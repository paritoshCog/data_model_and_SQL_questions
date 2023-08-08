-- 1.	Top 10 (based on rating) movies from “Comedy” Genre.
  
select movie.mov_id, movie.mov_title from movie 
join
rating ON movie.mov_id = rating.mov_id
join
movie_genres ON rating.mov_id = movie_genres.mov_id
join
genres ON movie_genres.gen_id = genres.gen_id
where
genres.gen_title = 'comedy'
ordered by 
rating.num_o_ratings DESC
limit 10

-- 2.	All the movies Directed by “Steven Spielberg”.


select movie.mov_id, movie.mov_title from movie
join
movie_direction ON movie.mov_id = movie_direction.mov_id
join
director ON movie_direction.dir_id = director.dir_id
where
director.dirfname = 'Steven' and director.dirlname = 'Spielberg'   
	
-- 3.	All the movies where “Samuel L. Jackson” acted as “Supporting Actor” role.

select movie.mov_id, movie.mov_title from movie
join
movie_cast on movie.mov_id = movie_cast.mov_id
join
actor ON movie_cast.act_id = actor.act_id
where
movie_cast.role = 'Supporting Actor' and actor.act_fname = 'Samuel L.' and actor.act_lname = 'Jackson'

-- 4.	Find the directors & movie name who also acted on the same movie.

select movie.mov_title, concat(director.dir_fname,' ',director.dir_lname) as director_name from movie
join
movie_direction ON movie.mov_id = movie_direction.mov_id
join
director ON movie_direction.dir_id = director.dir_id


-- 5.	Find the name of director who created movie on all below 4 genre –
-- a.	Horror 
-- b.	Comedy
-- c.	Drama 
-- d.	Sci-Fi

select concat(director.dir_fname,' ', director.dir_lname) from director
join
movie_direction ON director.dir_id = movie_direction.dir_id
join
movie ON movie_direction.mov_id = movie.mov_id
join
movie_genres ON movie.mov_id = movie_genres.mov_id
join
genres ON movie_genres.gen_id = genres.gen_id
where
genres.gen_title = 'horror' and genres.gen_title = 'comedy' and genres.gen_title = 'drama' and genres.gen_title = 'sci-fi'

-- 6.	Find the name pairs who played roles in maximum number of movies as “Leading Actor” & “Leading Actress.”

-- 7.	Find how many Bengali movies releases outside India.

select mov_id, mov_title from movie where mov_rel_country != 'India'

-- 8.	Which year least number of movies had been released.

select count(mov_year) as lest_mov from movie group by mov_year order by least_mov limit 1

-- 9.	Find the Movie name & actor name where any Actor played role of multiple characters.

-- 10.	Which director has maximum number of movies with 5-star rating.

select count(director.dir_id), movie.mov_title, rating.rev_stars from director
join
movie_direction ON director.dir_id = movie_direction.dir_id
join
movie ON movie_direction.mov_id = movie.movie_id
join
rating ON movie.mov_id = rating.mov_id
where rating.rav_stars = 5
order by
director.dir_id desc
limit 1
















