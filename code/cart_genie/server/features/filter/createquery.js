function generateFilterString(startDate, endDate, company, orderStatus, orderType) {
  const filters = [];
  // Add filters for startDate and endDate if provided
  if (startDate) {
    filters.push(`order.date >= "${startDate}"`);
  }
  if (endDate) {
    filters.push(`order.date <= "${endDate}"`);
  }
 
  // Add filters for company, orderStatus, and orderType if provided
  if (company) {
    filters.push(`order.company_name === '${company}'`);
  }
  if (orderStatus) {
    filters.push(`order.current_status === '${orderStatus}'`);
  }
  if (orderType) {
    filters.push(`order.order_type === '${orderType}'`);
  }
 
  // Join all filters with " && " to create the final filter string
  const filterString = filters.join(" && ");
  
  return filterString;
}
 
 
 module.exports = generateFilterString;