import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/presentations/home/views/screens/notification_screen.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final ShowActionEnum actionType;
  final String title;
  final bool showTitle;
  final LeadingTypeEnum leadingType;
  final VoidCallback? customLeadingAction;
  const CustomAppBarWidget({
    super.key,
    this.actionType = ShowActionEnum.notification,
    required this.title,
    this.showTitle = true,
    this.leadingType = LeadingTypeEnum.logo,
    this.customLeadingAction,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingType == LeadingTypeEnum.back ? 80 : null,
      leading: leadingType == LeadingTypeEnum.logo
          ? Image.asset(AppAssetsPath.logo)
          : GestureDetector(
              onTap: () {},
              child: GestureDetector(
                onTap: customLeadingAction ?? () => Navigator.pop(context),
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    Icon(Icons.arrow_back_rounded, weight: 500),
                    SizedBox(width: 8),
                    Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      title: showTitle
          ? Text(title, style: TextStyle(fontSize: 20, fontWeight: .w800))
          : null,

      centerTitle: true,
      actions: actionType != ShowActionEnum.hidden
          ? [
              actionType == ShowActionEnum.notification
                  ? InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        Navigator.pushNamed(context, NotificationScreen.name);
                      },
                      child: Badge(
                        label: Text('5'),
                        child: Icon(Icons.notifications_outlined, size: 30),
                      ),
                    )
                  : Container(
                      padding: .all(2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: .circle,
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
              SizedBox(width: 12),
            ]
          : [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

enum ShowActionEnum { hidden, notification, addTask }

enum LeadingTypeEnum { logo, back }
