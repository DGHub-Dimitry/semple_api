import 'package:get/get.dart';
import 'package:semper/controllers/page/page_screen_controller.dart';
import 'package:semper/models/post.dart';
import 'package:semper/repository/repository.dart';

class PostController extends GetxController {
  PostController();
  Repository repository = Repository();
  var list = List<Post>.empty(growable: true).obs;
  var page = 1;
  var isLoading = false.obs;

  // For Pagination
  PageScreenController pageScreenController = Get.put(PageScreenController());
  var isMoreDataAvailable = true.obs;

  var selectedPriority = 1.obs;
  var isProcessing = false.obs;

  @override
  void onInit() async {
    get();

    //For Pagination
    paginate();
    super.onInit();
  }

  // Fetch Data
  void get() {
    try {
      isMoreDataAvailable(false);
      isLoading(true);
      repository.getPost().then((posts) {
        isLoading(false);
        list.addAll(posts);
      }, onError: (err) {
        isLoading(false);
        print(err.toString());
      });
    } catch (exception) {
      isLoading(false);
      print(exception.toString());
    }
  }

  // For Pagination
  void paginate() {
    pageScreenController.scrollController.addListener(() {
      if (pageScreenController.scrollController.position.pixels ==
          pageScreenController.scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getMore(page);
      }
    });
  }

  // Get More data
  void getMore(var page) {
    try {
      repository.getPost().then((posts) {
        if (posts.length > 0) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          print('No more items');
        }
        list.addAll(posts);
      }, onError: (err) {
        isMoreDataAvailable(false);
        print(err.toString());
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      print(exception.toString());
    }
  }

  // Refresh List
  void refreshList() async {
    page = 1;
    get();
  }

  @override
  void onClose() {
    pageScreenController.scrollController.dispose();
    super.onClose();
  }
}
