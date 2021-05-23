class JsonDefault {
  String status;
  String data;
  String token;
  String message;

  JsonDefault({this.status, this.data, this.token, this.message});

  JsonDefault.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}
