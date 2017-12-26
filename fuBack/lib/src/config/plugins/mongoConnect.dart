import 'package:mongo_dart/mongo_dart.dart';

class MongoInit{
  Db db;
  mongoInit() async{
     this.db = new Db("mongodb://localhost:27017/fileuploaddart");
     await this.db.open();
     return db.collection('files');
   }
  mongoUninit(){
    this.db.close();
  }
}
