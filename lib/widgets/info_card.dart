import 'package:covidapp/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function press;
  const InfoCard({
    Key key, this.title, this.effectedNum, this.iconColor, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context, constraints) {
      return GestureDetector(
        onTap:press,
        child: Container(
          width: constraints.maxWidth/2-10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: AlignmentDirectional.center,
                      width:30 ,
                      height: 30,
                      decoration: BoxDecoration(
                        color:iconColor.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/running.svg',
                        width: 12,
                        height: 12,
                        color: iconColor,
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              color: kTextColor),
                          children:[
                            TextSpan(
                              text:"$effectedNum\n",
                              // ignore: deprecated_member_use
                              style:Theme.of(context).textTheme.title.copyWith(
                                  fontWeight:FontWeight.bold
                              ),
                            ),
                            TextSpan(
                              text: 'People',
                              style: TextStyle(
                                fontSize: 12,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: LineReportChart(),)
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
    );
  }
}
