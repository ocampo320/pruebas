class PurchaseOrderResponse {
  List<Order> orders;

  PurchaseOrderResponse({this.orders});

  factory PurchaseOrderResponse.fromJson(Map<String, dynamic> json) {
    return PurchaseOrderResponse(
      orders: json['orders'] != null
          ? (json['orders'] as List).map((i) => Order.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  String buyer;
  String client;
  String daliveryDate;
  int id;
  String requestDate;
  String type;

  Order(
      {this.buyer,
      this.client,
      this.daliveryDate,
      this.id,
      this.requestDate,
      this.type});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      buyer: json['buyer'],
      client: json['client'],
      daliveryDate: json['daliveryDate'],
      id: json['id'],
      requestDate: json['requestDate'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buyer'] = this.buyer;
    data['client'] = this.client;
    data['daliveryDate'] = this.daliveryDate;
    data['id'] = this.id;
    data['requestDate'] = this.requestDate;
    data['type'] = this.type;
    return data;
  }
}
