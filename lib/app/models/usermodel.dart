import 'package:using_moor/app/database/database.dart';

class UserModel {
  String gender;
  Name name;
  String email;
  Dob dob;
  String phone;
  String cell;
  Picture picture;
  String nat;

  UserModel(
      {this.gender,
      this.name,
      this.email,
      this.dob,
      this.phone,
      this.cell,
      this.picture,
      this.nat});

  UserModel.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    email = json['email'];
    dob = json['dob'] != null ? new Dob.fromJson(json['dob']) : null;
    phone = json['phone'];
    cell = json['cell'];
    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    nat = json['nat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['email'] = this.email;
    if (this.dob != null) {
      data['dob'] = this.dob.toJson();
    }
    data['phone'] = this.phone;
    data['cell'] = this.cell;
    if (this.picture != null) {
      data['picture'] = this.picture.toJson();
    }
    data['nat'] = this.nat;
    return data;
  }
  User toMoor() {
    return User(
      name: '${this.name.first} ${this.name.last}', 
      email: this.email,
      profilePicture: this.picture.thumbnail,
      detailPicture: this.picture.thumbnail
    );
  }

}

class Name {
  String title;
  String first;
  String last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}

class Dob {
  String date;
  int age;

  Dob({this.date, this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['age'] = this.age;
    return data;
  }
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}