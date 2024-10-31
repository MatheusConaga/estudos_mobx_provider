import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_projeto/controller.dart';
import 'package:mobx_projeto/principal.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Controller controller;
  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    controller = Provider.of<Controller>(context);

    // autorun((_){
    //   print(controller.formularioValidado);
    // });

    reactionDisposer = reaction(
            (_) => controller.usuarioLogado,
        (usuarioLogado){
              if ( usuarioLogado ){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => Principal())
                );
              }
        }
    );

  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.all(16),
            //   child: Observer(
            //       builder: (_){
            //         return  Text(
            //           "${controller.contador}",
            //           style: TextStyle(color: Colors.black, fontSize: 80),
            //         );
            //       }
            //   ),
            // ),

            Padding(
                padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email"
                ),
                onChanged: controller.setEmail,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Senha"
                ),
                onChanged: controller.setSenha,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                  builder: (_){
                    return Text(
                        controller.formularioValidado ? "Campos validados"
                            : "* Campos não validados"
                    );
                  },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                  builder: (_){
                    return ElevatedButton(
                      onPressed: controller.formularioValidado
                          ? () {
                        controller.logar();
                      }
                          : null,
                      child: controller.carregando
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      ) : Text(
                        "Logar",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      )
                    );
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
