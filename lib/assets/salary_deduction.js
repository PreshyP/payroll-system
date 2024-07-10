// lib/assets/javascripts/salary_deductions.js

document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('form');
    const totalDaysWorkedInput = document.getElementById('salary_deduction_total_days_worked');
    const hoursWorkedInput = document.getElementById('salary_deduction_hrs_worked');
    const taxFeeInput = document.getElementById('salary_deduction_tax_fee');
    const pensionFeeInput = document.getElementById('salary_deduction_pension_fee');
    const netPayInput = document.getElementById('salary_deduction_net_pay');
  
    form.addEventListener('submit', (event) => {
      event.preventDefault(); // Prevent the form from submitting
  
      const totalDaysWorked = parseFloat(totalDaysWorkedInput.value) || 0;
      const hoursWorked = parseFloat(hoursWorkedInput.value) || 0;
      const taxFee = parseFloat(taxFeeInput.value) || 0;
      const pensionFee = parseFloat(pensionFeeInput.value) || 0;
  
      // Assuming you have a fixed rate for calculating pay
      const ratePerHour = 20; // Example rate per hour
      const grossPay = totalDaysWorked * hoursWorked * ratePerHour;
      const netPay = grossPay - taxFee - pensionFee;
  
      netPayInput.value = netPay.toFixed(2); // Update the net pay field
  
      form.submit(); // Now submit the form
    });
  });
  