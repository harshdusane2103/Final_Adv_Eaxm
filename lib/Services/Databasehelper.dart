import 'package:final_eaxm_ui/Modal/modal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper
{
  static DbHelper dbHelper =DbHelper._();
  DbHelper._();
  Database? db;
  get database async => db?? await initDatabase();

  initDatabase() async {
    final path= await getDatabasesPath();
    final dbPath= join(path,'product.db');
    db=await openDatabase(
        dbPath,
       version: 1,
      onCreate: (dbPath,version) async {
        String sql='''CREATE TABLE product (name TEXT PRIMARY KEY, Category TEXT NOT NULL, Quantity INTEGER NOT NULL  ); ''';
          await db?.execute(sql);
      }

    );
    return db;

  }

   Future<int> insertDatabase(InventoryModal inventory)
   async {
     Database? db = await database;
     String sql = '''INSERT INTO product (name,Category,Quantity) 
     VALUES (?,?,?);
    ''';
     List args = [inventory.name,inventory.Category,inventory.Quantity];
     return await db!.rawInsert(sql, args);
   }
  Future<List<Map<String, Object?>>> readData() async {
    Database? db = await database;
    String sql = '''SELECT * FROM product''';
    return await db!.rawQuery(sql);
  }


   Future<void> updateDatabase(InventoryModal inventory,String name)
    async {
     Database? db =await database;
     String sql=''' UPDATE product SET name''';
     List args= [inventory.name,inventory.Category,inventory.Quantity];
     await db!.rawUpdate(sql,args);
   }
   deleteDatabase(String name)
   async {
     Database? db = await database;
     String sql = '''DELETE FROM product WHERE name = ?''';
     List args = [name];
     await db!.rawDelete(sql, args);
   }





}
