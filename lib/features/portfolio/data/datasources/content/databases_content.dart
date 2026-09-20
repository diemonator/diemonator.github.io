import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/navigation/app_routes.dart';
import '../../../domain/models/portfolio_project.dart';

const MapEntry<AppRoutes, List<PortfolioProject>> databasesContent = MapEntry(
  AppRoutes.databases,
  [
    PortfolioProject(
      svgLanguage: AppAssets.sql,
      svgImage: AppAssets.db,
      title: 'Oracle SQL',
      description: '''
      A robust and widely used relational database system, Oracle SQL is essential for managing structured data efficiently. I have hands-on experience designing, optimizing, and querying large-scale databases.  

      🔹 Strong experience in writing efficient SQL queries for complex data retrieval.  
      🔹 Expertise in optimizing queries, indexing strategies, and performance tuning.  
      🔹 Deep understanding of relational data modeling and schema normalization.  
      🔹 Hands-on experience with database transactions, concurrency control, and ACID compliance.  
      🔹 Worked on real-world applications involving large-scale enterprise databases.  
      ''',
    ),
    PortfolioProject(
      svgLanguage: AppAssets.sql,
      svgImage: AppAssets.db,
      title: 'Oracle PL/SQL',
      description: '''
      PL/SQL enhances SQL with procedural capabilities, making it a powerful tool for complex business logic. I have extensive experience writing high-performance PL/SQL code for enterprise applications.  

      🔹 Skilled in writing stored procedures, functions, triggers, and packages for business logic execution.  
      🔹 Experience in handling bulk data operations using collections and bulk processing techniques.  
      🔹 Strong grasp of exception handling, cursors, and dynamic SQL for flexible query execution.  
      🔹 Developed complex PL/SQL applications involving data migration, transformation, and reporting.  
      🔹 Expertise in fine-tuning PL/SQL code for optimal performance and maintainability.  
      ''',
    ),
    PortfolioProject(
      svgLanguage: AppAssets.sql,
      svgImage: AppAssets.db,
      title: 'MSSQL',
      description: '''
      Microsoft SQL Server is a powerful database system used in enterprise applications. I have worked extensively with T-SQL, stored procedures, and database optimization techniques.  

      🔹 Proficient in writing complex T-SQL queries, stored procedures, views, and functions.  
      🔹 Experience in database administration, performance tuning, and query optimization.  
      🔹 Hands-on experience with SQL Server Management Studio (SSMS) for monitoring and debugging.  
      🔹 Implemented database security measures such as roles, permissions, and encryption.  
      🔹 Worked with large datasets and optimized indexing strategies for high-performance applications.  
      ''',
    ),
    PortfolioProject(
      svgLanguage: AppAssets.dbDoc,
      svgImage: AppAssets.dbDoc,
      title: 'Firebase Realtime Database',
      description: '''
      A cloud-hosted NoSQL database that syncs data in real-time, making it ideal for dynamic applications. I have successfully integrated Firebase into multiple Flutter projects.  

      🔹 Extensive experience in integrating Firebase Realtime Database with Flutter applications.  
      🔹 Expertise in real-time data syncing for dynamic, responsive user interfaces.  
      🔹 Designed efficient NoSQL data structures for optimal performance and scalability.  
      🔹 Implemented authentication, role-based access control, and security rules in Firebase.  
      🔹 Developed cloud-based apps with offline persistence and automatic sync capabilities.  
      ''',
      gitHubLink: 'https://',
    ),
    PortfolioProject(
      svgLanguage: AppAssets.dbDoc,
      svgImage: AppAssets.dbDoc,
      title: 'MongoDB',
      description: '''
      A leading NoSQL database known for its flexibility and scalability. I have used MongoDB to build modern applications with dynamic schemas and high-performance queries.  

      🔹 Strong experience in working with NoSQL databases, especially document-based storage.  
      🔹 Designed and implemented scalable data models for high-performance applications.  
      🔹 Expertise in using MongoDB aggregation framework for advanced analytics and reporting.  
      🔹 Worked with MongoDB Atlas for cloud-based deployment, indexing, and monitoring.  
      🔹 Developed RESTful APIs backed by MongoDB with Mongoose ORM for Node.js applications.  
      ''',
      gitHubLink: '',
    ),
  ],
);
