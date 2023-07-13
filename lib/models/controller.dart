import 'dart:ui';

class Controller {
  String name;
  String status;
  List<Controller> values;

  Controller(
    {
      required this.name,
      required this.status,
      required this.values
    }
  );
}