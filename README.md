<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

## Features


## Getting started


## Usage

to `/example` folder.

```dart
Widget exampleComboBox(BuildContext context) {
  return ComboBox(
    items: [
      ComboBoxItemModel(value: 1, label: "AAA"),
      ComboBoxItemModel(value: 2, label: "BBB"),
      ComboBoxItemModel(value: 3, label: "CCC"),
      ComboBoxItemModel(value: 4, label: "DDD"),
    ],
    valueSelected: valueSelected,
    textStyle: TextStyle(color: Colors.black, fontSize: 16),
    textStyleSelected: TextStyle(color: Colors.blue, fontSize: 16),
    displayText: (item) {
      return "${item.value}-${item.label}";
    },
    heightItem: 50,
    numberItemShow: 4,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.blue, width: 2.0, style: BorderStyle.solid, strokeAlign: 1),
    ),
    borderFocus: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.red, width: 2.0, style: BorderStyle.solid, strokeAlign: 1),
    ),
    onChanged: (item) {
      valueSelected = item?.value;
    },
  );
}
```

## Additional information

