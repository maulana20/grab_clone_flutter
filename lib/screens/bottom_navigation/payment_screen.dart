import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:grab_clone/widgets/grab_icon_menu.dart';

class PaymentScreen extends StatelessWidget {
  double cirleSmallDiameter = 110.0;
  double cirleBigDiameter = 200.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Text(
              'Pembayaran',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'Sanomat Grab Web',
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Color(0xff99eeff),
                                      Colors.white
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                              ),
                              Positioned(
                                bottom: -cirleBigDiameter / 2.5,
                                right: -cirleBigDiameter / 2.5,
                                child: Container(
                                  width: cirleBigDiameter,
                                  height: cirleBigDiameter,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xff73d9cf),
                                            Colors.white
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                ),
                              ),
                              Positioned(
                                left: cirleSmallDiameter / 1.5,
                                bottom: (-cirleSmallDiameter * 2) / 1.55,
                                child: Container(
                                  width: (cirleSmallDiameter * 2),
                                  height: (cirleSmallDiameter * 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xff0fb9db),
                                            Colors.white
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                ),
                              ),
                              Positioned(
                                left: -cirleSmallDiameter / 1.5,
                                bottom: -cirleSmallDiameter / 3,
                                child: Container(
                                  width: cirleSmallDiameter,
                                  height: cirleSmallDiameter,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xff99eeff),
                                            Colors.white
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 45,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'OVO Cash',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF6514a3),
                                  fontFamily: 'Sanomat Grab Web',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 17),
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Sanomat Grab Web',
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  top: 2,
                                  left: 0,
                                  child: Text(
                                    'Rp',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6),
                                      fontFamily: 'Sanomat Grab Web',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/pay/reward.png"),
                                    width: 25,
                                  ),
                                  Text(
                                    'OVO Points',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Sanomat Grab Web',
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 18,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GrabIconMenu(
                                      title: "Bayar",
                                      image: "assets/images/pay/pay.png",
                                      size: 50,
                                    ),
                                    GrabIconMenu(
                                      title: "Isi Ulang",
                                      image: "assets/images/pay/topu.png",
                                      size: 50,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  buildCard(
                      context,
                      "OVO Security",
                      "https://icon-library.com/images/secure-icon-png/secure-icon-png-16.jpg",
                      "To keep your transactions safe, update ovo security now.",
                      "Update Now"),
                  SizedBox(
                    height: 30,
                  ),
                  buildCard(
                      context,
                      "Langganan",
                      "https://www.pngfind.com/pngs/m/75-750093_creating-and-sending-messages-icon-vector-graphics-hd.png",
                      "Choose a subscription plan to save on rides, food, shopping, and more!",
                      "View Plants"),
                  SizedBox(
                    height: 30,
                  ),
                  buildActivity(context),
                  Container(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, String imgUrl,
      String desc, String action) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.w700,
              fontFamily: 'Sanomat Grab Web',
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: NetworkImage(imgUrl),
                      width: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text(
                        desc,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Sanomat Grab Web',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    action,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff0382a6),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Sanomat Grab Web',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Aktifitas Terbaru",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.w700,
              fontFamily: 'Sanomat Grab Web',
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            height: 200,
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: NetworkImage(
                      "https://smallimg.pngkey.com/png/small/93-938871_torn-note-paper-png-transparent-notebook-paper-png.png"),
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Yuk, bertransaksi Hari Ini!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Sanomat Grab Web',
                  ),
                ),
                Text(
                  'Transaksi anda akan muncul di sini.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontFamily: 'Sanomat Grab Web',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
