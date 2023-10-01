class SingleServiceModal {
  String logoUrl;
  String name;
  String description;
  List<String> imagesList;
  SingleServiceModal({
    required this.logoUrl,
    required this.name,
    required this.description,
    required this.imagesList,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'logoUrl': logoUrl,
      'imagesList': imagesList,
    };
  }

  factory SingleServiceModal.fromJson(Map<String, dynamic> json) {
    return SingleServiceModal(
      logoUrl: json['logoUrl'],
      name: json['name'],
      description: json['description'],
      imagesList: List<String>.from(json['imagesList']),
    );
  }
}
