//import statements
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/theme_toggle_button.dart';

class ContactFormPage extends StatefulWidget {
  //toggles between light and dark mode
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const ContactFormPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  //allows for a maximum of 3 messages to be sent per session to prevent spam
  static const int _maxMessagesPerSession = 3;

  //form key and text controllers for the contact form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isSubmitting = false;
  int _messagesSentThisSession = 0;

  //disposes of text controllers when widget is removed from widget tree to free up resources
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  //shows a dialog to the user after successfully sending feedback, allowing them to either send another message or return home
  Future<void> _showSuccessDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Feedback sent'),
          content: const Text(
            'Your message is ready in your email app. Choose what you would like to do next.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
                _formKey.currentState?.reset();
              },
              child: const Text('Send another message'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Return home'),
            ),
          ],
        );
      },
    );
  }

  //shows session limit message to the user when they have reached the maximum number of messages allowed per session
  Future<void> _showLimitReachedMessage() async {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You have reached the message limit for this session.'),
      ),
    );
  }

  //submits the feedback form through input validation, email construction, and launch of email app
  Future<void> _submitFeedback() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_messagesSentThisSession >= _maxMessagesPerSession) {
      await _showLimitReachedMessage();
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

  //contructs the email message using the user's input
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    final subject = Uri.encodeComponent('Feedback from $name');
    final body = Uri.encodeComponent(
      'Name: $name\n'
      'Email: $email\n\n'
      'Message:\n$message',
    );

    final uri = Uri.parse('mailto:Arushi.Saravanan@uga.edu?subject=$subject&body=$body');

  //opens the user's default email app with their feedback message
    try {
      if (await canLaunchUrl(uri)) {
        _messagesSentThisSession += 1;
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        if (!mounted) return;
        await _showSuccessDialog();
      } else {
        //shows error message if the user's email app cannot be opened
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to open your email app right now.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

//builds the feedback form page with title, user input fields, and submit button
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final outline = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.outline,
        width: 1.2,
      ),
    );
    final focusedOutline = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 2,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Form'),
        centerTitle: true,
        actions: [
          ThemeToggleButton(
            isDarkMode: widget.isDarkMode,
            onToggleTheme: widget.onToggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          color: isDark ? AppColors.cardDark : AppColors.cardLight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Share Your Feedback or Reach Out!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Your name',
                      prefixIcon: const Icon(Icons.person_outline),
                      enabledBorder: outline,
                      focusedBorder: focusedOutline,
                      errorBorder: outline,
                      focusedErrorBorder: focusedOutline,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      prefixIcon: const Icon(Icons.email_outlined),
                      enabledBorder: outline,
                      focusedBorder: focusedOutline,
                      errorBorder: outline,
                      focusedErrorBorder: focusedOutline,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email address.';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      labelText: 'Your message',
                      alignLabelWithHint: true,
                      prefixIcon: const Icon(Icons.message_outlined),
                      enabledBorder: outline,
                      focusedBorder: focusedOutline,
                      errorBorder: outline,
                      focusedErrorBorder: focusedOutline,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a message.';
                      }
                      return null;
                    },
                  ),
                  //submit button is disabled if the user reaches the maximum message limit per session
                  const SizedBox(height: 24),
                  CustomButton(
                    text: _messagesSentThisSession >= _maxMessagesPerSession
                        ? 'Limit reached'
                        : (_isSubmitting ? 'Sending…' : 'Send Feedback'),
                    icon: Icons.send_rounded,
                    onPressed: _messagesSentThisSession >= _maxMessagesPerSession
                        ? _showLimitReachedMessage
                        : (_isSubmitting ? () {} : _submitFeedback),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
