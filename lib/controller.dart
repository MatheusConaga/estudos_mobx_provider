import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

// mixin Store para gerar codigos automaticos
abstract class ControllerBase with Store {

  ControllerBase() {
    autorun((_) {
      // print(email);
      // print(senha);
      // print(formularioValidado);
    });
  }

  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  bool usuarioLogado = false;

  @observable
  bool carregando = false;

  @computed
  String get emailSenha => "$email - $senha";

  @computed
  bool get formularioValidado => email.length >= 5 && senha.length >= 5;

  @action
  void setEmail(valor) => email = valor;

  @action
  void setSenha(valor) => senha = valor;

  @action
  Future<void> logar() async{

    carregando = true;

    // Silumando processamento
    await Future.delayed(Duration(seconds: 2));

    carregando = false;
    usuarioLogado = true;

  }

// executa sempre que um observável tem seu estado alterado

//
// @observable
// int contador = 0;
//
// @action
// incrementar(){
//   contador++;
// }

// var _contador = Observable(0);
// late Action incrementar;
//
// Controller(){
//   incrementar = Action(_incrementar);
// }
//
// int get contador => _contador.value;
// set contador (int novoValor)=> _contador.value = novoValor;
//
// _incrementar(){
//   // contador.value = contador.value+1;
//   contador++;
//
// }
}
