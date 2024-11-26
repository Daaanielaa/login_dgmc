import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:login/main.dart'; 
void main() {
  testWidgets('Verificar elementos del formulario de login', (WidgetTester tester) async {
    
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    
    expect(find.byType(TextField), findsNWidgets(3));

    
    expect(find.text('Siguiente'), findsOneWidget);
    expect(find.text('Salir'), findsOneWidget);
  });

  testWidgets('Ingresar texto en los campos y verificar contenido', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    
    await tester.enterText(find.byType(TextField).at(0), 'Usuario Test');
    await tester.enterText(find.byType(TextField).at(1), 'email@test.com');
    await tester.enterText(find.byType(TextField).at(2), '123456');

    
    expect(find.text('Usuario Test'), findsOneWidget);
    expect(find.text('email@test.com'), findsOneWidget);
    expect(find.text('123456'), findsOneWidget);
  });

  testWidgets('Presionar botón Siguiente muestra un mensaje', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    
    await tester.enterText(find.byType(TextField).at(0), 'Usuario Test');
    await tester.enterText(find.byType(TextField).at(1), 'email@test.com');
    await tester.enterText(find.byType(TextField).at(2), '123456');

    
    await tester.tap(find.text('Siguiente'));
    await tester.pump(); 

    
    expect(find.textContaining('Datos ingresados'), findsOneWidget);
    expect(find.textContaining('Usuario Test'), findsOneWidget);
    expect(find.textContaining('email@test.com'), findsOneWidget);
  });

  testWidgets('Presionar botón Salir simula un evento de salida', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    
    await tester.tap(find.text('Salir'));
    await tester.pump();

    
  });
}
