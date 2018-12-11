
final String contactTable = "Contacts";
final String idCollumn = "Id";
final String nameCollumn = "Name";
final String emailCollumn = "Email";
final String phoneCollumn = "Phone";
final String adressCollumn = "Adress";
final String imgCollumn = "Imagem";
final String dataCreationCollumn = "DataCreation";
final String activeCollumn = "Active";

class Contact {
  int id;
  String name;
  String email;
  String phone;
  String adress;
  String img;
  DateTime dataCreation;
  bool active;

  Contact.fromMap(Map map) {
    id = map[idCollumn];
    id = map[nameCollumn];
    id = map[emailCollumn];
    id = map[phoneCollumn];
    id = map[adressCollumn];
    id = map[imgCollumn];
    id = map[dataCreationCollumn];
    id = map[activeCollumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameCollumn: name,
      emailCollumn: email,
      phoneCollumn: email,
      adressCollumn: adress,
      imgCollumn: img,
      dataCreationCollumn: dataCreation,
      activeCollumn: active
    };
    if (id != null) {
      map[idCollumn] = id;
    }
    return map;
  }
}
