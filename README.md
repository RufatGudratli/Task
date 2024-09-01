### Project Management Tool

### Overview

This project is a basic project management tool developed using Laravel 11, PHP 8.3, and MySQL. It allows users to create, update, delete, and manage projects and tasks. The focus of this application is on implementing core functionality with clean and maintainable code, demonstrating full-stack development skills within a limited timeframe.

### Features

- **Project Management**: Create, update, delete, and view projects.
- **Task Management**: Assign tasks to projects, update task status, and manage task assignments.
- **User Access Control**: Projects are accessible only to users who have been granted access.
- **Pre-configured Demo User**: Default user credentials are pre-filled on the login page, allowing easy access to the dashboard with one click.

### Prerequisites

- **PHP**: Version 8.1 or higher
- **Composer**: Dependency management tool for PHP
- **MySQL**: For database management


### Installation

Follow the steps below to set up the project on your local machine.


### Clone the Repository

Clone the repository from GitHub using the following command:
	git clone https://github.com/RufatGudratli/Task.git

CD to project folder


Install Composer Dependencies:
	composer install


Configure Environment Variables:
	Windows:
	copy .env.example .env

	Linux/macOS:
	cp .env.example .env


Generate the application key for your Laravel application:
	php artisan key:generate


Migrate the Database and Seed Data
	php artisan migrate --seed

Start the Development Server:
	php artisan serve



### Additional Information
SQL file are included in Repository.
Default users credentials are pre-written (just click to login button)