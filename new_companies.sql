select company.company_code, founder, count(distinct(Lead_Manager.lead_manager_code)), count(distinct(Senior_Manager.senior_manager_code)), count(distinct(Manager.manager_code)),
count(distinct(Employee.employee_code))
from company join Lead_Manager on (company.company_code = Lead_Manager.company_code)
join Senior_Manager on (Lead_Manager.lead_manager_code = Senior_Manager.lead_manager_code)
join Manager on (Senior_Manager.senior_manager_code = Manager.senior_manager_code)
join Employee on (Manager.manager_code = Employee.manager_code)
group by company.company_code, founder
order by company.company_code