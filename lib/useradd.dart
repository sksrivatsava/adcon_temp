import 'package:firebase_database/firebase_database.dart';

class adv{
  String uid;
  String aid;
  String cat;
  String key;

  adv.fromSnapshot(DataSnapshot snap)

    :aid = snap.value['aid'],
        cat =snap.value['cat'],
        uid=snap.value['uid'],
        key=snap.key;



}

class advertiser{
  String key;
  String email;
  String type;
  String username;
  String cat;
  dynamic rate1;
  dynamic rate2;
  dynamic rate3;

  advertiser.fromSnapShot(DataSnapshot snap)
    :key=snap.key,
      email=snap.value['email'],
      type=snap.value['type'],
      username=snap.value['username'],
      cat=snap.value['cat'],
      rate1=snap.value['rate'];


}
class advertisertv extends advertiser{
  dynamic hrate;
  dynamic mrate;
  dynamic lrate;

  advertisertv.fromSnapShot(DataSnapshot snap) :

        hrate=snap.value['rate'][0],
        mrate=snap.value['rate'][1],
        lrate=snap.value['rate'][2],
        super.fromSnapShot(snap)
  ;





}

class apply{
  String key;
  String advertiserid;
  String addid;
  int rate;
  String Confirm;
  String link;
  apply.fromSnapShot(DataSnapshot snap)
  :key=snap.key,
    advertiserid=snap.value['advertiserid'],
    addid=snap.value['key1'],
    rate=snap.value['rate'],
    Confirm=snap.value['Confirm'],
    link=snap.value['link'];

}

class applycard{

  String key;
  String addname;
  String username;
  dynamic rate;
  String cat;
  applycard(this.key,this.addname,this.username,this.rate,this.cat);
}