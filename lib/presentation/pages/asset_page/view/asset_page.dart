import 'package:flutter/material.dart';

class AssetPage extends StatefulWidget {
  final String companyId;

  const AssetPage({
    super.key,
    required this.companyId,
  });

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
