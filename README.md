# README

API Delivery
Link: https://api-delivery28.herokuapp.com/api

A aplicação esta programada em Ruby 2.3.1, com Rails 5 e base de dados PostgreSQL.

Para utilizar 

É necessario ter instalado o Ruby e op Rails nas versoes ditas acima

Apos fazer o clone do repositorio acessar o diretorio criado e executar os comandos abaixo:
Instalacao das dependencias

bundle install

Criacao do banco de dados

rake db:create

Execução das migrações

rake db:migrate

Dependencias

Serializador
gem 'active_model_serializers', '~> 0.10.0'

Database
gem 'pg', '~> 0.21.0'

Testes
gem 'rspec-rails', '~> 3.6'

Validações 

EndPoints

GET /api/shipments/:id HTTP/1.1
Retorna dum Shipment com id especificado no formato abaixo:

{

}

POST /api/truckers HTTP/1.1
Efetua a gravação do
