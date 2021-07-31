import 'package:adcon/appliedadvertiser.dart';
import 'package:adcon/confirmedadvertiser.dart';
import 'package:adcon/contentsubmittedads.dart';
import 'package:adcon/loading.dart';
import 'package:adcon/rejectedadvertsers.dart';
import 'package:adcon/useradd.dart';
import 'package:adcon/userservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

import 'advapply.dart';
import 'constants.dart';
class insta{
}
class cusadservice extends StatefulWidget {
  final adv ads;
  cusadservice(this.ads);
  @override
  _cusadserviceState createState() => _cusadserviceState();
}

class _cusadserviceState extends State<cusadservice> {
  final _advref=FirebaseDatabase.instance.reference().child('advertisers');
  final urlImage =
      'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png';
  final type="Customer";
  var name="null";
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final _dref = FirebaseDatabase.instance.reference().child('CustomUser');
  List<advertisertv> tvl =[];
  List<advertisertv> ftvl =[];
  List<advertiser> instl=[];
  List<advertiser> finstl =[];
  List<advertiser> youtubel=[];
  List<advertiser> fyoutubel=[];
  List<advertiser> newsl=[];
  List<advertiser> fnewsl=[];
  var st=false;
  var si=false;
  var sy=false;
  var sn=false;

  @override
  void initState(){
    super.initState();
    final _tv = _advref.orderByChild('cat').equalTo('tv');
    final _inst =_advref.orderByChild('cat').equalTo('instagram');
    final _youtube=_advref.orderByChild('cat').equalTo('youtube');
    final _news =_advref.orderByChild('cat').equalTo('news');
    dynamic result=  _auth.currentUser;
    var x=getUser(result.email);
    _dref.child(x).child('Username').once().then((value) {
      setState(() {
        name=value.value;
      });
    });

    _tv.onChildAdded.listen(_tvf);
    _inst.onChildAdded.listen(_instf);
    _youtube.onChildAdded.listen(_youtubef);
    _news.onChildAdded.listen(_newsf);
  }

