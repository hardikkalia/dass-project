function createQuery(queryParams) {
    const query = {};
    console.log(queryParams);

    if (queryParams.date) {
      query["orders.full_messages.date"] = queryParams.date;
    }
  
    if (queryParams.company) {
      query["company_name"] = queryParams.company;
    }
  
    if (queryParams.orderStatus) {
      query["orders.current_status"] = queryParams.orderStatus;
    }
  
    return query;
  }

  module.exports=createQuery;
