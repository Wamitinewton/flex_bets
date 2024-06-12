import 'package:betting_app/Models/event_season.dart';
import 'package:betting_app/common/utils/http.dart';
import 'package:get/get.dart';


class EventController extends GetxController {
  final HttpUtil _httpUtil = HttpUtil();

  var events = <Event>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      isLoading.value = true;
      var response = await _httpUtil.get('https://www.thesportsdb.com/api/v1/json/3/eventsseason.php?id=4424&s=2024');
      if (response != null && response['events'] != null) {
        List<Event> fetchedEvents = (response['events'] as List)
            .map((e) => Event.fromJson(e))
            .toList();
        events.assignAll(fetchedEvents);
      } else {
        print('No events found in the response');
      }
    } catch (e) {
      print('Error fetching events: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
