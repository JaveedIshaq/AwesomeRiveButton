import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AwesomeRiveButtons {
  static const MethodChannel _channel =
      const MethodChannel('awesome_rive_buttons');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

class CircularAwesomeRiveButton extends StatefulWidget {
  final Alignment alignment;
  final BoxFit fit;
  final bool pause;
  final FlareCompletedCallback callback;
  final GestureTapCallback onPress;

  const CircularAwesomeRiveButton({
    Key key,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
    this.pause = true,
    this.callback,
    this.onPress,
  }) : super(key: key);

  @override
  _CircularAwesomeRiveButtonState createState() =>
      _CircularAwesomeRiveButtonState();
}

class _CircularAwesomeRiveButtonState extends State<CircularAwesomeRiveButton> {
  final FlareControls controls = FlareControls();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FlareActor(
        "packages/awesome_rive_buttons/flarefiles/CircularButton.flr",
        alignment: widget.alignment,
        fit: widget.fit,
        isPaused: widget.pause,
        callback: widget.callback,
        controller: controls,
        animation: 'StaticCircularButton',
      ),
      onTap: () {
        setState(() {
          controls.play('CircularButton');
        });
        widget.onPress();
      },
    );
  }
}

class RectangularAwesomeRiveButton extends StatefulWidget {
  final Alignment alignment;
  final BoxFit fit;
  final bool pause;
  final FlareCompletedCallback callback;
  final GestureTapCallback onPress;

  const RectangularAwesomeRiveButton(
      {this.alignment = Alignment.center,
      this.fit = BoxFit.contain,
      this.pause = false,
      this.callback,
      this.onPress,
      Key key})
      : super(key: key);
  @override
  _RectangularAwesomeRiveButtonState createState() =>
      _RectangularAwesomeRiveButtonState();
}

class _RectangularAwesomeRiveButtonState
    extends State<RectangularAwesomeRiveButton> {
  final FlareControls controls = FlareControls();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FlareActor(
        "packages/awesome_rive_buttons/flarefiles/RectangularButton.flr",
        alignment: widget.alignment,
        fit: widget.fit,
        isPaused: widget.pause,
        callback: widget.callback,
        controller: controls,
        animation: "StaticRectangularButton",
      ),
      onTap: () {
        setState(() {
          controls.play('RectangularButton');
        });
        widget.onPress();
      },
    );
  }
}
