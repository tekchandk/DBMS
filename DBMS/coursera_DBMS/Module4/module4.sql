/* List the customer number, the name, the phone number, and the city of customers.*/
SELECT custno, custname, phone, city
FROM Customer;

/* List the customer number, the name, the phone number, and the city of customers who reside in Colorado (State is CO).*/
SELECT custno, custname, phone, city
FROM Customer
WHERE State = 'CO'; 


/* List all columns of the EventRequest table for events costing more than $4000.  Order the result by the event date (DateHeld).*/
SELECT *
FROM EventRequest
WHERE EventRequest.estcost > 4000
ORDER BY dateheld;

/* List the event number, the event date (DateHeld), and the estimated audience number with approved status 
 * and audience greater than 9000 or with pending status and audience greater than 7000.
 */
SELECT eventno, dateheld, estaudiance 
FROM EventRequest
WHERE (status = 'Approved' AND estaudiance > 9000) OR (status = 'Pending' AND estaudiance > 7000);


/* List the event number, event date (DateHeld), customer number and customer name of events placed 
 * in January 2018 by customers from Boulder.
 */
SELECT EventRequest.eventno, EventRequest.dateheld, Customer.custno, custname 
FROM EventRequest, Customer
WHERE city = 'Boulder' AND DateHeld BETWEEN '2018-01-01'AND '2018-01-31';

/* List the average number of resources used (NumberFld) by plan number. 
 * Include only location number L100.
 */
SELECT PlanNo, AVG(NumberFld) AS AvgNumResources
  FROM EventPlanLine
  WHERE LocNo = 'L100'
  GROUP BY PlanNo;

/* List the average number of resources used (NumberFld) by plan number. Only include location number L100. 
 * Eliminate plans with less than two event lines containing location number L100.
 */
SELECT PlanNo, AVG(NumberFld) AS AvgNumResources
 COUNT(*) AS NumEventLines
  FROM EventPlanLine
  WHERE LocNo = 'L100'
  GROUP BY PlanNo;
  HAVING COUNT(*) > 1;
