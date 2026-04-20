import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';

class WeightInputWedget extends StatelessWidget {
  final Function(String a) onInputChange;
  const WeightInputWedget({
    super.key,
    required this.weightTEC,
    required this.onInputChange,
  });

  final TextEditingController weightTEC;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: .only(
              topLeft: .circular(8),
              bottomLeft: .circular(8),
            ),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)],
          ),
          padding: .all(10),
          child: Text(
            'Weight:',
            style: TextStyle(fontSize: 16, fontWeight: .w500),
          ),
        ),
        SizedBox(
          width: 120,
          height: 45,
          child: TextField(
            keyboardType: .number,
            controller: weightTEC,
            decoration: InputDecoration(
              hintText: 'Enter here',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: .w500,
                color: Colors.grey.shade400,
              ),
              fillColor: ConstColors.lightBoderColor,
              border: OutlineInputBorder(
                borderRadius: .only(
                  topLeft: .circular(0),
                  topRight: .circular(8),
                  bottomLeft: .circular(0),
                  bottomRight: .circular(8),
                ),
              ),
            ),
            onChanged: (value) {
              onInputChange(value);
            },
          ),
        ),
      ],
    );
  }
}
