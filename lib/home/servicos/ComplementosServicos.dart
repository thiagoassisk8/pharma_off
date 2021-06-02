import 'package:path/path.dart';

class Complemento {
  int id_usuario = 0;
  String nme_usuario = "";
  String email_usuario = "";
  String pwd_usuario = "";
  String changedpassword = "";

  Map getUsersfromEmail(List users, String email) {
    var usuario = {};
    for (var user in users) {
      if (user.email_usuario == email) {
        usuario['id_usuario'] = user.id_usuario;
        usuario['email_usuario'] = user.email_usuario;
        usuario['pwd_usuario'] = user.pwd_usuario;

        return usuario;
      }
    }
  }

  Map getnameuser(List users, String email) {
    var usuario = {};
    for (var user in users) {
      if (user.vhr_email == email) {
        usuario['id_usuario'] = user.id_usuario;
        usuario['nme_usuario'] = user.nme_usuario;

        return usuario;
      }
    }
  }

  void saveDataUser(Map userLogged) {
    id_usuario = userLogged['id_usuario'];
    nme_usuario = userLogged['nme_usuario'];
    email_usuario = userLogged['email_usuario'];
    // token = userLogged['token'];
  }

  bool isLogged(userstatus) {
    if (userstatus == true) {
      return true;
    } else {
      return false;
    }
  }
}
