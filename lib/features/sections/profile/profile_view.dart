import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        _SectionTitle('Personal Profile'),
        Gap(16),
        SelectableText(
          "I graduated with a Bachelor's in ICT & Software Engineering at Fontys University of Applied Sciences. I am a quick learner, hardworking, flexible, friendly, and social. "
          'As a professional software developer with good communication skills, I am easy to work with. My skills allow me to work both individually and within a team. '
          'Additionally, I have an appetite for learning new technologies and programming languages since every technology has its specific use and place. '
          'Professional software engineers mustn’t only write quality code and have an in-depth understanding of a technology. '
          'A true professional is a person who coaches, provides assistance, and leads by example, not by demand. A good team leader helps team members to become leaders themselves.',
          style: TextStyle(fontSize: 16),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: _SectionTitle('Work Experience'),
        ),
        Timeline(
          title: 'Kaizen Gaming',
          time: 'March 2023 – Present',
          position: 'Backend software engineer working on microservices.',
          texts: [
            'Complex microservice architecture understanding',
            'Worked on creating microservice "adapters" (casino games integrations)',
            'Created an internal tool to streamline internal process',
            'Mentoring developers and teaching programming to future automation QAs',
            'Writing and maintaining quality code',
            'Understanding architectural needs based on microservice accomplishment goal',
            'Writing performant and scalable code',
            'Unit, Integration, Component & E2E testing',
          ],
          isFirst: true,
        ),
        Timeline(
          title: 'Appolica OOD',
          time: 'September 2021 – October 2023',
          position: 'Flutter team lead, Mobile software engineer & tech expert',
          texts: [
            'Worked on multiple Flutter projects and conducted interviews for Flutter developers',
            'Improved internal processes such as adapting the available native pipeline to accommodate a Flutter app',
            'Created Flutter template projects - standard and modular',
            'Team management, training, and leading company initiatives',
            'Providing technical expertise for Flutter projects and participating in sales phases',
          ],
        ),
        Timeline(
          title: 'Embedded Fitness B.V. – The Netherlands, Helmond',
          time: 'September 2021 – October 2023',
          position: 'FullStack software developer',
          texts: [
            'Learned Flutter & Dart, NodeJS with SocketIO, and ReactJS',
            'Applied MVVM architecture and software design patterns',
            'Project management, user testing, communication, and presenting skills',
          ],
        ),
        Timeline(
          title: 'Vanderlande B.V. – The Netherlands, Veghel',
          time: 'February 2020 – March 2020',
          position: 'Full-time software developer intern, R&D department',
          texts: [
            'Worked on WPF forms applications with MVVM software architecture',
            'Project management, communication, and presenting skills',
          ],
        ),
        Timeline(
          title: 'Author-e B.V. – The Netherlands, Eindhoven',
          time: 'February 2019 – June 2019',
          position: 'Full-time software developer intern',
          texts: [
            'Developed an internal code documenting system',
            'Worked with APIs, XMLs, and .NET Compiler',
            'Extended knowledge in design patterns and multi-threading',
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: _SectionTitle('Education'),
        ),
        Timeline(
          title:
              'Fontys University of Applied Sciences – The Netherlands, Eindhoven',
          time: 'August 2016 – July 2021',
          position:
              'Bachelor of Science, ICT & Software Development in English',
          texts: [
            'Mobile development: Finished Android and iOS specializations covering native development, UX/UI, and mobile lifecycle.',
            'Languages: C#, Java, Kotlin, Swift, C/C++, JS, HTML & CSS, PHP, SQL, PL*SQL',
            'Technologies: .NET Framework, WCF, WPF, Unity, Laravel, AngularJS, and more.',
          ],
          icon: Icons.school,
          isLast: true,
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class Timeline extends StatelessWidget {
  const Timeline({
    required this.title,
    required this.time,
    required this.position,
    required this.texts,
    this.icon = Icons.location_pin,
    this.isFirst = false,
    this.isLast = false,
    super.key,
  });

  final String title;
  final String time;
  final String position;
  final IconData icon;
  final List<String> texts;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final strBuilder = StringBuffer();
    for (final item in texts) {
      strBuilder.writeln('- $item');
    }
    final description = strBuilder.toString();

    return Stack(
      children: [
        const Positioned(
          width: 3,
          top: 0,
          left: 14.5,
          bottom: 0,
          child: ColoredBox(color: Colors.blue),
        ),
        Positioned(
          top: isFirst ? 0 : null,
          bottom: isLast ? 0 : null,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blue,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ),
        Row(
          children: [
            const Gap(48.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SelectableText(
                    time,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SelectableText(
                    position,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Gap(16),
                  SelectableText(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Gap(16),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
