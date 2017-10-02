require 'test_helper'

class Api::PessoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_pessoa = api_pessoas(:one)
  end

  test "should get index" do
    get api_pessoas_url, as: :json
    assert_response :success
  end

  test "should create api_pessoa" do
    assert_difference('Api::Pessoa.count') do
      post api_pessoas_url, params: { api_pessoa: { name: @api_pessoa.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_pessoa" do
    get api_pessoa_url(@api_pessoa), as: :json
    assert_response :success
  end

  test "should update api_pessoa" do
    patch api_pessoa_url(@api_pessoa), params: { api_pessoa: { name: @api_pessoa.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_pessoa" do
    assert_difference('Api::Pessoa.count', -1) do
      delete api_pessoa_url(@api_pessoa), as: :json
    end

    assert_response 204
  end
end
