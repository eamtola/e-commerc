import 'package:facebook_clone/screens/tab_screens/home.dart';
import 'package:facebook_clone/screens/tab_screens/group.dart';
import 'package:facebook_clone/screens/tab_screens/makertplace.dart';
import 'package:facebook_clone/screens/tab_screens/more.dart';
import 'package:facebook_clone/screens/tab_screens/notifications.dart';
import 'package:facebook_clone/screens/tab_screens/watch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  final controller = ScrollController();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: ScrollAppBar(
        controller: controller,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "facebook",
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              _appBarAction(FontAwesomeIcons.search),
              _appBarAction(FontAwesome5Brands.facebook_messenger),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            labelPadding: const EdgeInsets.all(1),
            tabs: [
              Tab(
                icon: Icon(
                  Ionicons.md_home,
                  color: Colors.grey[700],
                ),
              ),
              Tab(
                icon: Icon(
                  Ionicons.md_people,
                  color: Colors.grey[700],
                ),
              ),
              Tab(
                icon: Icon(
                  Ionicons.logo_youtube,
                  color: Colors.grey[700],
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.grey[700],
                ),
              ),
              Tab(
                icon: Icon(
                  Ionicons.md_notifications_outline,
                  color: Colors.grey[700],
                ),
              ),
              Tab(
                icon: Icon(
                  Ionicons.md_menu,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: controller,
                    child: const HomeScreen(),
                  ),
                  const Group(),
                  const Watch(),
                  const Makertplace(),
                  const Notifications(),
                  const More(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBarAction(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.23)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
