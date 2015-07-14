
#moving_posts_main {
  width:760px;
  margin-bottom:20px;
  overflow:hidden;
  border-top:1px solid #ccc;
}

#moving_posts_main li  {
  line-height:1.5em;
  /*border-bottom:1px solid #ccc;*/
  float:left;
  display:inline;
  width: 50%;
} 

#moving_posts_main {
  width:760px;
  margin-bottom:20px;
  overflow:hidden;
  border-top:1px solid #ccc;
  columns: 2;
}

#moving_posts_main #post_div_1 li  {
  line-height:1.5em;
  /*border-bottom:1px solid #ccc;*/
  float:left;
  display:inline;
  width: 75%;
  color: blue;
} 

#moving_posts_main #post_div_2 li  {
  line-height:1.5em;
  /*border-bottom:1px solid #ccc;*/
  float:left;
  display:inline;
  width: 50%;
  color: blue;
} 

<% if post.created_at <= time.now %>

#Movers can see all posts and bid on all posts, but can only see their own bids 
#Individuals can post and see their own posts. Can also see only their own bids
#time_left method - figure out how to do math with dates in ruby
#clean up code
#push to git
#push to heroku and look up how to push to production