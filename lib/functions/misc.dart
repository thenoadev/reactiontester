import 'package:device_info_plus/device_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

void launchURLMisc(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Unable to launch Internet Browser on device ${getId()} ';
  }
}

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (UniversalPlatform.isWeb) {
    WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
    List<int> webBytes = utf8.encode(
      webInfo.browserName.toString() +
          webInfo.vendor! +
          webInfo.hardwareConcurrency!.toString() +
          webInfo.deviceMemory!.toString() +
          webInfo.userAgent!.toString(),
    );
    Digest webDigest = sha1.convert(webBytes);
    return webDigest.toString();
  } else {
    if (UniversalPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId;
    } else if (UniversalPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    } else if (UniversalPlatform.isLinux) {
      LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      return linuxInfo.machineId;
    } else if (UniversalPlatform.isWindows) {
      return await PlatformDeviceId.getDeviceId;
    }
  }
}

Future<String?> getDeviceType() async {
  var deviceInfo = DeviceInfoPlugin();
  if (UniversalPlatform.isWeb) {
    WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
    return webInfo.browserName.toString();
  } else {
    if (UniversalPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    } else if (UniversalPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.model;
    } else if (UniversalPlatform.isLinux) {
      LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      return linuxInfo.prettyName;
    } else if (UniversalPlatform.isWindows) {
      return 'Windows';
    }
  }
}

Future<String?> getDeviceVersion() async {
  var deviceInfo = DeviceInfoPlugin();
  if (UniversalPlatform.isWeb) {
    WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
    return webInfo.appVersion.toString();
  } else {
    if (UniversalPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      AndroidBuildVersion ec = androidInfo.version;
      return 'Android ${ec.release}; SDK ${androidInfo.version.sdkInt}';
    } else if (UniversalPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.systemVersion;
    } else if (UniversalPlatform.isLinux) {
      LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      return linuxInfo.version;
    } else if (UniversalPlatform.isWindows) {
      return 'Win10+';
    }
  }
}

Future<String?> getDeviceOs() async {
  if (UniversalPlatform.isWeb) {
    return 'Web';
  } else {
    if (UniversalPlatform.isAndroid) {
      return 'Android';
    } else if (UniversalPlatform.isIOS) {
      return 'IOS';
    } else if (UniversalPlatform.isLinux) {
      return 'Linux';
    } else if (UniversalPlatform.isWindows) {
      return 'Windows';
    }
  }
}
