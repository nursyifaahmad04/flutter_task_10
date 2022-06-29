import 'package:flutter_tugas_10/model/Barang.dart';
import 'package:flutter/material.dart';

class ViewUser extends StatefulWidget {
  final Barang barang;

  const ViewUser({Key? key, required this.barang}) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SQLite CRUD"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Full Details",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Nama Pelanggan',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(widget.barang.KodeBarang ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Alamat',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Text(widget.barang.NamaBarang ?? '',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Telepon',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(widget.barang.harga ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Email',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(widget.barang.stock ?? '',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
