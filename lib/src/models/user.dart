class User {
  int _id;
  String _email;
  String _fname;
  String _lname;
  String _avatar;

  User(this._id, this._email, this._fname, this._lname, this._avatar);

  User.fromJson(Map<String, dynamic> parsedJson) {
    this._id = parsedJson['id'];
    this._email = parsedJson['email'];
    this._fname = parsedJson['first_name'];
    this._lname = parsedJson['last_name'];
    this._avatar = parsedJson['avatar'];
  }

  int get id => _id;

  String get email => _email;

  String get fname => _fname;

  String get lname => _lname;

  String get avatar => _avatar;
}
