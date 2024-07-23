import "dart:async";
import "package:audioplayers/audioplayers.dart";
import "package:flutter/material.dart";

class RadioPlayer extends StatefulWidget {
  @override
  _RadioPlayerState createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayer preloadedPlayer = AudioPlayer();
  late List<String> radioUrls;
  int currentIndex = 0;

  final Map<String, String> radioStations = {
    "https://s2.radio.co/sd4968cb05/listen": "Station 1",
    "https://stream.zeno.fm/8kqd6dp18vzuv": "Station 2",
    "https://lifelightradio.radioca.st/stream": "Station 3",
    "https://dc1.serverse.com/proxy/vaanmalar2/stream": "Station 4",
    "https://stream.zeno.fm/kzd2e3tx24zuv": "Station 5",
  };

  @override
  void initState() {
    super.initState();
    radioUrls = radioStations.keys.toList();
    preloadNextStream();
  }

  void showLoadingDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(width: 10),
              Expanded(child: Text(message)),
            ],
          ),
        );
      },
    );
  }

  void updateLoadingDialog(String message) {
    Navigator.of(context, rootNavigator: true).pop(); // Close the previous dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(width: 10),
              Expanded(child: Text(message)),
            ],
          ),
        );
      },
    );
  }

  void closeDialog() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<void> playRadio() async {
    showLoadingDialog("Please wait while we connect...");
    try {
      await audioPlayer.play(UrlSource(radioUrls[currentIndex]));
      closeDialog();
      showSuccessDialog("You are listening to ${radioStations[radioUrls[currentIndex]]}");
      preloadNextStream();
    } on TimeoutException catch (_) {
      closeDialog();
      showErrorDialog("Sorry, can't connect to the frequency. Try another one.");
    } catch (e) {
      closeDialog();
      showErrorDialog("An error occurred: $e");
    }
  }

  Future<void> pauseRadio() async {
    await audioPlayer.pause();
  }

  Future<void> stopRadio() async {
    await audioPlayer.stop();
  }

  Future<void> resumeRadio() async {
    await audioPlayer.resume();
  }

  Future<void> nextRadio() async {
    showLoadingDialog("Please wait while we connect...");
    try {
      await audioPlayer.stop();
      audioPlayer = preloadedPlayer; // Switch to the preloaded player
      await audioPlayer.resume();
      currentIndex = (currentIndex + 1) % radioUrls.length; // Increment and wrap index
      closeDialog();
      showSuccessDialog("You are listening to ${radioStations[radioUrls[currentIndex]]}");
      preloadedPlayer = AudioPlayer();
      preloadNextStream();
    } on TimeoutException catch (_) {
      closeDialog();
      showErrorDialog("Sorry, can't connect to the frequency. Try another one.");
    } catch (e) {
      closeDialog();
      showErrorDialog("An error occurred: $e");
    }
  }

  void preloadNextStream() async {
    int nextIndex = (currentIndex + 1) % radioUrls.length;
    try {
      await preloadedPlayer.play(UrlSource(radioUrls[nextIndex]));
      await preloadedPlayer.pause(); // Start in paused state to buffer
    } catch (e) {
      // Handle preload error if necessary
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showSuccessDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: playRadio,
              child: const Text('Play Radio'),
            ),
            ElevatedButton(
              onPressed: pauseRadio,
              child: const Text('Pause Radio'),
            ),
            ElevatedButton(
              onPressed: stopRadio,
              child: const Text('Stop Radio'),
            ),
            ElevatedButton(
              onPressed: resumeRadio,
              child: const Text('Resume Radio'),
            ),
            ElevatedButton(
              onPressed: nextRadio,
              child: const Text('Next Radio'),
            ),
          ],
        ),
      ),
    );
  }
}
