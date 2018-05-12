## Docker YApi

- `docker-compose.yml`

  ```yml
  version: "3"
  services:
    mongo:
      image: mongo:3
      container_name: mongo
      networks:
        - yapi
      environment:
        - MONGO_INITDB_ROOT_USERNAME=yapi
        - MONGO_INITDB_ROOT_PASSWORD=yapi
        - MONGO_INITDB_DATABASE=yapi
      volumes:
        - ./mongo-data:/data/db
    yapi:
      image: daocloud.io/wyntau/yapi
      container_name: yapi
      depends_on:
        - mongo
      ports:
        - "3000:3000"
      networks:
        - yapi
      volumes:
        - ./config.json:/app/config.json
        - ./yapi-runtime:/app/runtime
  networks:
    yapi:
  ```
- `config.json`

  ```json
  {
    "port": "3000",
    "adminAccount": "admin@example.com",
    "db": {
      "servername": "mongo",
      "DATABASE": "yapi",
      "port": 27017,
      "user": "yapi",
      "pass": "yapi",
      "authSource": "admin"
    }
  }
  ```