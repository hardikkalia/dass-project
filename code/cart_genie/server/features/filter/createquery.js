function generateFilterString(
  startDate,
  endDate,
  company,
  orderStatus,
  orderType
) {
  const filters = [];

  if (startDate) {
    filters.push(`order.date >= new Date("${startDate}")`);
  }
  if (endDate) {
    filters.push(`order.date <= new Date("${endDate}")`);
  }

  if (company) {
    filters.push(`order.company_name === '${company}'`);
  }
  if (orderStatus) {
    filters.push(`order.current_status === '${orderStatus}'`);
  }
  if (orderType) {
    filters.push(`order.order_type === '${orderType}'`);
  }

  const filterString = filters.join(" && ");

  return filterString;
}

module.exports = generateFilterString;
