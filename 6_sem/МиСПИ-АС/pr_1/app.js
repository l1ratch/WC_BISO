const express = require('express');
const redis = require('redis');

const app = express();
const client = redis.createClient({
  url: 'redis://redis:6379'  // имя контейнера Redis в сети app-net
});

client.on('error', err => console.log('Redis Client Error', err));

app.get('/', async (req, res) => {
  await client.connect();
  let visits = await client.get('visits');
  visits = (parseInt(visits) || 0) + 1;
  await client.set('visits', visits);
  await client.disconnect();
  res.send(`<h1>Visits: ${visits}</h1>`);
});

app.listen(3000, () => console.log('App listening on port 3000'));
