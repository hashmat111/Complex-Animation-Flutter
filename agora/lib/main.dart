import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class VideoChatScreen extends StatefulWidget {
  @override
  _VideoChatScreenState createState() => _VideoChatScreenState();
}

class _VideoChatScreenState extends State<VideoChatScreen> {
  late RtcEngine _engine;  // Declare _engine as late to ensure it's initialized later
  bool _isMicrophoneOn = true;
  int? _remoteUid;

  // Create an RtcConnection object to manage the connection explicitly
  final RtcConnection _connection = RtcConnection(channelId: 'test'); // Replace with your channel name

  @override
  void initState() {
    super.initState();
    _initializeAgora();
  }

  Future<void> _initializeAgora() async {
    // Request microphone and camera permissions
    await [Permission.microphone, Permission.camera].request();

    // Initialize Agora RTC engine
    _engine = createAgoraRtcEngine();  // Initialize the _engine here
    await _engine.initialize(RtcEngineContext(appId: '278290981d4c4762b1b53b52f4f9643f'));  // Replace with your App ID

    // Set channel profile and client role
    await _engine.setChannelProfile(ChannelProfileType.channelProfileCommunication);
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

    // Register event handlers for user interactions
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print('Local user joined channel');
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    // Join the Agora channel
    await _engine.joinChannel(
      token: '35bd1b27a56d4f3ba93cd0d5eba587f9',  // Replace with your token
      channelId: 'test',  // Replace with your channel name
      options: ChannelMediaOptions(),
      uid: 0,  // Local user ID
    );
  }

  void _toggleMicrophone() async {
    if (_engine == null) return;  // Prevent action if _engine isn't initialized
    setState(() {
      _isMicrophoneOn = !_isMicrophoneOn;
    });

    if (_isMicrophoneOn) {
      await _engine.enableAudio();
    } else {
      await _engine.disableAudio();
    }
  }

  void _endCall() async {
    if (_engine == null) return;  // Prevent action if _engine isn't initialized
    await _engine.leaveChannel();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    if (_engine != null) {
      _engine.release();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Chat'),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              // Show the local or remote video stream
              _remoteUid != null
                  ? AgoraVideoView(
                controller: VideoViewController(





                  rtcEngine: _engine,
                  canvas: const VideoCanvas(uid: 1),  // Remote user ID
                ),
              )
                  : AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: _engine,
                  canvas: const VideoCanvas(uid: 0),  // Local user ID
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: FloatingActionButton(
                  onPressed: _toggleMicrophone,
                  backgroundColor: Colors.white,
                  child: Icon(
                    _isMicrophoneOn ? Icons.mic : Icons.mic_off,
                    color: Colors.red,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  onPressed: _endCall,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(VideoChatScreen());
}
