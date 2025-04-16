// Importa tu extensión (asegúrate de que el path sea correcto)
import 'package:extensions/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas de la extensión capitalize', () {
    test('Devuelve cadena vacía si la cadena es vacía', () {
      expect(''.capitalize(), '');
    });

    test('Capitaliza la primera letra de una palabra simple', () {
      expect('hola'.capitalize(), 'Hola');
    });

    test(
        'No modifica los caracteres que no son letras al inicio (ejemplo con signo)',
        () {
      expect('¿quieres cerrar?'.capitalize(), '¿Quieres cerrar?');
    });

    test('No modifica si no hay letras en el string', () {
      expect('123!'.capitalize(), '123!');
    });

    test(
        'Capitaliza correctamente cuando la primera letra es minúscula y el resto está en mayúsculas',
        () {
      expect('aREA'.capitalize(), 'Area');
    });

    test(
        'Mantiene la parte no alfabética intacta y capitaliza solo el primer carácter alfabético',
        () {
      expect('\$\$\$dollar'.capitalize(), '\$\$\$Dollar');
    });
  });
}
