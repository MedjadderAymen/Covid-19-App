import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: SvgPicture.asset("assets/icons/search.svg"))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 21),
                          blurRadius: 53,
                          color: Colors.black.withOpacity(0.05))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Cases',
                          style: TextStyle(
                              color: kTextMediumColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        SvgPicture.asset("assets/icons/more.svg")
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "547 ",
                          style: Theme.of(context)
                              .textTheme
                              .display3!
                              .copyWith(color: kPrimaryColor, height: 1.2),
                        ),
                        Text(
                          "5.9% ",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        SvgPicture.asset("assets/icons/increase.svg")
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "From Health Center",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: kTextMediumColor,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AspectRatio(
                      aspectRatio: 1.7,
                      child: BarChart(BarChartData(
                        barGroups: getBarGroups(),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(showTitles: false),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTitles: getWeek,
                            getTextStyles: (context, value) => TextStyle(
                                color: Color(0xFF7589A2),
                                fontWeight: FontWeight.w300,
                                fontSize: 10),
                          ),
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildRichTextWithPercentage(
                              title: "From Last Week", percentage: "5.47"),
                          buildRichTextWithPercentage(
                              title: "Recovery Rate", percentage: "9.43"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 21),
                          blurRadius: 54,
                          color: Colors.black.withOpacity(0.05))
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Global Map",
                          style: TextStyle(fontSize: 15),
                        ),
                        SvgPicture.asset("assets/icons/more.svg")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset("assets/icons/map.svg")
                  ],
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  RichText buildRichTextWithPercentage(
      {required String title, required String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$percentage% \n",
            style: TextStyle(fontSize: 20, color: kPrimaryColor),
          ),
          TextSpan(
            text: title,
            style: TextStyle(color: kTextMediumColor, height: 1.5),
          ),
        ],
      ),
    );
  }

  getBarGroups() {
    List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
    List<BarChartGroupData> barChartGroups = [];
    barChartDatas.asMap().forEach(
          (i, value) => barChartGroups.add(
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  y: value,
                  //This is not the proper way, this is just for demo
                  colors: [i == 4 ? kPrimaryColor : kInactiveChartColor],
                  width: 16,
                )
              ],
            ),
          ),
        );
    return barChartGroups;
  }

  String getWeek(double value) {
    switch (value.toInt()) {
      case 0:
        return 'MON';
      case 1:
        return 'TUE';
      case 2:
        return 'WED';
      case 3:
        return 'THU';
      case 4:
        return 'FRI';
      case 5:
        return 'SAT';
      case 6:
        return 'SUN';
      default:
        return '';
    }
  }
}
