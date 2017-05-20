response = RestClient::Request.execute(
  method: :get,
  url: 'https://easyschedule-73192.herokuapp.com/api/v1/users/1.json',
  headers: {api_key: 'abc'}
  )

JSON.parse(response)

JSON.parse(response)['email']

------------

response = RestClient::Request.execute(
  method: :get,
  url: 'localhost:3000/api/v1/users/1.json'
  )

JSON.parse(response)

JSON.parse(response)['email']

--------------

response = RestClient::Request.execute(
  method: :get,
  url: 'localhost:3000/api/v1/users/1.json',
  headers: {api_key: 'this is fucking wrong'}
  )

JSON.parse(response)

JSON.parse(response)['email']

------------

response = RestClient::Request.execute(
  method: :get,
  url: 'localhost:3000/api/v1/users/1.json',
  headers: {api_key: 'abc'}
  )

JSON.parse(response)

JSON.parse(response)['email']
