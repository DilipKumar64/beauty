import 'dart:convert';

class UserModel {
  final String uid;
  final String? phoneNumber;
  final String? email;
  final String? name;
  final String? paymentId;
  final String? appoinmentId;
  UserModel(
      {required this.uid,
      this.phoneNumber,
      this.email,
      this.name,
      this.paymentId,
      this.appoinmentId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'phoneNumber': phoneNumber,
      'email': email,
      'name': name,
      'paymentId': paymentId,
      'appoinmentId': appoinmentId
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'] as String,
        phoneNumber:
            map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
        email: map['email'] != null ? map['email'] as String : null,
        name: map['name'] != null ? map['name'] as String : null,
        paymentId: map['paymentId'] != null ? map['paymentId'] as String : null,
        appoinmentId:
            map['appoinmentId'] != null ? map['appoinmentId'] as String : null);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
