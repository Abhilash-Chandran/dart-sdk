Map<String, dynamic> removeNullsFromMap(Map<String, dynamic> json) => json
  ..removeWhere((String key, dynamic value) => value == null)
  ..map<String, dynamic>((key, value) => MapEntry(key, removeNulls(value)));

removeNulls(e) => (e is List)
    ? removeNullsFromList(e)
    : (e is Map<String, dynamic> ? removeNullsFromMap(e) : e);

List removeNullsFromList(List list) => list
  ..removeWhere((value) => value == null)
  ..map((e) => removeNulls(e)).toList();

String mapToQueryParams(Map<String, String> metadataMap) {
  var _queryParam = '';
  for (var entry in metadataMap.entries) {
    _queryParam += '${entry.key}=${entry.value}&';
  }
  return _queryParam.substring(0, _queryParam.length - 1);
}
