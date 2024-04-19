function generateFilterString(startDate, endDate, company, orderStatus, orderType) {
  const filters = [];
 
  // Add filters for startDate and endDate if provided
  if (startDate) {
    filters.push(`date >= ${startDate}`);
  }
  if (endDate) {
    filters.push(`date <= ${endDate}`);
  }
 
  // Add filters for company, orderStatus, and orderType if provided
  if (company) {
    filters.push(`company_name === '${company}'`);
  }
  if (orderStatus) {
    filters.push(`current_status === '${orderStatus}'`);
  }
  if (orderType) {
    filters.push(`order_type === '${orderType}'`);
  }
 
  // Join all filters with " && " to create the final filter string
  const filterString = filters.join(" && ");
  
  return filterString;
}
 
 
 module.exports = generateFilterString;