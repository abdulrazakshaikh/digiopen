class UserData {
  String? id;
  String? degree;
  String? language;
  String? courses;
  String? noofyears;
  String? category;
  String? class1;
  String? subject;
  String? image;
  String? deviceType;
  String? deviceToken;
  String? firstname;
  String? lastname;
  String? mobile;
  String? email;
  String? password;
  String? createdDate;
  String? updatedDate;
  String? status;
  String? type;

  UserData(
      {this.id,
      this.degree,
      this.language,
      this.courses,
      this.noofyears,
      this.category,
      this.class1,
      this.subject,
      this.image,
      this.deviceType,
      this.deviceToken,
      this.firstname,
      this.lastname,
      this.mobile,
      this.email,
      this.password,
      this.createdDate,
      this.updatedDate,
      this.status,
      this.type});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    degree = json['degree'];
    language = json['language'];
    courses = json['courses'];
    noofyears = json['noofyears'];
    category = json['category'];
    class1 = json['class'];
    subject = json['subject'];
    image = json['image'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    status = json['status'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['degree'] = this.degree;
    data['language'] = this.language;
    data['courses'] = this.courses;
    data['noofyears'] = this.noofyears;
    data['category'] = this.category;
    data['class'] = this.class1;
    data['subject'] = this.subject;
    data['image'] = this.image;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['status'] = this.status;
    data['type'] = this.type;
    return data;
  }
}