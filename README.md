# RottenPotatoes (Hello Rails)

**Live Deployed Application:** [https://rottenpotatoes-dheeraj.onrender.com](https://rottenpotatoes-dheeraj.onrender.com)

---

## About the Application

**RottenPotatoes** is a movie catalog web application built with **Ruby on Rails 8**. It allows users to browse an organized collection of films, view detailed information about each title, add new movies, update existing entries, and remove titles with confirmation safeguards. The application is deployed in the cloud on **Render** using a managed **PostgreSQL** database.

---

## Key Features & Functionality

- **Full RESTful CRUD Operations**:
  - **Create**: Add new movies with custom title, MPAA rating, release date, and description.
  - **Read**: View a dedicated details page for any movie with formatted metadata badges and summary.
  - **Update**: Edit existing movie information through pre-populated forms.
  - **Delete**: Safely delete movie records with a browser confirmation prompt.
- **Structured Movie Table**:
  - Clean HTML5 semantic table structure (`<table>`, `<thead>`, `<tbody>`, `<tfoot>`, `<th>`, `<tr>`, `<td>`).
  - Summarizes movie count and current sorting status in the table footer.
- **Bidirectional Column Sorting**:
  - Interactive table headers allow sorting by **Movie Title**, **Rating**, and **Release Date**.
  - Clicking a header toggles between **Ascending (ASC)** and **Descending (DESC)** order.
  - Sorting is performed efficiently at the database level using ActiveRecord queries.
- **Session-Based Sort Persistence**:
  - The application remembers your chosen sort column and direction.
  - If you navigate away (e.g., to create or edit a movie) and return to the main list, your sorting preferences are automatically preserved.
- **Custom Hand-Written CSS**:
  - 100% custom, hand-crafted CSS without relying on external libraries or frameworks (no Bootstrap, Tailwind, etc.).
  - **Dual-Color Sort Indicators**:
    - **Ascending (`▲`)**: Highlighted with a warm amber tone.
    - **Descending (`▼`)**: Highlighted with a fresh teal tone.
  - Accessible, screen-readable direction symbols accompanying the visual highlight.
  - Cohesive card layouts, form fields, action buttons, and responsive flash notices across all views.
- **Idempotent Database Seeding**:
  - Pre-populated with 10 movies.
  - Uses `find_or_create_by!` to ensure re-running seed tasks never creates duplicate records.

---

## User Guide: How to Use the Application

### 1. Browsing & Sorting Movies
- **View All Movies**: Navigate to the home page or click **"RottenPotatoes!"** in the navigation header to see the movie catalog.
- **Sort by Title**: Click the **"Movie Title"** column header. Click once to sort A-to-Z (`▲`). Click again to sort Z-to-A (`▼`).
- **Sort by Rating or Release Date**: Click **"Rating"** or **"Release Date"** to sort by those criteria. Notice the column highlights and the direction arrow updates.

### 2. Viewing Movie Details
- In the movie table, click on the **"More about [Movie Title]"** link in the rightmost column.
- This opens the movie's detail page, showing its rating badge, release date, full synopsis, and quick action buttons.

### 3. Adding a New Movie
- Click the **"Add new movie"** button beneath the movie table.
- Fill out the form:
  - **Title**: Enter the name of the movie (required).
  - **Rating**: Select a rating from the dropdown (`G`, `PG`, `PG-13`, `R`, `NC-17`).
  - **Released On**: Use the date picker to set the official release date.
  - **Description**: Add a synopsis or summary.
- Click **"Create Movie"** to save. You will be redirected to the movie's page with a green confirmation notice.

### 4. Editing an Existing Movie
- From any movie's detail page, click the **"Edit info"** button.
- Make the desired changes in the form and click **"Update Movie"**.
- Click **"Cancel"** at any time to return to the movie list without saving changes.

### 5. Deleting a Movie
- From the movie detail page, click the red **"Delete movie"** button.
- Confirm the popup prompt (`"Are you sure you want to delete [Movie]?"`).
- The movie will be permanently removed from the database, and you will be returned to the movie list with a confirmation notice.

---

## Local Development Setup

Follow these step-by-step instructions to run the application locally on your machine.

### Prerequisites
Make sure you have the following installed:
- **Ruby** (v3.2+ recommended; project uses v3.4.10)
- **Ruby on Rails** (v8.0+; project uses v8.1.4)
- **Bundler** (`gem install bundler`)
- **SQLite3**

Verify your versions:
```bash
ruby -v
rails -v
bundle -v
sqlite3 --version
```

### 1. Clone the Repository
```bash
git clone https://github.com/Dheeraj-Sai/hw-hello-rails.git
cd hw-hello-rails
```

### 2. Install Dependencies
Install all required gems specified in the `Gemfile`:
```bash
bundle install
```

### 3. Setup the Database & Seed Data
Create the local SQLite database, execute the database migration to build the `movies` schema, and seed the initial movies:
```bash
# Create local database
bin/rails db:create

# Run migration to create the movies table
bin/rails db:migrate

# Populate initial seed data (10 movies)
bin/rails db:seed
```

*(Tip: You can verify that re-running `bin/rails db:seed` is idempotent and will not create duplicate entries).*

### 4. Start the Rails Server
Launch the local Puma development server:
```bash
bin/rails server
```
*(Or simply `rails s`)*.

### 5. Access the Application
Open your web browser and go to:
👉 **[http://localhost:3000](http://localhost:3000)**

You will be automatically redirected to `http://localhost:3000/movies`.

### 6. Stopping the Server
To stop the server, switch to your terminal window and press `Ctrl + C`.

---

## Tech Stack

- **Framework**: Ruby on Rails 8.1.4
- **Language**: Ruby 3.4.10
- **Database (Development & Test)**: SQLite3
- **Database (Production)**: PostgreSQL
- **Asset Pipeline**: Propshaft
- **Web Server**: Puma
- **Hosting Platform**: Render
