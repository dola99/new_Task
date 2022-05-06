import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repo/access_network_repo.dart';

class AccessDevices extends ChangeNotifier {
  bool _bluetoothIsOn = false;
  bool _wifiIsOn = false;

  bool get bluetootOn => _bluetoothIsOn;
  bool get wifiOn => _wifiIsOn;

  static AccessDevices of(BuildContext context, {bool listen = false}) {
    if (listen) return context.watch<AccessDevices>();
    return context.read<AccessDevices>();
  }

  Future<void> bluetoothStatus() async {
    _bluetoothIsOn = await AccessNetworkRepositry().bluetoothStatus();
    notifyListeners();
  }

  Future<void> wifiStatus() async {
    _wifiIsOn = await AccessNetworkRepositry().wifiStatus();
    notifyListeners();
  }

  Future<void> changebluetoothStatus() async {
    _bluetoothIsOn = await AccessNetworkRepositry().changeStautsBluetooth();

    notifyListeners();
  }

  Future<void> changewifiStatus() async {
    _wifiIsOn = await AccessNetworkRepositry().changeStautsWifi();
    notifyListeners();
  }
}
