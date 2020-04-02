class User{
  //User Variables
  String email;
  String fullName;
  String password;

  User({
    this.email = "email@email.com",
    this.fullName = "John Doe",
    this.password = "Secret"
  });

  @override
  String toString() {
    return "{ email: $email, fullname: $fullName, password: $password }";
  }


}