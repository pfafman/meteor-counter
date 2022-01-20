Package.describe({
  name: "pfafman:counter",
  summary: "Better way to count large collections",
  version: "1.0.2"
});

Package.onUse(function (api) {
  
  api.use([
    'coffeescript',
    'mongo'
  ]);

  api.addFiles(
    [
    'lib/client.coffee'
    ]
    , 'client');

  api.addFiles(
    [
    'lib/server.coffee'
    ]
    , 'server');
  
});