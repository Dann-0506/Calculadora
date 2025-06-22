import 'package:flutter/material.dart';

import 'package:calculadora/pages/basic_calculator_page.dart';
import 'package:calculadora/pages/scientific_calculator_page.dart';
import 'package:calculadora/pages/conversor_page.dart';
import 'package:calculadora/pages/more_options_page.dart';

final List<Widget> appPages = [
  const BasicCalculatorPage(),
  const ScientificCalculatorPage(),
  const ConversorPage(),
  const MoreOptionsPage(),
];

final List<NavigationDestination> appDestinations = [
  const NavigationDestination(
    icon: Icon(Icons.calculate),
    label: 'Básica',
  ),
  const NavigationDestination(
    icon: Icon(Icons.science),
    label: 'Científica',
  ),
  const NavigationDestination(
    icon: Icon(Icons.swap_horiz),
    label: 'Conversor',
  ),
  const NavigationDestination(
    icon: Icon(Icons.more_horiz),
    label: 'Más',
  ),
];