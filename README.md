# Team Directory Application

A Team Directory application built with **ColdFusion (CFC API)** as the backend and **React** as the frontend. This project demonstrates fetching employee data from a database via a RESTful API, displaying it in a clean UI, and searching by employee name.

---

## Features

* Fetch all employees from the database
* Search employees by first or last name
* Responsive design using plain CSS
* Secure backend with parameterized queries
* CORS enabled for frontend–backend communication

---

## How to Run Locally

### 1️⃣ Database

1. Create a new database using your preferred DBMS
2. Run the SQL script `db.sql` in the created database

---

### 2️⃣ Backend (ColdFusion)

1. Copy `EmployeeService.cfc` to your ColdFusion server directory
   (e.g. `C:/ColdFusion2025/cfusion/wwwroot/api/`).
   Create the `api` folder if it does not already exist.
2. Create a ColdFusion datasource named **team** and connect it to the created database
3. Start the ColdFusion server

---

### 3️⃣ Frontend (React)

1. Open a terminal and navigate to the project directory:

   ```
   /team-directory
   ```
2. Install dependencies:

   ```
   npm install
   ```
3. Start the development server:

   ```
   npm run dev
   ```
