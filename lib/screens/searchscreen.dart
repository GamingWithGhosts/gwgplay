import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class searchScreen extends StatefulWidget {
  @override
  _searchScreenState createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {

  static const historyLength = 5;
  List<String> _searchHistory = [
        'ghost1',
        'ghost2',
        'ghost3',
        'ghost4',
        'new ghost'
  ];

  List<String> _filteredSearchHistory;

  String selectedTerm;

  List<String> filterSearchTerms({
    @required String filter,
  }){
    if(filter != null && filter.isNotEmpty){
      return _searchHistory.reversed.where((term) => term.startsWith(filter)).toList();
    }else{
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term){
    if(_searchHistory.contains(term)){
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
    _filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    _filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

FloatingSearchBarController controller;
  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    _filteredSearchHistory = filterSearchTerms(filter: null);
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white70
        ),
        backgroundColor: Colors.black,
        title: Text('Search Ghosts',style: TextStyle(
          color: Colors.white70
        ),),
      ),
      body: FloatingSearchBar(
        backgroundColor:Colors.redAccent,
        controller: controller ,
        body: FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(
            searchTerm: selectedTerm,
          ),
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics:BouncingScrollPhysics() ,
        title: Text(
          selectedTerm ?? 'Search Ghost here',
          style: Theme.of(context).textTheme.headline6,
        ),
        hint: 'Search Ghosts here',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query){
          setState(() {
            _filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted:(query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.black ,
              elevation: 4,
              child: Builder(
                builder: (context){
                  if(_filteredSearchHistory.isNotEmpty && controller.query.isNotEmpty){
                    return Container(
                      height: 56,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child:
                      Text('Start searching',
                        maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  }else if(_filteredSearchHistory.isEmpty){
                    return ListTile(
                        title: Text(controller.query
                            ),
                      leading: const Icon(FontAwesomeIcons.search),
                      onTap: (){
                          setState(() {
                            addSearchTerm(controller.query);
                            selectedTerm = controller.query;
                          });
                          controller.close();
                      },
                    );
                  }else{
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _filteredSearchHistory.map((term) => ListTile(
                        title: Text(term,maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                        leading: const Icon(FontAwesomeIcons.history,color: Colors.white70,),
                        trailing: IconButton(
                          icon: const Icon(FontAwesomeIcons.times,color: Colors.white70,),
                          onPressed: (){
                            setState(() {
                              deleteSearchTerm(term);
                            });
                          },
                        ),
                        onTap: (){
                          setState(() {
                            addSearchTerm(controller.query);
                            selectedTerm=controller.query;
                          });
                          controller.close();
                        },
                      ),
                      ).toList(),
                    );
                  }
                },
              ),
            ),
          );
        },
      )
      );
  }
}


class SearchResultsListView extends StatelessWidget {
final String searchTerm;

  const SearchResultsListView({
    Key key, this.searchTerm}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(searchTerm == null){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(FontAwesomeIcons.search,size: 64,),
          Text('Search',style: Theme.of(context).textTheme.headline5,)],
        ),
      );
    }
  final fsb = FloatingSearchBar.of(context);
  return ListView(
  padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
  children: List.generate(
  50,
  (index) => ListTile(
  title: Text('$searchTerm search result'),
  subtitle: Text(index.toString()),
  ),
  ),
  );
  }
}