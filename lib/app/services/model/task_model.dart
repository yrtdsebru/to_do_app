class Task {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;
  final int v;

  Task(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.v});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'],
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  @override
  String toString() {
    return 'Task{id: $id, userId: $userId, title: $title, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  Task copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return Task(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  
}
