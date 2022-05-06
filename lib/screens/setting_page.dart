import 'package:flutter/material.dart';
import 'package:simple_task/provider/access_devices_provider.dart';
import 'package:simple_task/provider/login_provider.dart';
import 'package:simple_task/screens/web_view_screen.dart';
import 'package:simple_task/widget/custom_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
    AccessDevices.of(context).bluetoothStatus();
    AccessDevices.of(context).wifiStatus();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _uriController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .050),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello ${LoginProvider.of(context).user.name}',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 25),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Text(
                    'You Logged in by ${LoginProvider.of(context).user.methodOfLogin}'),
                SizedBox(
                  height: height * .05,
                ),
                TextFormField(
                    controller: _uriController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field Can not to be Empty';
                      } else {
                        bool _validURL = Uri.parse(value).isAbsolute;
                        if (!_validURL) {
                          return 'Enter Valid Url';
                        } else {
                          return null;
                        }
                      }
                    }),
                SizedBox(
                  height: height * .05,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              WebViewScreen(url: _uriController.text)));
                    }
                  },
                  child: Container(
                    width: width * .25,
                    height: width * .15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange,
                    ),
                    child: Center(
                      child: Text(
                        'Go',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                ToggoleWithText(
                  text: 'Bluetooth',
                  onChanged: (value) {
                    value != value;
                    AccessDevices.of(context).changebluetoothStatus();
                  },
                  isSelect: AccessDevices.of(context, listen: true).bluetootOn,
                ),
                SizedBox(
                  height: height * .02,
                ),
                ToggoleWithText(
                  text: 'Wifi',
                  onChanged: (vakue) {
                    AccessDevices.of(context).changewifiStatus();
                  },
                  isSelect: AccessDevices.of(context, listen: true).wifiOn,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
