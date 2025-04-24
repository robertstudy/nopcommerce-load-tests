Feature: Register new user with dynamic token

Background:
  * url 'http://localhost:5000'

Scenario: Fetch token and register new user
  Given path '/register'
  When method get

  * def parseAndExtractValue =
    """
    function(html) {
      var Jsoup = Java.type('org.jsoup.Jsoup');
      var doc = Jsoup.parse(html);
      var input = doc.select('input[name=__RequestVerificationToken]').first();
      if (input) {
        return input.attr('value');
      }
      return null;
    }
    """

  * def html = response
  * def token = parseAndExtractValue(html)
  
  Given path '/register'
  And header Content-Type = 'application/x-www-form-urlencoded'
  And header User-Agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
  And form field __RequestVerificationToken = token

  * def generateUniqueEmail = 
  """
  function() {
    var uuid = java.util.UUID.randomUUID().toString();
    return 'example+' + uuid + '@example.com';
  }
  """

  * def email = generateUniqueEmail()
  And form field Email = email

  And form field Password = 'Password123!'
  And form field ConfirmPassword = 'Password123!'
  And form field FirstName = 'Test'
  And form field LastName = 'User'
  And form field Company = ''
  And form field Newsletter = 'false'
  And form field register-button = ''
  When method POST
  Then status 200