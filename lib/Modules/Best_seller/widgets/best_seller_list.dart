import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:softwie/Modules/Home/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Models/best_seller_books_model.dart';


class BestSellerList extends StatefulWidget {
  final List<BestSellerModel> books;
  const BestSellerList({super.key, required this.books});

  @override
createState() => _BestSellerListState();
}

class _BestSellerListState extends StateMVC<BestSellerList> {
  _BestSellerListState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;

  @override
  void initState() {
    super.initState();
    // con.updateItems();
  }
  @override
  Widget build(BuildContext context) {
            return
              SizedBox(
                height: 330,
                //color: Colors.red,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index){
                    final book = con.bestSellerBooks[index];
                return ListTile(
                    leading: book.volumeInfo?.imageLinks != null
                    ? Image.network(book.volumeInfo!.imageLinks!.smallThumbnail??"")
                      : const Icon(Icons.book),
    title: Text(book.volumeInfo!.title!),
    subtitle: book.volumeInfo?.description != null
    ? Text(book.volumeInfo!.description !)
        : const Text("No description available"),
    );
  },
                    separatorBuilder: (context, index) =>
                    const SizedBox(
                      width: 5,
                    ),
                    itemCount: con.bestSellerBooks.length),
              );
          // return Container(
          //   height: 220,
          //   padding: const EdgeInsets.only(left: 10.0,top:10),
          //   child: ListView.separated(
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) =>  RecentlyViewed(imageIndex: index),
          //       separatorBuilder: (context, index) => const SizedBox(
          //         width: 5,
          //       ),
          //       itemCount: 7),
          // );
          //  const Center(child: CircularProgressIndicator());
        }


  }

  Widget bestSellerWidget(BestSellerModel books, context) {
    return InkWell(
        onTap: () async {
          final Uri _url = Uri.parse(books.volumeInfo!.canonicalVolumeLink!);
          if (!await launchUrl(_url)) {
            throw Exception('Could not launch $_url');
          }
          // Navigator.push(context, MaterialPageRoute(
          //     builder: (context) =>
          //          WebViewExample(
          //            url:  books.volumeInfo.previewLink!,
          //         )));
        },
        child: Column(
            children: [
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .33,
                child: AspectRatio(
                  aspectRatio: 5 / 9,
                  child: Container(
                    // width: 60,
                    // height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: Colors.red,
                      image: DecorationImage(
                        image: NetworkImage(
                            books.volumeInfo?.imageLinks?.thumbnail ??
                                'https://i.pinimg.com/564x/bc/42/a4/bc42a40ea31850951a52f99d8dbd457a.jpg'
                          //  '${bestSellerBooks.items.indexOf(element)['items']['volumeInfo']['imageLinks']}'
                        ),
                        // AssetImage('assets/images/fatherhood.png')),
                      ),
                    ),
                  ),
                ),
              ),
              // bookName(
              //     text: books.volumeInfo.authors?.first ?? "Famous Author"),
              const SizedBox(
                height: 10,
              ),
            ]
        )
    );
  }
