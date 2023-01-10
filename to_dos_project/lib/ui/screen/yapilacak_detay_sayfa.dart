import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dos_project/data/entity/yapilacaklar.dart';
import 'package:to_dos_project/ui/cubit/yapilacak_detay_cubit.dart';

class YapilacakDetaySayfa extends StatefulWidget {
  Yapilacaklar plan;
  YapilacakDetaySayfa({required this.plan});

  @override
  State<YapilacakDetaySayfa> createState() => _YapilacakDetaySayfaState();
}

class _YapilacakDetaySayfaState extends State<YapilacakDetaySayfa> {
  var tfPlanAd = TextEditingController();

  @override
  void initState() {
    super.initState();
    var plan = widget.plan;
    tfPlanAd.text = plan.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kişi Detay"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfPlanAd,decoration: const InputDecoration(hintText: "Yapılacak"),),
              ElevatedButton(onPressed: (){
                context.read<YapilacakDetayCubit>().guncelle(widget.plan.id, tfPlanAd.text);
              }, child: const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),
    );
  }
}
