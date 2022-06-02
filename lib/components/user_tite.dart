import 'package:flutter/material.dart';
import 'package:fluttercrud/models/user.dart';

import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    //Se nao tiver fica vazio
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty ? CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Container(
          //Largura de 100
          width: 100,
          //Icones na linha
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                color: Colors.amber,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
