class RoutineModel {
  final String id; // primary key
  final String title;

  RoutineModel({
    required this.id,
    required this.title,
  });

  RoutineModel copyWith({
    String? id,
    String? title,
  }) {
    return RoutineModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}