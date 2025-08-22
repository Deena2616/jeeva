import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum ElementType {
  heading, paragraph, button, list, video, card, icon, imageSlider, submitButton, nextButton, backButton, loginButton, image, logo, radioGroup, checkbox, bottomBar, cardRow2, cardRow3, appBar, textField
}

// Admin Pages Data
final List<Map<String, dynamic>> adminPages = [
  {
    'name': 'Page 1',
    'backgroundColor': '#FFFFFF',
    'elements': [
      {
        'type': ElementType.heading,
        'text': 'deenakarthi',
        'color': '#000000',
        'size': 20,
        'padding': {
          'left': 8,
          'top': 8,
          'right': 8,
          'bottom': 8,
        },
        'margin': {
          'left': 4,
          'top': 4,
          'right': 4,
          'bottom': 4,
        },
        'width': Infinity,
        'height': null,
        'listStyle': 'disc',
        'videoUrl': '',
        'imageUrls': [
        ],
        'icon': 'star',
        'bold': false,
        'italic': false,
        'underline': false,
        'backgroundColor': '#00000000',
        'borderRadius': 0,
        'borderWidth': 0,
        'borderColor': '#00000000',
        'alignment': 'left',
        'fontFamily': 'Poppins',
        'shadow': {
          'elevation': 0,
          'blurRadius': 0,
        },
        'opacity': 1,
        'textShadow': {
          'dx': 0,
          'dy': 0,
          'blurRadius': 0,
          'color': '#00000000',
        },
        'buttonStyle': null,
        'isSubmitButton': false,
        'fieldId': null,
      },
    ]
  },
];

// User Pages Data
final List<Map<String, dynamic>> userPages = [
  {
    'name': 'Page 1',
    'backgroundColor': '#FFFFFF',
    'elements': [
    ]
  },
];

// ADMIN Pages
class AdminPage1 extends StatefulWidget {
  const AdminPage1({super.key});

  @override
  _AdminPage1State createState() => _AdminPage1State();
}

class _AdminPage1State extends State<AdminPage1> {
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    for (var el in adminPages[0]['elements']) {
      if (el['type'] == ElementType.textField) {
        _controllers[el['fieldId']] = TextEditingController();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _submitForm() async {
    final Map<String, dynamic> formData = {};
    for (var el in adminPages[0]['elements']) {
      if (el['type'] == ElementType.textField) {
        formData[el['label']] = _controllers[el['fieldId']]?.text ?? '';
      }
    }

    // Submit to backend
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/submit-form'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(formData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form submitted successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit form')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: 2.718281828459045')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFFF),
        child: ListView(
          children: [
            Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Container(
              margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x00000000),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Opacity(
                opacity: 1,
                child: Text(
                  'deenakarthi',
                  style: GoogleFonts.getFont(
  'Poppins',
  fontSize: 20,
  color: Color(0x000000),
)
.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          ],
        ),
      ),
    );
  }
}

// USER Pages
class UserPage1 extends StatefulWidget {
  const UserPage1({super.key});

  @override
  _UserPage1State createState() => _UserPage1State();
}

class _UserPage1State extends State<UserPage1> {
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    for (var el in userPages[0]['elements']) {
      if (el['type'] == ElementType.textField) {
        _controllers[el['fieldId']] = TextEditingController();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _submitForm() async {
    final Map<String, dynamic> formData = {};
    for (var el in userPages[0]['elements']) {
      if (el['type'] == ElementType.textField) {
        formData[el['label']] = _controllers[el['fieldId']]?.text ?? '';
      }
    }

    // Submit to backend
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/submit-form'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(formData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form submitted successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit form')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: 2.718281828459045')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFFF),
        child: ListView(
          children: [
          ],
        ),
      ),
    );
  }
}

