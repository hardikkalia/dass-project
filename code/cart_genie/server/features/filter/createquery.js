function createQuery(queryParams) {
    const query = {};
  
    if (queryParams.date) {
      query["orders.full_messages.date"] = queryParams.date;
    }
  
    if (queryParams.company) {
      query["orders.company_name"] = { $regex: queryParams.company, $options: "i" };
    }
  
    if (queryParams.orderStatus) {
      query["orders.current_status"] = queryParams.orderStatus;
    }
  
    return query;
  }