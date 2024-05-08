import 'dart:convert';

class Exercicios {
  List<Exercicio>? tricepsOmbroPeito;
  List<Exercicio>? bracoCostas;
  List<Exercicio>? perna;

  Exercicios({this.tricepsOmbroPeito, this.bracoCostas, this.perna});

  Exercicios.fromJson(Map<String, dynamic> json) {
    if (json['exercicios']['Triceps/Ombro/Peito'] != null) {
      tricepsOmbroPeito = <Exercicio>[];
      json['exercicios']['Triceps/Ombro/Peito'].forEach((v) {
        tricepsOmbroPeito!.add(new Exercicio.fromJson(v));

      });
    }
    if (json['exercicios']['Braco/Costas'] != null) {
      bracoCostas = <Exercicio>[];
      json['exercicios']['Braco/Costas'].forEach((v) {
        bracoCostas!.add(new Exercicio.fromJson(v));
      });
    }
    if (json['exercicios']['Perna'] != null) {
      perna = <Exercicio>[];
      json['exercicios']['Perna'].forEach((v) {
        perna!.add(new Exercicio.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tricepsOmbroPeito != null) {
      data['Triceps/Ombro/Peito'] =
          this.tricepsOmbroPeito!.map((v) => v.toJson()).toList();
    }
    if (this.bracoCostas != null) {
      data['Braco/Costas'] = this.bracoCostas!.map((v) => v.toJson()).toList();
    }
    if (this.perna != null) {
      data['Perna'] = this.perna!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String toString(){
    Map<String, dynamic> json = this.toJson();
    return jsonEncode(json);
  }

}

class Exercicio {
  String? nome;
  String? series;
  String? repeticoes;
  String? peso;

  Exercicio({this.nome, this.series, this.repeticoes, this.peso});

  Exercicio.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    series = json['series'];
    repeticoes = json['repeticoes'];
    peso = json['peso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['series'] = this.series;
    data['repeticoes'] = this.repeticoes;
    data['peso'] = this.peso;
    return data;
  }
}