import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:http/http.dart';

class CodeGenerator extends StatefulWidget {
  @override
  _CodeGeneratorState createState() => _CodeGeneratorState();
}

class _CodeGeneratorState extends State<CodeGenerator> {
  @override
  initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    String uri =
        'https://raw.githubusercontent.com/nzxcvbnm/gallery/master/lib/main.dart';
    try {
      final res = await get(Uri.parse(uri));

      final source = res.body;
      log(source);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CodeEditor(source)));
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CodeEditor extends StatefulWidget {
  String source;
  CodeEditor(this.source);
  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    final source = widget.source;
    _codeController = CodeController(
      text: source,
      language: dart,
      theme: monokaiSublimeTheme,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CodeField(
          controller: _codeController!,
          textStyle: TextStyle(fontFamily: 'SourceCode'),
        ),
      ),
    );
  }
}
