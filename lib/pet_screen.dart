import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:mongocrud/mongo_service.dart';
import 'package:mongocrud/pet_model.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  List<PetModel> pets = [];

  @override
  void initState() {
    super.initState();
    _fetchPets();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchPets() async {
    pets = await MongoService().getPets();
    setState(() {
    });
  }

  // void _updatePet(PetModel pet) async {
  //   await MongoService().updatePet(pet);
  //   _fetchPets();
  // }

  void _deletePet(mongo.ObjectId id) async {
    await MongoService().deletePet(id);
    _fetchPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MongoDB CRUD'),),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          var pet = pets[index];
          return ListTile(
            title: Text(pet.name),
            subtitle: Text(pet.type),
            trailing:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: null,
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deletePet(pet.id),
                      ),
                    ],
                  ),
          );
        }
      ),
    );
  }
}