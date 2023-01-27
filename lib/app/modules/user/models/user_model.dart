import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
//url https://63d3c5a4a93a149755b25aa3.mockapi.io/user

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String jobTitle;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'jobTitle': jobTitle,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      jobTitle: map['jobTitle'] as String,
    );
  }
}
