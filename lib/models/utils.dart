import 'package:flutter/foundation.dart';
import 'package:smart_farm/models/controller.dart';

class utils {
  static List<Controller> getMockedController() {
    return [
      Controller(
        name: "Controller - 1",
        status: "active",
        values: [],
      ),
      Controller(
        name: "Controller - 2",
        status: "inactive",
        values: [],
      ),
      Controller(
        name: "Controller - 3",
        status: "inactive",
        values: [],
      ),
      Controller(
        name: "Controller - 4",
        status: "active",
        values: [],
      ),
      Controller(
        name: "Controller - 5",
        status: "inactive",
        values: [],
      ),
      Controller(
        name: "Controller - 6",
        status: "inactive",
        values: [],
      ),
    ];
  }
}