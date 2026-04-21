import 'package:flutter/material.dart';
import 'package:neutria/data/choioce_options/entity/meal_timing_entity.dart';
import 'package:neutria/data/choioce_options/enums/meridium_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';

class EnterTimeWidget extends StatefulWidget {
  final ChooseOptionProvider provider;
  final int timeIndex;
  const EnterTimeWidget({
    super.key,
    required this.provider,
    required this.timeIndex,
  });

  @override
  State<EnterTimeWidget> createState() => _EnterTimeWidgetState();
}

class _EnterTimeWidgetState extends State<EnterTimeWidget> {
  MeridiumEnum? _selected = MeridiumEnum.am;
  final TextEditingController _hourTEC = TextEditingController();
  final TextEditingController _minTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _hourTEC.text = widget.provider.getMealTiming[widget.timeIndex].hr == 0
        ? ''
        : widget.provider.getMealTiming[widget.timeIndex].hr.toString().padLeft(
            2,
            '1',
          );
    _minTEC.text = widget.provider.getMealTiming[widget.timeIndex].min
        .toString()
        .padLeft(2, '0');

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: .circular(8)),
      content: SizedBox(
        height: 180,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const Text(
              'Enter Time',
              style: TextStyle(fontSize: 20, fontWeight: .w500),
            ),
            SizedBox(height: 26),
            Column(
              children: [
                Row(
                  crossAxisAlignment: .end,
                  children: [
                    Text(
                      'Meal name',
                      style: TextStyle(fontSize: 12, fontWeight: .w400),
                    ),
                    Spacer(),
                    Text(
                      'Hour',
                      style: TextStyle(fontSize: 12, fontWeight: .w400),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Min',
                      style: TextStyle(fontSize: 12, fontWeight: .w400),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'Meridiem indicator',
                        softWrap: true,
                        style: TextStyle(fontSize: 12, fontWeight: .w400),
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: .center,
                  children: [
                    Text(
                      widget.provider.getMealTiming[widget.timeIndex].mealName,
                      style: TextStyle(fontSize: 16, fontWeight: .w500),
                    ),
                    Spacer(flex: 2),
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: TextFormField(
                          validator: (value) {
                            if (value?.isNotEmpty ?? false) {
                              if (int.parse(value!) > 12 ||
                                  int.parse(value) < 1) {
                                return '❌';
                              }
                            }
                            return null;
                          },

                          autovalidateMode: .onUserInteraction,
                          keyboardType: .number,
                          controller: _hourTEC,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                          decoration: const InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            hintText: '00',
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 5),
                    Text(
                      ':',
                      style: TextStyle(fontSize: 30, fontWeight: .bold),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: TextFormField(
                          validator: (value) {
                            if (value?.isNotEmpty ?? false) {
                              if (int.parse(value!) > 59 ||
                                  int.parse(value) < 0) {
                                return '❌';
                              }
                            }
                            return null;
                          },
                          autovalidateMode: .onUserInteraction,

                          keyboardType: .datetime,
                          controller: _minTEC,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                          decoration: const InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: RadioGroup<MeridiumEnum>(
                        groupValue: _selected,
                        onChanged: (MeridiumEnum? value) {
                          // setState(() {
                          //   _character = value;
                          // });
                        },
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selected = MeridiumEnum.am;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    _selected == MeridiumEnum.am
                                        ? Icons.circle_rounded
                                        : Icons.circle_outlined,
                                    size: 16,
                                  ),
                                  Text('AM'),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selected = MeridiumEnum.pm;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    _selected == MeridiumEnum.pm
                                        ? Icons.circle_rounded
                                        : Icons.circle_outlined,
                                    size: 16,
                                  ),
                                  Text('PM'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            MealTimingEntity entity = MealTimingEntity(
              mealName:
                  widget.provider.getMealTiming[widget.timeIndex].mealName,
              hr: int.parse(_hourTEC.text.isEmpty ? '0' : _hourTEC.text),
              min: int.parse(_minTEC.text.isEmpty ? '0' : _minTEC.text),
              isAm: _selected == MeridiumEnum.am,
            );
            widget.provider.updateMealTiming(entity, widget.timeIndex);
            Navigator.pop(context);
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
