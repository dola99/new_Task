import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wifi_iot/wifi_iot.dart';
class AccessNetworkRepositry {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  
  Future<bool> wifiStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
     if(connectivityResult == ConnectivityResult.wifi){
       return true;
     }else{
       return false;
     }
  }

  Future<bool> bluetoothStatus() async {
    return await flutterBlue.isOn;
  }

Future<bool> changeStautsWifi() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
     if(connectivityResult == ConnectivityResult.wifi){
        await WiFiForIoTPlugin.setEnabled(false,shouldOpenSettings: true);
        return false;
     }else{
         await WiFiForIoTPlugin.setEnabled(true,shouldOpenSettings: true);
         return true;
     }
  }

  Future<bool> changeStautsBluetooth() async {
    if (await flutterBlue.isOn) {
       await flutterBlue.turnOff();
      return false;
    } else {
       await flutterBlue.turnOn();
       return true;
    }
  }
}
