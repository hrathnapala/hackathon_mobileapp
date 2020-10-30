import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:button3d/button3d.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:hackathon_app/service/api_service.dart' as api_service;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int confirmed = 0;
  int recovered = 0;
  int deaths = 0;

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  Future getDetails() async {
    try {
      var response = await api_service
          .fetchGet("https://hpb.health.gov.lk/api/get-current-statistical");
      var res = json.decode(response.body);
      setState(() {
        confirmed = res['data']['local_active_cases'];
        recovered = res['data']['local_recovered'];
        deaths = res['data']['local_deaths'];
      });
    } catch (e) {
      setState(() {
        confirmed = 1250;
        recovered = 3000;
        deaths = 20;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 0,
          height: size.height * 0.35,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: const Radius.circular(40)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage(
                    "assets/images/virus.png",
                  ))),
              child: Column(
                children: [
                  Expanded(
                      child: Stack(
                    children: [
                      Positioned(
                        top: size.height * 0.1,
                        left: size.width * 0.04,
                        child: SvgPicture.asset(
                          "assets/images/Drcorona.svg",
                          width: size.width * 0.45,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Positioned(
                          top: size.height * 0.13,
                          left: size.width * 0.45,
                          child: Column(
                            children: [
                              Text(
                                "COVID-19",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.07,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Are you feeling sick?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width * 0.04),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Button3d(
                                  width: size.width * 0.3,
                                  height: 35,
                                  style: Button3dStyle(
                                      topColor: Colors.white,
                                      backColor: Color(0xFF200887),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.phone,
                                          color: Color(0xFF200887),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Call 1390',
                                          style: TextStyle(
                                              color: Color(0xFF200887),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () async {
                                    const url = "tel://1390";
                                    if (await UrlLauncher.canLaunch(url)) {
                                      await UrlLauncher.launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  })
                            ],
                          ))
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: size.height * 0.38,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.58,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 25, right: 16),
                    child: Text(
                      'Covid-19 Latest Update',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.045,
                          ),
                          _Counter(
                            name: "Active",
                            amount: confirmed,
                            color: Colors.purpleAccent,
                          ),
                          _Counter(
                            name: "Recovered",
                            amount: recovered,
                            color: Colors.greenAccent,
                          ),
                          _Counter(
                            name: "Deaths",
                            amount: deaths,
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 25, right: 16),
                    child: Text(
                      'Preventions',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5),
                    ),
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 10.0),
                          child: Row(
                            children: [
                              PreventionCard(
                                title: "Wash Hands",
                                svgSrc: "assets/images/hand_wash.svg",
                              ),
                              SizedBox(
                                width: size.width * 0.1,
                              ),
                              PreventionCard(
                                title: "Wear Mask",
                                svgSrc: "assets/images/use_mask.svg",
                              ),
                              SizedBox(
                                width: size.width * 0.1,
                              ),
                              PreventionCard(
                                title: "Clean Disinfect",
                                svgSrc: "assets/images/Clean_Disinfect.svg",
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ))
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventionCard({Key key, this.svgSrc, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(title,
            style: TextStyle(
                color: Colors.black45,
                fontSize: 15,
                fontWeight: FontWeight.w900))
      ],
    );
  }
}

class _Counter extends StatelessWidget {
  final int amount;
  final String name;
  final Color color;
  const _Counter(
      {@required this.amount, @required this.name, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          margin: const EdgeInsets.only(right: 20, bottom: 10),
          height: 100,
          width: 100,
          child: Center(
            child: Text(
              "$amount",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(name,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w900)),
        )
      ],
    );
  }
}
