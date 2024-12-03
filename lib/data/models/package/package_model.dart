class Package {
  final int id;
  final String nombre;
  final String fecha;
  final List<String> servicios;
  final int viajeros;

  Package(
    this.id,
    this.nombre,
    this.fecha,
    this.servicios,
    this.viajeros,
  );
  factory Package.fromMap(Map<String, dynamic> json) {
    return Package(json['id'], json['nombre'], json['fecha'], json['servicios'],
        json['viajeros']);
  }
  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(json['id'], json['nombre'], json['fecha'], json['servicios'],
        json['viajeros']);
  }
}
