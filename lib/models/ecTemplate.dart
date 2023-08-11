class Template {
  final String name;

  Template(this.name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Template && name == other.name;
  }
  @override
  int get hashCode => name.hashCode;
}

class ListViewItem {
  final Template template;
  final int ecValue;

  ListViewItem({
    required this.template,
    required this.ecValue,
  });
}

List<Template> templates = [
  Template('Melon A1'),
  Template('Strawberry A3'),
  Template('Melon Honey'),
];

Map<Template, List<ListViewItem>> listViewItems = {
  Template('Melon A1'): [
    ListViewItem(
      template: Template('Melon A1'),
      ecValue: 2,
    ),
    ListViewItem(
      template: Template('Melon A1'),
        ecValue: 1,
    ),
    ListViewItem(
      template: Template('Melon A1'),
        ecValue: 3,
    ),
    ListViewItem(
      template: Template('Melon A1'),
      ecValue: 1,
    ),
    ListViewItem(
      template: Template('Melon A1'),
      ecValue: 3,
    ),
  ],
  Template('Strawberry A3'): [
    ListViewItem(
      template: Template('Strawberry A3'),
      ecValue: 2,
    ),
    ListViewItem(
      template: Template('Strawberry A3'),
      ecValue: 2,
    ),
  ],
  Template('Melon Honey'): [
    ListViewItem(
      template: Template('Melon Honey'),
      ecValue: 5,
    ),
    ListViewItem(
      template: Template('Melon Honey'),
      ecValue: 2,
    ),
    ListViewItem(
      template: Template('Melon Honey'),
      ecValue: 1,
    ),
  ],
};