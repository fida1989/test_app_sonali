import 'class12_interface.dart';

class Class12Presenter {
  late Class12Interface _interface;

  Class12Presenter(Class12Interface interface) {
    _interface = interface;
  }

  void getTime() {
    String time = DateTime.now().toString();
    _interface.onDataSuccess(time);
  }
}
