# "Truth or Dare" Application

"Truth or Dare" is a mobile application developed with Flutter, allowing users to play the famous game in just three clicks.

The goal was to create a fast, intuitive, and visually appealing application by incorporating the glassmorphism style into the user interface for a modern and elegant aesthetic.


# Design and UX/UI

This application has two main objectives:

    Implement a glassmorphism user interface using Flutter.
    Develop a mobile application connected to a web API.

The design follows the principles of glassmorphism, a UI style that gained popularity since 2021. This style emphasizes transparency, creating a glass effect with a blurred background, vivid colors, floating elements, and sharp, clean outlines.

The aim is to create a visual hierarchy through the depth of the interface. The user can easily organize and select information based on its level of transparency.

The use of vibrant colors and transparency gives the interface a modern and innovative look.

The idea behind this application is to modernize the classic game "Truth or Dare" with a contemporary design.

The target audience includes mostly evening gatherings (student or otherwise), with a quick and intuitive selection system, inspired by drinking games for a smooth and fun experience.


# Usage

Simply open the app and choose between two game categories:

    Classic
    Spicy

The idea is to offer two distinct atmospheres: a "mild" and friendly version for fun moments and a "spicy" version for more adult and daring evenings.


# Project architecture


## Backend

You can refer to the "Truth or Dare API" repository for the backend code.

This minimalist backend, developed with the Laravel framework, ensures communication between a MySQL database composed of four tables and the Flutter application by providing API routes.
Database Structure

The Laravel application manages four independent tables:

    Classic Action
    Classic Truth
    Spicy Action
    Spicy Truth

Each table contains an identifier (ID) and a description (which will be displayed in the app).

At this stage, no relationships between the tables are necessary. Each table operates autonomously. However, in the future, it could be possible to add complexity to the database by adding features like player profiles to track the number of actions and truths completed.

The backend remains simple but efficient, without needing additional complexity at this stage of development.


## Flutter Application (Frontend)

In our architecture, the Flutter application is responsible for displaying the actions and truths retrieved from the 4 API routes of the backend. This architecture was chosen to compartmentalize dependencies between projects, making the overall system more maintainable. It also provides the flexibility to modify or replace the backend without affecting the Flutter application. From a security standpoint, this separation ensures data protection and reinforces the security of each project component.

The Flutter application itself consists of three main pages: Home, Classic, and Spicy. Each page includes components dedicated to the glassmorphic backgrounds and API calls to retrieve and display data.

Once again, the project remains simple, as it fulfills specific and concise requirements.

The entire project took 5 days to develop, including:

    1 day for UI/UX design,
    30 minutes for the backend creation with Laravel,
    The rest of the week for the Flutter frontend integration.

# How It Works

Every time the user clicks one of the game selection buttons (either Classic or Spicy mode), the app makes an API call to the appropriate backend route. These routes return all available data from the corresponding tables (actions or truths).

Once the data is retrieved, the Flutter application uses a random selection mechanism to display a specific action or truth on the screen. This process repeats with each new user selection, ensuring a varied game experience.

Here's a breakdown of the steps:

    Category Selection: 
    The user selects one of the two game modes, Classic or Spicy.

    API Call: 
    A GET request is sent to the appropriate API route, which returns all the actions or truths associated with the selected category.

    Random Selection: 
    Once the data is retrieved, a random selection algorithm in Flutter chooses a specific action or truth.

    Displaying Data: 
    The Flutter widget is updated to display the selected action or truth to the user.

    New Interaction: 
    Each subsequent click randomly selects another action or truth from the same category.


This system ensures that the user gets different content each time without making multiple API calls, reducing latency and improving the user experience.

# Security

The project is still in the refinement phase, especially regarding security. Currently, the API routes are secured in a basic way, and future improvements are planned to enhance data protection and communication between the app and the backend.

It’s important to note that, for now, the API routes used are GET routes only, which minimizes the risk of direct attacks on the database. No sensitive data is being sent or modified through these routes. However, adding authentication, stricter access controls, and protection against malicious requests will be considered in the next development stages to ensure optimal security.

In summary, while the current risks are low, improvements are on the way to guarantee more robust long-term security.
