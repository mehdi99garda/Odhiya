import 'package:http/http.dart';

class Resource
{
  String url;

  Function(Response response) parse;
  final Map<String, dynamic> data;

  Resource({ this.url, this.parse, this.data});
}
