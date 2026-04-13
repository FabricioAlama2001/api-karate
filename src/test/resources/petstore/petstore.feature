Feature: PetStore API - Gestión de mascotas

  Background:
    * url baseUrl
    * def petId = java.lang.System.currentTimeMillis()
    * def petName = 'Dante Doberman'
    * def updatedPetName = 'Dante Alama Doberman '
    * def petStatus = 'available'
    * def updatedStatus = 'sold'
    * def requestBody =
      """
      {
    "id": #(petId),
    "category": {
    "id": 101,
    "name": "Dogs"
    },
    "name": #(petName),
    "photoUrls": [
    "https://petstore.test/images/max-labrador.jpg"
    ],
    "tags": [
    {
    "id": 501,
    "name": "vaccinated"
    },
    {
    "id": 502,
    "name": "large-breed"
    }
    ],
    "status": #(petStatus)
    }
    """

  Scenario: Crear una mascota con datos válidos
    Given path 'pet'
    And request requestBody
    When method post
    Then status 200
    And match response.id == petId
    And match response.name == petName
    And match response.status == petStatus

  Scenario: Consultar una mascota existente por ID
    Given path 'pet'
    And request requestBody
    When method post
    Then status 200

    * configure retry = { count: 5, interval: 1000 }

    Given path 'pet', petId
    And retry until responseStatus == 200
    When method get
    Then status 200
    And match response.id == petId
    And match response.name == petName
    And match response.status == petStatus

  Scenario: Actualizar el nombre y estado de una mascota a sold
    Given path 'pet'
    And request requestBody
    When method post
    Then status 200

    * set requestBody.name = updatedPetName
    * set requestBody.status = updatedStatus

    Given path 'pet'
    And request requestBody
    When method put
    Then status 200
    And match response.id == petId
    And match response.name == updatedPetName
    And match response.status == updatedStatus

  Scenario: Consultar mascotas por estado sold
    Given path 'pet'
    And request requestBody
    When method post
    Then status 200

    * set requestBody.name = updatedPetName
    * set requestBody.status = updatedStatus

    Given path 'pet'
    And request requestBody
    When method put
    Then status 200

    Given path 'pet', 'findByStatus'
    And param status = updatedStatus
    When method get
    Then status 200
    And match response == '#[]'

  Scenario: Flujo E2E completo de gestión de mascota
    Given path 'pet'
    And request requestBody
    When method post
    Then status 200
    And match response.id == petId
    And match response.name == petName
    And match response.status == petStatus

    * configure retry = { count: 5, interval: 1000 }

    Given path 'pet', petId
    And retry until responseStatus == 200
    When method get
    Then status 200
    And match response.id == petId
    And match response.name == petName
    And match response.status == petStatus

    * set requestBody.name = updatedPetName
    * set requestBody.status = updatedStatus

    Given path 'pet'
    And request requestBody
    When method put
    Then status 200
    And match response.id == petId
    And match response.name == updatedPetName
    And match response.status == updatedStatus

    Given path 'pet', 'findByStatus'
    And param status = updatedStatus
    When method get
    Then status 200
    And match response == '#[]'