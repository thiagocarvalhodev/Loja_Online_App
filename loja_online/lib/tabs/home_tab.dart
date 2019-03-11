  // Tela de inicio: imagens iniciais, 
  
  import 'package:flutter/material.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
  import 'package:transparent_image/transparent_image.dart';

  class HomeTab extends StatelessWidget {
    final Widget child;
  
    HomeTab({Key key, this.child}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      // Degradê de fundo
      Widget _buildBodyBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 45, 180, 239),
              Color.fromARGB(255, 178, 226, 247),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
      );
      
      return Stack(
        children: <Widget>[
          _buildBodyBack(),
          // Permite 'rolar' a appbar
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                floating: true,
                snap: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text("Novidades"),
                  centerTitle: true,
                ),
              ),
              FutureBuilder<QuerySnapshot>(
                // obtendo os documentos e ordenando pela posição
                // O dado vindo do documento será passado pro builder
                // como o argumento snapshot
                future: Firestore.instance
                  .collection("home").orderBy("pos").getDocuments(),
                builder: (context, snapshot){
                  // verifica se snapshot contém dados
                  // se não, mostrar CircularProgressIndicator
                  if(!snapshot.hasData){
                    return SliverToBoxAdapter(
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          // define a cor do CircularProgressIndicator
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    );
                  }
                  // caso tenha, fazer a tela
                  else {
                    print(snapshot.data.documents.length);
                    return SliverStaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      // obtendo todos os documentos, mapeando e transformando em staggredTile
                      staggeredTiles: snapshot.data.documents.map(
                        (doc){
                          return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                        }
                      ).toList(),
                      children: snapshot.data.documents.map(
                        (doc){
                          return FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: doc.data["image"],
                            fit: BoxFit.cover,
                          );
                        }
                      ).toList()
                    );
                  }
                },
              )
            ],
          )
        ],
      );
    }
  }