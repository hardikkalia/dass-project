function createQuery(queryParams) {
    const query = {};
    console.log(queryParams);

    if (queryParams.startdate) {
      query["orders.full_messages.startdate"] = queryParams.startDate;
    }

    if (queryParams.enddate) {
      query["orders.full_messages.enddate"] = queryParams.endDate;
    }

    if (queryParams.company) {
      query["orders.company_name"] = queryParams.company;
    }
  
    if (queryParams.orderStatus) {
      query["orders.current_status"] = queryParams.orderStatus;
    }
  
    if (queryParams.orderType) {
      query["orders.type"] = queryParams.orderType;
    }

    return query;
  }

  module.exports=createQuery;
