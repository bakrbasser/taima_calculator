// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Currency {
  final int id;
  final String name;
  final double sellPrice;
  final double buyPrice;

  const Currency({
    required this.id,
    required this.name,
    required this.sellPrice,
    required this.buyPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sellPrice': sellPrice,
      'buyPrice': buyPrice,
    };
  }

  factory Currency.fromMap(Map map) {
    return Currency(
      id: map['id'] as int,
      name: map['name'] as String,
      sellPrice: map['sellPrice'] as double,
      buyPrice: map['buyPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) =>
      Currency.fromMap(json.decode(source) as Map<String, dynamic>);
}
