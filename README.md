<h1>API Delivery</h1><br>
<a>https://api-delivery28.herokuapp.com/api</a>

<h2>Objetivo</h2>
Gerenciamento de fretes, que permite a busca de motoritas localizados proximos de um determinado frete e a atualzação da localizacao do desses motoristas

<h2>Aplicação</h2>
Programada em Ruby 2.3.1, com Rails 5 e base de dados PostgreSQL.

<h2>Clone</h2>

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

EndPoints

<>GET /api/shipments/:id HTTP/1.1
Retorna dum Shipment com id especificado no formato abaixo:

{

}

POST /api/truckers HTTP/1.1
Efetua a gravação do
