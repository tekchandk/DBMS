/* List the event number, date held, customer number, customer name, facility number, and facility name of 2018 events placed by Boulder customers.*/
SELECT eventno, dateheld, Customer.custno, custname, Facility.facno, facname
FROM EventRequest, Customer, Facility
WHERE city = 'Boulder'
AND Customer.custno = EventRequest.custno
AND Facility.facno = EventRequest.facno
AND dateheld BETWEEN '2018-01-01' AND '2018-12-31'; 

-- Using JOIN operator
SELECT eventno, dateheld, Customer.custno, custname, Facility.facno, facname
FROM EventRequest INNER JOIN Customer 
ON EventRequest.custno = Customer.custno 
INNER JOIN Facility ON EventRequest.FacNo = Facility.facno
WHERE city = 'Boulder'
AND dateheld BETWEEN '2018-01-01' AND '2018-12-31';



/* List the customer number, customer name, event number, date held, facility number, facility name, and estimated audience cost per person (EstCost / EstAudience) for events 
  held on 2018, in which the estimated cost per person is less than $0.2 */
SELECT Customer.custno, custname, eventno, dateheld, Facility.facno, facname, estcost/estaudiance AS estcostperperson
FROM EventRequest, Customer, Facility
WHERE city = 'Boulder'
AND Customer.custno = EventRequest.custno
AND Facility.facno = EventRequest.facno
AND dateheld BETWEEN '2018-01-01' AND '2018-12-31'
AND estcostperperson < 0.2;

-- Using JOIN operator
SELECT Customer.custno, custname, eventno, dateheld, Facility.facno, facname, estcost/estaudiance AS estcostperperson
FROM EventRequest INNER JOIN Customer 
ON EventRequest.custno = Customer.custno 
INNER JOIN Facility ON EventRequest.FacNo = Facility.facno
WHERE city = 'Boulder'
AND dateheld BETWEEN '2018-01-01' AND '2018-12-31'
AND estcostperperson < 0.2;



/* List the customer number, customer name, and total estimated costs for Approved events.
 * The total amount of events is the sum of the estimated cost for each event. Group the results by customer number and customer name.*/
SELECT Customer.custno, Customer.custname, SUM(estcost) AS totalestcost   
FROM Customer, EventRequest
WHERE status ='Approved'
AND Customer.custno = EventRequest.custno
GROUP BY Customer.custno, Customer.custname;

-- Using JOIN operator
SELECT Customer.custno, Customer.custname, SUM(estcost) AS totalestcost   
FROM EventRequest INNER JOIN Customer  
ON Customer.custno = EventRequest.custno
WHERE status ='Approved'
GROUP BY Customer.custno, Customer.custname;



/* Insert yourself as a new row in the Customer table.*/
INSERT INTO Customer
(custno, custname, address, internal, contact, phone, city, state, zip)
VALUES ('C9999999', 'Tek Chand', '5th flat, Indira Nagar', 'Y', 'Self', '999999',
               'Hyderabad', 'TN', '80204')


/* Increase the rate by 10 percent of nurse resource in the resource table*/
SET SQL_SAFE_UPDATES = 0;
UPDATE Resourcetbl 
  SET rate = rate * 1.1 
  WHERE resName = 'nurse';
SET SQL_SAFE_UPDATES = 1;


/* Delete the new row added to the Customer table.*/
DELETE FROM Customer
  WHERE CustNo = 'C9999999';