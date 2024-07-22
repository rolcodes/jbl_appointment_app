class UserModel {
  final String email;
  final String name;
  final String telephone;
  final String id;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.telephone,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'telephone': telephone,
  };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        telephone: json['telephone'],
      );
}
