import 'constants.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class LanguageTranslatorView extends StatefulWidget {
  @override
  State<LanguageTranslatorView> createState() => _LanguageTranslatorViewState();
}

class _LanguageTranslatorViewState extends State<LanguageTranslatorView> {
  String? _translatedText;
  final _controller = TextEditingController();
  final _modelManager = OnDeviceTranslatorModelManager();
  var _sourceLanguage = TranslateLanguage.english;
  var _targetLanguage = TranslateLanguage.spanish;
  var _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: TranslateLanguage.spanish);

  @override
  void dispose() {
    _onDeviceTranslator.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                kPrimaryPurple,
                kPrimaryBlue,
              ], // Change colors as needed
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: GestureDetector(
                      child: GlassContainer(
                        blur: 8,
                        color: Colors.white.withOpacity(1),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.blue.withOpacity(0.6),
                          ],
                        ),
                        border: Border.fromBorderSide(BorderSide.none),
                        shadowStrength: 8,
                        borderRadius: BorderRadius.circular(16),
                        shadowColor: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.arrow_back_ios),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Lingua",
                    style: kHeadingTextStyle,
                  ),
                ),
                SizedBox(height: 30),
                Center(
                    child: Text(
                  'Enter text (source: ${_sourceLanguage.name})',
                  style: kHeadingTextStyle.copyWith(fontSize: 20),
                )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                            )),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(border: InputBorder.none),
                          maxLines: null,
                        ),
                      )),
                      SizedBox(width: 20),
                      _buildDropdown(false),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                    child: Text(
                  'Translated Text (target: ${_targetLanguage.name})',
                  style: kHeadingTextStyle.copyWith(fontSize: 20),
                )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                )),
                            child: Text(_translatedText ?? '')),
                      ),
                      SizedBox(width: 20),
                      _buildDropdown(true),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: GlassContainer(
                      height: 65,
                      width: 150,
                      blur: 8,
                      color: Colors.white.withOpacity(1),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.blue.withOpacity(0.6),
                        ],
                      ),
                      //--code to remove border
                      border: Border.fromBorderSide(BorderSide.none),
                      shadowStrength: 8,
                      borderRadius: BorderRadius.circular(16),
                      shadowColor: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Text(
                          "Translate",
                          style: kHeadingTextStyle.copyWith(
                              fontSize: 20, color: kPrimaryGrey),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(bool isTarget) => DropdownButton<String>(
        value: (isTarget ? _targetLanguage : _sourceLanguage).bcpCode,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.white),
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (String? code) {
          if (code != null) {
            final lang = BCP47Code.fromRawValue(code);
            if (lang != null) {
              setState(() {
                isTarget ? _targetLanguage = lang : _sourceLanguage = lang;
                _onDeviceTranslator = OnDeviceTranslator(
                    sourceLanguage: _sourceLanguage,
                    targetLanguage: _targetLanguage);
              });
            }
          }
        },
        items: TranslateLanguage.values.map<DropdownMenuItem<String>>((lang) {
          return DropdownMenuItem<String>(
            value: lang.bcpCode,
            child: Text(lang.name),
          );
        }).toList(),
      );

  Future<void> _downloadSourceModel() async {
    Toast().show(
        'Downloading model (${_sourceLanguage.name})...',
        _modelManager
            .downloadModel(_sourceLanguage.bcpCode)
            .then((value) => value ? 'success' : 'failed'),
        context,
        this);
  }

  Future<void> _downloadTargetModel() async {
    Toast().show(
        'Downloading model (${_targetLanguage.name})...',
        _modelManager
            .downloadModel(_targetLanguage.bcpCode)
            .then((value) => value ? 'success' : 'failed'),
        context,
        this);
  }

  Future<void> _deleteSourceModel() async {
    Toast().show(
        'Deleting model (${_sourceLanguage.name})...',
        _modelManager
            .deleteModel(_sourceLanguage.bcpCode)
            .then((value) => value ? 'success' : 'failed'),
        context,
        this);
  }

  Future<void> _deleteTargetModel() async {
    Toast().show(
        'Deleting model (${_targetLanguage.name})...',
        _modelManager
            .deleteModel(_targetLanguage.bcpCode)
            .then((value) => value ? 'success' : 'failed'),
        context,
        this);
  }

  Future<void> _isSourceModelDownloaded() async {
    Toast().show(
        'Checking if model (${_sourceLanguage.name}) is downloaded...',
        _modelManager
            .isModelDownloaded(_sourceLanguage.bcpCode)
            .then((value) => value ? 'downloaded' : 'not downloaded'),
        context,
        this);
  }

  Future<void> _isTargetModelDownloaded() async {
    Toast().show(
        'Checking if model (${_targetLanguage.name}) is downloaded...',
        _modelManager
            .isModelDownloaded(_targetLanguage.bcpCode)
            .then((value) => value ? 'downloaded' : 'not downloaded'),
        context,
        this);
  }

  Future<void> _translateText() async {
    FocusScope.of(context).unfocus();
    Toast().show(
        'Translating...',
        _onDeviceTranslator.translateText(_controller.text).then((result) {
          setState(() {
            _translatedText = result;
          });
          return 'done!';
        }),
        context,
        this);
  }
}

class Toast {
  void show(String message, Future<String> t, BuildContext context,
      State<StatefulWidget> state) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    showLoadingIndicator(context, message);
    final verificationResult = await t;
    Navigator.of(context).pop();
    if (!state.mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Result: ${verificationResult.toString()}'),
    ));
  }

  void showLoadingIndicator(BuildContext context, String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Colors.black87,
              content: LoadingIndicator(text: text),
            ));
      },
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  final String text;

  const LoadingIndicator({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        color: Colors.black.withOpacity(0.8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [_getLoadingIndicator(), _getHeading(), _getText(text)]));
  }

  Widget _getLoadingIndicator() {
    return Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(strokeWidth: 3)));
  }

  Widget _getHeading() {
    return Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Text(
          'Please wait …',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ));
  }

  Widget _getText(String displayedText) {
    return Text(
      displayedText,
      style: TextStyle(color: Colors.white, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}
