import 'package:carros/drawer_list.dart';
import 'package:carros/pages/carros/carro_api.dart';
import 'package:carros/pages/carros/carros_page.dart';
import 'package:carros/utils/prefs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _initState();
  }

  void _initState() async {
    _tabController = TabController(length: 3, vsync: this);

    _tabController.index = await Prefs.getInt("tabIdx");

    _tabController.addListener(() {
      print("Tab: ${_tabController.index}");
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Clássicos"),
            Tab(text: "Esportivos"),
            Tab(text: "Luxo"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CarrosPage(TipoCarro.classicos),
          CarrosPage(TipoCarro.esportivos),
          CarrosPage(TipoCarro.luxo),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}
