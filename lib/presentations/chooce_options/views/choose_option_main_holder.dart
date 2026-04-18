import 'package:flutter/material.dart';

class ChooseOptionMainHolder extends StatefulWidget {
  static const name = 'ChooseOptionMainHoldermainHolder_choose_option';

  const ChooseOptionMainHolder({super.key});

  @override
  State<ChooseOptionMainHolder> createState() => _ChooseOptionMainHolderState();
}

class _ChooseOptionMainHolderState extends State<ChooseOptionMainHolder> {
  double progress = .5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 32),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Back'),
                ],
              ),
              SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  double barWidth = constraints.maxWidth;
                  double dotX = barWidth * progress;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: 5,
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey[300],
                          color: Colors.black,
                          borderRadius: .circular(5),
                        ),
                      ),

                      // Dot marker floating above
                      Positioned(
                        left: dotX - 8,
                        top: -6,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Text(
                    'Choose your Gender',
                    style: TextStyle(fontWeight: .w600, fontSize: 24),
                  ),
                  Text(
                    'It will be used to calibrate your custom plan.',
                    style: TextStyle(fontWeight: .w400, fontSize: 12),
                  ),
                  SizedBox(height: 160),
                  ElevatedButton(onPressed: () {}, child: const Text('Male')),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: Theme.of(context).elevatedButtonTheme.style!
                        .copyWith(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          foregroundColor: WidgetStatePropertyAll(Colors.black),
                        ),
                    child: const Text('Female'),
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
        child: ElevatedButton(onPressed: () {}, child: const Text("Next")),
      ),
    );
  }
}
