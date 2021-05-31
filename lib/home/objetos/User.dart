class PharmaUser {
  String status;
  int results;
  List<dynamic> data = [];

  PharmaUser({this.status, this.results, this.data});

  PharmaUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = (json['data'][0] as List)
        .map((e) {
          return Data.fromJson(e);
        })
        .cast<dynamic>()
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    data['data'] = this.data;
    return data;
  }
}

class Data {
  int id_usuario;
  String nme_usuario;
  String email_usuario;
  String pwd_usuario;
  String pwd_changed;
  String token;

  Data(this.id_usuario, this.nme_usuario, this.email_usuario, this.pwd_usuario,
      this.pwd_changed, this.token);

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      json['id_usuario'] as int,
      json['nme_usuario'] as String,
      json['email_usuario'] as String,
      json['pwd_usuario'] as String,
      json['pwd_changed'] as String,
      json['token'] as String,
    );
  }
}
