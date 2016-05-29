Package.describe({
  name: "pfafman:counter",
  summary: "Better way to count large collections",
  version: "1.0.0"
});

Package.onUse(function (api) {
  api.versionsFrom("1.3.1");

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