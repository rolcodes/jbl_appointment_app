class BranchClass {
  const BranchClass({
    required this.id,
    required this.image,
    required this.title,
    required this.location,
    required this.distance,
    required this.weekdayHours,
    required this.weekendHours,
    required this.branchStatus,
    required this.contact,
    required this.staffs,
  });

  final String id;
  final String image;
  final String title;
  final String location;
  final String distance;
  final String weekdayHours;
  final String weekendHours;
  final String branchStatus;
  final String contact;
  final List<String> staffs;
}
