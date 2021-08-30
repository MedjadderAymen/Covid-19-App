import 'package:covid_19_app/constants.dart';
import 'package:covid_19_app/screens/details_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor.withOpacity(.03),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: SvgPicture.asset("assets/icons/search.svg"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.03),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  LayoutBuilder(builder: (context, constraints) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailsScreen();
                        }));
                      },
                      child: Container(
                        width: constraints.maxWidth / 2 - 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xFFFF9C00).withOpacity(0.12),
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                      "assets/icons/running.svg",
                                      color: Color(0xFFFF9C00),
                                      height: 12,
                                      width: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Confirmed Cases",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(color: kTextColor),
                                        children: [
                                          TextSpan(
                                            text: "1.062 \n",
                                            style: Theme.of(context)
                                                .textTheme
                                                .title!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          TextSpan(
                                            text: "People",
                                            style: TextStyle(
                                                fontSize: 12, height: 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: AspectRatio(
                                        aspectRatio: 2.2,
                                        child: LineChart(
                                          LineChartData(
                                            gridData: FlGridData(show: false),
                                            borderData:
                                                FlBorderData(show: false),
                                            titlesData:
                                                FlTitlesData(show: false),
                                            lineBarsData: [
                                              LineChartBarData(
                                                  spots: getSports(),
                                                  isCurved: true,
                                                  dotData:
                                                      FlDotData(show: false),
                                                  belowBarData:
                                                      BarAreaData(show: false),
                                                  colors: [kPrimaryColor],
                                                  barWidth: 4),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth / 2 - 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color:
                                          Color(0xFFFF2D55).withOpacity(0.12),
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    "assets/icons/running.svg",
                                    height: 12,
                                    width: 12,
                                    color: Color(0xFFFF2D55),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Total Deaths",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: kTextColor),
                                      children: [
                                        TextSpan(
                                          text: "75 \n",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: "People",
                                          style: TextStyle(
                                              fontSize: 12, height: 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AspectRatio(
                                      aspectRatio: 2.2,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(show: false),
                                          borderData: FlBorderData(show: false),
                                          titlesData: FlTitlesData(show: false),
                                          lineBarsData: [
                                            LineChartBarData(
                                                spots: getSports(),
                                                isCurved: true,
                                                dotData: FlDotData(show: false),
                                                belowBarData:
                                                    BarAreaData(show: false),
                                                colors: [kPrimaryColor],
                                                barWidth: 4),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth / 2 - 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color:
                                          Color(0xFF50E3C2).withOpacity(0.12),
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    "assets/icons/running.svg",
                                    height: 12,
                                    width: 12,
                                    color: Color(0xFF50E3C2),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Total Recovered",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: kTextColor),
                                      children: [
                                        TextSpan(
                                          text: "689 \n",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: "People",
                                          style: TextStyle(
                                              fontSize: 12, height: 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AspectRatio(
                                      aspectRatio: 2.2,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(show: false),
                                          borderData: FlBorderData(show: false),
                                          titlesData: FlTitlesData(show: false),
                                          lineBarsData: [
                                            LineChartBarData(
                                                spots: getSports(),
                                                isCurved: true,
                                                dotData: FlDotData(show: false),
                                                belowBarData:
                                                    BarAreaData(show: false),
                                                colors: [kPrimaryColor],
                                                barWidth: 4),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth / 2 - 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color:
                                          Color(0xFF5856D6).withOpacity(0.12),
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    "assets/icons/running.svg",
                                    height: 12,
                                    width: 12,
                                    color: Color(0xFF5856D6),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "New Cases",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: kTextColor),
                                      children: [
                                        TextSpan(
                                          text: "326 \n",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: "People",
                                          style: TextStyle(
                                              fontSize: 12, height: 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AspectRatio(
                                      aspectRatio: 2.2,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(show: false),
                                          borderData: FlBorderData(show: false),
                                          titlesData: FlTitlesData(show: false),
                                          lineBarsData: [
                                            LineChartBarData(
                                                spots: getSports(),
                                                isCurved: true,
                                                dotData: FlDotData(show: false),
                                                belowBarData:
                                                    BarAreaData(show: false),
                                                colors: [kPrimaryColor],
                                                barWidth: 4),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preventions',
                    style: Theme.of(context)
                        .textTheme
                        .title!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset("assets/icons/hand_wash.svg"),
                          Text(
                            'Wash Hands',
                            style: Theme.of(context)
                                .textTheme
                                .body2!
                                .copyWith(color: kPrimaryColor),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset("assets/icons/use_mask.svg"),
                          Text(
                            'Use Mask',
                            style: Theme.of(context)
                                .textTheme
                                .body2!
                                .copyWith(color: kPrimaryColor),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset("assets/icons/Clean_Disinfect.svg"),
                          Text(
                            'Clean Disinfect',
                            style: Theme.of(context)
                                .textTheme
                                .body2!
                                .copyWith(color: kPrimaryColor),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .4,
                              top: 20,
                              right: 20),
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF60BE93),
                                Color(0xFF1B8D59),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Dial 911 for\nMedical Help!\n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .title!
                                      .copyWith(color: Colors.white),
                                ),
                                TextSpan(
                                  text: 'If any symptoms appear',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SvgPicture.asset("assets/icons/nurse.svg"),
                        ),
                        Positioned(
                          top: 30,
                          right: 10,
                          child: SvgPicture.asset(
                            'assets/icons/virus.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 35),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -7),
                  color: Color(0xFF6DAED9).withOpacity(0.11),
                  blurRadius: 33)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: kPrimaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/Following.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/Glyph.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/person.svg'),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> getSports() {
    return [
      FlSpot(0, .5),
      FlSpot(1, 1.5),
      FlSpot(2, .5),
      FlSpot(3, .7),
      FlSpot(4, .2),
      FlSpot(5, 2),
      FlSpot(6, 1.5),
      FlSpot(7, 1.7),
      FlSpot(8, 1),
      FlSpot(9, 2.8),
      FlSpot(10, 2.5),
      FlSpot(11, 2.65),
    ];
  }
}
