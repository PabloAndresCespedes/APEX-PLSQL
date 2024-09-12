/**
 * Single Responsibility Principle
 * Sostiene que una clase debe tener una sola razón
 * para cambiar esto implica que debe tener solo una tarea
 * o responsabilidad
*/

function calculateSalary(employee) {
    const salary = employee.hoursWorket * employee.payPerHour;
}

function generateReport(employee, salary) {
    const report = `
     Name: ${employee.name}
     Hours worket: ${employee.hoursWorket}
     Pay per hour: ${employee.payPerHour}
     Total salary: ${employee.salary}
    `;

    console.log(report);
}

const salary = calculateSalary(employee);
generateReport(employee, salary);