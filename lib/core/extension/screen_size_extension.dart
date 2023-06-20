import 'package:flutter/widgets.dart';
extension MediaQueryValues on BuildContext{
  double getWidth({double w=393})=> MediaQuery.of(this).size.width / (393 / w);
  double getHeight({double h=852}) => MediaQuery.of(this).size.height / (852 / h);
}