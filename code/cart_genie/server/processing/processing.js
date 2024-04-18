function extractOrderInfo(message) {
    const orderNumberPattern = /\b[0-9]+[0-9]+[0-9]+\b/;
    const orderStatusWords = {
        dispatched: ['dispatched', 'dispatch'],
        outForDelivery: ['out for delivery', 'out for deliveries'],
        delivered: ['delivered', 'delivery completed'],
        failed: ['failed', 'delivery failed']
    };
    let orderStatus = null;

    const companyNamePattern = /(Amazon|Delhivery|Blue\sDart|DTDC)/;
    const orderTypePattern = /(Delivery| Return)/;

    const orderNumberMatch = message.match(orderNumberPattern);
    for (const status in orderStatusWords) {
        for (const word of orderStatusWords[status]) {
            if (message.match(word)) {
                orderStatus = status;
                break;
            }
        }
        if (orderStatus) break;
    }
    const companyNameMatch = message.match(companyNamePattern);
    const orderTypeMatch = message.match(orderTypePattern);

    const orderNumber = orderNumberMatch ? orderNumberMatch[0] : null;
    const companyName = companyNameMatch ? companyNameMatch[0] : null;
    const orderType = orderTypeMatch ? orderTypeMatch[0] : null;

    return { orderNumber, orderStatus, companyName, orderType };
}

module.exports = extractOrderInfo;
