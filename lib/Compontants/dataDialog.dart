import 'package:final_eaxm_ui/Controller/controller.dart';
import 'package:final_eaxm_ui/Modal/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget dataDialog(InventoryController Controller)
{
  return AlertDialog(
    title: Text('ADD Product '),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(decoration: InputDecoration(hintText: 'Product Name'),controller: Controller.txtName,),
        TextField(decoration: InputDecoration(hintText: 'Category'),controller: Controller.txtCategory,),
        TextField(decoration: InputDecoration(hintText: 'Quantity'),controller: Controller.txtQuantity,),
        TextButton(onPressed: () {
            Get.back();
        }, child: Text('Cancel')),
        TextButton(onPressed: () {
          String name=Controller.txtName.text;
          String Category=Controller.txtCategory.text;
          int Quantity=int.parse(Controller.txtQuantity.text);
          InventoryModal inventory=InventoryModal(name, Category, Quantity);
          Controller.addProduct(inventory);
          Get.back();
          Controller.txtQuantity.clear();
          Controller.txtName.clear();
          Controller.txtCategory.clear();

        }, child: Text('save')),

      ],

    ),
  );
}