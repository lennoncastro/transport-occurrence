import 'package:flutter/widgets.dart';
import 'package:i69n/i69n.dart' as i69n;
import 'package:transport_occurrence/messages/labels.i69n.dart';

extension LabelsExtension on BuildContext {
  i69n.I69nMessageBundle get labels => Labels();
}
