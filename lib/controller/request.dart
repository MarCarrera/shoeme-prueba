import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/view_model.dart';

//url local
//final url = Uri.parse('http://192.168.1.93/shoeme_api/controller.php');

//final url Produccion
final url = Uri.parse("https://marcarrera.site/shoeme_api/controller.php");

Future<List<Calzado>> getShoes() async {
  var data = {
    'opcion': '1',
  };
  try {
    final response = await http.post(
      url,
      body: data,
    );

    if (response.statusCode == 200) {
      //print(response.body);
      var jsonResponse = jsonDecode(response.body) as List;
      return jsonResponse.map((item) => Calzado.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener entrenamientos');
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

Future<List<Calzado>> getShoesById({required String idAlmacen}) async {
  var data = {'opcion': '2', 'id_almacen': idAlmacen};
  try {
    final response = await http.post(
      url,
      body: data,
    );

    if (response.statusCode == 200) {
      print(response.body);
      var jsonResponse = jsonDecode(response.body) as List;
      return jsonResponse.map((item) => Calzado.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener entrenamientos');
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

Future<bool> addNewShoe(
    {required String modelo,
    required String marca,
    required String numPie,
    required String precio,
    required String existencia,
    required String almacen}) async {
  var data = {
    'opcion': '3',
    'modelo': modelo,
    'marca': marca,
    'num_pie': numPie,
    'precio': precio,
    'existencia': existencia,
    'id_almacen': almacen
  };
  try {
    final response = await http.post(
      url,
      body: data,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Error al agregar: ${response.reasonPhrase}');
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> updateShoe(
    {
    required String idCalzado,
    required String precio}) async {
  var data = {
    'opcion': '4',
    'id_calzado': idCalzado,
    'precio': precio,
  };
  try {
    final response = await http.post(
      url,
      body: data,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Error al agregar: ${response.reasonPhrase}');
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> deleteShoe({required String idCalzado}) async {
  var data = {'opcion': '5', 'id_calzado': idCalzado};
  try {
    final response = await http.post(
      url,
      body: data,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Error al agregar: ${response.reasonPhrase}');
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<List<Sucursal>> getSucursales() async {
  var data = {'opcion': '6'};
  try {
    final response = await http.post(
      url,
      body: data,
    );

    if (response.statusCode == 200) {
      //print(response.body);
      var jsonResponse = jsonDecode(response.body) as List;
      return jsonResponse.map((item) => Sucursal.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener entrenamientos');
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
