class AuthenticationRequest {
  String password;
  String user;

  AuthenticationRequest({this.password, this.user});

  factory AuthenticationRequest.fromJson(Map<String, dynamic> json) {
    return AuthenticationRequest(
      password: json['password'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['user'] = this.user;
    return data;
  }
}
