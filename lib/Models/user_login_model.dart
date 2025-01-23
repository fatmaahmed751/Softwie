class UserLoginModel{
  late String password;
  late String email;


  UserLoginModel({
    this.email ='',
    this.password = ''
});
factory UserLoginModel.formJson(Map<String, dynamic>json){
  return UserLoginModel(

    email:json['email'],
password: json['password']
  );
}


}
