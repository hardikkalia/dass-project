[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=13380437&assignment_repo_type=AssignmentRepo)
# Cart Genie

## Introduction

Cart Genie is a mobile application designed to streamline the shopping experience by allowing users to manage shopping carts and orders effortlessly. This guide will provide instructions for setting up and running the Cart Genie application.

## Prerequisites to run on emulator

Before you begin, ensure you have the following installed:

- Flutter (Version: 3.16.9)
- Dart (Version: 3.2.6)
- Node.js (Version: 21.7.2)
- npm (Version: 10.5.0)
- Twilio (Version: 5.0.3)

### Dependencies:

sms_advanced: ^1.0.1

sms_advanced:
  git:url: https://github.com/EddieKamau/sms_advanced.git
    
   ref: master

permission_handler: ^11.3.1

## Getting Started

### 1. Clone the Repository

Start by cloning the repository to your local machine. To do this, run the following command in your terminal:

git clone <https://github.com/<your_username.git/cart-genie.git>

cd code

cd cart-genie

### 2. Install Flutter Dependencies

- cd code/cart-genie
- flutter pub get

If there are outdated dependencies, upgrade them:
- flutter pub upgrade

### 3. Start the Backend Server

Navigate to the server directory and install the necessary Node.js packages, then start the server:\

- cd server
- npm install
- npm run dev

## Pre-requesites to run the apk
- Android 12+
- Download and install the apk from the code folder and you're ready to go

## Usage

Once the application is running, you can explore the application through the intuitive UI and use various features offered by Cart Genie. Enjoy adding items to your cart and managing orders!
