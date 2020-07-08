class AuthenticationResponse {
  String agentState;
  int code;
  String name;
  String permission;
  String sicomAgent;
  String tag;
  String token;
  String user;
  String userState;

  AuthenticationResponse(
      {this.agentState,
      this.code,
      this.name,
      this.permission,
      this.sicomAgent,
      this.tag,
      this.token,
      this.user,
      this.userState});

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponse(
      agentState: json['agentState'] as String,
      code: json['code'] as int,
      name: json['name'] as String,
      permission: json['permission'] as String,
      sicomAgent: json['sicomAgent'] as String,
      tag: json['tag'] as String,
      token: json['token'] as String,
      user: json['user'] as String,
      userState: json['userState'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agentState'] = this.agentState;
    data['code'] = this.code;
    data['name'] = this.name;
    data['permission'] = this.permission;
    data['sicomAgent'] = this.sicomAgent;
    data['tag'] = this.tag;
    data['token'] = this.token;
    data['user'] = this.user;
    data['userState'] = this.userState;
    return data;
  }
}
