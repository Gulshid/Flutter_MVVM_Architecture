import 'package:flutter_dev/State_Management/Data/Response/status.dart';

class Api_Response<T> {
  Status? status;
  T? data;
  String? message;

  Api_Response(this.status, this.message, this.data);
  Api_Response.loading() : status = Status.LOADING;
  Api_Response.completed() : status = Status.COMPLETED;
  Api_Response.error() : status = Status.ERROR;

 
  String to_String() {
    return "Status: $status \n Message:$message \n Data: $data";
  }
}
