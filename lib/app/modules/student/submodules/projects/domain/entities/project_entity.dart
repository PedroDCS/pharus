class ProjectEntity {
  final String name;
  final int score;
  final String medal;
  final String description;
  final String scoreDescription;
  final DateTime startDate;
  final DateTime endDate;
  final String rules;
  final String mentor;
  final String projectType;
  final String urlImage;
  final String urlParter;
  ProjectEntity({
    required this.name,
    required this.score,
    required this.medal,
    required this.description,
    required this.scoreDescription,
    required this.startDate,
    required this.endDate,
    required this.rules,
    required this.mentor,
    required this.projectType,
    required this.urlImage,
    required this.urlParter,
  });
}
