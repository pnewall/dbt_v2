{% docs order_status %}
	
One of the following values: 

| status         | definition                                       |
|----------------|--------------------------------------------------|
| placed         | Order placed, not yet shipped                    |
| shipped        | Order has been shipped, not yet been delivered   |
| completed      | Order has been received by customers             |
| return pending | Customer indicated they want to return this item |
| returned       | Item has been returned                           |

{% enddocs %}

{% docs payment_status %}

| status         | definition                                       |
|----------------|--------------------------------------------------|
| success        | Customer has paid - in time                      |
| failed         | Customer payment failed                          |
| late           | Customer tardy in coughing up                    |

{% enddocs %}