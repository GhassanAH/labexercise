import 'package:flutter/material.dart';
import './recipts.dart';

class ReciptsItems extends StatelessWidget {
  // const ReciptsItems({Key? key}) : super(key: key);
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexilty complexity;
  final Affordability affordability;

  ReciptsItems(
      {this.id,
      this.title,
      this.affordability,
      this.complexity,
      this.duration,
      this.imageUrl});

String get complexityText{

    switch(complexity){
      case Complexilty.Simple:
        return "Simple";
        break;
      case Complexilty.Hard:
        return "Hard";
        break;
      case Complexilty.Challenging:
        return "Challenging";
        break;
      default:
        return "not easy not hard";
          break;
    }
  }

  String get affordabilityText{

    switch(affordability){
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.affordability:
        return "affordability";
        break;
      default:
        return "sorry";
          break;
    }
  }

  void selectRecipts() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectRecipts,
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20
                    ),
                    child: Text(title ,style: TextStyle(fontSize: 20, color: Colors.white), softWrap: true, overflow: TextOverflow.fade,),
                  
                  )
                
                ),
              ],
            ),
            Container(
                    color: Color.fromARGB(242, 255, 255, 255),
                    child: Padding(padding: EdgeInsets.all(20),
                    child: Row(
                      
                      children:[

                        Row(children: [
                          Icon(Icons.timelapse),
                          SizedBox(width: 2,),
                          Text('${duration} min')
                        ],
                        ),
                        Row(children: [
                          Icon(Icons.badge),
                          SizedBox(width: 2,),
                          Text(complexityText)
                        ],
                        ),
                        Row(children: [
                          Icon(Icons.timelapse),
                          SizedBox(width: 2,),
                          Text(affordabilityText)
                        ],
                        )
                      ]
                    ),
                    ),
                    )
                
            
                

          ],
        ),
      ),
    );
  }
}
