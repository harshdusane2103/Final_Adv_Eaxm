class InventoryModal
{
   String? name,Category;
   int? Quantity;
   InventoryModal(this.name,this.Category,this.Quantity);
   factory InventoryModal.fromMap(Map m1)
   {
      return InventoryModal(m1['name'],m1['Category'], m1['Quantity']);
   }
}
