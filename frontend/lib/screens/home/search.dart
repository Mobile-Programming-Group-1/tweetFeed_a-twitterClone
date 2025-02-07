import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweet_feed/screens/main/profile/list.dart';
import 'package:tweet_feed/services/user.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  
  UserServices _userServices = UserServices();
  String search = '';
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: _userServices.queryByName(search),
      initialData: [],
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            onChanged: (text) {
              setState(() {
                search = text;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search...'
            ),
          ),
          ),
          ListUsers()
        ],
      ),
    );
  }
}
