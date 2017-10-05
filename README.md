<h1>API Delivery</h1>

<p>https://api-delivery28.herokuapp.com/</p>

<h2>Objetivo</h2>
EndPoints que permite a criação, edicao e busca de fretes e motoristas. 

<h2>Aplicação</h2>
Programada em Ruby 2.3.1, com Rails 5 e base de dados PostgreSQL.

<h2>Clone e colaboração</h2>

É necessario ter instalado o Ruby e o Rails nas versoes ditas acima

Apos fazer o clone do repositorio acessar o diretorio criado e executar os comandos abaixo:

- Instalacao das dependencias
```
$ bundle install
```
- Criacao do banco de dados
```
$ rake db:create
```
- Execução das migrações
```
$ rake db:migrate
```

<h2>Dependencias</h2>

Serializador
>gem 'active_model_serializers', '~> 0.10.0'

Database
>gem 'pg', '~> 0.21.0'

Testes
>gem 'rspec-rails', '~> 3.6'

<h2>EndPoints</h2>

<h4>Permite a criação de um novo shipment</h4>

> POST /api/shipments HTTP/1.1
> Content-Type: application/json; charset="utf-8"
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
> HTTP/1.1 201 Created
> Location: /api/shipments/1
<br>
<h4>Retorna  shipment com determinado "id"</h4>

> GET /api/shipments/1 HTTP/1.1

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
> HTTP/1.1 200 OK
> Content-Type: application/json; charset="utf-8"
<br>
<h4>Permite a gravação de motoristas</h4>

> POST /api/truckers HTTP/1.1
> Content-Type: application/json; charset="utf-8"
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
> HTTP/1.1 201 Created
> Location: /api/truckers/1
<br>
<h4>Atualiza a localização de determinado motorista</h4>

> PUT /api/truckers/1/last_location
> Content-Type: application/json; charset="utf-8"
```
{
    "location": {
        "city": "São Paulo",
        "state": "SP"
    }
}
```
> HTTP 204 No Content
<br>

<h4>Retorna uma lista de motoristas localizados na origem de determinada shipment</h4>

> GET /api/shipments/1/nearby_truckers HTTP/1.1
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
> HTTP 200 OK
> Content-Type: application/json; charset="utf-8"
