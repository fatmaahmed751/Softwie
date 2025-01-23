// // To parse this JSON data, do
// //
// //     final bestSellerModel = bestSellerModelFromJson(jsonString);
//
// import 'dart:convert';
//
// BestSellerModel bestSellerModelFromJson(String str) => BestSellerModel.fromJson(json.decode(str));
//
// String bestSellerModelToJson(BestSellerModel data) => json.encode(data.toJson());
//
// class BestSellerModel {
//   final String? kind;
//   final String? id;
//   final String? etag;
//   final String? selfLink;
//   final VolumeInfo? volumeInfo;
//   final SaleInfo? saleInfo;
//   final AccessInfo? accessInfo;
//   final SearchInfo? searchInfo;
//
//   BestSellerModel({
//     this.kind,
//     this.id,
//     this.etag,
//     this.selfLink,
//     this.volumeInfo,
//     this.saleInfo,
//     this.accessInfo,
//     this.searchInfo,
//   });
//
//   factory BestSellerModel.fromJson(Map<String, dynamic> json) => BestSellerModel(
//     kind: json["kind"],
//     id: json["id"],
//     etag: json["etag"],
//     selfLink: json["selfLink"],
//     volumeInfo: json["volumeInfo"] == null ? null : VolumeInfo.fromJson(json["volumeInfo"]),
//     saleInfo: json["saleInfo"] == null ? null : SaleInfo.fromJson(json["saleInfo"]),
//     accessInfo: json["accessInfo"] == null ? null : AccessInfo.fromJson(json["accessInfo"]),
//     searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "kind": kind,
//     "id": id,
//     "etag": etag,
//     "selfLink": selfLink,
//     "volumeInfo": volumeInfo?.toJson(),
//     "saleInfo": saleInfo?.toJson(),
//     "accessInfo": accessInfo?.toJson(),
//     "searchInfo": searchInfo?.toJson(),
//   };
// }
//
// class AccessInfo {
//   final String? country;
//   final String? viewability;
//   final bool? embeddable;
//   final bool? publicDomain;
//   final String? textToSpeechPermission;
//   final Epub? epub;
//   final Epub? pdf;
//   final String? webReaderLink;
//   final String? accessViewStatus;
//   final bool? quoteSharingAllowed;
//
//   AccessInfo({
//     this.country,
//     this.viewability,
//     this.embeddable,
//     this.publicDomain,
//     this.textToSpeechPermission,
//     this.epub,
//     this.pdf,
//     this.webReaderLink,
//     this.accessViewStatus,
//     this.quoteSharingAllowed,
//   });
//
//   factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
//     country: json["country"],
//     viewability: json["viewability"],
//     embeddable: json["embeddable"],
//     publicDomain: json["publicDomain"],
//     textToSpeechPermission: json["textToSpeechPermission"],
//     epub: json["epub"] == null ? null : Epub.fromJson(json["epub"]),
//     pdf: json["pdf"] == null ? null : Epub.fromJson(json["pdf"]),
//     webReaderLink: json["webReaderLink"],
//     accessViewStatus: json["accessViewStatus"],
//     quoteSharingAllowed: json["quoteSharingAllowed"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "country": country,
//     "viewability": viewability,
//     "embeddable": embeddable,
//     "publicDomain": publicDomain,
//     "textToSpeechPermission": textToSpeechPermission,
//     "epub": epub?.toJson(),
//     "pdf": pdf?.toJson(),
//     "webReaderLink": webReaderLink,
//     "accessViewStatus": accessViewStatus,
//     "quoteSharingAllowed": quoteSharingAllowed,
//   };
// }
//
// class Epub {
//   final bool? isAvailable;
//   final String? acsTokenLink;
//
//   Epub({
//     this.isAvailable,
//     this.acsTokenLink,
//   });
//
//   factory Epub.fromJson(Map<String, dynamic> json) => Epub(
//     isAvailable: json["isAvailable"],
//     acsTokenLink: json["acsTokenLink"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "isAvailable": isAvailable,
//     "acsTokenLink": acsTokenLink,
//   };
// }
//
// class SaleInfo {
//   final String? country;
//   final String? saleability;
//   final bool? isEbook;
//   final SaleInfoListPrice? listPrice;
//   final SaleInfoListPrice? retailPrice;
//   final String? buyLink;
//   final List<Offer>? offers;
//
//   SaleInfo({
//     this.country,
//     this.saleability,
//     this.isEbook,
//     this.listPrice,
//     this.retailPrice,
//     this.buyLink,
//     this.offers,
//   });
//
//   factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
//     country: json["country"],
//     saleability: json["saleability"],
//     isEbook: json["isEbook"],
//     listPrice: json["listPrice"] == null ? null : SaleInfoListPrice.fromJson(json["listPrice"]),
//     retailPrice: json["retailPrice"] == null ? null : SaleInfoListPrice.fromJson(json["retailPrice"]),
//     buyLink: json["buyLink"],
//     offers: json["offers"] == null ? [] : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "country": country,
//     "saleability": saleability,
//     "isEbook": isEbook,
//     "listPrice": listPrice?.toJson(),
//     "retailPrice": retailPrice?.toJson(),
//     "buyLink": buyLink,
//     "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
//   };
// }
//
// class SaleInfoListPrice {
//   final double? amount;
//   final String? currencyCode;
//
//   SaleInfoListPrice({
//     this.amount,
//     this.currencyCode,
//   });
//
//   factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) => SaleInfoListPrice(
//     amount: json["amount"]?.toDouble(),
//     currencyCode: json["currencyCode"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "amount": amount,
//     "currencyCode": currencyCode,
//   };
// }
//
// class Offer {
//   final int? finskyOfferType;
//   final OfferListPrice? listPrice;
//   final OfferListPrice? retailPrice;
//
//   Offer({
//     this.finskyOfferType,
//     this.listPrice,
//     this.retailPrice,
//   });
//
//   factory Offer.fromJson(Map<String, dynamic> json) => Offer(
//     finskyOfferType: json["finskyOfferType"],
//     listPrice: json["listPrice"] == null ? null : OfferListPrice.fromJson(json["listPrice"]),
//     retailPrice: json["retailPrice"] == null ? null : OfferListPrice.fromJson(json["retailPrice"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "finskyOfferType": finskyOfferType,
//     "listPrice": listPrice?.toJson(),
//     "retailPrice": retailPrice?.toJson(),
//   };
// }
//
// class OfferListPrice {
//   final int? amountInMicros;
//   final String? currencyCode;
//
//   OfferListPrice({
//     this.amountInMicros,
//     this.currencyCode,
//   });
//
//   factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice(
//     amountInMicros: json["amountInMicros"],
//     currencyCode: json["currencyCode"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "amountInMicros": amountInMicros,
//     "currencyCode": currencyCode,
//   };
// }
//
// class SearchInfo {
//   final String? textSnippet;
//
//   SearchInfo({
//     this.textSnippet,
//   });
//
//   factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
//     textSnippet: json["textSnippet"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "textSnippet": textSnippet,
//   };
// }
//
// class VolumeInfo {
//   final String? title;
//   final List<String>? authors;
//   final String? publisher;
//   final DateTime? publishedDate;
//   final String? description;
//   final List<IndustryIdentifier>? industryIdentifiers;
//   final ReadingModes? readingModes;
//   final int? pageCount;
//   final String? printType;
//   final List<String>? categories;
//   final String? maturityRating;
//   final bool? allowAnonLogging;
//   final String? contentVersion;
//   final PanelizationSummary? panelizationSummary;
//   final ImageLinks? imageLinks;
//   final String? language;
//   final String? previewLink;
//   final String? infoLink;
//   final String? canonicalVolumeLink;
//
//   VolumeInfo({
//     this.title,
//     this.authors,
//     this.publisher,
//     this.publishedDate,
//     this.description,
//     this.industryIdentifiers,
//     this.readingModes,
//     this.pageCount,
//     this.printType,
//     this.categories,
//     this.maturityRating,
//     this.allowAnonLogging,
//     this.contentVersion,
//     this.panelizationSummary,
//     this.imageLinks,
//     this.language,
//     this.previewLink,
//     this.infoLink,
//     this.canonicalVolumeLink,
//   });
//
//   factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
//     title: json["title"],
//     authors: json["authors"] == null ? [] : List<String>.from(json["authors"]!.map((x) => x)),
//     publisher: json["publisher"],
//     publishedDate: json["publishedDate"] == null ? null : DateTime.parse(json["publishedDate"]),
//     description: json["description"],
//     industryIdentifiers: json["industryIdentifiers"] == null ? [] : List<IndustryIdentifier>.from(json["industryIdentifiers"]!.map((x) => IndustryIdentifier.fromJson(x))),
//     readingModes: json["readingModes"] == null ? null : ReadingModes.fromJson(json["readingModes"]),
//     pageCount: json["pageCount"],
//     printType: json["printType"],
//     categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
//     maturityRating: json["maturityRating"],
//     allowAnonLogging: json["allowAnonLogging"],
//     contentVersion: json["contentVersion"],
//     panelizationSummary: json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]),
//     imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]),
//     language: json["language"],
//     previewLink: json["previewLink"],
//     infoLink: json["infoLink"],
//     canonicalVolumeLink: json["canonicalVolumeLink"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "title": title,
//     "authors": authors == null ? [] : List<dynamic>.from(authors!.map((x) => x)),
//     "publisher": publisher,
//     "publishedDate": "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
//     "description": description,
//     "industryIdentifiers": industryIdentifiers == null ? [] : List<dynamic>.from(industryIdentifiers!.map((x) => x.toJson())),
//     "readingModes": readingModes?.toJson(),
//     "pageCount": pageCount,
//     "printType": printType,
//     "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
//     "maturityRating": maturityRating,
//     "allowAnonLogging": allowAnonLogging,
//     "contentVersion": contentVersion,
//     "panelizationSummary": panelizationSummary?.toJson(),
//     "imageLinks": imageLinks?.toJson(),
//     "language": language,
//     "previewLink": previewLink,
//     "infoLink": infoLink,
//     "canonicalVolumeLink": canonicalVolumeLink,
//   };
// }
//
// class ImageLinks {
//   final String? smallThumbnail;
//   final String? thumbnail;
//
//   ImageLinks({
//     this.smallThumbnail,
//     this.thumbnail,
//   });
//
//   factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
//     smallThumbnail: json["smallThumbnail"],
//     thumbnail: json["thumbnail"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "smallThumbnail": smallThumbnail,
//     "thumbnail": thumbnail,
//   };
// }
//
// class IndustryIdentifier {
//   final String? type;
//   final String? identifier;
//
//   IndustryIdentifier({
//     this.type,
//     this.identifier,
//   });
//
//   factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
//     type: json["type"],
//     identifier: json["identifier"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "type": type,
//     "identifier": identifier,
//   };
// }
//
// class PanelizationSummary {
//   final bool? containsEpubBubbles;
//   final bool? containsImageBubbles;
//
//   PanelizationSummary({
//     this.containsEpubBubbles,
//     this.containsImageBubbles,
//   });
//
//   factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
//     containsEpubBubbles: json["containsEpubBubbles"],
//     containsImageBubbles: json["containsImageBubbles"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "containsEpubBubbles": containsEpubBubbles,
//     "containsImageBubbles": containsImageBubbles,
//   };
// }
//
// class ReadingModes {
//   final bool? text;
//   final bool? image;
//
//   ReadingModes({
//     this.text,
//     this.image,
//   });
//
//   factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
//     text: json["text"],
//     image: json["image"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "text": text,
//     "image": image,
//   };
// }
