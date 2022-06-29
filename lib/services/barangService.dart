import 'dart:async';

import 'package:flutter_tugas_10/db_helper/repository.dart';
import 'package:flutter_tugas_10/model/barang.dart';

class BarangService {
  late Repository _repository;
  BarangService() {
    _repository = Repository();
  }
  //Save barang
  Savebarang(Barang barang) async {
    return await _repository.insertData('barangs', barang.barangMap());
  }

  //Read All barangs
  readAllbarangs() async {
    return await _repository.readData('barangs');
  }

  //Edit barang
  Updatebarang(Barang barang) async {
    return await _repository.updateData('barangs', barang.barangMap());
  }

  deletebarang(barangId) async {
    return await _repository.deleteDataById('barangs', barangId);
  }
}
