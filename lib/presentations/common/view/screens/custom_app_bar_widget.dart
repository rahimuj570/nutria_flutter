import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final ShowActionEnum actionType;
  final String title;
  final bool showTitle;
  final LeadingTypeEnum leadingType;
  const CustomAppBarWidget({
    super.key,
    this.actionType = ShowActionEnum.notification,
    required this.title,
    this.showTitle = true,
    this.leadingType = LeadingTypeEnum.logo,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingType == LeadingTypeEnum.back ? 80 : null,
      leading: leadingType == LeadingTypeEnum.logo
          ? Image.asset(AppAssetsPath.logo)
          : GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Icon(Icons.arrow_back_rounded),
                  SizedBox(width: 8),
                  Text('Back', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
      title: showTitle
          ? Text(title, style: TextStyle(fontSize: 20, fontWeight: .w800))
          : null,

      centerTitle: true,
      actions: actionType != ShowActionEnum.hidden
          ? [
              actionType == ShowActionEnum.notification
                  ? Badge(
                      label: Text('5'),
                      child: Icon(Icons.notifications_outlined, size: 30),
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
