/* 

https://trailhead.salesforce.com/content/learn/modules/marketing-cloud-data-management/query-data-with-sql

Diagram 1: Left Outer Join

You want all records from data extension A, plus matching records in the data extension B.

Check all the emails have been sent to a deployment list

*/

SELECT
    k.SubscriberKey
    ,s.Status
    ,s.EmailAddress
    ,se.EventDate
FROM [Deployment_List] AS k
LEFT JOIN _Subscribers AS s
ON k.SubscriberKey = s.SubscriberKey
LEFT JOIN _Sent AS se
ON k.SubscriberKey = se.SubscriberKey
AND se.JobID IN (SELECT j.JobID FROM _Job AS j WHERE j.EmailName IN ('Email_Template_1', 'Email_Template_2'))
