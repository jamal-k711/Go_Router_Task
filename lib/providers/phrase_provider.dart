import 'package:flutter/foundation.dart';
import '../utils/hashtag_extractor.dart';

class PhraseProvider extends ChangeNotifier {
  String _phrase = '';
  List<String> _hashtags = [];
  String _hashtagsText = '';

  String get phrase => _phrase;
  List<String> get hashtags => _hashtags;
  String get hashtagsText => _hashtagsText;

  void updatePhrase(String value) {
    _phrase = value;
    _extractHashtags();
    notifyListeners();
  }

  void updateHashtagsText(String value) {
    _hashtagsText = value;
    _hashtags = HashtagExtractor.extractHashtagsFromText(value);
    notifyListeners();
  }

  void _extractHashtags() {
    _hashtags = HashtagExtractor.extractHashtagsFromText(_phrase);
    _hashtagsText = _hashtags.map((tag) => '#$tag').join(' ');
  }

  void reset() {
    _phrase = '';
    _hashtags = [];
    _hashtagsText = '';
    notifyListeners();
  }
}