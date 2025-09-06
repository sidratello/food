import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/external_order.dart/data/model/show_adress_model.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
         // optional trailing actions (e.g., button, menu)

  const AddressCard({
    super.key,
    required this.address,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1.5,
      child: ListTile(
        leading: const Icon(Icons.place, color: Colors.teal),
        title: Text(
          address.city,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('${address.street} • بناء ${address.building} • طابق ${address.floor}'),
            if ((address.notes ?? '').isNotEmpty)
              Text(address.notes!, style: const TextStyle(fontSize: 12)),
          ],
        ),
 
      ),
    );
  }
}
