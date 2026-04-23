import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';

class MealCardWidget extends StatelessWidget {
  final String imgPath;
  final String title;
  final String subTitle;
  final VoidCallback? onTapAction;

  const MealCardWidget({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: .circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            Image.asset(imgPath),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(title, style: TextStyle(fontSize: 13, fontWeight: .w400)),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 10, fontWeight: .w400),
                ),
              ],
            ),
            Spacer(),
            if (onTapAction != null)
              TextButton(
                onPressed: onTapAction,
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: ConstColors.lightGreyTextColor,
                  ),
                ),
                child: Text('View all'),
              ),
          ],
        ),
      ),
    );
  }
}
