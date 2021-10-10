import 'package:app_admin/model/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
 
  final CollectionReference _ref = FirebaseFirestore.instance.collection('PatoBurguer')
      .withConverter<Config> (
      fromFirestore: (snapshot,_) => Config.fromJson(snapshot),
      toFirestore: (config,_) => config.toJson(),
  );

  Future<Config> getConfig() async {
    Config config = await _ref.doc('config').get().then((snapshot) => snapshot.data() as Config);
    return config;
  }

  Future<void> setConfig(Config config) async {
    await _ref.doc('config').set(config).catchError((error) => throw error);
  }

}