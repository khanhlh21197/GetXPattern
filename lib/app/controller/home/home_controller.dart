import 'package:get/get.dart';
import 'package:getx_pattern/app/data/model/album.dart';
import 'package:getx_pattern/app/data/model/menu.dart';
import 'package:getx_pattern/app/data/model/model.dart';
import 'package:getx_pattern/app/data/repository/posts_repository.dart';
import 'package:getx_pattern/app/routes/app_pages.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final MyRepository repository;

  HomeController({@required this.repository}) : assert(repository != null);

  final _postsList = List<MyModel>().obs;

  get postList => this._postsList.value;

  set postList(value) => this._postsList.value = value;

  final _post = MyModel().obs;

  get post => this._post.value;

  set post(value) => this._post.value = value;

  final _album = Album().obs;

  get album => this._album.value;

  set album(value) => this._album.value = value;

  final _menuList = List<Menu>().obs;

  get menuList => this._menuList.value;

  set menuList(value) => this._menuList.value = value;

  getAll() {
    repository.getAll().then((data) {
      this.postList = data;
    });
  }

  getAlbum() {
    repository.getAlbum().then((album) {
      print('$album');
      this.album = album;
    });
  }

  getMenu() {
    repository.getMenu().then((data) {
      this.menuList = data;
    });
  }

  adicionar(post) {}

  //dismissible
  excluir(id) {}

  //dismissible
  editar() {}

  details(post) {
    this.post = post;
    Get.toNamed(Routes.DETAILS);
  }
}
