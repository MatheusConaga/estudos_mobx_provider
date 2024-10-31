import 'package:mobx/mobx.dart';
import 'package:mobx_projeto/item_controller.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

// mixin Store para gerar codigos automaticos
abstract class PrincipalControllerBase with Store {

  @observable
  String novoItem = "";

  @action
  void setNovoItem( String valor ) => novoItem = valor;


  ObservableList<ItemController> listaItens = ObservableList<ItemController>();

  @action
  void adicionarItem(){
    listaItens.add(ItemController(novoItem));
    // novoItem
    // print(listaItens);
  }


}