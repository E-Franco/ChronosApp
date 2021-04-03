class User {
  final String email;
  final String mobileAuth;
  final String name;
  final String host;
  final String port;

  const User({
    this.email,
    this.mobileAuth,
    this.name,
    this.host,
    this.port,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return User(
      email: json['email'] ?? 'user@email.com',
      mobileAuth: json['mobile_auth'],
      name: json['name'] ?? 'Usuário',
      host: json['host'],
      port: json['port'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'mobile_auth': mobileAuth,
      'name': name,
      'host': host,
      'port': port,
    };
  }
}
