import 'package:flutter/material.dart';

class DonagalDrawer extends StatelessWidget {
  const DonagalDrawer();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Pick up Donagal App',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          Divider(
            color: Colors.grey[600],
          ),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text('Mes voyages'),
            onTap: () {
              Navigator.pushNamed(context, '/trips');
            },
          )
        ],
      ),
    );
  }
}
