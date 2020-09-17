const String SERVICE_VERSION = '5.4';
const endpoint = 'localhost:8080';

Future<String> getURL(String suffix) async {
  String prefix = await getBaseURL();
  String url = prefix == null ? endpoint : prefix;
  return '$url$suffix';
}

Future<String> getBaseURL() async {
  String prefix = "localhost:8080";
  return prefix == null ? endpoint : prefix;
}

const GET_USER = '/ehi_connect/get_user';
const ADD = '/ehi_connect/add';
const ALL = '/ehi_connect/all';
const DELETE = '/ehi_connect/delete';
