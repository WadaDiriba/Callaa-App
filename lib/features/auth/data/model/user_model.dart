

class UserModel {

  final String id;
  final String username;
  final String fullName;
  final String? referralCode;
  final double amount;
  final String? accessToken;

  final int totalReffered;
  final double? totalEarned;

  UserModel({
    this.accessToken,
    required this.totalReffered,
    this.totalEarned,
    required this.amount,
    required this.id,
    required this.username,
    required this.fullName,
    required this.referralCode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['accessToken'] ?? '',
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      fullName: json['fullName'] ?? '',
      referralCode: json['referralCode'],
      totalReffered: json['totalReffered'] ?? 0,
      totalEarned: json['totalEarned'] != null ? (json['totalEarned'] as num).toDouble() : null,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "accessToken": accessToken,
      "id": id,
      "username": username,
      "fullName": fullName,
      "referralCode": referralCode,
      "amount": amount,
      "totalReffered": totalReffered,
      "totalEarned": totalEarned,
    };
  }
}
