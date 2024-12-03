class Travel {
  final int id;
  final String nombre;
  final String contacto;
  final bool viaja;

  Travel(
    this.id,
    this.nombre,
    this.contacto,
    this.viaja,
  );
  factory Travel.fromMap(Map<String, dynamic> json) {
    return Travel(json['id'], json['nombre'], json['contacto'], json['viaja']);
  }
  factory Travel.fromJson(Map<String, dynamic> json) {
    return Travel(json['id'], json['nombre'], json['contacto'], json['viaja']);
  }
}
