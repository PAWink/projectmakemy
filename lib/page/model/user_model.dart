class UserModel {
  String? uid;
  String? choosevehicle;
  String? fullname;
  String? email;
  String? password;
  String? phone;
  String? faculty;
  String? vehicle;
  String? bank;

// receiving data
  UserModel(
      {this.uid,
      this.choosevehicle,
      this.bank,
      this.email,
      this.faculty,
      this.fullname,
      this.password,
      this.phone,
      this.vehicle});
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        choosevehicle: map['choosevehicle'],
        bank: map['bank'],
        email: map['email'],
        faculty: map['faculty'],
        fullname: map['fullname'],
        password: map['password'],
        phone: map['phone'],
        vehicle: map['vehicle']);
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'choosevehicle': choosevehicle,
      'bank': bank,
      'email': email,
      'faculty': faculty,
      'fullname': fullname,
      'password': password,
      'phone': phone,
      'vehicle': vehicle,
    };
  }
}
