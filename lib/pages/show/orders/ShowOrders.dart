import 'package:flutter/material.dart';
import 'package:restaurant_management_app/controllers/OrderController.dart';
import 'package:restaurant_management_app/models/Order.dart';
import 'package:restaurant_management_app/widgets/ShowEntityCard.dart';

import 'ShowOrder.dart';

class ShowOrders extends StatefulWidget{
  const ShowOrders({Key? key}) : super(key: key);

  @override
  State<ShowOrders> createState() => _ShowOrders();
}

class _ShowOrders extends State<ShowOrders> {
  Future<List<Order>> orders = OrderController.getList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 650,
          child: FutureBuilder<List<Order>>(
              future: orders,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final orderr = snapshot.data!;
                  return buildOrder(orderr);
                }
                else {
                  return (Center(
                      child:CircularProgressIndicator()));
                }
              }
          ),
        ),
      ),
    );
  }

  Widget buildOrder(List<Order> orders) =>
      ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ShowEntityCard(
            name: order.name,
            id: order.id ?? 0,
            route: (int id) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowOrder(id: id)));
            },
            deleteFunc: (int id) {
              OrderController.deleteOrder(order.id.toString());
            },
          );
        },
      );
}