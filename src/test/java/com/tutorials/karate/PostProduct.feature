Feature: Test API Playground
  Background:
    * url baseUrl
      Scenario: Create New Product
        Given path '/products'
        And request { "name": "postProductName", "type": "postProductType", "price": 100, "shipping": 10, "upc": "asdf","description": "asdf","manufacturer": "asdf","model": "asdf","url": "asdf","image": "asdf"}
        When method POST
        Then status 201
        And def product = response

        Given path '/products/'+product.id
        When method GET
        Then status 200
        And match $ contains {id:'#(product.id)',name:'#(product.name)',type:"postProductType"}





