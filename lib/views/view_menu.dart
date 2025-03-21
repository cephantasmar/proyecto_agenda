import 'package:flutter/material.dart';
import 'view_empresas.dart';
import 'view_citas.dart';

class ViewMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Menú Principal'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Empresas'),
              Tab(text: 'Mis Citas'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ViewEmpresas(),
            ViewCitas(),
          ],
        ),
      ),
    );
  }
}