
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/show_order/data/model/show_order_model.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
 
    final typeText = order.orderType == 'external' ? 'طلب خارجي' : 'طلب محلي';
    final productsCount = order.products.length;
    
    final isExternal = order.orderType == 'external';
    final statusText = order.status;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Text('طلب #${order.id}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    )),
                const Spacer(),
            
              ],
            ),
            const SizedBox(height: 6),
         const SizedBox(height: 4),

              // ✅ الحالة (نص فقط بدون ألوان)
              Text('الحالة: $statusText',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600)),
         const SizedBox(height: 4),
            // Chips row
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                _Chip(icon: Icons.local_shipping_outlined, label: typeText),
              
             
              ],
            ),

            // Address (external)
            if (isExternal) ...[
              const SizedBox(height: 10),
              _AddressBlock(address: order.address),
            ],
          ],
        ),
      ),
    );
  }
}


class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Chip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}

class _AddressBlock extends StatelessWidget {
  final OrderAddress address;
  const _AddressBlock({required this.address});

  @override
  Widget build(BuildContext context) {
    final city = address.city ?? '—';
    final street = address.street ?? '—';
    final b = address.building;
    final f = address.floor;
    final notes = address.notes;

    final line = '$city • $street'
        '${b != null ? ' • بناء $b' : ''}'
        '${f != null ? ' • طابق $f' : ''}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.place, color: AppColor.pink),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(line, style: const TextStyle(fontWeight: FontWeight.w600)),
              if (notes != null && notes.trim().isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(notes, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
