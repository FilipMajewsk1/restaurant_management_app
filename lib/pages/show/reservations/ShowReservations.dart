import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';
import 'package:restaurant_management_app/controllers/ReservationController.dart';
import 'package:restaurant_management_app/models/Reservation.dart';
import 'package:restaurant_management_app/pages/show/reservations/ShowReservation.dart';
import 'package:restaurant_management_app/widgets/ShowEntityCard.dart';

class ShowReservations extends StatefulWidget{
  const ShowReservations({Key? key}) : super(key: key);

  @override
  State<ShowReservations> createState() => _ShowReservations();
}

class _ShowReservations extends State<ShowReservations> {
  final ThemeManager _themeManager = ThemeManager();
  Future<List<Reservation>> reservations = ReservationController.getList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
      appBar: AppBar(
        title: Text(
          "Reservations",
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
          child: FutureBuilder<List<Reservation>>(
              future: reservations,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final reservationn = snapshot.data!;
                  return buildReservation(reservationn);
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

  Widget buildReservation(List<Reservation> reservations) =>
      ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return ShowEntityCard(
            name: reservation.name,
            id: reservation.id,
            route: (int id) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowReservation(id: id)));
            },
            deleteFunc: (int id) {
              ReservationController.deleteReservation(reservation.id.toString());
            },
          );
        },
      );
}