import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:mongocrud/pet_model.dart';

class MongoService {
  static final MongoService _instance = MongoService._internal();
  //late mongo.Db _db;
  late mongo.Db _db;

  MongoService._internal();

  factory MongoService(){
    return _instance;
  }

  Future<void> connect() async {
    _db = await mongo.Db.create('mongodb+srv://gnieva:3uPFCkma68pxw9rF@cluster0.1hqs0.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0');
    await _db.open();
  }

  Future<List<PetModel>> getPets() async {
    var collection = _db.collection('pets');
    var pets = await collection.find().toList();
    return pets.map((pet) => PetModel.fromJson(pet)).toList();
  }

}