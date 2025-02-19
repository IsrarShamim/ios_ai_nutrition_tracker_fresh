import 'package:flutter/material.dart';

class MarkdownMessage extends StatelessWidget {
  final String message;
  final bool isSent;

  const MarkdownMessage({
    super.key,
    required this.message,
    required this.isSent,
  });

  Widget _buildMessageContent(String text) {
    final List<Widget> widgets = [];
    final lines = text.split('\n');
    int bulletLevel = 0;
    int numberLevel = 0;
    int numberCounter = 1;

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];

      // Check for headings
      final headingMatch = RegExp(r'^(#{1,6})\s(.+)$').firstMatch(line);
      if (headingMatch != null) {
        final level = headingMatch.group(1)!.length;

        // Add extra spacing before headings
        if (i > 0) {
          widgets.add(SizedBox(height: 16 + (6 - level) * 2.0));
        }

        widgets.add(
          Text(
            headingMatch.group(2)!,
            style: TextStyle(
              color: isSent ? Colors.white : Colors.black87,
              fontSize: 26 - (level * 2),
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              height: 1.3,
            ),
          ),
        );

        // Add spacing after headings
        widgets.add(SizedBox(height: 8 + (6 - level) * 1.0));
        continue;
      }

      // Check for blockquotes
      if (line.trim().startsWith('> ')) {
        widgets.add(
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: isSent ? Colors.white70 : Colors.grey.shade400,
                  width: 4,
                ),
              ),
              color: isSent ? Colors.white.withOpacity(0.05) : Colors.grey.withOpacity(0.05),
            ),
            child: RichText(
              text: TextSpan(
                children: _processInlineFormatting(line.substring(2)),
              ),
            ),
          ),
        );
        continue;
      }

      // Check for numbered lists
      final numberedMatch = RegExp(r'^(\s*)\d+\.\s*(.+)$').firstMatch(line);
      if (numberedMatch != null) {
        final indent = numberedMatch.group(1)?.length ?? 0;
        numberLevel = (indent / 2).floor();

        widgets.add(
          Padding(
            padding: EdgeInsets.only(
              left: 20.0 + (numberLevel * 20),
              top: 4,
              bottom: 4,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  child: Text(
                    '$numberCounter.',
                    style: TextStyle(
                      color: isSent ? Colors.white : Colors.black87,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: _processInlineFormatting(numberedMatch.group(2)!.trimLeft()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        numberCounter++;
        continue;
      }

      // Check for bullet points with nesting
      final bulletMatch = RegExp(r'^(\s*)[*\-+](?![*\-+])\s+(.+)$').firstMatch(line);
      if (bulletMatch != null) {
        final indent = bulletMatch.group(1)?.length ?? 0;
        bulletLevel = (indent / 2).floor();

        widgets.add(
          Padding(
            padding: EdgeInsets.only(
              left: 20.0 + (bulletLevel * 20),
              top: 4,
              bottom: 4,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '•',
                  style: TextStyle(
                    color: isSent ? Colors.white : Colors.black87,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: _processInlineFormatting(bulletMatch.group(2)!.trimLeft()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        continue;
      }

      // Check for code blocks
      if (line.trim().startsWith('```')) {
        int endIndex = i;
        List<String> codeLines = [];

        // Find the ending ```
        for (int j = i + 1; j < lines.length; j++) {
          if (lines[j].trim() == '```') {
            endIndex = j;
            break;
          }
          codeLines.add(lines[j]);
        }

        if (codeLines.isNotEmpty) {
          widgets.add(
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSent ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSent ? Colors.white.withOpacity(0.1) : Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Text(
                codeLines.join('\n'),
                style: TextStyle(
                  fontFamily: 'monospace',
                  color: isSent ? Colors.white.withOpacity(0.9) : Colors.black87,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          );

          i = endIndex;
          continue;
        }
      }

      // Regular text
      if (line.isNotEmpty) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: RichText(
              text: TextSpan(
                children: _processInlineFormatting(line),
              ),
            ),
          ),
        );
      } else if (i < lines.length - 1 && lines[i + 1].isNotEmpty) {
        // Add paragraph spacing only if next line is not empty
        widgets.add(const SizedBox(height: 8));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  TextStyle _getBaseStyle() {
    return TextStyle(
      color: isSent ? Colors.white : Colors.black87,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.1,
    );
  }

  List<InlineSpan> _processInlineFormatting(String text) {
    final List<InlineSpan> spans = [];
    String remainingText = text;
    final baseStyle = _getBaseStyle();

    while (remainingText.isNotEmpty) {
      final boldItalicMatch = RegExp(r'\*\*\*(.*?)\*\*\*|___(.+?)___').firstMatch(remainingText);
      final boldMatch = RegExp(r'\*\*((?!\*\*\*).+?)\*\*|__(.+?)__').firstMatch(remainingText);
      final italicMatch = RegExp(r'\*([^*].*?)\*|_([^_].*?)_').firstMatch(remainingText);
      final strikeMatch = RegExp(r'~~(.*?)~~').firstMatch(remainingText);
      final codeMatch = RegExp(r'`(.*?)`').firstMatch(remainingText);

      final matches = [
        if (boldItalicMatch != null) (boldItalicMatch, 'bolditalic'),
        if (boldMatch != null) (boldMatch, 'bold'),
        if (italicMatch != null) (italicMatch, 'italic'),
        if (strikeMatch != null) (strikeMatch, 'strike'),
        if (codeMatch != null) (codeMatch, 'code'),
      ];

      if (matches.isEmpty) {
        spans.add(TextSpan(
          text: remainingText,
          style: baseStyle,
        ));
        break;
      }

      matches.sort((a, b) => a.$1.start.compareTo(b.$1.start));
      final firstMatch = matches.first;
      final match = firstMatch.$1;
      final type = firstMatch.$2;

      if (match.start > 0) {
        spans.add(TextSpan(
          text: remainingText.substring(0, match.start),
          style: baseStyle,
        ));
      }

      final matchedText = match.group(1) ?? match.group(2);
      late TextStyle style;

      switch (type) {
        case 'bolditalic':
          style = baseStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          );
          break;
        case 'bold':
          style = baseStyle.copyWith(
            fontWeight: FontWeight.bold,
          );
          break;
        case 'italic':
          style = baseStyle.copyWith(
            fontStyle: FontStyle.italic,
          );
          break;
        case 'strike':
          style = baseStyle.copyWith(
            decoration: TextDecoration.lineThrough,
          );
          break;
        case 'code':
          style = TextStyle(
            fontFamily: 'monospace',
            backgroundColor: isSent ? Colors.white24 : Colors.black.withOpacity(0.05),
            color: isSent ? Colors.white : Colors.black87,
            fontSize: 14,
            height: 1.5,
            letterSpacing: 0,
          );
          break;
        default:
          style = baseStyle;
      }

      spans.add(TextSpan(
        text: matchedText,
        style: style,
      ));

      remainingText = remainingText.substring(match.end);
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return _buildMessageContent(message);
  }
}
