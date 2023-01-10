import 'package:to_dos_project/data/entity/yapilacaklar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dos_project/data/repo/yapilacaklardao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>>{
  AnasayfaCubit() : super(<Yapilacaklar>[]);

  var yrepo = YapilacaklarDaoRepository();

  Future<void> yapilacaklariYukle() async{
    var liste = await yrepo.yapilacaklariYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async{
    var liste = await yrepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int id) async{
    await yrepo.sil(id);
    await yapilacaklariYukle();
  }
}