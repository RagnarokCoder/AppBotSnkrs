class MacResponseModel{
  
  final String error;


  MacResponseModel({this.error});

  factory MacResponseModel.fromJson(Map<String,dynamic> json){
    return MacResponseModel(error: json["userType"] != null? json["userType"]: "");
  }
}

class MacRequestModel{
 
  String mac;

  MacRequestModel({
   
    this.mac
  });

  Map<String,dynamic>toJson(){
    Map<String,dynamic> map ={
   
      "divice": mac
    };

    return map;
  }
}