import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String token;
  final String? age;       
  final String? gender;    
  final String? address;   

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.token,
    this.age,      
    this.gender,   
    this.address,  
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'token': token,
      'age': age,        
      'gender': gender,  
      'address': address 
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
      token: map['token'] as String,
      age: map['age'] as String?,       
      gender: map['gender'] as String?, 
      address: map['address'] as String?
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? token,
    String? age,
    String? gender,
    String? address,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      token: token ?? this.token,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      address: address ?? this.address,
    );
  }
}

