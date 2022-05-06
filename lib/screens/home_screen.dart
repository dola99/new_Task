import 'package:flutter/material.dart';
import 'package:simple_task/provider/login_provider.dart';
import 'package:simple_task/widget/custom_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomContainer(
                  onTap: () async {
                    await LoginProvider.of(context).googleSignin(context);
                  },
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width * .35,
                  borderRadius: 12,
                  widget: Image.asset('assets/icons/google.png'),
                  color: Colors.white),
              CustomContainer(
                  onTap: () async {
                    await LoginProvider.of(context).facebookSignin(context);
                  },
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width * .35,
                  borderRadius: 12,
                  widget: Image.asset('assets/icons/facebook.png'),
                  color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
