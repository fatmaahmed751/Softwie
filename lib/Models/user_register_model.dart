class UserRegisterModel {
  late String name;
  late String email;
  late String password;
  late String confirmPassword;
  late String uId;
  late String image;
  late String coverImage;
  late String bio;

  UserRegisterModel({
    this.name = '',
      this.email = '',
      this.password = '',
    this.confirmPassword='',
      this.uId = '',
      this.image = 'https://i.pinimg.com/564x/c0/c8/17/c0c8178e509b2c6ec222408e527ba861.jpg'
    ,
    this.coverImage = 'https://i.pinimg.com/564x/96/77/96/967796a7208b39ac2498310c84e5ab3c.jpg',
    this.bio = 'Flutter Developer',

      });
  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      image: json['image'],
      coverImage: json['coverImage'],
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'email': email,
      'uId': uId,
      'coverImage': coverImage,
      'bio': bio
    };
  }

  List<UserRegisterModel> users = [];
}
