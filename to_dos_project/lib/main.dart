import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dos_project/ui/cubit/anasayfa_cubit.dart';
import 'package:to_dos_project/ui/cubit/yapilacak_detay_cubit.dart';
import 'package:to_dos_project/ui/cubit/yapilacak_kayit_cubit.dart';
import 'package:to_dos_project/ui/screen/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => YapilacakKayitCubit()),
        BlocProvider(create: (context) => YapilacakDetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Anasayfa(),
      ),
    );
  }
}

