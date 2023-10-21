class AppoinmentModel {
  final DateTime appoinmentTime;
  final String noOfPeople;
  final String serviceType;
  final String totalPrice;
  AppoinmentModel({
    required this.appoinmentTime,
    required this.noOfPeople,
    required this.serviceType,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'appoinmentTime': appoinmentTime,
      'noOfPeople': noOfPeople,
      'serviceType': serviceType,
      'totalPrice': totalPrice,
    };
  }

  factory AppoinmentModel.fromJson(Map<String, dynamic> map) {
    return AppoinmentModel(
      appoinmentTime: DateTime.parse(map['appoinmentTime']),
      noOfPeople: map['noOfPeople'],
      serviceType: map['serviceType'],
      totalPrice: map['totalPrice'],
    );
  }
}
