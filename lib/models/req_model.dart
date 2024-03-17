class Requests {
  String? id;
  String? username;
  String? phone;
  String? email;
  String? det;
  // String? education;

  Requests(
      {this.id,
      this.username,
      this.email,
      this.phone,
      this.det,
      // this.education
      });

  factory Requests.fromJson(Map<String, dynamic> map) {
    return Requests(
      id: map['id'] ?? '',
      username: map['username'],
      phone: map['email'],
      det: map['det'],
      // education: map['education']
      );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'phone': phone,
      'email': email,
      'det': det,
      // 'education': education,
    };
  }
}
