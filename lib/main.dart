import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class Item {
  final String imageUrl;
  final String name;
  final String description;

  Item(this.imageUrl, this.name, this.description);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MAMAMARA.RO'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.menu),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 2,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
            ),
            // ListView tab content Widget
            ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int position) => _ItemListCellWidget(items[position]))
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          subtitle: Text(_item.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _item.description,
        maxLines: 2,
        style: TextStyle(),
      ),
      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  //1
  Item(
    "https://media2.bulgari.com/f_auto,q_auto/production/dw62a0c52b/images/images/1348757.png",
    "Bulgari Dias",
    "24.500.000",
  ),
  //2
  Item(
    "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//98/MTA-22395158/coach_coach_tabby_top_handle_20_black_elegant_bag_branded_full01_knfc53x9.jpg",
    "Coach Tabby",
    "2.000.000",
  ),
  //3
  Item(
    "https://ae01.alicdn.com/kf/Hd59854abf0f342538dc4ecb5cd7a2a92K/Vintage-Chain-Designer-PU-Leather-Crossbody-Bags-For-Women-2022-Winter-Women-s-Trend-Handbags-Branded.jpg",
    "Vintage Leather",
    "500.000",
  ),
  //4
  Item(
    "https://apollo-singapore.akamaized.net/v1/files/e5jhmiegl3w02-ID/image;s=850x0",
    "Dior Blue Gery",
    "32.000.000",
  ),
  //5
  Item(
    "https://s3.bukalapak.com/img/3421201952/large/Tas_Wanita_Bonia_Easy_bag_Handbag_Branded_Import_New_Arrival.jpg",
    "Bonia Brown",
    "200.000",
  ),
  //6
  Item(
    "https://www.stylesgap.com/wp-content/uploads/2014/10/Top-10-Most-Famous-Best-Designer-Bags-Popular-Handbags-Brands-1-1.jpg",
    "Channel Chain Black",
    "37.000.000",
  ),
  //7
  Item(
    "https://media.karousell.com/media/photos/products/2022/1/10/sling_bag_branded_1641812062_7e12e386_progressive.jpg",
    "Sling Saddle Dior",
    "25.000.000",
  ),
];
