// import 'package:adcon/advform.dart';
// import 'package:flutter/material.dart';
// class advfrom1 extends StatefulWidget {
//   @override
//   _advfrom1State createState() => _advfrom1State();
// }
//
// class _advfrom1State extends State<advfrom1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('select your category'),
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: [
//           RaisedButton(
//               child: Text('furniture'),
//
//               onPressed: () async {
//                 dynamic result= await Navigator.push(context, MaterialPageRoute(builder: (context)=>advform('furniture')));
//                 if(result=="back"){
//                   Navigator.pop(context);
//                 }
//           }),
//           RaisedButton(
//               child: Text('NGOS'),
//
//               onPressed: () async{
//                 dynamic result= await Navigator.push(context, MaterialPageRoute(builder: (context)=>advform('NGOS')));
//                 if(result=="back"){
//                   Navigator.pop(context);
//                 }
//               }),
//           RaisedButton(
//               child: Text('Electronics'),
//
//               onPressed: () async{
//                 dynamic result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>advform('Electronics')));
//                 if(result=="back"){
//                   Navigator.pop(context);
//                 }
//               }),
//           RaisedButton(
//               child: Text('Arts'),
//
//               onPressed: () async{
//                 dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>advform('Music')));
//                 if(result=="back"){
//                   Navigator.pop(context);
//                 }
//               }),
//           RaisedButton(
//               child: Text('Banking'),
//
//               onPressed: () async{
//                 dynamic result= await Navigator.push(context, MaterialPageRoute(builder: (context)=>advform('Banking')));
//                 if(result=="back"){
//                   Navigator.pop(context);
//                 }
//               }),
//         ],
//
//
//       )
//
//     );
//   }
// }
import 'package:adcon/advform.dart';
import 'package:adcon/test.dart';
import 'package:flutter/material.dart';



import 'constants.dart';

class Category {
  String imageLocation;
  String imageDescription;

  Category(String imageLocation, String imageDescription) {
    this.imageLocation = imageLocation;
    this.imageDescription = imageDescription;
  }
}

List<Category> getCategoryData() {
  List<Category> categoryLis = [];
  categoryLis
      .add(new Category("assets/images/choose_Furniture.jpg", "Furniture"));
  categoryLis
      .add(new Category("assets/images/choose_Electronics.jpg", "Electronics"));
  categoryLis.add(
      new Category("assets/images/choose_Commercial Services.jpg", "Services"));
  categoryLis.add(new Category("assets/images/choose_FMCG.jpg", "Goods"));
  categoryLis.add(
      new Category("assets/images/choose_Commercial Services.jpg", "Services"));
  categoryLis.add(new Category("assets/images/choose_Arts.jpg", "Arts"));
  categoryLis.add(new Category("assets/images/choose_NGO.jpg", "NGOs"));

  return categoryLis;
}
class CategoryPage extends StatefulWidget {
  @override
  CategoryPageState createState() => new CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  List<Category> categoryLis = getCategoryData();
  Widget build(BuildContext c) {
    return new MaterialApp(
        home: new Scaffold(

          backgroundColor: Color.fromRGBO(244, 243, 243, 1),
          /* the following floatingactionbutton is not needed*/

          appBar: AppBar(
            backgroundColor: kCategoryPageColor,
            brightness: Brightness.light,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
                onPressed: (){

                  Navigator.pop(c);
                }),
            /* add back function here*/
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kCategoryPageColor,
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Choose your product's",
                        style: TextStyle(color: Colors.black87, fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Category",
                        style: TextStyle(color: Colors.black87, fontSize: 40),
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Categories",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            for (var item in categoryLis)
                              menuCard(item.imageLocation, item.imageDescription,
                                  /*change function definition here*/
                                      () async{
                                    dynamic result= await Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage(item.imageDescription)));
                                    if(result=="back"){
                                      Navigator.pop(context);
                                    }

                                  }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget menuCard(image, text, Function press) {
    return new Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2.62 / 3,
          child: GestureDetector(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(right: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    stops: [0.1, 0.9],
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.1)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 17.0,
          left: 10.0,
          child: new Center(
            child: new Container(
              child: new Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}