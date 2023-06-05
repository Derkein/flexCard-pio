import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TestModel {
  final int? id;
  final String nome;
  final String descricao;
  final String nomeFantasia;

  TestModel({
    this.id,
    required this.nome,
    required this.descricao,
    required this.nomeFantasia,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'nomeFantasia': nomeFantasia,
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      id: map['id']?.toInt(),
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
      nomeFantasia: map['nomeFantasia'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TestModel.fromJson(String source) =>
      TestModel.fromMap(json.decode(source));
}
