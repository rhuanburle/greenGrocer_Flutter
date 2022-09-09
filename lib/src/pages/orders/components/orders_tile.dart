import 'package:curso_flutter_greengrocer/src/services/utils_services.dart';
import 'package:flutter/material.dart';

import '../../../models/order_model.dart';

class OrderTile extends StatelessWidget {
  OrderTile({Key? key, required this.order}) : super(key: key);

  final OrderModel order;
  final UltilsServices ultilsServices = UltilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pedido: ${order.id}'),
                 Text(
                  ultilsServices.formatDateTime(order.createdDateTime),
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
            children: []),
      ),
    );
  }
}
