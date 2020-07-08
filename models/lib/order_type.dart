class OrderType {
  String name;

  OrderType(
    this.name,
  );

  factory OrderType.fromJson(Map<String, dynamic> json) => OrderType(
        json['name'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
      };
}
