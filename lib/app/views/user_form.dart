import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrud/models/user.dart';
import 'package:provider/provider.dart';

import '../../provider/users.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  UserForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('User form'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState?.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name']!,
                    email: _formData['email']!,
                    password: _formData['password']!,
                    avatarUrl: _formData['avatarUrl']!,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(
              Icons.save,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo não preenchido!';
                  }
                },
                onSaved: (value) => _formData['name'] = value!,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo não preenchido!';
                  }
                },
                onSaved: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo não preenchido!';
                  }
                  if (value.trim().length < 8) {
                    return 'No minímo 8 caracteres!';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo não preenchido!';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                decoration: const InputDecoration(labelText: 'Url do avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
