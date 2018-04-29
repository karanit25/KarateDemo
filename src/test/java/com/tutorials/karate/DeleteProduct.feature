Feature: Test API Playground
  Background:
    * url baseUrl
    * def allProducts = call read('GetAllProducts.feature')
    Scenario: Delete New Product
      Given path '/products/'+allProducts.productId
      When method DELETE
      Then status 200

      Given path '/products/'+allProducts.productId
      When method GET
      Then status 404
      And match $ !contains {id:'#(product.id)'}