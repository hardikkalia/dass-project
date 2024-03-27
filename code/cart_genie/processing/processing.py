import re

def extract_order_info(message):
    order_number_pattern = r'\b[0-9, \-]+\b'
    order_status_pattern = r'(dispatched|out\sfor\sdelivery|delivered|failed)'
    company_name_pattern = r'(Amazon|Delhivery)'

    order_number = re.search(order_number_pattern, message)
    order_status = re.search(order_status_pattern, message)
    company_name = re.search(company_name_pattern, message)

    order_number = order_number.group() if order_number else None
    order_status = order_status.group() if order_status else None
    company_name = company_name.group() if company_name else None

    return order_number, order_status, company_name

text_message = "Your order AB1234 with Amazon has been dispatched."

order_number, order_status, company_name = extract_order_info(text_message)

print("Order No:", order_number)
print("Order Status:", order_status)
print("Company name:", company_name)
