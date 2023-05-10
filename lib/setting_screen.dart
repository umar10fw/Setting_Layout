import 'package:flutter/material.dart';
import 'package:setting_screen/const.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.05,
              0.25,
            ],
            colors: [
              Color.fromARGB(255, 106, 183, 247),
              Color.fromARGB(255, 247, 246, 246)
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 22, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Icon(Icons.arrow_back), Icon(Icons.settings)],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              horizontalTitleGap: 0,
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Image.asset("assets/images/person_avatar.png"),
              ),
              title: "Tracker One".text.semiBold.make(),
              // trailing: Icon(
              //   Icons.favorite_border_outlined,
              //   color: Colors.black,
              // ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    "Binding",
                    const Image(
                      image: AssetImage("assets/images/binding.png"),
                      color: Color.fromARGB(255, 38, 148, 10),
                      height: 35,
                    ),
                    const Color.fromARGB(255, 163, 241, 180),
                    Colors.white,
                    () => {VxToast.show(context, msg: "You Click Binding")},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    "Renewal",
                    const Image(
                      image: AssetImage("assets/images/bank.png"),
                      color: Color.fromARGB(255, 53, 137, 247),
                      height: 32,
                    ),
                    const Color.fromARGB(255, 158, 199, 238),
                    Colors.white,
                    () => {VxToast.show(context, msg: "You Click Renewal")},
                  )
                ],
              ),
            ),
            ListView.separated(
              // physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listDetail.length,
              separatorBuilder: (context, index) {
                return const Divider(thickness: 0, color: Colors.white);
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 30,
                  child: ListTile(
                    horizontalTitleGap: 13,
                    minLeadingWidth: 10,
                    leading: Image.asset(
                      listIcon[index],
                      height: 18,
                      fit: BoxFit.contain,
                      color: Colors.black,
                    ),
                    title: Text(
                      listDetail[index],
                      style: const TextStyle(fontSize: 13),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.grey.shade400,
                    ),
                    onTap: () {
                      switch (index) {
                        case 0:
                          VxToast.show(context,
                              msg: "You Click Customer Service");
                          break;
                        case 1:
                          VxToast.show(context,
                              msg: "You Click Network Detection");
                          break;
                        case 2:
                          VxToast.show(context, msg: "You Click Log Upload");
                          break;
                        case 3:
                          VxToast.show(context, msg: "You Click Feedback");
                          break;
                        case 4:
                          VxToast.show(context, msg: "You Click About");
                          break;
                      }
                    },
                  ),
                );
              },
            )
                .box
                .white
                .margin(const EdgeInsets.symmetric(horizontal: 20, vertical: 5))
                .padding(const EdgeInsets.only(bottom: 20))
                .roundedSM
                .make()
          ],
        ),

        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         stops: [0.1, 0.5, 0.7, 0.9],
        //         colors: [Colors.blueAccent, Colors.yellow])),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Expanded CustomButton(
      String title, Image image, Color color1, color2, Function() onTap) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            stops: const [
              0.01,
              0.6,
            ],
            colors: [color1, color2],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            title.text.semiBold
                .size(15)
                .make()
                .box
                .margin(const EdgeInsets.all(10))
                .make(),
            const SizedBox(
              width: 15,
            ),
            image,
          ],
        ),
      ),
    ));
  }
}
