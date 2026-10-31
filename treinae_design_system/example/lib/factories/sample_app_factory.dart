import 'package:flutter/material.dart';
import '../samples/sample_app.dart';
import '../viewmodels/sample_view_model.dart';

abstract final class SampleAppFactory {
  static Widget create() => TreinaeSampleApp(model: createViewModel());
  static SampleViewModel createViewModel() => SampleViewModel();
}
