Package.describe({
  name: "pfafman:counter",
  summary: "Better way to count large collections",
  version: "1.0.1"
});

Package.onUse(function (api) {
  
  api.use([
    'coffeescript',
    'mongo'
  ]);

  api.add_files(
    [
    'lib/client.coffee'
    ]
    , 'client');

  api.add_files(
    [
    'lib/server.coffee'
    ]
    , 'server');
  
});