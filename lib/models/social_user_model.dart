class SocialUserModel {
  String email;
  String name;
  String phone;
  String uId;
  bool isEmailVerified;
  SocialUserModel(
      {this.email, this.name, this.phone, this.uId, this.isEmailVerified});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
