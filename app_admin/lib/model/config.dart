import 'package:cloud_firestore/cloud_firestore.dart';

class Config{
  Horario? hra;
  Local? localizacao;
  String? whats;
  RedeSoc? redeSoc;
  String? docId;

  Config({this.hra,this.localizacao,this.whats,this.redeSoc,this.docId});

  Config.fromJson(DocumentSnapshot<Object?> snapshot) : this(
    docId: snapshot.id,
    whats: (snapshot.data() as Map<String, Object?>) ['whats'] as String,
    localizacao: Local.fromMap((snapshot.data() as Map<String, Object?>) ['localizacao'] as Map<String, Object?>),
    hra: Horario.fromMap((snapshot.data() as Map<String, Object?>) ['horario'] as Map<String, Object?>),
    redeSoc: RedeSoc.fromMap((snapshot.data() as Map<String, Object?>) ['redeSoc'] as Map<String, Object?>),
  );


  Map<String, Object?> toJson() {
    return {
      'horario' : hra!.toJson(),
      'localizacao' : localizacao!.toJson(),
      'whats': whats,
      'redeSoc' : redeSoc!.toJson(),
    };
  }
}

class Horario{
  String? domFer;
  String? sabado;
  String? segSexta;

  Horario({this.domFer,this.sabado,this.segSexta});
  Horario.fromMap(Map<String, Object?> map) : this(
    domFer: map['domFer'] as String,
    sabado: map['sabado'] as String,
    segSexta: map['segSexta'] as String,
  );

  Map<String, Object?> toJson() {
    return {
      'domFer' : domFer,
      'sabado' : sabado,
      'segSexta' : segSexta,
    };
  }

}

class Local{
  String endereco;

  Local({required this.endereco});
  Local.fromMap(Map<String, Object?> map) : this(
    endereco: map['endereco'] as String,
  );

  Map<String, Object?> toJson() {
    return {
      'endereco' : endereco,
    };
  }

}

class RedeSoc{
  String? face;
  String? insta;

  RedeSoc({this.face,this.insta});
  RedeSoc.fromMap(Map<String, Object?> map) : this(
    face: map['face'] as String,
    insta: map['insta'] as String,
  );

  Map<String, Object?> toJson() {
    return {
     'face' : face,
     'insta' : insta,
    };
  }

}
