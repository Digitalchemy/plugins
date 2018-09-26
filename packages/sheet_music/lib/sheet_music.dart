library sheet_music;

import 'package:flutter/material.dart';

import 'util/clef_asset.dart';
import 'util/pitch_asset.dart';
import 'util/scale_asset.dart';

/// Transparent Sheet Music View with [black] color.
class SheetMusic extends StatelessWidget {
  final bool trebleClef;
  final String pitch, scale;

  /// Hide the Sheet Music View.
  final bool hide;

  /// Color of the [background], everything else will be [black].
  /// Defaults to [transparent].
  final Color backgroundColor;

  /// Called when the [clef] section is tapped.
  final VoidCallback clefTap;

  /// Called when the [scale] section is tapped.
  final VoidCallback scaleTap;

  /// Called when the [note] section is tapped.
  final VoidCallback pitchTap;

  SheetMusic({
    @required this.trebleClef,
    @required this.scale,
    @required this.pitch,
    this.pitchTap,
    this.clefTap,
    this.scaleTap,
    this.backgroundColor,
    this.hide,
  });

  Widget _buildClef() {
    return Container(
      child: InkWell(
        onTap: clefTap,
        child: SizedBox(
          height: 100.0,
          width: 39.0,
          child: Image.asset(
            getClefAsset(trebleClef),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildScale() {
    return Container(
      child: InkWell(
        onTap: scaleTap,
        child: SizedBox(
          height: 100.0,
          width: 100.0,
          child: Image.asset(
            getScaleAsset(scale, trebleClef: trebleClef),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildPitch() {
    return Container(
      child: InkWell(
        onTap: pitchTap,
        child: SizedBox(
          height: 100.0,
          width: 58.0,
          child: Image.asset(
            getPitchAsset(pitch, trebleClef: trebleClef),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (hide != null && hide) return Container();

    return Container(
      color: backgroundColor,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[_buildClef(), _buildScale(), _buildPitch()]),
    );
  }
}