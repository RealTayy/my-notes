SELECT h.hacker_id, h.name, COUNT(c.challenge_id) challenges_created
FROM Hackers h
JOIN Challenges c
ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
ORDER BY
  challenges_created DESC,
  h.hacker_id

SELECT MAX(challenges_created) as max_challenges
FROM 
  (SELECT COUNT(c.challenge_id) challenges_created
  FROM Hackers h
  JOIN Challenges c
  ON h.hacker_id = c.hacker_id
  GROUP BY h.hacker_id, h.name) t1



  SELECT challenges_created, COUNT(challenges_created) as people
FROM 
  (SELECT h.hacker_id, h.name, COUNT(c.challenge_id) challenges_created
  FROM Hackers h
  JOIN Challenges c
  ON h.hacker_id = c.hacker_id
  GROUP BY h.hacker_id, h.name) t1
GROUP BY challenges_created
HAVING
  COUNT(challenges_created) = 1
  OR challenges_created = MAX(challenges_created)
ORDER BY
  challenges_created DESC,
  people DESC