import 'package:flutter/material.dart';
import 'package:fluttercrud/models/user.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';
import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    //Se nao tiver fica vazio
    // ignore: unnecessary_null_comparison
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty ? const CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('User remove'),
                      content: Text('Are you sure?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Não'),
                          onPressed: () =>
                            Navigator.of(context).pop(false),
                          ,
                        ),
                        FlatButton(
                          child: Text('Sim'),
                          onPressed: () => 
                            Navigator.of(context).pop(true),
                        ),
                      ],
                    ),
                  ).then((confimed){
                    if(confimed){
                      Provider.of<Users>(context).remove(user);
                    }
                  });
                },
              ),
            ],
          ),
        ));
  }
}
