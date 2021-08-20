Package.describe({
  name: "pfafman:counter",
  summary: "Better way to count large collections",
  version: "1.0.2"
});

Package.onUse(function (api) {
  
  api.use([
    'coffeescript@2.4.0',
    'mongo@1.12.0'
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