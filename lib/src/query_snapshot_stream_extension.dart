import 'package:cloud_firestore/cloud_firestore.dart';

extension QuerySnapshotStreamExtensions
    on Stream<QuerySnapshot<Map<String, dynamic>>> {
  Stream<List<Map<String, dynamic>>> toMapJsonListStream() {
    return map((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      return querySnapshot.docs.map((doc) {
        // Obtener los datos del documento
        final Map<String, dynamic> data = doc.data();
        // Añadir el ID del documento
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }
}
