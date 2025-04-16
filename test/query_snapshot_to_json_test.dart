import 'package:extensions/extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Implementación ficticia de QueryDocumentSnapshot para pruebas.
// ignore: subtype_of_sealed_class
class FakeQueryDocumentSnapshot implements QueryDocumentSnapshot<Object?> {
  @override
  final String id;
  final Map<String, dynamic> _data;

  FakeQueryDocumentSnapshot({
    required this.id,
    required Map<String, dynamic> data,
  }) : _data = data;

  @override
  Map<String, dynamic> data() => _data;

  // Se delegan otros métodos/properties a noSuchMethod para evitar implementarlos todos.
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// Implementación ficticia de QuerySnapshot para pruebas.
class FakeQuerySnapshot implements QuerySnapshot<Object?> {
  final List<FakeQueryDocumentSnapshot> _docs;

  FakeQuerySnapshot(this._docs);

  @override
  List<QueryDocumentSnapshot<Object?>> get docs => _docs;

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('QuerySnapshotExtensions', () {
    // Preparamos una lista de documentos falsos para la prueba.
    final docs = [
      FakeQueryDocumentSnapshot(id: '1', data: {'field': 'value1'}),
      FakeQueryDocumentSnapshot(id: '2', data: {'field': 'value2'}),
      FakeQueryDocumentSnapshot(id: '3', data: {'field': 'value3'}),
    ];
    final snapshot = FakeQuerySnapshot(docs);

    test('toListMapJson returns list of maps with id field', () {
      final listMap = snapshot.toListMapJson();

      expect(listMap.length, equals(3));
      expect(listMap[0]['id'], equals('1'));
      expect(listMap[0]['field'], equals('value1'));
      expect(listMap[1]['id'], equals('2'));
      expect(listMap[1]['field'], equals('value2'));
      expect(listMap[2]['id'], equals('3'));
      expect(listMap[2]['field'], equals('value3'));
    });

    test('toListString returns list of document ids', () {
      final ids = snapshot.toListString();
      expect(ids, equals(['1', '2', '3']));
    });

    test(
        'toJson returns map where keys are document ids and values are maps with id field',
        () {
      final jsonMap = snapshot.toJson();

      expect(jsonMap.length, equals(3));
      expect(jsonMap['1'], isA<Map<String, dynamic>>());
      expect(jsonMap['1']['id'], equals('1'));
      expect(jsonMap['1']['field'], equals('value1'));
      expect(jsonMap['2']['id'], equals('2'));
      expect(jsonMap['2']['field'], equals('value2'));
      expect(jsonMap['3']['id'], equals('3'));
      expect(jsonMap['3']['field'], equals('value3'));
    });
  });
}
