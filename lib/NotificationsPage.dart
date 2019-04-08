import 'package:flutter/material.dart';
import 'package:freshit_flutter/AppTheme.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
        child: Card(
          child: InkWell(
            onTap: ()=>null,
            splashColor: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: new Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage('images/watermelon.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                      margin: EdgeInsets.only(left:10.0),
                      child:RichText(
                          text: TextSpan(
                              text:'Watermelon',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppTheme.primaryFont,
                                fontSize: 16,
                              ),
                            children: <TextSpan>[
                              TextSpan(text: ' kept in', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
                              TextSpan(text: ' Referigerator', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: AppTheme.primaryFont, color: Colors.blue)),
                              TextSpan(text: ' will', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
                              TextSpan(text: ' Expire in 2 days', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: AppTheme.primaryFont, color: Colors.red))
                            ]
                          ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ),
      width: screenSize.width,
      height: 60,
    );
  }

}