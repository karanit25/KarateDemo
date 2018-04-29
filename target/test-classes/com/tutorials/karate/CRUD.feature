Feature: Test API Playground
  Background:
    * url baseUrl
    * def allProducts = call read('GetAllProducts.feature')
    Scenario: Get all Products
      Given path '/products'
      When method GET
      Then status 200
      And match response.data[*].categories[*].id contains ['pcmcat248700050021']
      And def productId = response.data[0].id
      #And def productId = $.data[-1].id
      And print productId


    Scenario: Get Product by id
      Given path '/products/'+ allProducts.productId
      When method GET
      Then status 200

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

    Scenario: Delete New Product
      Given path '/products/'+allProducts.productId
      When method DELETE
      Then status 200

      Given path '/products/'+allProducts.productId
      When method GET
      Then status 404
      And match $ !contains {id:'#(product.id)'}