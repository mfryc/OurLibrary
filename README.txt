OUR LIBRARY VER. 0.0.4 (SPRING BOOT, SPRING SECURITY, MySQL AND THYMELEAF)
==========================================================================

Application for managing of books in the library.

DISPLAY CONTENT BASED ON USER ROLE
==================================

In the application, you can display content based on user role.

- User role: users in this role will only be allowed to list books.
- Librarian role: users in this role will be allowed to list, add and update books.
- Admin role: users in this role will be allowed to list, add, update and delete books.

TEST THE APPLICATION
====================

0. Run the our_library.sql script in MySQL Workbench before running the application.

1. Run the Spring Boot application: OurLibraryApplication.java

2. Open a web browser for the app: http://localhost:8080

3. Log in using one of the accounts

+-----------+-----------+---------------------------+
|   login   | password  |           roles           |
+-----------+-----------+---------------------------+
| user      | user      | ROLE_USER                 |
| librarian | librarian | ROLE_USER, ROLE_LIBRARIAN |
| admin     | admin     | ROLE_USER, ROLE_ADMIN     |
+-----------+-----------+---------------------------+

4. You can also create your own account with ROLE_USER privileges!