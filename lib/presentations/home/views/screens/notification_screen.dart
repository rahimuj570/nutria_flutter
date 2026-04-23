import 'package:flutter/material.dart';
import 'package:neutria/presentations/common/view/screens/custom_app_bar_widget.dart';

class NotificationScreen extends StatelessWidget {
  static const String name = 'notification_screen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Notification',
        actionType: ShowActionEnum.hidden,
        leadingType: LeadingTypeEnum.back,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Card(
            shape: RoundedRectangleBorder(borderRadius: .circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.add_circle),
                  SizedBox(width: 10),
                  Text(
                    'Today, you consumed 500 kcal Extra.',
                    style: TextStyle(fontSize: 14, fontWeight: .w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
