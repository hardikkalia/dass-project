function extractOrderInfo(message) {
    const amazonPattern = /\b\d{3}-\d{7}-\d{7}\b/;
    const blueDartPattern = /\bAWB# \d{11}\b/;
    const delhiveryPattern = /\bAWB \d{11}\b/;
    const orderStatusWords = {
      Dispatched: ['dispatched', 'dispatch', 'shipped'],
      "Out for Delivery": ['out for delivery', 'out for deliveries'],
      Delivered: ['delivered', 'delivery completed'],
      Failed: ['failed', 'delivery failed'],
      Ordered: ['successfully placed', 'ordered', 'packed']
    };
    let orderStatus = null;
    const companyNamePattern = /(Amazon|Delhivery|Blue\sDart|DTDC)/;
    const orderTypePattern = /(Delivery|Return)/i;
  
    const companyNameMatch = message.match(companyNamePattern);
    const companyName = companyNameMatch ? companyNameMatch[0] : null;
  
    let orderNumberMatch;
    if (companyName === 'Amazon') {
      orderNumberMatch = message.match(amazonPattern);
    } else if (companyName === 'Blue Dart') {
      orderNumberMatch = message.match(blueDartPattern);
    } else if(companyName == 'Delhivery'){
      orderNumberMatch = message.match(delhiveryPattern);
    }
  
    for (const status in orderStatusWords) {
      for (const word of orderStatusWords[status]) {
        if (message.match(word)) {
          orderStatus = status;
          break;
        }
      }
      if (orderStatus) break;
    }
  
    const orderTypeMatch = message.match(orderTypePattern);
  
    const orderNumber = orderNumberMatch ? orderNumberMatch[0] : null;
    const orderType = orderTypeMatch ? orderTypeMatch[0] : null;
  
    return { orderNumber, orderStatus, companyName, orderType };
  }
  
  module.exports = extractOrderInfo;
