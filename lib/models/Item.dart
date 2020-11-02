class Item {
  String name;
  String icon;
  String type;
  double value;

  Item({this.name, this.icon, this.type, this.value});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}
