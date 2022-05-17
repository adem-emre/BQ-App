class UserModel{
  String name;
  String surName;

  UserModel({required this.name, required this.surName});


  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "surName": surName
    };
  }


  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      name: map["name"],
      surName: map["surName"]
    );
  }

}