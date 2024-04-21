// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final DateTime? lastUpdate;

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
    this.lastUpdate,
  });

 
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
    DateTime? lastUpdate,
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
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

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
      'address': address,
      'lastUpdate': lastUpdate?.millisecondsSinceEpoch,
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
      age: map['age'] != null ? map['age'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      lastUpdate: map['lastUpdate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['lastUpdate'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, phone: $phone, token: $token, age: $age, gender: $gender, address: $address, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.phone == phone &&
      other.token == token &&
      other.age == age &&
      other.gender == gender &&
      other.address == address &&
      other.lastUpdate == lastUpdate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phone.hashCode ^
      token.hashCode ^
      age.hashCode ^
      gender.hashCode ^
      address.hashCode ^
      lastUpdate.hashCode;
  }
}

