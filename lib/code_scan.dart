// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:intl/intl.dart';
//
//
// class CalendarPage extends StatefulWidget {
//   @override
//   _CalendarPageState createState() => _CalendarPageState();
// }
//
// class _CalendarPageState extends State<CalendarPage> {
//   CalendarController _calendarController;
//   TextEditingController _eventController;
//   Map<DateTime, List<dynamic>> _events;
//   late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
//
//   @override
//   void initState() {
//     super.initState();
//     _calendarController = CalendarController();
//     _eventController = TextEditingController();
//     _events = {};
//     _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     _initializeNotifications();
//   }
//
//   void _initializeNotifications() async {
//     final initializationSettings = InitializationSettings(
//       android: AndroidInitializationSettings('app_icon'),
//       iOS: IOSInitializationSettings(),
//     );
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   Future<void> _showNotification(String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'item x',
//     );
//   }
//
//   void _addEvent(DateTime day) {
//     setState(() {
//       if (_events[day] != null) {
//         _events[day].add(_eventController.text);
//       } else {
//         _events[day] = [_eventController.text];
//       }
//       _eventController.clear();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Agenda'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TableCalendar(
//               calendarController: _calendarController,
//               events: _events,
//               onDaySelected: (day, events, holidays) {
//                 print("Selected Day: $day");
//               },
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Événements du jour:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(height: 10),
//             _buildEventList(),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _showAddEventDialog(),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   Widget _buildEventList() {
//     DateTime selectedDay = _calendarController.selectedDay;
//     if (_events[selectedDay] != null) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: _events[selectedDay]
//             .map((event) => ListTile(
//           title: Text(event),
//         ))
//             .toList(),
//       );
//     } else {
//       return Container();
//     }
//   }
//
//   Future<void> _showAddEventDialog() async {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Ajouter un événement'),
//           content: TextField(
//             controller: _eventController,
//             decoration: InputDecoration(labelText: 'Événement'),
//           ),
//           actions: [
//             FlatButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Annuler'),
//             ),
//             FlatButton(
//               onPressed: () {
//                 _addEvent(_calendarController.selectedDay);
//                 Navigator.of(context).pop();
//               },
//               child: Text('Ajouter'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
