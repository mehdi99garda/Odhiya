import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Album> post(String body) async {
  final response = await http.post(
    Uri.parse('https://laravel-flutter-chat.herokuapp.com/api/messages?sender_id=3&receiver_id=1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'body': body,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {

  final String body;

  Album({ this.body});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(

      body: json['title'],
    );
  }
}



