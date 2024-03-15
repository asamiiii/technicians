class Requests {
  String? id;
  String? username;
  String? phone;
  String? email;
  // String? age;
  // String? education;

  Requests(
      {this.id,
      this.username,
      this.email,
      this.phone,
      // this.age,
      // this.education
      });

  factory Requests.fromJson(Map<String, dynamic> map) {
    return Requests(
      id: map['id'] ?? '',
      username: map['username'],
      phone: map['email'],
      // age: map['age'],
      // education: map['education']
      );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'phone': phone,
      'email': email,
      // 'age': age,
      // 'education': education,
    };
  }
}
