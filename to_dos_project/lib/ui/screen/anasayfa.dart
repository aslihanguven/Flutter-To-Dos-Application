import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dos_project/data/entity/yapilacaklar.dart';
import 'package:to_dos_project/ui/cubit/anasayfa_cubit.dart';
import 'package:to_dos_project/ui/screen/yapilacak_detay_sayfa.dart';
import 'package:to_dos_project/ui/screen/yapilacak_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yapilacaklariYukle();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
            TextField(decoration: const InputDecoration(hintText: "ARA"),onChanged: (aramaSonucu){
              context.read<AnasayfaCubit>().ara(aramaSonucu);
            },) :
            const Text("To Dos"),
            actions: [
              aramaYapiliyorMu ?
              IconButton(onPressed: (){
                setState(() {
                  aramaYapiliyorMu = false;
                });
              }, icon: const Icon(Icons.clear)) :
              IconButton(onPressed: (){
                setState(() {
                  aramaYapiliyorMu = true;
                });
                context.read<AnasayfaCubit>().yapilacaklariYukle();
              }, icon: const Icon(Icons.search)),
            ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Yapilacaklar>>(
        builder: (context, yapilacaklarListesi){
          if(yapilacaklarListesi.isNotEmpty){
            return ListView.builder(
              itemCount: yapilacaklarListesi.length,
              itemBuilder: (context,indeks){
                var plan = yapilacaklarListesi[indeks];
                return GestureDetector( onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacakDetaySayfa(plan: plan)))
                      .then((value) {context.read<AnasayfaCubit> ().yapilacaklariYukle();});
                },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${plan.name} "),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${plan.name} silinsin mi?"),
                              action: SnackBarAction(
                                label: "Evet",
                                onPressed: () {
                                  context.read<AnasayfaCubit>().sil(plan.id);
                                },
                              ),
                            ),
                          );
                        }, icon: Icon(Icons.delete_outline,color: Colors.black54,)),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const YapilacakKayitSayfa()))
              .then((value) {context.read<AnasayfaCubit>().yapilacaklariYukle();});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
