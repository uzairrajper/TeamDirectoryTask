component {

    /**
     * Get all employees or search by name
     * Usage: /api/EmployeeService.cfc?method=getEmployees
     *        /api/EmployeeService.cfc?method=getEmployees&search=John
     */
    remote any function getEmployees() httpmethod="GET" returnformat="json" {

        // Allow React/JS to fetch from this server (CORS)
        cfheader(name="Access-Control-Allow-Origin", value="*");
        cfheader(name="Content-Type", value="application/json; charset=utf-8");

        // Check if search parameter exists safely
        var search = "";
        if (structKeyExists(URL, "search")) {
            search = trim(URL.search);
        }

        // Base SQL
        var sql = "SELECT id, firstName, lastName, role FROM employees";
        var params = {};

        // Add search filter if search term is provided
       if (len(search)) {
            sql &= " WHERE LOWER(firstName) LIKE :search OR LOWER(lastName) LIKE :search";
            params = { search = "%" & lcase(search) & "%" };
        }
        // Execute query securely with parameters
        var qEmployees = queryExecute(
            sql,
            params,
            { datasource = "team" } // Replace with your datasource name
        );

        // Map query result to an array of objects for React
        var result = [];
        for (var row in qEmployees) {
            arrayAppend(result, {
                ID: row.ID,
                FIRSTNAME: row.FIRSTNAME,
                LASTNAME: row.LASTNAME,
                ROLE: row.ROLE
            });
        }

        // Return pure JSON
        return result;
    }

}
