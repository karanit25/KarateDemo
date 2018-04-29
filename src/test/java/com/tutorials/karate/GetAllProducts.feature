Feature: Test API Playground
  Background:
    * url baseUrl
    Scenario: Get all Products
      Given path '/products'
      When method GET
      Then status 200
      And match response.data[*].categories[*].id contains ['pcmcat248700050021']
      And def productId = response.data[0].id
      #And def productId = $.data[-1].id
      And print productId




