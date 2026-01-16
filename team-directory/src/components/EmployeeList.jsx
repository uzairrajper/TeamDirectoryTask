import { useEffect, useState } from "react";
import "../index.css";

export default function EmployeeList() {
  const [employees, setEmployees] = useState([]);
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(false);

  const fetchEmployees = async (searchTerm = "") => {
    setLoading(true);
    try {
      let url = "http://localhost:8500/api/EmployeeService.cfc?method=getEmployees";
      if (searchTerm) url += `&search=${encodeURIComponent(searchTerm)}`;

      const res = await fetch(url);
      const data = await res.json();
      console.log(data);
      setEmployees(data);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchEmployees();
  }, []);

  const handleSearch = (e) => {
    setSearch(e.target.value);
    fetchEmployees(e.target.value);
  };

  return (
    <div className="container">
      <h1>Team Directory</h1>

      <input
        type="text"
        value={search}
        onChange={handleSearch}
        placeholder="Search by first or last name..."
      />

      {loading ? (
        <p className="no-data">Loading...</p>
      ) : employees.length === 0 ? (
        <p className="no-data">No employees found.</p>
      ) : (
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Role</th>
            </tr>
          </thead>
          <tbody>
            {employees.map(emp => (
              <tr key={emp.ID}>
                <td>{emp.ID}</td>
                <td>{emp.FIRSTNAME}</td>
                <td>{emp.LASTNAME}</td>
                <td>{emp.ROLE}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}
