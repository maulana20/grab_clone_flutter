import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _indexButton = 0;
  final List<String> _listNameButton = ['Aktifitas', 'Express'];
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _indexButton = controller.page.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Aktifitas Saya',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Sanomat Grab Web'),
                      ),
                      Text(
                        'Riwayat',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Sanomat Grab Web',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _indexButton = index;
                                controller.jumpToPage(index);
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: _indexButton == index
                                      ? BorderRadius.circular(15)
                                      : BorderRadius.circular(0),
                                  color: _indexButton == index
                                      ? Colors.grey[100]
                                      : Colors.transparent,
                                ),
                                child: Text(
                                  _listNameButton[index],
                                  style: TextStyle(
                                    color: _indexButton == index
                                        ? Colors.green
                                        : Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Sanomat Grab Web',
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                  scrollDirection: Axis.horizontal,
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lagi ga ada apa apa, nih',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Sanomat Grab Web',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Yuk lihat apa yang baru di aplikasi Grab.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'Sanomat Grab Web',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Text(
                            'Lagi Berjalan',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Sanomat Grab Web',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        ExpansionTileItem(
                          title: "Dijadwalkan",
                        ),
                        ExpansionTileItem(
                          title: "Lagi ke pengiriman",
                        ),
                        ExpansionTileItem(
                          title: "Barang sudah di ambil",
                        ),
                        ExpansionTileItem(
                          title: "Lagi ke penerima",
                        ),
                        SizedBox(
                          height: 10,
                          child: Container(
                            color: Colors.grey[200],
                          ),
                        ),
                        ExpansionTileItem(
                          title: "Yang Sudah Lewat",
                          isBold: true,
                        )
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansionTileItem extends StatefulWidget {
  final String title;
  final bool isBold;

  ExpansionTileItem({this.title, this.isBold = false});

  @override
  _ExpansionTileItemState createState() =>
      _ExpansionTileItemState(title: title, isBold: isBold);
}

class _ExpansionTileItemState extends State<ExpansionTileItem> {
  final String title;
  final bool isBold;

  bool isExpand = false;

  _ExpansionTileItemState({this.title, this.isBold});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileTheme(
          dense: true,
          child: Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: false,
              onExpansionChanged: (value) {
                setState(() {
                  isExpand = isExpand ? false : true;
                });
              },
              title: Text(
                title,
                style: TextStyle(
                    fontSize: isBold ? 16.0 : 14.0,
                    color:
                        isBold ? Colors.black : Colors.black.withOpacity(0.5),
                    fontFamily: 'Sanomat Grab Web',
                    fontWeight: FontWeight.w700),
              ),
              children: [
                ListTile(
                  title: Text(
                    "Sepertinya anda tidak punya pengantaran dengan status ini",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[300],
                      fontFamily: 'Sanomat Grab Web',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        !isExpand
            ? Container(
                height: 1,
                margin: EdgeInsets.only(left: 15, right: 15),
                color: Colors.grey[200],
              )
            : Container()
      ],
    );
  }
}
