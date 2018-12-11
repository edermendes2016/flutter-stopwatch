import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String contactTable = "Contacts";
final String idCollumn = "Id";
final String nameCollumn = "Name";
final String emailCollumn = "Email";
final String phoneCollumn = "Phone";
final String adressCollumn = "Adress";
final String imgCollumn = "Imagem";
final String dataCreationCollumn = "DataCreation";
final String activeCollumn = "Active";

class ContactModel {
  static final ContactModel _instance = ContactModel.internal();

  factory ContactModel() => _instance;

  ContactModel.internal();

  Database _db;

 Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database>initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contacts.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async{
      await db.execute(
        "CREATE TABLE $contactTable($idCollumn INTEGER PRIMARY KEY, $nameCollumn TEXT, $emailCollumn TEXT," 
        "$phoneCollumn TEXT, $adressCollumn TEXT, $imgCollumn TEXT, $dataCreationCollumn DATETIME, $activeCollumn BOOL)"
      );
    });
  }
}

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
