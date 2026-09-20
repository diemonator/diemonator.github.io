import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/navigation/app_routes.dart';
import '../../../domain/models/portfolio_project.dart';

const MapEntry<AppRoutes, List<PortfolioProject>> backendContent = MapEntry(
  AppRoutes.backend,
  [
    PortfolioProject(
      title: 'C# ASP.NET Microservices & Software Development',
      svgLanguage: AppAssets.cSharp,
      svgImage: AppAssets.cSharp,
      description: '''
Experienced in C# ASP.NET development with a focus on complex microservice architectures. Specialized in casino game integrations, internal tool development, and mentoring developers while ensuring high-quality, scalable code.

Key Skills & Contributions:
🔹 Developed microservice adapters for casino game integrations using C# ASP.NET.
🔹 Built an internal tool to optimize workflows and streamline processes.
🔹 Provided mentorship and programming guidance to developers & future automation QAs.
🔹 Ensured performance, scalability, and maintainability of microservices.
🔹 Conducted Unit, Integration, Component, and E2E testing for software reliability.
🔹 Designed solutions aligned with architectural goals for scalable microservices.
🔹 A strong background in C# ASP.NET microservices, performance optimization, and developer mentorship! 🚀''',
    ),
    PortfolioProject(
      svgLanguage: AppAssets.java,
      svgImage: AppAssets.java,
      title: 'LoanBroker – Java-Based Loan Aggregator',
      description: '''
LoanBroker is a Java-based system that acts as an intermediary between customers and multiple banks, helping users find the best loan offers. It utilizes RESTful communication and asynchronous messaging for efficient loan processing.

🔹 Features:
Asynchronous Messaging – Uses ActiveMQ to handle loan requests efficiently.
Microservices-Like Structure – Separates components for better scalability.
Credit Score & Loan Matching – Determines the best loan offers based on customer credit scores.
Multi-Bank Communication – Fetches loan options via RESTful APIs.

🔹 Technology Stack:
Java for core application logic.
ActiveMQ (JMS) for message queuing.
REST APIs for bank communication.

A robust and scalable loan aggregation system using REST and JMS-based messaging! 💰🏦
''',
    ),
    PortfolioProject(
      svgLanguage: AppAssets.java,
      svgImage: AppAssets.java,
      title: 'HealthBroker – Java-Based Health Insurance Aggregator',
      description: '''
HealthBroker is a Java-based system designed to connect users with multiple health insurance providers, helping them find the best policies based on their needs. It leverages RESTful communication and asynchronous messaging for seamless policy matching.

🔹 Features:
Asynchronous Messaging – Uses ActiveMQ for efficient request handling.
Policy Comparison – Matches users with the best health insurance plans.
Microservices-Like Structure – Ensures scalability and modularity.
Multi-Provider Integration – Fetches insurance policies via RESTful APIs.

🔹 Technology Stack:
Java for core application logic.
ActiveMQ (JMS) for message queuing.
REST APIs for provider communication.

A powerful and efficient health insurance brokerage system using REST and JMS-based messaging! 🏥🩺
''',
    ),
    PortfolioProject(
      svgLanguage: AppAssets.cSharp,
      svgImage: AppAssets.cSharp,
      title: 'CSA Course – WCF-Based C# Applications',
      description: '''
Projects that demonstrate the use of Windows Communication Foundation (WCF) for building service-oriented applications.

🔹 Projects Included:
FastFoodService: Simulates a fast-food ordering system using WCF services.
LanguageSchool: Manages language school operations with WCF-based services.

🔹 Key Features:
Service-Oriented Architecture – Emphasizes building applications as a collection of services.
WCF Implementation – Demonstrates various aspects of WCF, including service contracts, data contracts, and hosting.

🔹 Technology Stack:
C# for application development.
Windows Communication Foundation (WCF) for building and deploying services.

A valuable resource for understanding and implementing WCF services in C#! 🚀
''',
    ),
    PortfolioProject(
      title: 'SmartMove – Node.js Backend for Efficient Property Management',
      svgLanguage: AppAssets.node,
      svgImage: AppAssets.node,
      description: '''
The SmartMove app leverages a Node.js backend to handle property management tasks. The system allows users to find, track, and manage properties efficiently.

🔹 Key Features:
Real-time Data Processing – Uses Node.js for fast, efficient backend processing.
Property Tracking – Manages property listings, user interactions, and transactions seamlessly.

🔹 Technology Stack:
Node.js for backend development.
A dynamic backend for smooth property management and user experience! 🏠💻''',
    ),
  ],
);
