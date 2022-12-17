
import 'package:fabswap/variables/global_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

void fetchLocalId()async{
  final prefs = await SharedPreferences.getInstance();
  print(prefs.getString('id').toString() + " uuhh");
  if(prefs.containsKey('id')){
    myId=prefs.getString('id')!;
  }
}




void storeLocalId(String id)async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('id', id);
}
