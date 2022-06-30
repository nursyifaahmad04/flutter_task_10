import 'package:flutter_tugas_10/model/Barang.dart';
import 'package:flutter_tugas_10/services/barangService.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  var _barangKodeBarangController = TextEditingController();
  var _barangNamaBarangController = TextEditingController();
  var _barangHargaController = TextEditingController();
  var _barangStockController = TextEditingController();
  bool _validateKodeBarang = false;
  bool _validateNamaBarang = false;
  bool _validateHarga = false;
  bool _validateStock = false;
  var _barangService = BarangService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Barang"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tambahkan Data Barang',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _barangKodeBarangController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan Kode Barang',
                    labelText: 'Kode Barang',
                    errorText: _validateKodeBarang
                        ? 'Kode Barang Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _barangNamaBarangController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukan NamaBarang',
                    labelText: 'NamaBarang',
                    errorText: _validateNamaBarang
                        ? 'NamaBarang Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _barangHargaController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukan Nomor Harga',
                    labelText: 'Harga',
                    errorText:
                        _validateHarga ? 'Harga Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _barangStockController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukan Stock',
                    labelText: 'Stock',
                    errorText:
                        _validateStock ? 'Stock Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _barangKodeBarangController.text.isEmpty
                              ? _validateKodeBarang = true
                              : _validateKodeBarang = false;
                          _barangNamaBarangController.text.isEmpty
                              ? _validateNamaBarang = true
                              : _validateNamaBarang = false;
                          _barangHargaController.text.isEmpty
                              ? _validateHarga = true
                              : _validateHarga = false;
                          _barangStockController.text.isEmpty
                              ? _validateStock = true
                              : _validateStock = false;
                        });
                        if (_validateKodeBarang == false &&
                            _validateNamaBarang == false &&
                            _validateHarga == false &&
                            _validateStock == false) {
                          print("Good Data Can Save");
                          // var _barang = Barang();
                          // _barang.KodeBarang = _barangKodeBarangController.text;
                          // _barang.NamaBarang = _barangNamaBarangController.text;
                          // _barang.harga = _barangHargaController.text;
                          // _barang.stock = _barangStockController.text;
                          // var result = await _barangService.Savebarang(_barang);
                          // Navigator.pop(context, result);
                        }
                      },
                      child: const Text('Save Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _barangKodeBarangController.text = '';
                        _barangNamaBarangController.text = '';
                        _barangHargaController.text = '';
                        _barangStockController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
