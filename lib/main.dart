import 'package:flutter/material.dart';
import 'package:flutter_lab6/ListData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ListData> listData = [
    ListData(
        nameItem: "Orange",
        oldPrice: "12\$",
        newPrice: "8\$",
        urlImage:
            "https://ponnaorganics.com/wp-content/uploads/2015/12/fresh-orange-500x500-1.jpg"),
    ListData(
        nameItem: "Apple",
        oldPrice: "9\$",
        newPrice: "7\$",
        urlImage:
            "https://media.istockphoto.com/photos/red-apple-picture-id184276818?k=20&m=184276818&s=612x612&w=0&h=QxOcueqAUVTdiJ7DVoCu-BkNCIuwliPEgtAQhgvBA_g="),
    ListData(
        nameItem: "Mango",
        oldPrice: "20\$",
        newPrice: "17\$",
        urlImage:
            "https://media.istockphoto.com/photos/mango-picture-id168370138?k=20&m=168370138&s=170667a&w=0&h=-Pqqe7GF58_kUs__GkQdNKC3yxEsVWAu47WvWcMmTZA="),
    ListData(
        nameItem: "Peach",
        oldPrice: "14\$",
        newPrice: "10\$",
        urlImage:
            "https://www.plantgrower.org/uploads/6/5/5/4/65545169/published/peach.jpg?1515174163")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Market")),
            backgroundColor: Colors.orange[900],
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white, Colors.orange])),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return buildItem(index, listData[index]);
                    },
                    itemCount: listData.length,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildItem(int index, ListData list) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  list.nameItem += " add to cart";
                });
              },
              icon: Icon(Icons.add),
              label: Text("add to cart"),
              style: ElevatedButton.styleFrom(primary: Colors.orange[900]),
            ),
          ),
          ListTile(
            leading: Image.network(
              "${list.urlImage}",
              width: 100,
              height: 100,
            ),
            title: Text(
              list.nameItem,
              style: TextStyle(fontSize: 25),
            ),
            subtitle: Row(
              children: [
                Text(
                  "${list.oldPrice}",
                  style: TextStyle(
                      fontSize: 20, decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${list.newPrice}",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            trailing: TextButton(
                onPressed: () {
                  setState(() {
                    list.nameItem += " add to favorite";
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.orange[900],
                )),
          ),
        ],
      );
}
