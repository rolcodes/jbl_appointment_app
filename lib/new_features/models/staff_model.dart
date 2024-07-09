class StaffModel {
  const StaffModel({
    required this.id,
    required this.image,
    required this.staffName,
    required this.location,
    required this.position,
    required this.rating,
  });

  final String id;
  final String image;
  final String staffName;
  final String location;
  final String position;
  final double rating;
}
