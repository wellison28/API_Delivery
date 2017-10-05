#API Delivery
(https://api-delivery28.herokuapp.com/api)

<h2>Objetivo</h2>
Gerenciamento de fretes, que permite a busca de motoritas localizados proximos de um determinado frete e a atualzação da localizacao do desses motoristas

<h2>Aplicação</h2>
Programada em Ruby 2.3.1, com Rails 5 e base de dados PostgreSQL.

<h2>Clone e colaboração</h2>

É necessario ter instalado o Ruby e o Rails nas versoes ditas acima

Apos fazer o clone do repositorio acessar o diretorio criado e executar os comandos abaixo:
Instalacao das dependencias
```
bundle install
```
Criacao do banco de dados
```
$ rake db:create
```
Execução das migrações
```
$ rake db:migrate
```

Dependencias

Serializador
gem 'active_model_serializers', '~> 0.10.0'

Database
gem 'pg', '~> 0.21.0'

Testes
gem 'rspec-rails', '~> 3.6'

Validações 

<h2>EndPoints</h2>

<p>Permite a criação de um novo shipment</p>

POST /api/shipments HTTP/1.1
Content-Type: application/json; charset="utf-8"
```
{
    "shipment": {
        "value": 1500.0,
        "weight_kg": 2000,
        "contact": {
            "name": "Carlos", "phone": "(11) 98765-4321"
        },
        "vehicles": [
            { "type": "Truck", "body_type": "Baú" },
            { "type": "Truck", "body_type": "Sider" }
        ],
        "origin": { "city": "São Paulo", "state": "SP", "load_at": "2017-09-25" },
        "destination": { "city": "Goiânia", "state": "GO", "deliver_at": "2017-09-29" },
    }
}
```
HTTP/1.1 201 Created
Location: /api/shipments/1

<p>Retorna  shipment com determinado "id"</p>

GET /api/shipments/1 HTTP/1.1

```
{
    "id": 1,
    "shipment": {
        "value": 1500.0,
        "weight_kg": 2000,
        "contact": {
            "name": "Carlos", "phone": "(11) 98765-4321"
        },
        "vehicles": [
            { "type": "Truck", "body_type": "Baú" },
            { "type": "Truck", "body_type": "Sider" }
        ],
        "origin": { "city": "São Paulo", "state": "SP", "load_at": "2017-09-25" },
        "destination": { "city": "Goiânia", "state": "GO", "deliver_at": "2017-09-29" },
    }
}
```
HTTP/1.1 200 OK
Content-Type: application/json; charset="utf-8"

<p>Permite a gravação de motoristas</p>

POST /api/truckers HTTP/1.1
Content-Type: application/json; charset="utf-8"
```
{
    "trucker": {
        "name": "Lincoln Falcão",
        "phone": "(11) 97654-3210",
        "vehicle": {
            "type": "Truck", "body_type": "Baú"
        }
    }
}
```
HTTP/1.1 201 Created
Location: /api/truckers/1

<p>Atualiza a localização de determinado motorista</p>

PUT /api/truckers/1/last_location
Content-Type: application/json; charset="utf-8"
```
{
    "location": {
        "city": "São Paulo",
        "state": "SP"
    }
}
```
HTTP 204 No Content

<h3>Retorna uma lista de motoristas localizados na origem de determinada shipment</h3>

GET /api/shipments/1/nearby_truckers HTTP/1.1
```
{
    "truckers": [
        {
            "id": 1,
            "name": "Lincoln Falcão",
            "phone": "(11) 97654-3210",
            "vehicle": {
                "type": "Truck", "body_type": "Baú"
            }
        }
    ]
}
```
HTTP 200 OK
Content-Type: application/json; charset="utf-8"
