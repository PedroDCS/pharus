class SchoolEntity {
  // series
  // turmas - turnos

  final String name;
  final String director;
  final List<String> series;
  final List<String> classes;

  final String profileUrl;
  final String capeUrl;

  SchoolEntity({
    required this.name,
    required this.director,
    required this.series,
    required this.classes,
    required this.profileUrl,
    required this.capeUrl,
  });
}
