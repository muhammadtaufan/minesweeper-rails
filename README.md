# Minesweeper Board Generator

This application is a simple Minesweeper board generator built with Ruby on Rails 7.0.6, Ruby 3.0.0, PostgreSQL as the database, and Tailwind CSS for styling.

# About

This application allows users to generate simple Minesweeper boards. Users can specify the board's dimensions and the number of mines. The application will then generate a board with the specified parameters and display it to the user.

## Prerequisites

- Ruby 3.0.0
- Rails 7.0.6
- PostgreSQL
- Yarn

## Setup

1. Clone the repository:

```bash
git clone https://gitlab.com/mtaufan.dev/minesweeper-rails.git
```

2. Navigate into the directory:

```bash
cd minesweeper
```

3. Install the dependencies:

```bash
bundle install
yarn install
```

4. Migration

```bash
rails db:create
rails db:migrate
```

## Running the Application

To run the application, use the following command:

```bash
./bin/dev
```
