import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  List<AccountMenu> menus = [
    AccountMenu("Keanggotaan Rewards", info: "0 OVO Points"),
    AccountMenu("Rewards"),
    AccountMenu("Profil Bisnis"),
    AccountMenu("Terjadwal"),
    AccountMenu("Kartu Kamu"),
    AccountMenu("Langganan", isNew: true),
    AccountMenu("Tantangan", isNew: true),
    AccountMenu("Dukung untuk lingkungan", isNew: true),
    AccountMenu("Save Places"),
    AccountMenu("Pusat Bantuan"),
    AccountMenu("Mengemudi bareng Grab"),
    AccountMenu("Kontak Darurat"),
    AccountMenu("Pengaturan"),
    AccountMenu("Kasih Masukkan"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 15.0, top: 15, bottom: 15),
                  child: Container(
                    width: 75,
                    height: 75,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.green[300], width: 5),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 65,
                      color: Colors.green[300],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "maulana",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Sanomat Grab Web',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Edit Profil",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Sanomat Grab Web',
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 13,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: menus.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          menus[index].title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Sanomat Grab Web',
                          ),
                        ),
                        Row(
                          children: [
                            !["", null].contains(menus[index].info)
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      menus[index].info,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Sanomat Grab Web',
                                      ),
                                    ),
                                  )
                                : Container(),
                            menus[index].isNew == true
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 4),
                                    margin: EdgeInsets.only(right: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "Baru",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Sanomat Grab Web',
                                      ),
                                    ),
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountMenu {
  String title;
  bool isNew = false;
  String info = null;

  AccountMenu(this.title, {this.isNew, this.info});
}
