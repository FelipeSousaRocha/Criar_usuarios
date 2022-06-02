import 'dart:async';
import 'package:flutter/material.dart';
import 'home_view.dart';

//Classe de estado
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

//Instruções da classe de estado
class _SplashState extends State<Splash> {
  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 3), () {
      //Chamada para a pagina home
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ));
    });
  }

  //Conteudo do splash
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
        Text(
          'Loading...',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        //Barra de progresso
        CircularProgressIndicator(
          backgroundColor: Colors.black26,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.black,
          ),
          strokeWidth: 11.0,
        )
      ])),
    );
  }
}