  _tvf(Event event){
    setState(() {

      tvl.add(new advertisertv.fromSnapShot(event.snapshot));
      ftvl.add(new advertisertv.fromSnapShot(event.snapshot));

    });
  }
  _instf(Event event){
    setState(() {
      // await Insta.getprofile()
      instl.add(new advertiser.fromSnapShot(event.snapshot));
      finstl.add(new advertiser.fromSnapShot(event.snapshot));

    });
  }
  _youtubef(Event event){
    setState(() {
      youtubel.add(new advertiser.fromSnapShot(event.snapshot));
      fyoutubel.add(new advertiser.fromSnapShot(event.snapshot));

    });
  }
  _newsf(Event event){
    setState(() {
      newsl.add(new advertiser.fromSnapShot(event.snapshot));
      fnewsl.add(new advertiser.fromSnapShot(event.snapshot));

    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(

        home: DefaultTabController(
          length: 4,
          child: Scaffold(

              appBar: AppBar(
                title: Text('apply  advertiser for ${widget.ads.aid}'),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.tv),),
                    Tab(icon: FaIcon(FontAwesomeIcons.instagram)),
                    Tab(icon: FaIcon(FontAwesomeIcons.youtube)),
                    Tab(icon: FaIcon(FontAwesomeIcons.newspaper)),
                  ],

                ),
                actions: [
                  RaisedButton(
                    child: Text('back'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                ],

              ),
              drawer: Drawer(
                child: Material(
                  color: kNavBarColor1,
                  child: ListView(
                    children: <Widget>[
                      buildHeader(
                        urlImage: urlImage,
                        name: name,
                        type: type,
                        // onClicked: () => Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) => MyApp()),
                        // ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            buildMenuItemHeader(
                              text: '${widget.ads.aid}',
                              icon: Icons.account_tree_outlined,
                              onClicked: (){},
                            ),
                            const SizedBox(height: 50),
                            buildMenuItem(
                              text: 'Applied Advertisers ${widget.ads.aid}',
                              icon: Icons.sensors,
                              onClicked: () => selectedItem(context, 0),
                            ),
                            const SizedBox(height: 16),
                            buildMenuItem(
                              text: 'Confirmed Advertisers ${widget.ads.aid}',
                              icon: Icons.check,
                              onClicked: () => selectedItem(context, 1),
                            ),
                            const SizedBox(height: 16),
                            buildMenuItem(
                              text: 'Rejected Advertisers ${widget.ads.aid}',
                              icon: Icons.sensors_off,
                              onClicked: () => selectedItem(context, 2),
                            ),
                            const SizedBox(height: 16),
                            buildMenuItem(
                              text: 'Submitted Advertisers ${widget.ads.aid}',
                              icon: Icons.checklist_outlined,
                              onClicked: () => selectedItem(context, 3),
                            ),
                            const SizedBox(height: 80),
                            Divider(color: Colors.white70),
                            const SizedBox(height: 12),
                            buildMenuItem(
                              text: '© Adcons, 2021',
                              icon: Icons.copyright_outlined,
                              onClicked: () => selectedItem(context, 3),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // child: Column(
                //   children: [
                //     // SizedBox()
                //     ListTile(
                //       title: Text('applied advertiser'),
                //       onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=>appliedadvertsers(widget.ads)));
                //       },
                //     ),
                //     ListTile(
                //         title: Text('confirmed advertisers'),
                //         onTap:(){
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=>confirmedadvertsers(widget.ads)));
                //         }
                //
                //     ),
                //     ListTile(
                //       title: Text('Rejected advertisers'),
                //       onTap: (){
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>rejectedadvertsers(widget.ads)));
                //       },
                //     ),
                //     ListTile(
                //       title: Text('submitted advertisers'),
                //       onTap: (){
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>contentsubmitted(widget.ads)));
                //       },
                //     ),
                //   ],
                // ),
              ),
              body: TabBarView(
                children: [
                  SingleChildScrollView(

                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(icon: Icon(FontAwesomeIcons.sortAmountUpAlt), onPressed: (){

                              setState(() {
                                ftvl.sort((a,b)=>a.hrate.compareTo(b.hrate));
                              });
                            }),
                            IconButton(icon: Icon(FontAwesomeIcons.sortAmountUp), onPressed: (){

                              setState(() {
                                ftvl.sort((b,a)=>a.hrate.compareTo(b.hrate));
                              });
                            }),

                            !st?Text('all advertisers '):new Expanded(
                              child: new TextField(
                                onChanged: (value){
                                  setState(() {

                                    ftvl=tvl.where((obj)=>obj.key.toLowerCase().contains(value.toLowerCase())).toList();
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    hintText: "Search advertiser Here",
                                    hintStyle: TextStyle(color: Colors.black)),



                              ),
                            ),

                            st?IconButton(icon: Icon(Icons.cancel), onPressed: (){

                              setState(() {

                                st=false;
                                ftvl=List.from(tvl);
                              });
                            }):IconButton(icon: Icon(Icons.search), onPressed: (){

                              setState(() {

                                st=true;
                              });
                            }),
                          ],

                        ),


                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: ftvl.length,
                            itemBuilder: (context,index){
                              return new ListTile(
                                title: new Text('adverstiser : ${getUser(ftvl[index].email)}  cat:${ftvl[index].cat} rate:${ftvl[index].hrate} ${ftvl[index].lrate} ${ftvl[index].mrate}'),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>advapply(ftvl[index],widget.ads)));
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                  SingleChildScrollView(

                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(icon: Icon(FontAwesomeIcons.sortAmountUpAlt), onPressed: (){

                              setState(() {
                                finstl.sort((a,b)=>a.rate1.compareTo(b.rate1));
                              });
                            }),
                            IconButton(icon: Icon(FontAwesomeIcons.sortAmountUp), onPressed: (){

                              setState(() {
                                finstl.sort((b,a)=>a.rate1.compareTo(b.rate1));
                              });
                            }),

                            !si?Text('all advertisers '):new Expanded(
                              child: new TextField(
                                onChanged: (value){
                                  setState(() {

                                    finstl=instl.where((obj)=>obj.key.toLowerCase().contains(value.toLowerCase())).toList();
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    hintText: "Search advertisers Here",
                                    hintStyle: TextStyle(color: Colors.black)),



                              ),
                            ),

                            si?IconButton(icon: Icon(Icons.cancel), onPressed: (){

                              setState(() {

                                si=false;
                                finstl=List.from(instl);
                              });
                            }):IconButton(icon: Icon(Icons.search), onPressed: (){

                              setState(() {

                                si=true;
                              });
                            }),
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: finstl.length,
                            itemBuilder: (context,index){
                              return new ListTile(
                                title: new Text('adverstiser : ${getUser(finstl[index].email)}  cat:${finstl[index].cat} rate:${finstl[index].rate1}'),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>advapply(finstl[index],widget.ads)));
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                  SingleChildScrollView(

                    child: Column(
                      children: [

                        Row(
                          children: [
                            IconButton(icon: Icon(FontAwesomeIcons.sortAmountUpAlt), onPressed: (){

                              setState(() {
                                fyoutubel.sort((a,b)=>a.rate1.compareTo(b.rate1));
                              });
                            }),
                            IconButton(icon: Icon(FontAwesomeIcons.sortAmountUp), onPressed: (){

                              setState(() {
                                fyoutubel.sort((b,a)=>a.rate1.compareTo(b.rate1));
                              });
                            }),
                            !sy?Text('all advertisers '):new Expanded(
                              child: new TextField(
                                onChanged: (value){
                                  setState(() {

                                    fyoutubel=youtubel.where((obj)=>obj.key.toLowerCase().contains(value.toLowerCase())).toList();
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    hintText: "Search advertisers Here",
                                    hintStyle: TextStyle(color: Colors.black)),



                              ),
                            ),

                            sy?IconButton(icon: Icon(Icons.cancel), onPressed: (){

                              setState(() {

                                sy=false;
                                fyoutubel=List.from(youtubel);
                              });
                            }):IconButton(icon: Icon(Icons.search), onPressed: (){

                              setState(() {

                                sy=true;
                              });
                            }),
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: fyoutubel.length,
                            itemBuilder: (context,index){
                              return new ListTile(
                                title: new Text('adverstiser : ${getUser(fyoutubel[index].email)}  cat:${fyoutubel[index].cat} rate:${fyoutubel[index].rate1}'),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>advapply(fyoutubel[index],widget.ads)));
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                  SingleChildScrollView(

                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(icon: Icon(FontAwesomeIcons.sortAmountUpAlt), onPressed: (){

                              setState(() {
                                fnewsl.sort((a,b)=>a.rate1.compareTo(b.rate1));
                              });
                            }),
                            IconButton(icon: Icon(FontAwesomeIcons.sortAmountUp), onPressed: (){

                              setState(() {
                                fnewsl.sort((b,a)=>a.rate1.compareTo(b.rate1));
                              });
                            }),
                            !sn?Text('all advertisers '):new Expanded(
                              child: new TextField(
                                onChanged: (value){
                                  setState(() {

                                    fnewsl=newsl.where((obj)=>obj.key.toLowerCase().contains(value.toLowerCase())).toList();
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    hintText: "Search advertisers Here",
                                    hintStyle: TextStyle(color: Colors.black)),



                              ),
                            ),

                            sn?IconButton(icon: Icon(Icons.cancel), onPressed: (){

                              setState(() {

                                sn=false;
                                fnewsl=List.from(newsl);
                              });
                            }):IconButton(icon: Icon(Icons.search), onPressed: (){

                              setState(() {

                                sn=true;
                              });
                            }),
                          ],

                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: fnewsl.length,
                            itemBuilder: (context,index){
                              return new ListTile(
                                title: new Text('adverstiser : ${getUser(fnewsl[index].email)}  cat:${fnewsl[index].cat} rate:${fnewsl[index].rate1}'),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>advapply(fnewsl[index],widget.ads)));
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              )
          ),
        )
    );

  }
  Widget buildHeader({
    String urlImage,
    String name,
    String type,
    VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    type,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );

  Widget buildMenuItemHeader({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.grey[900];
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: TextStyle(
            color: color,
            fontSize: 18,
          )),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }


  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: TextStyle(
            color: color,
            fontSize: 14,
          )),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
  void selectedItem(BuildContext context, int index) {


    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>appliedadvertsers(widget.ads)));
        break;

      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>confirmedadvertsers(widget.ads)));
        break;

      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>rejectedadvertsers(widget.ads)));
        break;
      case 3:

        Navigator.push(context, MaterialPageRoute(builder: (context)=>contentsubmitted(widget.ads)));

        break;
    }
  }
}


