class Mascota {
  var _nombre;
  var _id;
  var _tipo;
  var _color;
  var _genero;
  var _foto;

  Mascota(this._color, this._tipo, this._genero, this._id, this._nombre,
      this._foto);

  Mascota.fromJson(Map<String, dynamic> data)
      : _id = data['id'],
        _nombre = data['nombre'],
        _tipo = data['tipo'],
        _color = data['color'],
        _genero = data['genero'],
        _foto = data['foto'];

  Map<String, dynamic> convertir() => {
        'id': _id,
        'nombre': _nombre,
        'tipo': _tipo,
        'color': _color,
        'genero': _genero,
        'foto': _foto,
      };

  get foto => _foto;
  set foto(value) {
    _foto = value;
  }

  get nombre => _nombre;
  set nombre(value) {
    _nombre = value;
  }

  get id => _id;
  set id(value) {
    _id = value;
  }

  get tipo => _tipo;
  set tipo(value) {
    _tipo = value;
  }

  get color => _color;
  set color(value) {
    _color = value;
  }

  get genero => _genero;
  set genero(value) {
    _genero = value;
  }
}
