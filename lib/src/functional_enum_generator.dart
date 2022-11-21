import 'dart:async';
import 'package:enum_generators/src/annotation.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'enum_generator.dart';

class FunctionalEnumGenerator extends GeneratorForAnnotation<EnumGenerator> {
  const FunctionalEnumGenerator();

  @override
  FutureOr<String> generateForAnnotatedElement(Element element,
      ConstantReader annotation,
      BuildStep buildStep,) {
    if (element.kind == ElementKind.ENUM && element is EnumElement) {
      return EnumExtensionGenerator(element).generate();
    } else {
      throw InvalidGenerationSourceError(
        '''@functionalEnum can only be applied on enum types. Instead, you are trying to use is it on a ${element
            .kind} ${element.name}.''',
        element: element,
      );
    }
  }
}
