import 'package:flutter/material.dart';
import 'package:flutter_favourite_app_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final words = provider.words;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
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
        floatingActionButton: FloatingActionButton.large(
          onPressed: (){
            provider.clearFavourite();
            Navigator.of(context).pop();
          },
          child: Text('Clear'),),
    );
  }
}