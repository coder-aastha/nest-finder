// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/diagnostics.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:nest_finder/features/auth/presentation/view_model/signup/register_bloc.dart';

// void main() {
//   group('RegisterEvent', () {
//     test('UploadImage supports value equality', () {
//       final file = File('test_image.png');
//       final event1 = UploadImage(file: file);
//       final event2 = UploadImage(file: file);

//       expect(event1, equals(event2));
//     });

//     test('RegisterUser supports value equality', () {
//       final file = File('test_image.png');
//       final event1 = RegisterUser(
//         context: FakeBuildContext(),
//         username: 'testUser',
//         email: 'test@example.com',
//         password: 'password123',
//         confirmPassword: 'password123',
//         image: file.path,
//       );
//       final event2 = RegisterUser(
//         context: FakeBuildContext(),
//         username: 'testUser',
//         email: 'test@example.com',
//         password: 'password123',
//         confirmPassword: 'password123',
//         image: file.path,
//       );

//       expect(event1, equals(event2));
//     });
//   });
// }

// /// Mock BuildContext since it is required in event constructors
// class FakeBuildContext extends BuildContext {
//   @override
//   // TODO: implement debugDoingBuild
//   bool get debugDoingBuild => throw UnimplementedError();

//   @override
//   InheritedWidget dependOnInheritedElement(InheritedElement ancestor,
//       {Object? aspect}) {
//     throw UnimplementedError();
//   }

//   @override
//   T? dependOnInheritedWidgetOfExactType<T extends InheritedWidget>(
//       {Object? aspect}) {
//     throw UnimplementedError();
//   }

//   @override
//   DiagnosticsNode describeElement(String name,
//       {DiagnosticsTreeStyle style = DiagnosticsTreeStyle.errorProperty}) {
//     throw UnimplementedError();
//   }

//   @override
//   List<DiagnosticsNode> describeMissingAncestor(
//       {required Type expectedAncestorType}) {
//     throw UnimplementedError();
//   }

//   @override
//   DiagnosticsNode describeOwnershipChain(String name) {
//     throw UnimplementedError();
//   }

//   @override
//   DiagnosticsNode describeWidget(String name,
//       {DiagnosticsTreeStyle style = DiagnosticsTreeStyle.errorProperty}) {
//     throw UnimplementedError();
//   }

//   @override
//   void dispatchNotification(Notification notification) {}

//   @override
//   T? findAncestorRenderObjectOfType<T extends RenderObject>() {
//     throw UnimplementedError();
//   }

//   @override
//   T? findAncestorStateOfType<T extends State<StatefulWidget>>() {
//     throw UnimplementedError();
//   }

//   @override
//   T? findAncestorWidgetOfExactType<T extends Widget>() {
//     throw UnimplementedError();
//   }

//   @override
//   RenderObject? findRenderObject() {
//     throw UnimplementedError();
//   }

//   @override
//   T? findRootAncestorStateOfType<T extends State<StatefulWidget>>() {
//     throw UnimplementedError();
//   }

//   @override
//   InheritedElement?
//       getElementForInheritedWidgetOfExactType<T extends InheritedWidget>() {
//     throw UnimplementedError();
//   }

//   @override
//   T? getInheritedWidgetOfExactType<T extends InheritedWidget>() {
//     throw UnimplementedError();
//   }

//   @override
//   bool get mounted => throw UnimplementedError();

//   @override
//   BuildOwner? get owner => throw UnimplementedError();

//   @override
//   Size? get size => throw UnimplementedError();

//   @override
//   void visitAncestorElements(ConditionalElementVisitor visitor) {}

//   @override
//   void visitChildElements(ElementVisitor visitor) {}

//   @override
//   Widget get widget => throw UnimplementedError();
// }
