class Api {
  static const String baseUrl = 'jsonplaceholder.typicode.com';
  static const String basePostUrl = '/photos';

  static Uri postListUrl(Map<String, dynamic>? queryParameters) {
    return Uri.https(baseUrl, basePostUrl, queryParameters);
  }

  static Uri postDetailUrl(int id) {
    return Uri.https(baseUrl, '$basePostUrl/$id');
  }
}
