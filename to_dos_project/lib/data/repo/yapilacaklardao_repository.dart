import 'dart:ffi';
import 'package:to_dos_project/data/sqlite/veritabani.dart';

import '../entity/yapilacaklar.dart';

class YapilacaklarDaoRepository{
  Future<void> kaydet(String name) async{
    var db = await Veritabani.veritabaniErisim();
    var planlar = Map<String, dynamic>();
    planlar["name"] = name;
    await db.insert("toDos", planlar);
  }
  Future<void> guncelle(int id, String name) async{
    var db = await Veritabani.veritabaniErisim();

    var planlar = Map<String, dynamic>();
    planlar["name"] = name;

    await db.update("toDos", planlar, where: "id=?", whereArgs: [id] );
  }

  Future<List<Yapilacaklar>> yapilacaklariYukle() async{
    var db = await Veritabani.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM toDos");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Yapilacaklar(id: satir["id"], name: satir["name"]);
    });
  }

  Future<List<Yapilacaklar>> ara(String aramaKelimesi) async{
    var db = await Veritabani.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM toDos WHERE name like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Yapilacaklar(id: satir["id"], name: satir["name"]);
    } );
  }
  Future<void> sil(int id) async{
    var db = await Veritabani.veritabaniErisim();
    await db.delete("toDos", where: "id=?", whereArgs: [id]);
  }
}