//import statements
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/colors.dart';
import '../../utils/accessibility.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/settings_button.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key});

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
          title: const Text('Email draft opened'),
          content: const Text(
            'Your message is ready in your email app. Review it and send it from there.',
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

    final uri = Uri.parse(
      'mailto:WarnellVRLab@uga.edu?subject=$subject&body=$body',
    );

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
          const SnackBar(
            content: Text('Unable to open your email app right now.'),
          ),
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
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Contact Form'),
        ),
        centerTitle: true,
        actions: [const SettingsButton()],
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
                  //adds an informational message telling user that their message will open in an email client
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.open_in_new_rounded,
                          size: accessibleIconSize(context, 20),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            'Note: Submitting a form opens your default email app with a draft of this message.',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Your name',
                      prefixIcon: Icon(
                        Icons.person_outline,
                        size: accessibleIconSize(context, 24),
                      ),
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
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: accessibleIconSize(context, 24),
                      ),
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
                      prefixIcon: Icon(
                        Icons.message_outlined,
                        size: accessibleIconSize(context, 24),
                      ),
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
                        : (_isSubmitting ? 'Opening email…' : 'Open Email App'),
                    icon: Icons.send_rounded,
                    onPressed:
                        _messagesSentThisSession >= _maxMessagesPerSession
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
