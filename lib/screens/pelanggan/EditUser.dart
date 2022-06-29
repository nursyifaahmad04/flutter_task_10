import 'package:flutter_tugas_10/model/User.dart';
import 'package:flutter_tugas_10/services/userService.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  final User user;
  const EditUser({Key? key, required this.user}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  var _userNamaPelangganController = TextEditingController();
  var _userAlamatController = TextEditingController();
  var _userTeleponController = TextEditingController();
  var _userEmailController = TextEditingController();
  bool _validateNamaPelanggan = false;
  bool _validateAlamat = false;
  bool _validateTelepon = false;
  bool _validateEmail = false;
  var _userService = UserService();

  @override
  void initState() {
    setState(() {
      _userNamaPelangganController.text = widget.user.NamaPelanggan ?? '';
      _userAlamatController.text = widget.user.alamat ?? '';
      _userTeleponController.text = widget.user.telepon ?? '';
      _userEmailController.text = widget.user.email ?? '';
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
                  controller: _userNamaPelangganController,
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
                  controller: _userAlamatController,
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
                  controller: _userTeleponController,
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
                  controller: _userEmailController,
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
                          _userNamaPelangganController.text.isEmpty
                              ? _validateNamaPelanggan = true
                              : _validateNamaPelanggan = false;
                          _userAlamatController.text.isEmpty
                              ? _validateAlamat = true
                              : _validateAlamat = false;
                          _userTeleponController.text.isEmpty
                              ? _validateTelepon = true
                              : _validateTelepon = false;
                          _userEmailController.text.isEmpty
                              ? _validateEmail = true
                              : _validateEmail = false;
                        });
                        if (_validateNamaPelanggan == false &&
                            _validateAlamat == false &&
                            _validateTelepon == false &&
                            _validateEmail == false) {
                          // print("Good Data Can Save");
                          var _user = User();
                          _user.id = widget.user.id;
                          _user.NamaPelanggan =
                              _userNamaPelangganController.text;
                          _user.alamat = _userAlamatController.text;
                          _user.telepon = _userTeleponController.text;
                          _user.email = _userEmailController.text;
                          var result = await _userService.UpdateUser(_user);
                          Navigator.pop(context, result);
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
                        _userNamaPelangganController.text = '';
                        _userAlamatController.text = '';
                        _userTeleponController.text = '';
                        _userEmailController.text = '';
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
