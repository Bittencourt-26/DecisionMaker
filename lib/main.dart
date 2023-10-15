import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  runApp(const DecisionMaker());
}

class DecisionMaker extends StatefulWidget {
  const DecisionMaker({super.key});

  @override
  State<DecisionMaker> createState() => _DecisionMakerState();
}

class _DecisionMakerState extends State<DecisionMaker> {
  var adUnit = "ca-app-pub-3940256099942544/6300978111";
  var adUnit1 = "ca-app-pub-1039297974244215/1431527433";


  @override
  void initState() {
    super.initState();
    initBannerAd();
    initBannerAd1();
  }

  late BannerAd bannerAd;
  bool isAdLoaded = false;

  late BannerAd bannerAd1;
  bool isAdLoaded1 = false;



  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: adUnit,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isAdLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  initBannerAd1() {
    bannerAd1 = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnit1,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isAdLoaded1 = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
      request: const AdRequest(),
    );
    bannerAd1.load();
  }

  bool verdeOuVermelo = false;
  bool umOuDois = false;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();
  late bool jaFoiIniciado = false;
  @override
  Widget build(BuildContext context) {
    String option1 = textEditingController.text;
    String option2 = textEditingController1.text;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Decision Maker')),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                isAdLoaded1
            ? SizedBox(
                height: bannerAd1.size.height.toDouble(),
                width: bannerAd1.size.width.toDouble(),
                child: AdWidget(ad: bannerAd1),
              )
            : const SizedBox(),
                
                const SizedBox(height: 60),
                const Text(
                  'What to do?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 3, 0, 0),
                      labelText: 'First Option',
                      hintText: 'Write your first option',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 10, color: Colors.blueGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueGrey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueGrey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text('Or'),
                const SizedBox(height: 5),
                Container(
                  //TextFieldTwo
                  width: 300,
                  height: 40,
                  child: TextField(
                    controller: textEditingController1,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 3, 0, 0),
                      labelText: 'Second Option',
                      hintText: 'Write your second option',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 10, color: Colors.blueGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueGrey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueGrey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      fixedSize: const Size(130, 30),
                      backgroundColor: Colors.blueGrey,
                      side: const BorderSide(width: 2, color: Colors.black)),
                  onPressed: () {
                    int a = Random().nextInt(2);
                    setState(() {
                      jaFoiIniciado = true;
                      if (a == 0) {
                        umOuDois = true;
                      } else {
                        umOuDois = false;
                      }
                    });
                  },
                  child: const Text('Decide'),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: !jaFoiIniciado
                            ? Colors.white
                            : verdeOuVermelo
                                ? Colors.green
                                : Colors.red,
                        blurRadius: 10,
                        spreadRadius: 10)
                  ]),
                  child: Center(
                    child: Text(
                      !jaFoiIniciado ? '' : (umOuDois ? option1 : option2),
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: !jaFoiIniciado
                            ? Colors.white
                            : !verdeOuVermelo
                                ? Colors.green
                                : Colors.red,
                        blurRadius: 10,
                        spreadRadius: 10)
                  ]),
                  child: Center(
                    child: Text(
                      !jaFoiIniciado ? '' : (umOuDois ? option2 : option1),
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: isAdLoaded
            ? SizedBox(
                height: bannerAd.size.height.toDouble(),
                width: bannerAd.size.width.toDouble(),
                child: AdWidget(ad: bannerAd),
              )
            : const SizedBox(),
      ),
    );
  }
}
