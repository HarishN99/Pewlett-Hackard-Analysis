-- DELIVERABLE 1
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table and retrieve the title, from_date, and to_date columns from the Titles table.

SELECT e.emp_no, e.first_name, e.last_name,
        ti.title, ti.from_date, ti.to_date


-- Create a new table using the INTO clause.

INTO retirement_titles

-- Join both tables on the primary key.

FROM employees as e
JOIN titles as ti
ON (e.emp_no = ti.emp_no)

-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.

WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

SELECT * FROM retirement_titles

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.

    -- Use Dictinct with Orderby to remove duplicate rows
    -- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
    -- These columns will be in the new table that will hold the most recent title of each employee.
    -- Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.

SELECT DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title

-- Create a Unique Titles table using the INTO clause.
INTO unique_titles

FROM retirement_titles

-- Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
WHERE (to_date = '9999-01-01')

-- Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
ORDER BY emp_no ASC, to_date DESC;

-- Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
SELECT * FROM unique_titles

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.

-- First, retrieve the number of titles from the Unique Titles table.
SELECT count(title) "count", title

-- Then, create a Retiring Titles table to hold the required information.
INTO retiring_titles
FROM unique_titles

-- Group the table by title, then sort the count column in descending order.
GROUP BY title
ORDER BY count DESC;

-- Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
SELECT * FROM retiring_titles



-- DELIVERABLE 2
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from Employees; rom_date and to_date columns from Department Employee; title column from the Titles.
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
                    de.from_date, de.to_date, ti.title

-- Create a new table using the INTO clause.
INTO mentorship_eligibilty

-- Join the Employees and the Department Employee tables on the primary key.
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)

-- Join the Employees and the Titles tables on the primary key.
JOIN titles as ti
ON (e.emp_no = ti.emp_no)

-- Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')

-- Order the table by the employee number.
ORDER BY e.emp_no;

-- Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
SELECT * FROM mentorship_eligibilty