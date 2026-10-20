# RottenPotatoes (Hello Rails)

**Deployed Application:** [https://rottenpotatoes-dheeraj.onrender.com](https://rottenpotatoes-dheeraj.onrender.com)

---

## Features & Rubric Checklist

- [x] **Cloud Deployment (30 pts)**: Configured for Render / Heroku with PostgreSQL database (`Procfile`, `bin/render-build.sh`, `config/database.yml`).
- [x] **CRUD Operations (20 pts)**:
  - **Create (5 pts)**: Users can add new movies via `/movies/new`.
  - **Read (5 pts)**: Users can view movie details via `/movies/:id`.
  - **Update (5 pts)**: Users can edit movie information via `/movies/:id/edit`.
  - **Delete (5 pts)**: Users can delete movies with confirmation.
- [x] **Seeded Database & No Duplicates (10 pts)**:
  - Contains 10 movies in `db/seeds.rb` (initial 5 movies + 5 additional).
  - Uses `find_or_create_by!` to ensure re-seeding is idempotent with zero duplicates.
- [x] **Structured HTML Table (10 pts)**:
  - Uses semantic HTML5 table elements: `<table>`, `<thead>`, `<tbody>`, `<tfoot>`, `<th>`, `<tr>`, `<td>`.
  - Movie description is omitted from index table per assignment requirements.
- [x] **Column Sorting & Session Persistence (15 pts)**:
  - Sortable by `Title`, `Rating`, and `Release Date`.
  - Bidirectional sorting: toggles between ascending (`ASC`) and descending (`DESC`).
  - Session retention: remembers sort selection when navigating away and returning.
- [x] **Custom Hand-written CSS Styles (15 pts)**:
  - 100% hand-written CSS in `app/assets/stylesheets/application.css` (zero external libraries/frameworks).
  - Two distinct highlight colors for sort direction: warm amber for ascending, fresh teal for descending.
  - Screen-readable indicators: `▲` for ascending and `▼` for descending.
  - Custom styling across all views (`index`, `show`, `new`, `edit`).

---

## Local Development Setup

```bash
# 1. Install dependencies
bundle install

# 2. Setup database, run migrations, and seed initial data
rails db:create db:migrate db:seed

# 3. Start local development server
rails server
```

Visit [http://localhost:3000](http://localhost:3000) in your browser.
