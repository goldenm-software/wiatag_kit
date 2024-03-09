# wiatag_kit

Uses the native SDKs developed by Gurtam to provide a simple and easy to convert your App into a WiaTag device.

Checkout more information about WiaTag [here](https://gurtam.com/en/wiatag)
Also, checkout the [WiaTag Kit Android](https://github.com/wialon/wiatag-kit-android) and [WiaTag Kit iOS](https://github.com/wialon/wiatag-kit-ios) for more information.

## Getting started
First of all, you need to define the host and port of the server. This server may be Wialon Hosting, Wialon Local, or Flespi. In this example, we will use Wialon Hosting.

For this example, this is our WiaTag unit in Wialon:
![Wialon Unit form](https://github.com/goldenm-software/wiatag_kit/blob/main/screenshots/wialon_unit.png)

After that, this is the ideal workflow to set the server:
```dart
import 'package:wiatag_kit/wiatag_kit.dart';

WiaTagKit plugin = WiaTagKit();

WiatagServer server = WiatagServer(
  host: 'nl.gpsgsm.org',
  port: 20963,
  unitId: 'wiatag_flutter',
  password: '', 
  hasCommands: true,
  commandListener: const Duration(seconds: 30),
);

plugin.setServer(server); // Future<bool?> setServer(WiatagServer server)
```

After that, you have multiples choices:

### Send a message
```dart
WiatagMessage message = WiatagMessage(
  latitude: 10,
  longitude: 10,
  // ... Look at the WiatagMessage class for more options
);

plugin.sendMessage(message); // Future<bool?> sendMessage(WiatagMessage message)
```

### Send an SOS
```dart
plugin.sendSOS(); // Future<bool?> sendSOS()
// Or, you can add a message to the SOS
WiatagMessage message = WiatagMessage(
  latitude: 10,
  longitude: 10,
  // ... Look at the WiatagMessage class for more options
);
plugin.sendSOS(message); // Future<bool?> sendSOS([WiatagMessage? message])
```

### Send a Text message
```dart
plugin.sendText('Hello, World!'); // Future<bool?> sendText(String text)
// Or you can add a message to the text
WiatagMessage message = WiatagMessage(
  latitude: 10,
  longitude: 10,
  // ... Look at the WiatagMessage class for more options
);
plugin.sendText('Hello, World!', message); // Future<bool?> sendText(String text, [WiatagMessage? message])
```

### How can I listen for the commands?
It's easy, you just need to add a listener to the plugin:
```dart
plugin.addListener((WiatagCommand command) {
  // Do something with the command
});
```

## Known issues
- Commands may not work propertly when Flespi is the server.
- Some command handlers in iOS are marked as not supported, we're working on it.
