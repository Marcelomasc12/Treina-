import 'brand_component.dart';
import 'brand_view_model.dart';

class BrandFactory {
  BrandFactory._();
  static BrandComponent standard({bool showTagline = true}) =>
      BrandComponent(viewModel: BrandViewModel(showTagline: showTagline));
}
