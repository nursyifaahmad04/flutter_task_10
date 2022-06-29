class User {
  int? id;
  String? NamaPelanggan;
  String? alamat;
  String? telepon;
  String? email;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['NamaPelanggan'] = NamaPelanggan!;
    mapping['alamat'] = alamat!;
    mapping['telepon'] = telepon!;
    mapping['email'] = email!;
    return mapping;
  }
}
