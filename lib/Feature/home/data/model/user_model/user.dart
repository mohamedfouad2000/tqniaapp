class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  dynamic image;
  String? jobTitle;
  String? address;
  String? phone;
  String? gender;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.image,
    this.jobTitle,
    this.address,
    this.phone,
    this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        image: json['image'] as dynamic,
        jobTitle: json['job_title'] as String?,
        address: json['address'] as String?,
        phone: json['phone'] as String?,
        gender: json['gender'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'image': image,
        'job_title': jobTitle,
        'address': address,
        'phone': phone,
        'gender': gender,
      };
}
