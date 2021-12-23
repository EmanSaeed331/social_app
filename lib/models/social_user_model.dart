class SocialUserModel {
  String email;
  String name;
  String phone;
  String uId;
  String bio;
  String image;
  String cover;
  bool isEmailVerified;
  SocialUserModel(
      {this.email, this.name, this.phone, this.uId, this.isEmailVerified,this.bio,this.image,this.cover});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
    bio = json['bio'];
    image = json['image'];
    cover = json['cover'];

  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'bio':bio,
      'image':image,
      'cover':cover,
    };
  }
}
