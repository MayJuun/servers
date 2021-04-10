import 'package:get_server/get_server.dart';

void main() => runApp(
      GetServer(
        home: FolderWidget('app/web'),
        getPages: [
          GetPage(
            name: '/welcome',
            page: () => Html(path: 'app/web/index.html'),
          ),
        ],
      ),
    );
