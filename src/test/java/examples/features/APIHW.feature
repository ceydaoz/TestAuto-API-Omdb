@APIHW

Feature: Get Harry Potter movie
  Background:
    * url 'http://www.omdbapi.com/'

  Scenario: Get Harry Potter movie properties by movie name and movie ID
    Given path '/'
    Given params {s: 'Harry Potter'}
    Given params {apikey: '9f799af8'}
    When method get
    #* def getImdbID = $response.Search[?(@.Title=="Harry Potter and the Sorcerer's Stone")].imdbID
    * def mov = get response.Search[?(@.Title=="Harry Potter and the Sorcerer's Stone")]
    * def movId = mov[0].imdbID
    #* print getImdbID
    #* params {i: #(getImdbID)}
    #* method get
    Then print response
    Then print mov
    Then print movId

    Given path '/'
    Given params {i: #(movId)}
    Given params {apikey: '9f799af8'}
    When method get
    Then print response
    Then status 200
    And  match response.Title == "Harry Potter and the Sorcerer's Stone"
    And match response.Year == "2001"
    And match response.imdbID == "tt0241527"
    And match response.Released == "16 Nov 2001"