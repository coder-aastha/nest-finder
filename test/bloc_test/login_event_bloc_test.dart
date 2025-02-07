// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/diagnostics.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:nest_finder/features/auth/presentation/view_model/login/login_bloc.dart';

// void main() {
//   group('LoginEvent', () {
//     test('NavigateRegisterScreenEvent supports value equality', () {
//       final event1 = NavigateRegisterScreenEvent(
//         context: FakeBuildContext(),
//         destination: const Placeholder(),
//       );
//       final event2 = NavigateRegisterScreenEvent(
//         context: FakeBuildContext(),
//         destination: const Placeholder(),
//       );

//       expect(event1, equals(event2));
//     });

//     test('NavigateHomeScreenEvent supports value equality', () {
//       final event1 = NavigateHomeScreenEvent(
//         context: FakeBuildContext(),
//         destination: const Placeholder(),
//       );
//       final event2 = NavigateHomeScreenEvent(
//         context: FakeBuildContext(),
//         destination: const Placeholder(),
//       );

//       expect(event1, equals(event2));
//     });

//     // test('LoginUserEvent supports value equality', () {
//     //   final event1 = LoginUserEvent(
//     //     context: FakeBuildContext(),
//     //     username: "test_user",
//     //     password: "password123",
//     //   );
//     //   final event2 = LoginUserEvent(
//     //     context: FakeBuildContext(),
//     //     username: "test_user",
//     //     password: "password123",
//     //   );

//     //   expect(event1, equals(event2));
//     // });
//   });
// }

// /// Mock BuildContext since it is required in event constructors
// class FakeBuildContext extends BuildContext {
//   @override
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
