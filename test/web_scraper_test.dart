import 'package:flutter_test/flutter_test.dart';

import 'package:web_scraper/web_scraper.dart';

void main() {
  final webScraper = WebScraper('https://webscraper.io');

  group('Complete Web Scraper Test', () {
    bool page;
    List<Map<String, dynamic>> productNames = [];
    test('Loads Webpage', () async{
      page = await webScraper.loadWebPage('/test-sites/e-commerce/allinone');
      expect(page, true);
    });
    test('Parse tags', () async{
      productNames = webScraper.getElement('div.thumbnail > div.caption > h4 > a.title', ['href', 'title']);
      expect(productNames, isNotNull);
    });
  });
}
