import 'package:flutter_tugas_10/model/Barang.dart';
import 'package:flutter_tugas_10/services/barangService.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  final Barang barang;
  const EditUser({Key? key, required this.barang}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  var NamaPelangganController = TextEditingController();
  var AlamatController = TextEditingController();
  var TeleponController = TextEditingController();
  var EmailController = TextEditingController();
  bool _validateNamaPelanggan = false;
  bool _validateAlamat = false;
  bool _validateTelepon = false;
  bool _validateEmail = false;
  var _barangService = BarangService();

  @override
  void initState() {
    setState(() {
      NamaPelangganController.text = widget.barang.KodeBarang ?? '';
      AlamatController.text = widget.barang.NamaBarang ?? '';
      TeleponController.text = widget.barang.harga ?? '';
      EmailController.text = widget.barang.stock ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite CRUD"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edit New User',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: NamaPelangganController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Nama Pelanggan',
                    labelText: 'Nama Pelanggan',
                    errorText: _validateNamaPelanggan
                        ? 'Name Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: AlamatController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Alamat',
                    labelText: 'Alamat',
                    errorText: _validateAlamat
                        ? 'Contact Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: TeleponController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Telepon',
                    labelText: 'Telepon',
                    errorText: _validateTelepon
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: EmailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    errorText: _validateEmail
                        ? 'Description Value Can\'t Be Empty'
                        : null,
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
                          NamaPelangganController.text.isEmpty
                              ? _validateNamaPelanggan = true
                              : _validateNamaPelanggan = false;
                          AlamatController.text.isEmpty
                              ? _validateAlamat = true
                              : _validateAlamat = false;
                          TeleponController.text.isEmpty
                              ? _validateTelepon = true
                              : _validateTelepon = false;
                          EmailController.text.isEmpty
                              ? _validateEmail = true
                              : _validateEmail = false;
                        });
                        if (_validateNamaPelanggan == false &&
                            _validateAlamat == false &&
                            _validateTelepon == false &&
                            _validateEmail == false) {
                          print("Good Data Can Save");
                          // var _barang = Barang();
                          // _barang.id = widget.barang.id;
                          // _barang.KodeBarang = NamaPelangganController.text;
                          // _barang.NamaBarang = AlamatController.text;
                          // _barang.harga = TeleponController.text;
                          // _barang.stock = EmailController.text;
                          // var result =
                          //     await _barangService.Updatebarang(_barang);
                          // Navigator.pop(context, result);
                        }
                      },
                      child: const Text('Update Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        NamaPelangganController.text = '';
                        AlamatController.text = '';
                        TeleponController.text = '';
                        EmailController.text = '';
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
