class UserModel {
  final String uid;
  final String? phoneNumber;
  final String? email;
  final String? name;
  final String? paymentId;
  final String? appoinmentId;
  final bool isAdmin;
  UserModel({
    required this.uid,
    this.phoneNumber,
    this.email,
    this.name,
    this.paymentId,
    this.appoinmentId,
    required this.isAdmin,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'phoneNumber': phoneNumber,
      'email': email,
      'name': name,
      'paymentId': paymentId,
      'appoinmentId': appoinmentId,
      'isAdmin': isAdmin,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'] as String,
        phoneNumber:
            json['phoneNumber'] != null ? json['phoneNumber'] as String : null,
        email: json['email'] != null ? json['email'] as String : null,
        name: json['name'] != null ? json['name'] as String : null,
        paymentId:
            json['paymentId'] != null ? json['paymentId'] as String : null,
        appoinmentId: json['appoinmentId'] != null
            ? json['appoinmentId'] as String
            : null,
        isAdmin: json['isAdmin'] != null ? json['isAdmin'] as bool : false);
  }
}
