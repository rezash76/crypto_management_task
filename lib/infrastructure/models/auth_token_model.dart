class AuthTokenModel {
  final String authToken;

  AuthTokenModel({required this.authToken});

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(authToken: json['authToken']);
  }
}
