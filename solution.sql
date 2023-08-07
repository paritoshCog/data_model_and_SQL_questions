-- 1.	Top 10 (based on rating) movies from “Comedy” Genre.
  
select * from movie 
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

-- 2.	All the movies Directed by “Steven Spielberg”.


select * from movie
join
	movie_direction ON movie.mov_id = movie_direction.mov_id
join
	director ON movie_direction.dir_id = director.dir_id
having
	director.dirfname = 'Steven' and director.dirlname = 'Spielberg'
	




















