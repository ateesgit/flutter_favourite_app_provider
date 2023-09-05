import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favourite_app_provider/provider/favourite_provider.dart';
import 'package:flutter_favourite_app_provider/screens/favourite.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('English Words'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder:(context,index){
          final word = words[index];
          return ListTile(
             title: Text(word),
             trailing: IconButton(
              onPressed: (){
                provider.toggleFavourite(word);
              }, 
              icon:provider.isExist(word)?
              Icon(Icons.favorite,color: Colors.red,): 
              Icon(Icons.favorite_border)
            ),
          );
        } ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            final route = MaterialPageRoute(builder: (context)=>FavouritePage());
            Navigator.push(context, route);
          }, 
          label: Text('favourites')),
    );
  }
}