function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'omdb';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    config.baseUrl = 'https://jsonplaceholder.typicode.com'
    // e.g. config.foo = 'bar';
  } else if (env == 'rick') {
    config.baseurl = 'https://rickandmortyapi.com/api'
    // customize
  }
  if (env == 'omdb') {
    config.baseUrl = 'https://www.omdbapi.com/?apikey=f20915aa&'
    // e.g. config.foo = 'bar';
  }
  return config;
}