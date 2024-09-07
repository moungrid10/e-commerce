import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/formatters/formatters.dart';

class UserModel{
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phoneNumber;

  String profilePicture;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstname $lastname';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);
    static List<String> nameParts(fullName) => fullName.split(" ");
      

      static String generateUsername(fullName){
      List<String> nameParts = fullName.split(" ");
      String firstname = nameParts[0].toLowerCase();
      String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

      String camelCaseUsername = "$firstname$lastname";
      String usernameWithPrefix = "cwt_$camelCaseUsername";
      return usernameWithPrefix;


    }

    static UserModel empty() => UserModel(id: '', firstname: '', lastname: '', username: '', email: '', phoneNumber: '',profilePicture: '');


    Map<String, dynamic> toJson(){
      return {
        'FirstName' : firstname,
        'LastName' : lastname,
        'Username' : username,
        'Email' : email,
        'PhoneNumber' : phoneNumber,
        'ProfilePicture' : profilePicture,
      };
    }

    factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  final data = document.data();
  if (data != null) {
    return UserModel(
      id: document.id,
      firstname: data['FirstName'] ?? '',
      lastname: data['LastName'] ?? '',
      username: data['Username'] ?? '',
      email: data['Email'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      profilePicture: data['ProfilePicture'] ?? '',
    );
  } else {
    throw Exception("Document data is null");
  }
}


  


}