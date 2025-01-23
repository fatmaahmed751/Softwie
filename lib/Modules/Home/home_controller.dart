
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/best_seller_books_model.dart';
import '../../Utilities/router_config.dart';
import '../../Widgets/alert_submmit_success_widget.dart';
import '../../Widgets/home_carusol_widget.dart';
import 'home_data_handler.dart';



class HomeController extends ControllerMVC {
  // singleton
  factory HomeController() {
    _this ??= HomeController._();
    return _this!;
  }

  static HomeController? _this;

  HomeController._();
  List<BestSellerModel> bestSellerBooks = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
// late List<String> items ;
// void updateItems() {
//   setState(() {
//     items = [
//       Strings.home.tr,
//       Strings.projectDetails.tr,
//       Strings.projectTime.tr,
//       Strings.projectChat.tr,
//       Strings.meetings.tr,
//       Strings.complaints.tr,
//       Strings.history.tr,
//       Strings.languages.tr,
//       Strings.logOut.tr,
//     ];
//   });
// }
// final List<String> routes = [
//   "/HomeScreen",
//   "/ProjectDetailsScreen",
//   "/ProjectTimeLineScreen",
//   "/ProjectChatScreen",
//   "/meetings",
//   "/complaints",
//   "/history",
//   "/clientLanguage",
//   "/selectScreen"
// ];

  // Future<void> fetchBestSellerBooks() async {
  //   final result = await BestSellerDataHandler.fetchBestSellerModel();
  //   result.fold(
  //         (failure) {
  //       // Handle failure
  //       print("Error: ${failure.toString()}");
  //     },
  //           (r) async {
  //             bestSellerBooks=r;
  //       });
  //       //   (books) {
  //       // setState(() {
  //       //   bestSellerBooks = books;
  //       // });
  //   //  },
  //  // );
  // }
  sendRequestSuccessfully()async {
    showDialog(
      context: currentContext_!,
      builder: (context) =>
          const AlertSummitedSuccessfully(
            firstText: "Request Submitted",
            secondText:"weWillContact",
          ),
    );
    await Future.delayed(const Duration(milliseconds: 10));
  }

  final List<CarouselData> carouselData = [
    CarouselData(
      imagePath:"https://softwie.com/wp-content/uploads/2024/11/video-banner-img-01-1024x373.jpg",
      title: "AI SERVICES",
      subtitle: "BE One Of Our Team",
      buttonText: "Join Now",

      onButtonPressed: () {
        //currentContext_!.pushNamed(BeAPartnerScreen.routeName);
      },
      textAlign: TextAlign.start,
    ),
    CarouselData(
      imagePath:"https://img.freepik.com/premium-psd/particle-connection-network-transparent-background_1111860-543.jpg",
      title: "Development Services",
      subtitle: "BE One Of Our Team",
      buttonText: "Join Now",
      onButtonPressed: () {
       // currentContext_!.pushNamed(CareerApplicationScreen.routeName);
      },
      textAlign: TextAlign.center,
    ),
    CarouselData(
      imagePath:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_l0bVS0aVytjYsmEZGF8968pPsuoTpCFGyyd2rjT2eTnz_m1m",
      title: "Development Services",
      subtitle: "BE One Of Our Team",
      buttonText: "Join Now",
      onButtonPressed: () {
       // print("Learn More pressed");
      },
      textAlign: TextAlign.right,
    ),
  ];




  int activeIndex = 0;
  bool loading = false;

  List imageUrl = [
    "https://s3-alpha-sig.figma.com/img/5bb0/0d35/b1da3db335df094db306785c964da80b?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qoLirjuyvJuzZyD5kqB4WebvxrkF3FpggdwM~qDMSACxzrTrUN0BfTgE1TPJS4UvzWySa4j-35k6wOizBjLRoyy71t1tUaXFyjY5fTB2vnjhW9jcRs5~oFomKOv~0CxlCK442GmMPJLyOw3FZIF9WKtVXSUSPSPdYCm~3LZyq~J604Eh0yYNy-c-oKrNA5HsKnJ3ywf04Au~s~oTkGwg0T6CAVPgk9Vt9EH5ReTcZFFsYgHO4BVsX-FupfP-HGUXZZLLAtY~a1SQ~UaQV6dxb4km4QnXaftavI9Hc9kepTepaB57nPtDb1YBNv6SWPKZj8hS8WThu9wHwTh8sjKm8A__",
    "https://s3-alpha-sig.figma.com/img/5bb0/0d35/b1da3db335df094db306785c964da80b?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qoLirjuyvJuzZyD5kqB4WebvxrkF3FpggdwM~qDMSACxzrTrUN0BfTgE1TPJS4UvzWySa4j-35k6wOizBjLRoyy71t1tUaXFyjY5fTB2vnjhW9jcRs5~oFomKOv~0CxlCK442GmMPJLyOw3FZIF9WKtVXSUSPSPdYCm~3LZyq~J604Eh0yYNy-c-oKrNA5HsKnJ3ywf04Au~s~oTkGwg0T6CAVPgk9Vt9EH5ReTcZFFsYgHO4BVsX-FupfP-HGUXZZLLAtY~a1SQ~UaQV6dxb4km4QnXaftavI9Hc9kepTepaB57nPtDb1YBNv6SWPKZj8hS8WThu9wHwTh8sjKm8A__",
    "https://s3-alpha-sig.figma.com/img/5bb0/0d35/b1da3db335df094db306785c964da80b?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qoLirjuyvJuzZyD5kqB4WebvxrkF3FpggdwM~qDMSACxzrTrUN0BfTgE1TPJS4UvzWySa4j-35k6wOizBjLRoyy71t1tUaXFyjY5fTB2vnjhW9jcRs5~oFomKOv~0CxlCK442GmMPJLyOw3FZIF9WKtVXSUSPSPdYCm~3LZyq~J604Eh0yYNy-c-oKrNA5HsKnJ3ywf04Au~s~oTkGwg0T6CAVPgk9Vt9EH5ReTcZFFsYgHO4BVsX-FupfP-HGUXZZLLAtY~a1SQ~UaQV6dxb4km4QnXaftavI9Hc9kepTepaB57nPtDb1YBNv6SWPKZj8hS8WThu9wHwTh8sjKm8A__",

  ];
  onPageChange(int index) {
    setState(() {
      activeIndex = index;
    });
    activeIndex = index;
  }
}
