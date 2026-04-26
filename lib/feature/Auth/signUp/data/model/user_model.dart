class UserData {
  final int? id;
  final String? name;
  final String? mobile;
  final String? email;
  final String? token;
  final String? profilePhoto;
  final String? profilePhotoUrl;

  UserData({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.token,
    this.profilePhoto,
    this.profilePhotoUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      token: json['token'],
      profilePhoto: json['profile_photo_path'],
      profilePhotoUrl: json['profile_photo_url'],
    );
  }
}
