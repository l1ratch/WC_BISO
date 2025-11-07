from opensearchpy import OpenSearch
import random
import logging
from datetime import datetime

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def setup_geo_mapping():
    """Настройка маппинга для геоданных в OpenSearch"""
    client = OpenSearch(
        hosts=[{'host': 'localhost', 'port': 9212}],
        http_compress=True,
        use_ssl=False
    )
    
    # Добавляем поля для геоданных в существующий индекс
    mapping_update = {
        "properties": {
            "geo_location": {
                "type": "geo_point"
            },
            "country": {
                "type": "keyword"
            },
            "city": {
                "type": "keyword"
            },
            "region": {
                "type": "keyword"
            }
        }
    }
    
    try:
        client.indices.put_mapping(
            index="packets-msv",
            body=mapping_update
        )
        logger.info("Маппинг для геоданных успешно добавлен")
        return True
    except Exception as e:
        logger.error(f"Ошибка при добавлении маппинга: {e}")
        return False

def enrich_with_manual_geo_data():
    """Обогащение данных ручными геометками"""
    client = OpenSearch(
        hosts=[{'host': 'localhost', 'port': 9212}],
        http_compress=True,
        use_ssl=False
    )
    
    # Список городов для демонстрации с координатами
    demo_locations = [
        # Северная Америка
        {"city": "New York", "country": "USA", "region": "North America", "lat": 40.7128, "lon": -74.0060},
        {"city": "Los Angeles", "country": "USA", "region": "North America", "lat": 34.0522, "lon": -118.2437},
        {"city": "Toronto", "country": "Canada", "region": "North America", "lat": 43.6532, "lon": -79.3832},
        
        # Европа
        {"city": "London", "country": "UK", "region": "Europe", "lat": 51.5074, "lon": -0.1278},
        {"city": "Berlin", "country": "Germany", "region": "Europe", "lat": 52.5200, "lon": 13.4050},
        {"city": "Paris", "country": "France", "region": "Europe", "lat": 48.8566, "lon": 2.3522},
        {"city": "Moscow", "country": "Russia", "region": "Europe", "lat": 55.7558, "lon": 37.6173},
        {"city": "Amsterdam", "country": "Netherlands", "region": "Europe", "lat": 52.3676, "lon": 4.9041},
        
        # Азия
        {"city": "Tokyo", "country": "Japan", "region": "Asia", "lat": 35.6762, "lon": 139.6503},
        {"city": "Beijing", "country": "China", "region": "Asia", "lat": 39.9042, "lon": 116.4074},
        {"city": "Singapore", "country": "Singapore", "region": "Asia", "lat": 1.3521, "lon": 103.8198},
        
        # Другие регионы
        {"city": "Sydney", "country": "Australia", "region": "Oceania", "lat": -33.8688, "lon": 151.2093},
        {"city": "São Paulo", "country": "Brazil", "region": "South America", "lat": -23.5505, "lon": -46.6333},
        {"city": "Dubai", "country": "UAE", "region": "Middle East", "lat": 25.2048, "lon": 55.2708}
    ]
    
    try:
        # Получаем документы для обогащения (ограничим 200 для демонстрации)
        search_query = {
            "size": 200,
            "query": {
                "exists": {"field": "ip_src"}
            },
            "_source": ["ip_src", "ip_dst", "frame_time_epoch"]
        }
        
        response = client.search(index="packets-msv", body=search_query)
        total_docs = len(response['hits']['hits'])
        
        logger.info(f"Найдено {total_docs} документов для обогащения геоданными")
        
        updated_count = 0
        for i, hit in enumerate(response['hits']['hits']):
            # Выбираем случайную локацию из нашего списка
            location = random.choice(demo_locations)
            
            # Формируем данные для обновления
            update_data = {
                "doc": {
                    "geo_location": {
                        "lat": location["lat"],
                        "lon": location["lon"]
                    },
                    "country": location["country"],
                    "city": location["city"],
                    "region": location["region"]
                }
            }
            
            # Обновляем документ
            client.update(
                index="packets-msv",
                id=hit['_id'],
                body=update_data,
                refresh=(i % 50 == 0)  # Обновляем индекс каждые 50 документов
            )
            
            updated_count += 1
            if (i + 1) % 50 == 0:
                logger.info(f"Обновлено {i + 1} документов")
        
        logger.info(f"Обогащение завершено. Всего обновлено {updated_count} документов")
        
        # Проверяем результат
        check_query = {
            "size": 5,
            "query": {
                "exists": {"field": "geo_location"}
            },
            "_source": ["ip_src", "country", "city", "geo_location"]
        }
        
        check_response = client.search(index="packets-msv", body=check_query)
        logger.info("Примеры обновленных документов:")
        for hit in check_response['hits']['hits']:
            logger.info(f"  IP: {hit['_source'].get('ip_src')} -> {hit['_source'].get('city')}, {hit['_source'].get('country')}")
            
        return True
        
    except Exception as e:
        logger.error(f"Ошибка при обогащении данных: {e}")
        return False

def create_geo_demo_dashboard():
    """Создание демонстрационных документов с геоданными"""
    client = OpenSearch(
        hosts=[{'host': 'localhost', 'port': 9212}],
        http_compress=True,
        use_ssl=False
    )
    
    # Создаем несколько демо-документов с разными геолокациями
    demo_data = [
        {
            "ip_src": "93.184.216.34",  # example.com
            "ip_dst": "192.168.1.100",
            "frame_time_epoch": 1700000000,
            "frame_protocols": "tcp,http",
            "http_host": "example.com",
            "geo_location": {"lat": 50.1109, "lon": 8.6821},
            "country": "Germany",
            "city": "Frankfurt",
            "region": "Europe"
        },
        {
            "ip_src": "8.8.8.8",  # Google DNS
            "ip_dst": "192.168.1.100", 
            "frame_time_epoch": 1700000100,
            "frame_protocols": "tcp,http",
            "http_host": "google.com",
            "geo_location": {"lat": 37.3861, "lon": -122.0839},
            "country": "USA",
            "city": "Mountain View",
            "region": "North America"
        },
        {
            "ip_src": "77.88.55.60",  # Yandex
            "ip_dst": "192.168.1.100",
            "frame_time_epoch": 1700000200, 
            "frame_protocols": "tcp,http",
            "http_host": "yandex.ru",
            "geo_location": {"lat": 55.7558, "lon": 37.6173},
            "country": "Russia", 
            "city": "Moscow",
            "region": "Europe"
        }
    ]
    
    for doc in demo_data:
        try:
            client.index(
                index="packets-msv",
                body=doc,
                refresh=True
            )
            logger.info(f"Добавлен демо-документ: {doc['ip_src']} -> {doc['city']}")
        except Exception as e:
            logger.error(f"Ошибка добавления демо-документа: {e}")

if __name__ == "__main__":
    logger.info("Начало обогащения данных геометками...")
    
    # Настраиваем маппинг
    if setup_geo_mapping():
        # Обогащаем существующие данные
        enrich_with_manual_geo_data()
        
        # Добавляем демо-документы для гарантии
        create_geo_demo_dashboard()
        
        logger.info("Обогащение данных завершено успешно!")
    else:
        logger.error("Не удалось настроить маппинг для геоданных")