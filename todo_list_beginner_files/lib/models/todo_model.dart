class TodoModel {
  final String name;
  final DateTime createdby;

  TodoModel({
    required this.name,
    required this.createdby,
  });

  @override
  String toString() {
    return 'TodoModel(name: $name, createdby: $createdby)';
  }
}
