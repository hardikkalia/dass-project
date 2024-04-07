// extractOrderInfo.js
function extractOrderInfo(message) {
    const orderNumberPattern = /\b[0-9]+-[0-9]+-[0-9]+\b/;
    const orderStatusPattern = /(dispatched|out\sfor\sdelivery|delivered|failed)/;
    const companyNamePattern = /(Amazon|Delhivery|Blue\sDart)/;
    const orderTypePattern = /(Delivery| Return)/;

    const orderNumberMatch = message.match(orderNumberPattern);
    const orderStatusMatch = message.match(orderStatusPattern);
    const companyNameMatch = message.match(companyNamePattern);
    const orderTypeMatch = message.match(orderTypePattern);

    const orderNumber = orderNumberMatch ? orderNumberMatch[0] : null;
    const orderStatus = orderStatusMatch ? orderStatusMatch[0] : null;
    const companyName = companyNameMatch ? companyNameMatch[0] : null;
    const orderType = orderTypeMatch ? orderTypeMatch[0] : null;

    return { orderNumber, orderStatus, companyName, orderType };
}

module.exports = extractOrderInfo;
