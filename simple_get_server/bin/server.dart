import 'package:get_server/get_server.dart';

void main() => runApp(
      GetServer(
        home: FolderWidget('web'),
        getPages: [
          GetPage(
            name: '/',
            page: () => Html(path: 'web/index.html'),
          ),
          GetPage(
            name: '/redirect',
            page: () => Html(path: 'web/index.html'),
          ),
        ],
        onNotFound: Html(path: 'web/index.html'),
      ),
    );
