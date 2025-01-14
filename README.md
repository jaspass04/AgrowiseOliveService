# AgroWise: Weather and Watering Tracker  
JSP-based weather and watering demo tracker for the five major olive-producing regions in Greece. Designed for Tomcat server deployment, the app helps farmers track monthly watering goals and analyze weather data for optimized olive cultivation.

## About the Project  
AgroWise is a tailored application for olive farmers operating in Greece's six largest olive-producing regions: Heraklion, Chania, Kalamata, Sparti, Pthiotis.  

Built using Java Server Pages (JSP) and designed for deployment on a Tomcat university server, this application combines real-time weather data with personalized irrigation tracking to optimize water usage and support sustainable agriculture.  

## Features  
- **Regional Weather Integration**: Tracks and synchronizes weather data for the five key olive-producing areas in Greece.  
- **Monthly Watering Goals**: Monitors user-defined watering schedules and adjusts targets based on local weather conditions.  
- **Personalized Recommendations**: Provides actionable insights for optimal irrigation planning.  
- **User-Friendly Interface**: Intuitive JSP frontend for seamless interaction.  

## Technology Stack  
- **Backend**: JSP, Java 8  
- **Frontend**: JSP with HTML, CSS, and JavaScript  
- **Database**: MySQL  
- **Server**: Apache Tomcat  

## Prerequisites  
Ensure the following tools are installed before deploying the application:  
- **Java Development Kit (JDK 8+)**  
- **Apache Tomcat Server (9.0 or higher)**  
- **MySQL Server**  

## Installation  

1. Clone the repository:  
   
   git clone https://github.com/yourusername/AgroWise-OliveSmart-JSP.git
   cd AgroWise-OliveSmart-JSP
   
## 2. Connect to Your Database

The application requires a MySQL database. Follow these steps to configure your database connection:

### Step 1: Create a MySQL Database
1. Log in to your MySQL server:
   ```bash
   mysql -u root -p
   CREATE DATABASE ismgroup21;
### Step 2: Set Up Environment Variables
Define the following environment variables on your system:

- **DB_SERVER**: Database server address (e.g., `195.251.249.131`).
- **DB_SERVER_PORT**: Database server port (e.g., `3306`).
- **DB_NAME**: Name of your database (e.g., `ismgroup21`).
- **DB_USERNAME**: Your database username.
- **DB_PASSWORD**: Your database password.
- **OPEN_WEATHER_API_KEY**: Your API key for weather data fetching.
### On Linux/MacOS
- Use the following commands to set up the environment variables:
   ```bash
   export DB_SERVER=server_ip_adderss
   export DB_SERVER_PORT=3306
   export DB_NAME=your_db_name
   export DB_USERNAME=your_username
   export DB_PASSWORD=your_password
   export OPEN_WEATHER_API_KEY=your_api_key
   
### On Windows Command Prompt
- Use the following commands to set up the environment variables:
   ```bash
  set DB_SERVER=server_ip_adderss
  set DB_SERVER_PORT=3306
  set DB_NAME=your_db_name
  set DB_USERNAME=your_username
  set DB_PASSWORD=your_password
  set OPEN_WEATHER_API_KEY=your_api_key 

### Step 3: Verify Database Connection
- Test the connection by running the application on your Tomcat server.
- Ensure the database schema and tables match the application's requirements.

### Step 4: Deploy on Tomcat
1. Build the project and package it into a WAR file.
2. Deploy the WAR file to your Tomcat server's `webapps` directory.
3. Start Tomcat and access the application at:
   ```bash
   http://<your-server-ip>:<port>/agrowise

### Additional Notes
- **Environment Variables**: Use tools like `.env` files for local development (e.g., `dotenv-java`).
- **Database Scripts**: Include database schema and data population scripts in the `/db` folder if applicable.

### Limitations
This project is developed as part of a university course and is expected to have certain limitations:

- **Business Logic**: The decision-making logic for irrigation recommendations is simplified for the purpose of this demo and may not account for all variables affecting olive cultivation. For practical implementation, further refinements would be needed to optimize the irrigation logic based on local agricultural practices and advanced weather patterns.

- **Frontend Aesthetics**: The design of the user interface is functional but minimalistic. It's not intended to be a polished, production-ready design, but rather a demonstration of the core functionality of the application.

- **Limited Region Coverage**: The application currently only supports the five main olive-producing regions in Greece. Expanding this to cover other agricultural areas would require additional development.

- **Weather Data Accuracy**: The system relies on external weather data from the OpenWeather API. While this data is generally reliable, it may not always be fully accurate for localized or micro-climate conditions that may affect olive cultivation.
  
### 🎉 Final Step: You're Ready to Go!
Grab a cup of coffee, start your Tomcat server, and enjoy using AgroWise! 🚀
