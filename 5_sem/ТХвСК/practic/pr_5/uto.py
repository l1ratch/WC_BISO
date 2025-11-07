from opensearchpy import OpenSearch
import pandas as pd
import numpy as np
import json
from datetime import datetime
import logging

# Настройка логирования
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def create_opensearch_client():
    """Создание клиента OpenSearch"""
    try:
        client = OpenSearch(
            hosts=[{'host': 'localhost', 'port': 9212}],
            http_compress=True,
            use_ssl=False,
            verify_certs=False,
            ssl_assert_hostname=False,
            ssl_show_warn=False
        )
        
        # Проверка подключения
        if client.ping():
            logger.info("Успешное подключение к OpenSearch")
            return client
        else:
            logger.error("Не удалось подключиться к OpenSearch")
            return None
            
    except Exception as e:
        logger.error(f"Ошибка при создании клиента: {e}")
        return None

def create_index_template(client):
    """Создание шаблона индекса"""
    template_name = "packets_msv"
    index_pattern = "packets-msv"
    
    template_body = {
        "index_patterns": [index_pattern],
        "template": {
            "settings": {
                "number_of_shards": 1,
                "number_of_replicas": 0
            },
            "mappings": {
                "properties": {
                    "frame_time_epoch": {
                        "type": "date",
                        "format": "epoch_second"
                    },
                    "ip_src": {
                        "type": "ip"
                    },
                    "ip_dst": {
                        "type": "ip"
                    },
                    "tcp_srcport": {
                        "type": "integer"
                    },
                    "tcp_dstport": {
                        "type": "integer"
                    },
                    "udp_srcport": {
                        "type": "integer"
                    },
                    "udp_dstport": {
                        "type": "integer"
                    },
                    "http_host": {
                        "type": "keyword"
                    },
                    "tls_handshake_extensions_server_name": {
                        "type": "keyword"
                    },
                    "frame_protocols": {
                        "type": "keyword"
                    },
                    "frame_len": {
                        "type": "integer"
                    },
                    "timestamp": {
                        "type": "date",
                        "format": "strict_date_optional_time||epoch_millis"
                    }
                }
            }
        }
    }
    
    try:
        client.indices.put_template(
            name=template_name,
            body=template_body
        )
        logger.info(f"Шаблон индекса '{template_name}' успешно создан")
        return True
    except Exception as e:
        logger.error(f"Ошибка при создании шаблона: {e}")
        return False

def load_data_to_opensearch(client, csv_file_path):
    """Загрузка данных из CSV в OpenSearch"""
    try:
        # Чтение CSV файла
        logger.info(f"Чтение файла {csv_file_path}")
        df = pd.read_csv(csv_file_path, sep=';')
        
        # Замена NaN на None
        df = df.replace({np.nan: None})
        
        # Переименование колонок (замена точек на подчеркивания)
        df.columns = [col.replace('.', '_') for col in df.columns]
        
        # Добавление timestamp для OpenSearch
        df['timestamp'] = pd.to_datetime(df['frame_time_epoch'], unit='s').astype(str)
        
        # Преобразование в список словарей
        data = df.to_dict('records')
        
        index_name = 'packets-msv'
        
        # Bulk загрузка данных
        bulk_data = []
        for i, doc in enumerate(data):
            bulk_data.append({"index": {"_index": index_name}})
            bulk_data.append(doc)
            
            # Отправка пачками по 1000 документов
            if len(bulk_data) >= 2000:
                response = client.bulk(body=bulk_data, refresh=True)
                if response['errors']:
                    logger.error("Ошибки при bulk-загрузке")
                    for item in response['items']:
                        if 'error' in item['index']:
                            logger.error(f"Ошибка: {item['index']['error']}")
                bulk_data = []
                logger.info(f"Загружено {i+1} документов...")
        
        # Отправка оставшихся документов
        if bulk_data:
            response = client.bulk(body=bulk_data, refresh=True)
            if response['errors']:
                logger.error("Ошибки при финальной bulk-загрузке")
        
        logger.info(f"Всего загружено {len(data)} документов в индекс {index_name}")
        return True
        
    except Exception as e:
        logger.error(f"Ошибка при загрузке данных: {e}")
        return False

def main():
    """Основная функция"""
    csv_file = "result_msv.csv"
    
    # Создание клиента OpenSearch
    client = create_opensearch_client()
    if not client:
        return
    
    # Создание шаблона индекса
    if not create_index_template(client):
        logger.warning("Продолжаем без шаблона индекса")
    
    # Загрузка данных
    if load_data_to_opensearch(client, csv_file):
        logger.info("Данные успешно загружены в OpenSearch")
        
        # Проверка количества документов в индексе
        try:
            count_response = client.count(index="packets-msv")
            logger.info(f"В индексе packets-msv теперь {count_response['count']} документов")
        except Exception as e:
            logger.error(f"Ошибка при проверке количества документов: {e}")
    else:
        logger.error("Не удалось загрузить данные в OpenSearch")

if __name__ == "__main__":
    main()