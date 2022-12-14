import '../utils/feedback_model.dart';
import 'package:http/http.dart' as http;
import '../utils/web_appoints_model.dart';

class RemoteServices {
  Future<List<FeedbackModel>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(
        "https://script.googleusercontent.com/macros/echo?user_content_key=G_W4MT5IBf28y4ZgWpAjtu4PkWBZ6ece7H_klw1Be93vL812-8TRIXK3FfSIhozWcIiUf9E-RbkOSij7BVToLNE2TvaDr1Rmm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnF638I6s8bb5axVhEi-STtK38kziOzhZBUCzen7Da2zdxRRoLko5TkXKvUDbBWAUWOk4u_4YLlxTXoz-iUhm4Uhl_V-ObwYmENz9Jw9Md8uu&lib=MNYPwTRJwh6-a6yzrOoHLYY-v5gZnHGs0");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return feedbackModelFromJson(json);
    }
    return null;
  }
}

class WebAppointRemoteServices {
  Future<List<WebAppointsModel>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(
        "https://script.google.com/macros/s/AKfycby4eCMQpZomJa5DhvS-ll1fVsPQYMFSLLiDRx8K_BGhPmO4c1CKPUC-4nr7ewsSc7J4/exec");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return webAppointsModelFromJson(json);
    }
    return null;
  }
}
