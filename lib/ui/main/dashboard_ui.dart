import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rimotest/controllers/dashboard_ctrl.dart';

class DashboardUI extends StatelessWidget {
  DashboardUI({Key? key}) : super(key: key);

  final ctrl = Get.put(DashboardCtrl());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * .06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              Image.asset('assets/images/image 4.png').image,
                          radius: 27,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Hi Sade, ',
                          style: GoogleFonts.lato(
                              color: const Color.fromRGBO(24, 24, 24, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.notifications,
                      color: Color.fromRGBO(79, 22, 153, 1),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                IndexedStack(
                  index: ctrl.index.value,
                  children: [
                    Home(ctrl: ctrl),
                    Center(
                      child: Text('Transactions'),
                    ),
                    Center(
                      child: Text('3'),
                    ),
                    Center(
                      child: Text('Settl card'),
                    ),
                    Center(
                      child: Text('More'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromRGBO(79, 22, 153, 1),
          onTap: ctrl.onTap,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/Group 26.png',
                ),
                activeIcon: Image.asset(
                  'assets/images/Group 26.png',
                  color: const Color.fromRGBO(172, 139, 211, 1),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/pie-chart 1.png',
                ),
                activeIcon: Image.asset(
                  'assets/images/pie-chart 1.png',
                  color: const Color.fromRGBO(172, 139, 211, 1),
                ),
                label: 'Transactions'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/Group 174.png',
                ),
                activeIcon: Image.asset(
                  'assets/images/Group 174.png',
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/pay (2) 2.png',
                ),
                activeIcon: Image.asset(
                  'assets/images/pay (2) 2.png',
                  color: const Color.fromRGBO(172, 139, 211, 1),
                ),
                label: 'Settl card'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/Group 761.png',
                ),
                activeIcon: Image.asset(
                  'assets/images/Group 761.png',
                  color: const Color.fromRGBO(172, 139, 211, 1),
                ),
                label: 'More'),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  final DashboardCtrl ctrl;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(123, 85, 168, 1),
                borderRadius: BorderRadius.circular(13)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Primary Wallet',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NGN',
                          style: GoogleFonts.lato(
                              color: Colors.grey,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          ctrl.isObscure.value ? '200,000' : '******',
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // width: 50,
                          // height: 20,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(172, 139, 211, 1),
                              shape: BoxShape.circle),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Add cash',
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ),
                Positioned(
                    top: -100,
                    right: -40,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3,
                              color:
                                  const Color.fromRGBO(246, 239, 255, 0.15))),
                    )),
                Positioned(
                    top: -70,
                    right: -100,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3,
                              color:
                                  const Color.fromRGBO(246, 239, 255, 0.15))),
                    )),
                Positioned(
                    bottom: -100,
                    left: -40,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3,
                              color:
                                  const Color.fromRGBO(246, 239, 255, 0.15))),
                    )),
                Positioned(
                    bottom: -70,
                    left: -100,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3,
                              color:
                                  const Color.fromRGBO(246, 239, 255, 0.15))),
                    )),
                Positioned(
                    top: 20,
                    right: 20,
                    child: GestureDetector(
                      onTap: ctrl.onVisible,
                      child: Icon(
                        ctrl.isObscure.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Get Started',
            style: GoogleFonts.lato(
                color: const Color.fromRGBO(24, 24, 24, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(248, 243, 255, 1),
                    borderRadius: BorderRadius.circular(13)),
                child: Stack(
                  children: [
                    Container(),
                    Positioned(
                      left: 15,
                      top: 50,
                      child: Text('Send \nMoney',
                          style: GoogleFonts.lato(
                              color: const Color.fromRGBO(64, 26, 109, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Image.asset('assets/images/send 1.png')))
                  ],
                ),
              )),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(248, 243, 255, 1),
                    borderRadius: BorderRadius.circular(13)),
                child: Stack(
                  children: [
                    Container(),
                    Positioned(
                      left: 15,
                      top: 50,
                      child: Text('Request \nMoney',
                          style: GoogleFonts.lato(
                              color: const Color.fromRGBO(64, 26, 109, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Image.asset('assets/images/Vector.png')))
                  ],
                ),
              ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(248, 243, 255, 1),
                    borderRadius: BorderRadius.circular(13)),
                child: Stack(
                  children: [
                    Container(),
                    Positioned(
                      left: 15,
                      top: 50,
                      child: Text('Create \nWallet',
                          style: GoogleFonts.lato(
                              color: const Color.fromRGBO(64, 26, 109, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Image.asset('assets/images/send 1.png')))
                  ],
                ),
              )),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(252, 241, 243, 1),
                    borderRadius: BorderRadius.circular(13)),
                child: Stack(
                  children: [
                    Container(),
                    Positioned(
                      left: 15,
                      top: 50,
                      child: Text('Upgrade your \nAccount',
                          style: GoogleFonts.lato(
                              color: const Color.fromRGBO(64, 26, 109, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Image.asset('assets/images/Star 1.png')))
                  ],
                ),
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Transactions',
                  style: GoogleFonts.lato(
                      color: const Color.fromRGBO(24, 24, 24, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              Text('See all',
                  style: GoogleFonts.lato(
                      color: const Color.fromRGBO(79, 22, 153, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w500))
            ],
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.zero,
                    child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          // mainAxisAlignment:
                          //     MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  Image.asset('assets/images/image 4.png')
                                      .image,
                              radius: 35,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Transfer to Chidi Obi',
                                      style: GoogleFonts.lato(
                                          color: const Color.fromRGBO(
                                              24, 24, 24, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text('Sent',
                                      style: GoogleFonts.lato(
                                          color: const Color.fromRGBO(
                                              79, 22, 153, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('- N150,000',
                                      style: GoogleFonts.lato(
                                          color: const Color.fromRGBO(
                                              24, 24, 24, 1),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text('Aug 12, 2020',
                                      style: GoogleFonts.lato(
                                          color: const Color.fromRGBO(
                                              79, 22, 153, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
