class NewAPIResponse {
  String? status;
  dynamic? data;
  String? message;
  bool isSuccess = false;

  NewAPIResponse({
    required this.status,
    required this.data,
    required this.message,
  }) {
    if (status == "SUCCESS" || status == "1" || message!.contains("success")) {
      isSuccess = true;
    } else {
      isSuccess = false;
    }
  }

  factory NewAPIResponse.fromJson(Map<String, dynamic> json) {
    try {
      if(json['error']==null){
        return NewAPIResponse(
          status: "SUCCESS",
          data: json,
          message: "",
        );
      }else {
        return NewAPIResponse(
          status: "2",
          data: json['error'],
          message: "",
        );
      }
    } catch (e) {
      print(e);
      return NewAPIResponse(status: "dd", data: null, message: "sdvsd");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['data'] = data;
    data1['status'] = status;
    data1['message'] = message;
    data1['isSuccess'] = isSuccess;
    return data1;
  }
}
