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
    if (status == "SUCCESS" || status == "1") {
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
}
