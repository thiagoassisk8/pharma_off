import 'package:flutter/material.dart';
import 'package:pharma_off/home/objetos/produto.dart';
import 'package:pharma_off/home/servicos/detalhes_produto.dart';
import 'package:pharma_off/palheta/constants.dart';
import 'package:pharma_off/palheta/size_config.dart';

class Pesquisa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return pesquisa();
  }
}

class pesquisa extends State<Pesquisa> {
  static String NomeNavegacao = "/pesquisa";
  @override
  String filterText = "";
  List<Produto> ProdutoLista = Produto.Produtolist;

  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (text) {
            setState(() {
              filterText = text;
            });
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Procurar produto",
            prefixIcon: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: ProdutoSearch());
              },
              icon: Icon(Icons.search),
            ),
          ),
        ));
  }
}

class ProdutoSearch extends SearchDelegate<Produto> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query, style: TextStyle(fontSize: 20)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? Produto.Produtolist
        : Produto.Produtolist.where((p) => p.name.startsWith(query)).toList();
    return mylist.isEmpty
        ? Text(
            'Resultado não encontrado',
            style: TextStyle(fontSize: 20),
          )
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final Produto listitem = mylist[index];
              return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          mylist[index],
                        ),
                      ),
                    );
                  },
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          listitem.name,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          listitem.estabelecimento,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider()
                      ]));
            });
  }
}
