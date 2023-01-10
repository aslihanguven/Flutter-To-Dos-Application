import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dos_project/data/repo/yapilacaklardao_repository.dart';

class YapilacakDetayCubit extends Cubit<void>{
  YapilacakDetayCubit() : super(0);

  var yrepo = YapilacaklarDaoRepository();

  Future<void> guncelle(int id, String name) async{
    await yrepo.guncelle(id, name);
  }
}