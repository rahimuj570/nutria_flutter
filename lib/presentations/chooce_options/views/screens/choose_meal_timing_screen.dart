import 'package:flutter/material.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class ChooseMealTimingScreen extends StatelessWidget {
  const ChooseMealTimingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Text(
            'Enter your Meal timings',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),

          SizedBox(height: 30),
          SizedBox(
            height: 400,
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) => Divider(indent: 10),
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  'Breakfast',
                  style: TextStyle(fontSize: 16, fontWeight: .w500),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '1:20 pm',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.watch_later_outlined),
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              Text('Add meal', style: TextStyle()),
            ],
          ),
        ],
      ),
    );
  }
}
