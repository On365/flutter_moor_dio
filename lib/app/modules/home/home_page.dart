import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:using_moor/app/database/database.dart';
import 'package:using_moor/app/modules/home/home_controller.dart';
import 'package:using_moor/app/pages/detail/detail.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Moor+Dio"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<UserDao>(context);
    final controller = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              final user = User(
                  email: 'Teste3@email.com',
                  detailPicture:
                      'https://randomuser.me/api/portraits/thumb/men/75.jpg',
                  profilePicture:
                      'https://randomuser.me/api/portraits/thumb/men/75.jpg',
                  name: 'A_Wesley Alves');
              dao.insertUser(user);
            },
          ),
          IconButton(
            icon: Icon(Icons.cloud_download),
            onPressed: () {
              controller.getData();
            },
          ),
          IconButton(icon: Icon(Icons.clear_all), onPressed: dao.clearUser),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.getData,
        child: StreamBuilder(
          stream: dao.watchAllTasks(),
          builder: (context, snapshot) {
            final List<User> user = snapshot.data;
            return Observer(
              builder: (_) {
                if (controller.data != null) {
                  controller.data.forEach((f) => dao.insertUser(f.toMoor()));
                  controller.data.clear();
                }
                return Container(
                  child: ListView.builder(
                    itemCount: user != null ? user.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      // final item = user[index];
                      return Dismissible(
                        background: Container(
                          color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                width: 60,
                                color: Colors.red,
                                child: Icon(Icons.delete, color: Colors.white),
                              )),
                            ],
                          ),
                        ),
                        key: Key(user[index].email),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            dao.deleteUSer(user[index]);
                          }
                        },
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(user[index])),
                            );
                          },
                          leading: Hero(
                            tag: 'avatar' + user[index].email,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(user[index].profilePicture),
                            ),
                          ),
                          title: Text(user[index].name),
                          subtitle: Text(user[index].email),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
