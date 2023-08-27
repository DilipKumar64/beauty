import 'dart:convert';

class SingleServiceModal {
  String name;
  String description;
  List<String> imagesList;
  SingleServiceModal({
    required this.name,
    required this.description,
    required this.imagesList,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imagesList': imagesList,
    };
  }

  factory SingleServiceModal.fromMap(Map<String, dynamic> map) {
    return SingleServiceModal(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imagesList: List<String>.from(map['imagesList']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleServiceModal.fromJson(String source) =>
      SingleServiceModal.fromMap(json.decode(source));
}
