import 'package:flutter/material.dart';
import 'package:fluttercrud/components/user_tite.dart';
import 'package:fluttercrud/data/dummy_users.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Criar um clone
    final users = {
      ...DUMMY_USERS
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        //Titulo
        title: const Text('Create users'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        //Tamanho
        itemCount: users.length,
        //Contexto e indice
        itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
      ),
    );
  }
}
