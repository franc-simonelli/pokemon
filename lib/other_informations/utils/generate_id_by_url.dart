generateIdByUrl(String url) {
  RegExp regExp = RegExp(r'/(\d+)/$');
  Match? match = regExp.firstMatch(url);

  if (match != null) {
    return int.parse(match.group(1)!);
  } else {
    return null;
  }
}
