import 'package:mobx/mobx.dart';
import 'package:using_moor/app/models/usermodel.dart';
import 'package:using_moor/app/modules/home/home_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final HomeService _service;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @observable
  List<UserModel> data;

  _HomeBase(this._service) {
      getData();
  }
  @observable
  bool isLoading = false;

  @action
  Future<void> getData() async {
    data = await _service.getUsers();
  }
}
