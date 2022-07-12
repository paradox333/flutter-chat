import 'package:flutter/material.dart';
import 'package:flutter_avanzado_segundo_proyecto/models/users.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final users = [
    User(online: true, email: 'test@test.cl', name: 'Nombre', uid: '1'),
     User(online: false, email: 'test@test.cl', name: 'Nombre2', uid: '1')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre de usuario', style: TextStyle(color: Colors.black87),),
        elevation: 1, 
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon( Icons.exit_to_app, color: Colors.black87,),
          onPressed: (){},
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child:  Icon( Icons.check_circle, color: Colors.blue[400],),
            // child: Icon( Icons.offline_bolt, color: Colors.red,)
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _uploadUsers,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400],),
          waterDropColor: const Color.fromRGBO(66, 165, 245, 1),
        ),
        child: _ListViewUsers(),
        )
   );
  }

  ListView _ListViewUsers() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, i) => userListTile(users[i]),
      separatorBuilder: (_,i) => Divider(),
      itemCount: users.length 
      );
  }

  ListTile userListTile(User user) {
    return ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          child: Text(user.name.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: user.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }

  _uploadUsers() async {

  
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  

}
}
