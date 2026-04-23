import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/data/home/entity/weekly_day_entity.dart';
import 'package:neutria/data/home/services/weekly_data_view_service.dart';
import 'package:neutria/presentations/common/view/screens/custom_app_bar_widget.dart';
import 'package:neutria/presentations/home/views/widgets/home_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<WeeklyDayEntity> weeklyDays = WeeklyDataViewService()
        .getWeeklyDayDate();
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Cal Z'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: weeklyDays
                    .map(
                      (e) => Column(
                        children: [
                          Text(e.dayName, style: TextStyle(fontSize: 12)),
                          SizedBox(height: 7),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: e.isToday ? Colors.black : null,
                              shape: .circle,
                            ),
                            child: Center(
                              child: Text(
                                '${e.date}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: e.isToday
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 18),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            '2300',
                            style: TextStyle(fontSize: 36, fontWeight: .bold),
                          ),
                          Text(
                            'Calories left',
                            style: TextStyle(fontSize: 12, fontWeight: .w500),
                          ),
                          Text(
                            '(Intake)',
                            style: TextStyle(fontSize: 10, fontWeight: .w400),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(AppAssetsPath.calUp),
                      SizedBox(width: 24),
                      Column(
                        children: [
                          Text(
                            'Burned',
                            style: TextStyle(
                              color: ConstColors.lightGreyTextColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: Colors.grey.shade300,
                            ),
                            child: Icon(
                              Icons.add,
                              color: ConstColors.lightGreyTextColor,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '100',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: .w500,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'KCal',
                            style: TextStyle(
                              color: ConstColors.lightGreyTextColor,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  HomeCardWidget(
                    title: '75g',
                    subTitle: 'Carbs left',
                    imgPath: AppAssetsPath.homeCard1,
                  ),
                  HomeCardWidget(
                    title: '50g',
                    subTitle: 'Carbs left',
                    imgPath: AppAssetsPath.homeCard2,
                  ),
                  HomeCardWidget(
                    title: '25g',
                    subTitle: 'Carbs left',
                    imgPath: AppAssetsPath.homeCard3,
                  ),
                ],
              ),
              SizedBox(height: 18),
              Row(
                crossAxisAlignment: .center,
                children: [
                  Text(
                    'Minerals status',
                    style: TextStyle(fontSize: 16, fontWeight: .w500),
                  ),
                  Spacer(),
                  Text(
                    'Activities',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w400,
                      color: ConstColors.lightGreyTextColor,
                    ),
                  ),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: ConstColors.lightBoderColor,
                        shape: .circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: ConstColors.lightGreyTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: .maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(8),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Major minerals',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w500,
                          color: Color(0xff3285A1),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              'Potassium (K)',
                              style: TextStyle(fontSize: 12, fontWeight: .w400),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 38.0,
                                  right: 12,
                                ),
                                child: Divider(
                                  color: ConstColors.lightBoderColor,
                                ),
                              ),
                            ),
                            Text(
                              '(12mg)',
                              style: TextStyle(fontSize: 10, fontWeight: .w500),
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                        itemCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
