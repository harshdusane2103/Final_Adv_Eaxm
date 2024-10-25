import 'package:final_eaxm_ui/Modal/modal.dart';
import 'package:final_eaxm_ui/Services/Databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController
{
   var InventoryList=<InventoryModal>[].obs;
   TextEditingController txtName=TextEditingController();
   TextEditingController txtCategory=TextEditingController();
   TextEditingController txtQuantity=TextEditingController();

   @override
  void onInit() {

    super.onInit();
    fetchData();
  }

  Future<void> fetchData()
   async {
     final  books =  await  DbHelper.dbHelper.readData();
     InventoryList.value = books.map((bookMap) => InventoryModal.fromMap(bookMap)).toList();
     print(InventoryList);
  }
  void addProduct(InventoryModal inventory)
  {
     DbHelper.dbHelper.insertDatabase(inventory);
     fetchData();


  }
  void updateProduct(InventoryModal inventory,String name)
  {
     DbHelper.dbHelper.updateDatabase(inventory, name);
     fetchData();

  }
  void deleteProduct(String name)
  {
     DbHelper.dbHelper.deleteDatabase(name);
     fetchData();

  }




}