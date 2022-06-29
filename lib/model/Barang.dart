class Barang {
  int? id;
  String? KodeBarang;
  String? NamaBarang;
  String? harga;
  String? stock;
  barangMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['KodeBarang'] = KodeBarang!;
    mapping['NamaBarang'] = NamaBarang!;
    mapping['harga'] = harga!;
    mapping['stock'] = stock!;
    return mapping;
  }
}
