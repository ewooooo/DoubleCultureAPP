import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//경기대학교 소성박물관 네이버지도
class KSM_bus extends StatefulWidget {
  @override
  _KSM_busState createState() => _KSM_busState();
}
class _KSM_busState extends State<KSM_bus> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("지도"),
        centerTitle: true,
      ),
      url: "https://m.place.naver.com/place/12346314/home?entry=ple&subtab=location",
    );
  }
}

//수원 광교박물관 네이버지도
class SGM_bus extends StatefulWidget {
  @override
  _SGM_busState createState() => _SGM_busState();
}
class _SGM_busState extends State<SGM_bus> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("지도"),
        centerTitle: true,
      ),
      url: "https://m.place.naver.com/place/20597182/home?entry=ple&subtab=location",
    );
  }
}

//수원 화성행궁 네이버지도
class SHF_bus extends StatefulWidget {
  @override
  _SHF_busState createState() => _SHF_busState();
}
class _SHF_busState extends State<SHF_bus> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("지도"),
        centerTitle: true,
      ),
      url: "https://m.place.naver.com/place/31169145/home?entry=ple&subtab=location",
    );
  }
}

//수원 화성박물관 네이버지도
class SHM_bus extends StatefulWidget {
  @override
  _SHM_busState createState() => _SHM_busState();
}
class _SHM_busState extends State<SHM_bus> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("지도"),
        centerTitle: true,
      ),
      url: "https://m.place.naver.com/place/13093608/home?entry=ple&subtab=location",
    );
  }
}

//수원박물관 네이버지도
class SMH_bus extends StatefulWidget {
  @override
  _SMH_busState createState() => _SMH_busState();
}
class _SMH_busState extends State<SMH_bus> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("지도"),
        centerTitle: true,
      ),
      url: "https://m.place.naver.com/place/12949111/home?entry=ple&subtab=location",
    );
  }
}