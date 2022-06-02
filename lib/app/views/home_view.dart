import 'package:flutter/material.dart';
import 'package:fluttercrud/components/user_tite.dart';
import 'package:fluttercrud/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:fluttercrud/provider/users.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Criar um clone
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        //Titulo
        title: const Text('Create users'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        //Tamanho
        itemCount: users.count,
        //Contexto e indice
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
