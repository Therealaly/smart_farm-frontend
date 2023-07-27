class Category {
  final String name;

  Category(this.name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category && name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}


class GridViewItem {
  final Category category;
  final String title;
  final String status;
  final String dap;
  final String water;
  final String air;
  final String humidity;
  final bool heater;
  final bool fan;
  final String ec;
  final bool aNutrition;
  final bool bNutrition;
  final String ph;
  final bool phUp;
  final bool phDown;
  final String waterFlow;
  final bool aPump;
  final bool bPump;
  final String duration;
  final String checking;

  GridViewItem({
    required this.category,
    required this.title,
    required this.status,
    required this.dap,
    required this.water,
    required this.air,
    required this.humidity,
    required this.heater,
    required this.fan,
    required this.ec,
    required this.aNutrition,
    required this.bNutrition,
    required this.ph,
    required this.phUp,
    required this.phDown,
    required this.waterFlow,
    required this.aPump,
    required this.bPump,
    required this.duration,
    required this.checking,
  });
}


List<Category> categories = [
  Category('Greenhouse Godean'),
  Category('Greenhouse Kaliurang'),
  Category('Greenhouse Jakal'),
];

Map<Category, List<GridViewItem>> gridViewItems = {
  Category('Greenhouse Godean'): [
    GridViewItem(
      category: Category('Greenhouse Godean'),
      title: 'Controller - 1',
      status: 'active',
      dap: '42 Days',
      water: '15',
      air: '24',
      humidity: '50',
      heater: false,
      fan: false,
      ec: '0.48',
      aNutrition: false,
      bNutrition: true,
      ph: '1.93',
      phUp: false,
      phDown: false,
      waterFlow: '0.00',
      aPump: true,
      bPump: false,
      duration: '10',
      checking: '20',
    ),
    GridViewItem(
      category: Category('Greenhouse Godean'),
      title: 'Controller - 2',
      status: 'inactive',
      dap: '21 Days',
      water: '15',
      air: '24',
      humidity: '50',
      heater: false,
      fan: false,
      ec: '0.48',
      aNutrition: true,
      bNutrition: true,
      ph: '1.93',
      phUp: false,
      phDown: false,
      waterFlow: '0.00',
      aPump: true,
      bPump: false,
      duration: '10',
      checking: '20',
    ),
    GridViewItem(
      category: Category('Greenhouse Godean'),
      title: 'Controller - 3',
      status: 'inactive',
      dap: '42 Days',
      water: '15',
      air: '24',
      humidity: '50',
      heater: false,
      fan: false,
      ec: '0.48',
      aNutrition: true,
      bNutrition: true,
      ph: '1.93',
      phUp: false,
      phDown: false,
      waterFlow: '0.00',
      aPump: true,
      bPump: false,
      duration: '10',
      checking: '20',
    ),
    GridViewItem(
      category: Category('Greenhouse Godean'),
      title: 'Controller - 4',
      status: 'active',
      dap: '42 Days',
      water: '15',
      air: '24',
      humidity: '50',
      heater: false,
      fan: false,
      ec: '0.48',
      aNutrition: true,
      bNutrition: true,
      ph: '1.93',
      phUp: false,
      phDown: false,
      waterFlow: '0.00',
      aPump: true,
      bPump: false,
      duration: '10',
      checking: '20',
    ),
  ],
  Category('Greenhouse Kaliurang'): [
    GridViewItem(
      category: Category('Greenhouse Kaliurang'),
      title: 'Controller - 1',
      status: 'inactive',
      dap: '42 Days',
      water: '25',
      air: '24',
      humidity: '50',
      heater: false,
      fan: false,
      ec: '0.48',
      aNutrition: true,
      bNutrition: true,
      ph: '1.93',
      phUp: false,
      phDown: false,
      waterFlow: '0.00',
      aPump: true,
      bPump: false,
      duration: '10',
      checking: '20',
    ),
    GridViewItem(
      category: Category('Greenhouse Kaliurang'),
      title: 'Controller - 2',
      status: 'active',
      dap: '42 Days',
      water: '20',
      air: '24',
      humidity: '50',
      heater: false,
      fan: false,
      ec: '0.48',
      aNutrition: true,
      bNutrition: true,
      ph: '1.93',
      phUp: false,
      phDown: false,
      waterFlow: '0.00',
      aPump: true,
      bPump: false,
      duration: '10',
      checking: '20',
    ),
    GridViewItem(
      category: Category('Greenhouse Kaliurang'),
      title: 'Controller - 3',
      status: 'inactive',
      dap: '42 Days',
      water: '-12.19',
      air: '24',
      humidity: '50',
      heater: false,
      fan: false,
      ec: '0.48',
      aNutrition: true,
      bNutrition: true,
      ph: '1.93',
      phUp: false,
      phDown: false,
      waterFlow: '0.00',
      aPump: true,
      bPump: false,
      duration: '10',
      checking: '20',
    ),
  ],
  Category('Greenhouse Jakal'): [
    GridViewItem(
      category: Category('Greenhouse Jakal'),
      title: 'Controller - 1',
      status: 'inactive',
      dap: '42 Days',
      water: '-12',
      air: '24',
      humidity: '50',
      heater: false,
      fan: false,
      ec: '0.48',
      aNutrition: true,
      bNutrition: true,
      ph: '1.93',
      phUp: false,
      phDown: false,
      waterFlow: '0.00',
      aPump: true,
      bPump: false,
      duration: '10',
      checking: '20',
    ),
    GridViewItem(
      category: Category('Greenhouse Jakal'),
      title: 'Controller - 2',
      status: 'inactive',
      dap: '42 Days',
      water: '17',
      air: '24',
      humidity: '50',
      heater: false,
      fan: false,
      ec: '0.48',
      aNutrition: true,
      bNutrition: true,
      ph: '1.93',
      phUp: false,
      phDown: false,
      waterFlow: '0.00',
      aPump: true,
      bPump: false,
      duration: '10',
      checking: '20',
    ),
  ],
};

