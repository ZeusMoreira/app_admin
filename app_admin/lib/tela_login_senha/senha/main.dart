import 'package:app_admin/model/config.dart';
import 'package:app_admin/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'my_app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

  /* Horario hr = Horario(domFer: "18:00-02:00", sabado: "18:00-02:00", segSexta: "18:00-02:00");
  Local local = Local(endereco: "Rua XXXxxxxx");
  RedeSoc redeSoc = RedeSoc(face: "Patao", insta: "@Pato");

  Config config = Config(hra: hr,localizacao: local ,whats: "90" , redeSoc: redeSoc);
  try{
    await FirestoreService().setConfig(config);
  }catch(e){
    print(e);
  } */


}
