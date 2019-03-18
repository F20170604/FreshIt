import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Card(
        margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: AspectRatio(
                aspectRatio: 0.75,
                child: Image.asset(
                  'images/bread.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              width: 120,
              //margin: EdgeInsets.only(left:5.0),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 4),
                  child: new Text(
                    "Watermelon",
                    softWrap: true,
                    style: new TextStyle(
                      fontSize: 20,
                      fontFamily: 'Flama',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                      child: new Text(
                        '12 packets',
                        style: new TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    //Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
                      child: new Text(
                        'Referigerator',
                        style: new TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(23, 69, 145, 1.0),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  color: Color.fromRGBO(255, 82, 78, 1.0),
                  child: Center(
                    child: Text(
                      'Fruits',
                    ),
                  ),
                  constraints: BoxConstraints.tight(Size(100, 30)),
                  margin: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
                  //alignment: Alignment.centerRight,
                  //margin: EdgeInsets.only(right: 120),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 4, 8.0, 4),
                  child: Text(
                    'Expires in: 2 days',
                    style: new TextStyle(
                        color: Colors.red,
                        fontSize: 18
                    ),
                  ),
                ),
                Container(
                  child: new RaisedButton(
                    onPressed: ()=> null,
                    color: Color.fromRGBO(23, 69, 145, 1.0),
                    child: new Text(
                      'Used It',
                      style: TextStyle(
                          fontFamily: 'Flama',
                          fontSize: 21,
                          letterSpacing: 2,
                          color: Colors.white
                      ),
                    ),
                  ),
                  width: screenSize.width-130,
                )
              ],
            )
          ],
        )
    );
  }

}