import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrud/models/user.dart';
import 'package:provider/provider.dart';

import '../../provider/users.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {
    'id': '',
    'name': '',
    'email': '',
    'password': '',
    'avatarUrl': ''
  };

  void _loadFormData(User user) {
    // ignore: unnecessary_null_comparison
    if (user != null) {
      _formData['id'] = user.id!;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['password'] = user.password;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;

    _loadFormData(user);

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
                    id: _formData['id'] ?? ' ',
                    name: _formData['name'] ?? ' ',
                    email: _formData['email'] ?? ' ',
                    avatarUrl: _formData['avatarUrl'] ?? ' ',
                    password: _formData['password'] ?? ' ',
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
                initialValue: _formData['name'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo não preenchido!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                initialValue: _formData['email'],
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
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                initialValue: _formData['password'],
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
                initialValue: _formData['avatarUrl'],
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
