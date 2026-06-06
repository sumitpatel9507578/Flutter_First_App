import 'package:flutter/cupertino.dart';

/// The main Pert of Provider
/// Multi-Provider => All Controllers
/// ChangeNotifierProvider => Single
/// ChangeNotifier =>  Class Statemangement help
/// NotifyListeners => Method for notify (when change the data)
/// Consumer
class CounterHelper extends ChangeNotifier{

  int _counter=0;
  int get counter=>_counter;
  void increment(){
    _counter++;
    notifyListeners();
  }
  void decrement(){
    if(counter>0){
      _counter--;
      notifyListeners();
    }
  }
  void tenIncreament(){
    _counter+=10;
    notifyListeners();
  }
  void reset(){
    _counter=0;
    notifyListeners();
  }

}