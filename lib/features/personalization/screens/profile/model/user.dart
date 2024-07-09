class User {
  final String imagePath;

  const User({
    required this.imagePath,
  });

  Map<String, dynamic> toJson() => {
    'imagePath' : imagePath,
  };
}
