class Calzado {
  final int idCalzado;
  final String modelo;
  final String marca;
  final int numPie;
  final String precio;
  final int existencia;
  final String nombreAlmacen;

  Calzado({
    required this.idCalzado,
    required this.modelo,
    required this.marca,
    required this.numPie,
    required this.precio,
    required this.existencia,
    required this.nombreAlmacen,
  });
//funcion que mapea la respuasta para el llenado del modelo
  factory Calzado.fromJson(Map<String, dynamic> json) {
    return Calzado(
        idCalzado: json['id_calzado'],
        modelo: json['modelo'],
        marca: json['marca'],
        numPie: json['num_pie'],
        precio: json['precio'],
        existencia: json['existencia'],
        nombreAlmacen: json['nombre_almacen']);
  }
}

class Sucursal {
  final int idSucursal;
  final String nombre;

  Sucursal({required this.idSucursal, required this.nombre});

  factory Sucursal.fromJson(Map<String, dynamic> json) {
    return Sucursal(
      idSucursal: json['id_almacen'] ?? 0,
      nombre: json['nombre'] ?? '',
    );
  }
}
