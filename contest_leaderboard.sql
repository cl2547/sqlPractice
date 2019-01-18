select t.hacker_id, t.name, sum(maxScore)
from (
select Submissions.hacker_id, name, max(score) as maxScore
from Hackers inner join Submissions on (Hackers.hacker_id = Submissions.hacker_id)
where score>0
group by Submissions.hacker_id, name, Submissions.challenge_id
) t
group by t.hacker_id, t.name
order by sum(maxScore) desc, t.hacker_id