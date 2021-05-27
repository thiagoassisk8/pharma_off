class PharmaUser {
  String status;
  int results;
  List<dynamic> data = [];

  PharmaUser({this.status, this.results, this.data});

  PharmaUser.fromJson(Map<String, dynamic> json) {
    // status = json['status'];
    // results = json['results'];
    // data = (json['response'][0] as List)
    // .map((e) {
    // return Data.fromJson(e);
    // })
    // .cast<dynamic>()
    // .toList();
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
  int id_pessoa;
  String nme_pessoa;
  String pwd_pessoa;
  String email_pessoa;
  // String changedpassword;
  // String pwd_pessoa;

  Data(this.id_pessoa, this.nme_pessoa, this.email_pessoa,
      this.pwd_pessoa); // this.changedpassword

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      json['id_pessoa'] as int, json['nme_pessoa'] as String,
      json['email_pessoa'] as String, json['pwd_pessoa'] as String,
      // json['changedpassword'] as String,
    );
  }
}
