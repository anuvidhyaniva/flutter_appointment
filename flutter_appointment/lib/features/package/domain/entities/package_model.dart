class Package {
  Package({
    required this.duration,
    required this.package,
  });
  final List<String> duration;
  final List<String> package;

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
        duration: List.castFrom<dynamic, String>(json['duration']),
        package: List.castFrom<dynamic, String>(json['package']));
  }
}
