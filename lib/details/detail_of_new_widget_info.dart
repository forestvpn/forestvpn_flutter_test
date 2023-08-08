import 'package:flutter/material.dart';

class DetailOfNewWidgetInfo extends StatelessWidget {
  const DetailOfNewWidgetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TopHeaderWidget(),
        NewDescription(),
      ],
    );
  }
}

class TopHeaderWidget extends StatelessWidget {
  const TopHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Image(
          image: AssetImage('images/2stimage.png'),
          height: 495,
          width: 414,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.medium,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(48, 389, 96, 40),
          child: Text(
            'We are processing your request...',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.56,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class NewDescription extends StatelessWidget {
  const NewDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
              text: '''

    Please excuse the interruption.

    Due to Google's efforts to maintain a “safe ads
    ecosystem” for its advertisers, publishers and
    users from fraud and bad experiences, Google
    has placed restrictions on our ad serving that 
    limit our ability to provide free VPN services. 
        
    Regrettably, this is beyond our control.  

    To continue to enjoy ForestVPN without 
    interruptions, please upgrade to our Premium 
    version.''',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.32,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
