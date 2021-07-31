import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class InboxScreen extends StatefulWidget {
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  int _indexButton = 0;
  PageController controller = PageController(initialPage: 0);

  List<inboxModel> inboxs = [
    inboxModel("Offer", "Sen", "GrabExpress diskon 50% (maks. Rp20rb)",
        "Cek promonya sekarang!"),
    inboxModel("Offer", "19 Jul", "GrabExpress diskon 90% (maks. Rp20rb)",
        "Cek promonya sekarang!"),
    inboxModel("Offer", "25 Jun", "0 OVO Points bisa buat apa?",
        "Bisa dapet cashback s.d. 100RB"),
    inboxModel("Offer", "16 Jun", "Masa nolak ketiban rejeki?",
        "Cashback s.d. 100rb OVO Points sekarang"),
    inboxModel("Offer", "3 Jun", "Ketiban tapi bikin hepi?",
        "Ya ketiban rejeki s.d. 100rb OVO Points"),
    inboxModel("Offer", "3 Jun", "Ketiban tapi bikin hepi?",
        "Ya ketiban rejeki s.d. 100rb OVO Points"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
            leading: Container(),
            title: Center(
              child: Text(
                'Kotak Masuk',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Sanomat Grab Web',
                ),
              ),
            ),
            actions: [
              (_indexButton == 1)
                  ? IconButton(
                      icon: Icon(Icons.restore_from_trash_outlined),
                    )
                  : Container(
                      width: 50,
                    )
            ],
            flexibleSpace: Container(
              color: Colors.white,
              height: 60,
            ),
            elevation: 0,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _indexButton = 0;
                        controller.jumpToPage(_indexButton);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                                  color: (_indexButton == 0)
                                      ? Colors.green
                                      : Colors.grey[100],
                                  width: (_indexButton == 0) ? 2.5 : 1.5))),
                      child: Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 14,
                          color: (_indexButton == 0)
                              ? Colors.green
                              : Colors.black87,
                          fontWeight: (_indexButton == 0)
                              ? FontWeight.w700
                              : FontWeight.normal,
                          fontFamily: 'Sanomat Grab Web',
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _indexButton = 1;
                        controller.jumpToPage(_indexButton);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                                  color: (_indexButton == 1)
                                      ? Colors.green
                                      : Colors.grey[100],
                                  width: (_indexButton == 1) ? 2.5 : 1.5))),
                      child: Text(
                        'Notifikasi',
                        style: TextStyle(
                          fontSize: 14,
                          color: (_indexButton == 1)
                              ? Colors.green
                              : Colors.black87,
                          fontWeight: (_indexButton == 1)
                              ? FontWeight.w700
                              : FontWeight.normal,
                          fontFamily: 'Sanomat Grab Web',
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 215,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://smallimg.pngkey.com/png/small/93-938871_torn-note-paper-png-transparent-notebook-paper-png.png"),
                              fit: BoxFit.contain)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'Kamu bisa melihat semua chat kamu di sini',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Sanomat Grab Web',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: inboxs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            inboxs[index].isRead = !inboxs[index].isRead;
                          });
                        },
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: [
                            IconSlideAction(
                              caption: 'Hapus',
                              icon: Icons.restore_from_trash_outlined,
                              color: Colors.redAccent,
                            )
                          ],
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            leading: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.orange[100],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    Icons.local_offer,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                )
                              ],
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(inboxs[index].type,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: inboxs[index].isRead
                                            ? FontWeight.normal
                                            : FontWeight.w900,
                                        fontFamily: 'Sanomat Grab Web',
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    inboxs[index].title,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: inboxs[index].isRead
                                          ? FontWeight.normal
                                          : FontWeight.w900,
                                      fontFamily: 'Sanomat Grab Web',
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  inboxs[index].shortDesc,
                                  style: TextStyle(
                                    fontFamily: 'Sanomat Grab Web',
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(inboxs[index].date,
                                  style: TextStyle(
                                    fontFamily: 'Sanomat Grab Web',
                                    fontWeight: inboxs[index].isRead
                                        ? FontWeight.normal
                                        : FontWeight.w900,
                                  )),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class inboxModel {
  String type;
  String date;
  String title;
  String shortDesc;
  bool isRead = false;

  inboxModel(@required this.type, @required this.date, @required this.title,
      @required this.shortDesc,
      {this.isRead = false});
}
