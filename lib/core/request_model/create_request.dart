import 'dart:convert';
import 'dart:io' show Platform;

class CreateRequest {
  // Get Device OS
  String os = Platform.operatingSystem;

  Future<String> userSearch(
      {String userId = '',}) async {
    String request = json.encode({
      'id':userId
    });
    return request;
  }


  Future<String> addUser({
    String name = '',
    String dob = '',
    String guardianName = '',
    String department = '',
    String role = '',
    String gender = '',
    String maritalStatus = '',
    String permanentAddress = '',
    String currentLocatedAddress = '',
    String contactNumber = '',
  }) async {
    String request = json.encode({
      "name": name,
      "name": dob,
      "name": guardianName,
      "name": department,
      "name": role,
      "query": gender,
      "query": maritalStatus,
      "query": permanentAddress,
      "query": currentLocatedAddress,
      "query": contactNumber,
    });
    return request;
  }



  Future<String> deleteUser(
      {String userId = '',}) async {
    String request = json.encode({
      'id':userId
    });
    return request;
  }




  Future<String> allUser({String email = ''}) async {
    String request = json.encode({
    } );
    return request;
  }






}
