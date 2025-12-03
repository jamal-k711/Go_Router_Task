import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/phrase_provider.dart';
import '../widgets/gradient_background.dart';
import '../widgets/large_icon_card.dart';
import '../widgets/rounded_card.dart';
import '../widgets/preview_box.dart';
import '../widgets/primary_button.dart';
import '../widgets/congratulations_dialog.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  void _showCongratulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const CongratulationsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PhraseProvider>(
      builder: (context, provider, child) {
        final hasData = provider.phrase.isNotEmpty;

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Screen B',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
          body: GradientBackground(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple,
              Colors.white,
            ],
            stops: const [0.0, 0.3],
            child: SafeArea(
              child: hasData ? _buildResultView(context, provider) : _buildEmptyView(context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LargeIconCard(
            icon: Icons.edit_note_rounded,
            size: 80,
            iconColor: Colors.deepPurple,
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(32),
          ),
          const SizedBox(height: 40),
          const Text(
            'No data yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Create your first phrase with hashtags',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            onPressed: () => context.go('/screen_c'),
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_rounded),
                SizedBox(width: 8),
                Text(
                  'Create Phrase',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultView(BuildContext context, PhraseProvider provider) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RoundedCard(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple.shade50,
                Colors.purple.shade50,
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.format_quote_rounded,
                      color: Colors.deepPurple,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Your Phrase',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                PreviewBox(
                  text: provider.phrase,
                  hashtagColor: Colors.blue,
                  fontSize: 16,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          RoundedCard(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade50,
                Colors.lightBlue.shade50,
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.tag_rounded,
                      color: Colors.blue.shade700,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Hashtags',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                PreviewBox(
                  text: provider.hashtagsText,
                  hashtagColor: Colors.blue,
                  fontSize: 16,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            onPressed: () => _showCongratulationsDialog(context),
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_rounded, size: 28),
                SizedBox(width: 12),
                Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
