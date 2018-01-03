library fuBack.src.routes;

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_static/angel_static.dart';
import 'package:file/file.dart';
import 'controllers/controllers.dart' as controllers;
import '../config/plugins/fileUploadParser.dart';
import '../config/plugins/mongoConnect.dart';
import 'package:mongo_dart/mongo_dart.dart';

/// Put your app routes here!
///
/// See the wiki for information about routing, requests, and responses:
/// * https://github.com/angel-dart/angel/wiki/Basic-Routing
/// * https://github.com/angel-dart/angel/wiki/Requests-&-Responses
AngelConfigurer configureServer(FileSystem fileSystem) {
  return (Angel app) async {
    var mdb = new MongoInit();
    DbCollection coll;
    await mdb.mongoInit().then((data)=>coll=data);
    // Typically, you want to mount controllers first, after any global middleware.
    await app.configure(controllers.configureServer);
    app.lazyParseBodies = true;
    // Render `views/hello.jl` when a user visits the application root.
    app.get('/', (RequestContext req, ResponseContext res) => res);

    app.post('/uploads',(request,res) async {
      var file = await request.lazyFiles();
      await request.parse();
      print(file[0]);
      var fup = new FileUploadParser(file[0]);
      var fileup = await fup.fileUploadParser();
      print(fup.fLength);
      coll.insert({'filename': fileup[1] , 'filesize': fileup[0], 'dlink':fileup[2]});
    });

    app.get('/fetch',(request,response) async{
      List files = await coll.find().toList();
      response.json(files);
      response.end();
    });

    app.get('/search/:sid',(request,response) async{
      print('search value' + request.params['sid']);
      List files = await coll.find({'filename' : {'\$regex': new BsonRegexp(request.params['sid'])}}).toList();
      response.json(files);
      response.end();
    });

    app.get('/delete/:fid',(request,response) async{
      var msg = await coll.remove(where.eq('filename',request.params['fid']));
      response.json(msg);
      response.end();
    });

    // Mount static server at web in development.
    // This variant of `VirtualDirectory` also sends `Cache-Control` headers.
    //
    // In production, however, prefer serving static files through NGINX or a
    // similar reverse proxy.
    //
    // Read the following two sources for documentation:
    // * https://medium.com/the-angel-framework/serving-static-files-with-the-angel-framework-2ddc7a2b84ae
    // * https://github.com/angel-dart/static
    var vDir = new CachingVirtualDirectory(
      app,
      fileSystem,
      source: fileSystem.directory('web'),
    );
    app.use(vDir.handleRequest);

    // Throw a 404 if no route matched the request.
    app.use(() => throw new AngelHttpException.notFound());

    // Set our application up to handle different errors.
    //
    // Read the following for documentation:
    // * https://github.com/angel-dart/angel/wiki/Error-Handling
    app.errorHandler = (e, req, res) async {
      if (e.statusCode == 404) {
        return await res
            .render('error', {'message': 'No file exists at ${req.path}.'});
      }

      return await res.render('error', {'message': e.message});
    };
  };
}
