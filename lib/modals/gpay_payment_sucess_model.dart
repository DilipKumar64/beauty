class GpayPaymentSucessModel {
  int apiVersion;
  int apiVersionMinor;
  PaymentMethodData paymentMethodData;
  DateTime? paymentTime;

  GpayPaymentSucessModel(
      {required this.apiVersion,
      required this.apiVersionMinor,
      required this.paymentMethodData,
      this.paymentTime});

  factory GpayPaymentSucessModel.fromJson(Map<String, dynamic> json) =>
      GpayPaymentSucessModel(
          apiVersion: json["apiVersion"],
          apiVersionMinor: json["apiVersionMinor"],
          paymentMethodData:
              PaymentMethodData.fromJson(json["paymentMethodData"]),
          paymentTime: (json['paymentTime'] != null)
              ? DateTime(json['paymentTime'])
              : null);

  Map<String, dynamic> toJson() => {
        "apiVersion": apiVersion,
        "apiVersionMinor": apiVersionMinor,
        "paymentMethodData": paymentMethodData.toJson(),
        "paymentTime": paymentTime
      };
}

class PaymentMethodData {
  String description;
  Info info;
  TokenizationData tokenizationData;
  String type;

  PaymentMethodData({
    required this.description,
    required this.info,
    required this.tokenizationData,
    required this.type,
  });

  factory PaymentMethodData.fromJson(Map<String, dynamic> json) =>
      PaymentMethodData(
        description: json["description"],
        info: Info.fromJson(json["info"]),
        tokenizationData: TokenizationData.fromJson(json["tokenizationData"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "info": info.toJson(),
        "tokenizationData": tokenizationData.toJson(),
        "type": type,
      };
}

class Info {
  BillingAddress billingAddress;
  String cardDetails;
  String cardNetwork;

  Info({
    required this.billingAddress,
    required this.cardDetails,
    required this.cardNetwork,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        billingAddress: BillingAddress.fromJson(json["billingAddress"]),
        cardDetails: json["cardDetails"],
        cardNetwork: json["cardNetwork"],
      );

  Map<String, dynamic> toJson() => {
        "billingAddress": billingAddress.toJson(),
        "cardDetails": cardDetails,
        "cardNetwork": cardNetwork,
      };
}

class BillingAddress {
  String address1;
  String? address2;
  String? address3;
  String? administrativeArea;
  String countryCode;
  String? locality;
  String name;
  String phoneNumber;
  String? postalCode;
  String? sortingCode;

  BillingAddress({
    required this.address1,
    this.address2,
    this.address3,
    this.administrativeArea,
    required this.countryCode,
    this.locality,
    required this.name,
    required this.phoneNumber,
    this.postalCode,
    this.sortingCode,
  });

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
        address1: json["address1"],
        address2: json["address2"],
        address3: json["address3"],
        administrativeArea: json["administrativeArea"],
        countryCode: json["countryCode"],
        locality: json["locality"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        postalCode: json["postalCode"],
        sortingCode: json["sortingCode"],
      );

  Map<String, dynamic> toJson() => {
        "address1": address1,
        "address2": address2,
        "address3": address3,
        "administrativeArea": administrativeArea,
        "countryCode": countryCode,
        "locality": locality,
        "name": name,
        "phoneNumber": phoneNumber,
        "postalCode": postalCode,
        "sortingCode": sortingCode,
      };
}

class TokenizationData {
  String token;
  String type;

  TokenizationData({
    required this.token,
    required this.type,
  });

  factory TokenizationData.fromJson(Map<String, dynamic> json) =>
      TokenizationData(
        token: json["token"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "type": type,
      };
}
