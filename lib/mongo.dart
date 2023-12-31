import 'constants.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:developer';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);
    await collection
        .insertOne({"username": "mp", "name": "MaxPayne", "orderid": '122344'});
    print(await collection.find().toList());
  }
}
