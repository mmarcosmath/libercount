import 'dart:convert';

class Livro {
  String codigo;
  Livro({
    this.codigo,
  });

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
    };
  }

  static Livro fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Livro(
      codigo: map['codigo'],
    );
  }

  String toJson() => json.encode(toMap());

  static Livro fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Livro(codigo: $codigo)';
}
