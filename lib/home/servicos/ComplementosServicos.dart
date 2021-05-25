class Complemento {
  int id_pessoa = 0;
  String nme_pessoa = "";
  String email_pessoa = "";
  String pwd_pessoa = "";
  String changedpassword = "";

  Map getUsersfromEmail(List users, String email) {
    var usuario = {};
    for (var user in users) {
      if (user.email_pessoa == email) {
        usuario['id_pessoa'] = user.id_pessoa;
        usuario['email_pessoa'] = user.email_pessoa;
        usuario['pwd_pessoa'] = user.pwd_pessoa;

        return usuario;
      }
    }
  }

  Map getnameuser(List users, String email) {
    var usuario = {};
    for (var user in users) {
      if (user.vhr_email == email) {
        usuario['id_pessoa'] = user.id_pessoa;
        usuario['nme_pessoa'] = user.nme_pessoa;

        return usuario;
      }
    }
  }

  void saveDataUser(Map userLogged) {
    id_pessoa = userLogged['id_pessoa'];
    nme_pessoa = userLogged['nme_pessoa'];
    email_pessoa = userLogged['email_pessoa'];
    // token = userLogged['token'];
  }
}
