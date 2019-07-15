    import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //title: 'Welcome to Flutter',
      //home: Scaffold(
      title: 'Skin lens Startup Name Generator',
      home: RandomWords(),

    /*appBar: AppBar(
          title: Text('skin lens startup names'),
        ),
        body: Center(

          child: RandomWords(),

      ),
      ),*/
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
   // final wordPair = WordPair.random();
   // return Text(wordPair.asPascalCase);
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildRow(WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    }
    Widget _buildSuggestions() {
      return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: /*1*/ (context, i) {
            if (i.isOdd) return Divider(); /*2*/

            final index = i ~/ 2; /*3*/
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            }
            return _buildRow(_suggestions[index]);

          });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Lens Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}
    class RandomWords extends StatefulWidget {
      @override
      RandomWordsState createState() => RandomWordsState();
    }