
class APIEndPoint{
  static const String baseServerURL = "https://www.googleapis.com/books/v1";
  static const String _baseURL = "$baseServerURL/volumes";



  //=========================== api User ====================================
  static const String test = "${_baseURL}todos";
  static const String bestSeller = "$_baseURL?Filtering=bestseller-ebooks&q=general&key=AIzaSyBx22lWuhA8EvcJ02s7RG_RJ4qiKbmQN9M";
}



