import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dos_project/data/repo/yapilacaklardao_repository.dart';

class YapilacakKayitCubit extends Cubit<void>{
  YapilacakKayitCubit() : super(0);

  var yrepo = YapilacaklarDaoRepository();

  Future<void> kaydet(String name) async{
    await yrepo.kaydet(name);
  }
}