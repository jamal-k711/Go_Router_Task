class HashtagExtractor {
  static List<String> extractHashtagsFromText(String text) {
    final regex = RegExp(r'#(\w+)');
    final matches = regex.allMatches(text);
    return matches.map((match) => match.group(1)!).toSet().toList();
  }
}