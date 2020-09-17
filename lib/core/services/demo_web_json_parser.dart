

dynamic getIsValid(Map<String, dynamic> json) {
  return json['success'];
}

dynamic getMessage(Map<String, dynamic> json) {
  return json['message'];
}


List<dynamic> getDataOfArrayWithDynamicIndex0(Map<String, dynamic> json) {
  return json[0];
}


