class RefreshTokenRequest {
  String token;

  RefreshTokenRequest({this.token});

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) {
    return RefreshTokenRequest(
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
