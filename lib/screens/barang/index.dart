import 'package:flutter_tugas_10/model/Barang.dart';
import 'package:flutter_tugas_10/model/User.dart';
import 'package:flutter_tugas_10/screens/barang/EditUser.dart';
import 'package:flutter_tugas_10/screens/barang/add.dart';
import 'package:flutter_tugas_10/screens/barang/viewUser.dart';
import 'package:flutter_tugas_10/services/barangService.dart';
import 'package:flutter/material.dart';

class PageBarang extends StatefulWidget {
  const PageBarang({Key? key}) : super(key: key);

  @override
  State<PageBarang> createState() => _PageBarangState();
}

class _PageBarangState extends State<PageBarang> {
  late List<Barang> _barangList = <Barang>[];
  final _barangService = BarangService();

  getAllBarangDetails() async {
    var barangs = await _barangService.readAllbarangs();
    _barangList = <Barang>[];
    barangs.forEach((barang) {
      setState(() {
        var barangModel = Barang();
        barangModel.id = barang['id'];
        barangModel.KodeBarang = barang['NamaPelanggan'];
        barangModel.NamaBarang = barang['alamat'];
        barangModel.harga = barang['telepon'];
        barangModel.stock = barang['email'];
        _barangList.add(barangModel);
      });
    });
  }

  @override
  void initState() {
    getAllBarangDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, barangId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Are You Sure to Delete',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.red),
                  onPressed: () async {
                    var result = await _barangService.deletebarang(barangId);
                    if (result != null) {
                      Navigator.pop(context);
                      getAllBarangDetails();
                      _showSuccessSnackBar('User Detail Deleted Success');
                    }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.teal),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Barang"),
      ),
      body: ListView.builder(
          itemCount: _barangList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewUser(
                                barang: _barangList[index],
                              )));
                },
                leading: const Icon(Icons.person),
                title: Text(_barangList[index].KodeBarang ?? ''),
                subtitle: Text(_barangList[index].NamaBarang ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditUser(
                                        barang: _barangList[index],
                                      ))).then((data) {
                            if (data != null) {
                              getAllBarangDetails();
                              _showSuccessSnackBar(
                                  'User Detail Updated Success');
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.teal,
                        )),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialog(context, _barangList[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Add()))
              .then((data) {
            if (data != null) {
              getAllBarangDetails();
              _showSuccessSnackBar('User Detail Added Success');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
