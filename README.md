# Just Watch Database Design

**Project Overview**
This project is centered around designing and implementing a relational database for **JustWatch (https://www.justwatch.com/)**, a platform that aggregates streaming service content. The database captures detailed information about streaming services, movies, TV shows, sporting events, and users, as well as pricing and quality options for content hosted on different platforms. The goal is to build a well-structured, efficient database that can support complex queries related to content discovery, pricing, and quality analysis across various services.

**Key Features**
**Streaming Services:** Stores information about streaming platforms, including service names and their associated URLs.
**Content Information:** Tracks key details of movies, TV shows, and sporting events—such as titles, synopses, release dates, runtime, age ratings, and external ratings like IMDb.
**Pricing and Quality:** Provides detailed information on rental and purchase prices, along with available quality options (e.g., SD, HD, 4K) for each piece of content, tailored to each streaming platform.
**User Management:** Stores user data such as first and last names, email addresses, passwords, and countries of residence.
**Cast and Event Participants:** Keeps records of cast members in movies and TV shows, as well as participants in sporting events, and their roles.
**Language and Production Details:** Manages data on subtitle and audio languages for content, as well as the countries where movies, TV shows, and sporting events were produced.

**Database Structure**
The database is built with a series of interconnected tables to ensure data integrity and efficient query handling:

**streaming_service:** Manages streaming platform details.
**movies_price_quality, shows_price_quality, sporting_events_price_quality:** Track the price and quality options for content across different services.
**user**: Stores user profiles for JustWatch platform users.
**movie, show, sporting_event**: Contains details about movies, TV shows, and sporting events.
**cast_member**: Records cast members involved in movies and shows, along with their roles.
**language_subtitle & language_audio**: Capture subtitle and audio language options available for different content.
**country_produced**: Tracks the country where each piece of content was produced.

**Key Updates and Enhancements**
**Quality Attribute**: Updated to use an ENUM (**Free, SD, HD, 4K**) for price/quality tracking, ensuring future scalability as new quality formats emerge.
**Foreign Key Integrit**y: Fixed syntax issues with foreign key definitions, ensuring proper relationships between tables.
**Test Data**: Expanded test data entries to include more records for effective validation of the database.
**SQL Compliance**: Resolved issues with primary key and foreign key constraints to adhere to proper SQL syntax and ensure data integrity.

**How to Use**
This database is designed to be used by platforms like JustWatch to:

**Store and manage content**: Collect detailed information about movies, TV shows, and sporting events across various streaming platforms.
**Run complex queries**: Search for content based on quality, price, platform availability, and other parameters.
**Ensure data integrity:** The database design follows best practices in relational database design, using well-defined primary and foreign keys to ensure data consistency.

**Future Enhancements**
**Data Expansion:** Add more records to further test and refine the database.
**Query Optimization:** Continue optimizing for performance in handling large datasets and complex queries.
**Advanced Query Capabilities:** Develop more advanced queries for content discovery, user preferences, and analytics based on streaming service data.
