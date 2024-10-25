import 'package:final_eaxm_ui/Compontants/dataDialog.dart';
import 'package:final_eaxm_ui/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
InventoryController controller=Get.put(InventoryController());
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Inventory'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context) => dataDialog(controller),);
      }, child: Icon(Icons.add,color: Colors.black,),),
      body: Obx(()=> ListView.builder(itemCount:controller.InventoryList.length,itemBuilder: (context, index) => Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.circular(10),

        ),
        child:Row(
          children: [
            Text(controller.InventoryList[index].Quantity!.toString()),
            Text(controller.InventoryList[index].name!),
            Text(controller.InventoryList[index].Category!),
          ],
        ),
      ),)),


    );
  }
}
