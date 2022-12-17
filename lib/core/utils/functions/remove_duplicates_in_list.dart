removeDuplicatesInList(List list) {
  var seen = <String>{};
  return list.where((element) => seen.add(element.id)).toList();
}
