#Too-Slow

Welcome to the Atlanta Intermediate Ruby Group workshop on SQL optimizations. After the event please give [feedback]() on the workshop! I hope you have fun!

####A Meta Exercise
If you are open to it I would encourage:

- [Pairing](http://anh.cs.luc.edu/170/Kindergarten.html) with another developer. Please take a minute to read the link so you and your pair on the same page.
- Adopting a [beginner's mindset](http://lifereimagined.aarp.org/stories/3251-Embracing-the-Beginner-s-Mindset). What does that mean? Maximize your learning while helping those around you. Everyone has different backgrounds and experiences. If you are struggling be vulnerable and ask questions. No question is a bad question. If you are not struggling help those around you. Take steps to get yourself to learn something whether that is steering the exercise to something novel for you or having someone else to give you a new challenge or topic to look into.

####Workflow

- Make a branch with you and your pair's first names. Develop on that branch rather than master.
- Use [Cloud9](https://c9.io/) for pairing in the cloud.

###Learning Goals
- Performance debugging: find the offender
- Performance strategy: find the lowest hanging fruit
- Performance tuning: make it faster

##Summary

Welcome to KarmaVille!  Things would be great if things weren't so slow.

We have a pre-built Rails application with two models: `User` and `KarmaPoint`.  After seeding the database with data, you'll have 100,000 rows in the `users` table and 1,500,000 rows in the `karma_points` table.  The index page is sl-o-o-ow and it's your job to speed it up without using any fancy technologies like [memcache](http://memcached.org/), [redis](http://redis.io/), or Rails' [fragment caching](http://guides.rubyonrails.org/caching_with_rails.html).

### Setting Up the Application

Get the application running as follows:

```text
$ bundle install
$ rake db:setup
```

The `rake db:setup` command could take a few minutes.  Once it's done run `rails server` and visit [http://localhost:3000](http://localhost:3000).

We use a gem called activerecord-import to mass import data into the database. Here is an issue to be aware of:  [this issue](https://github.com/zdennis/activerecord-import/wiki/Callbacks)
It should take a few seconds to load.  If you look at the last line of your server logs, you'll see it telling you how much time was spent rendering the views versus how much time was executing `ActiveRecord` methods.  Where's the bottleneck?

### Make it fast!

Your goal is to get the index page to load in under **200ms**.  Yes, that's milliseconds.

The test suite should remain green.  If you add any new public methods make sure you add appropriate corresponding tests.

You **should not** change the controller or view code.

##Releases
###Release 0
Identify why the app is so slow. Find the offending code(s) responsible for the
performance hit.
###Release 1
Come up with strategies to fix the offending code(s) that you've identified.
###Release 2
Execute your strategies one at a time and make sure you're on the right track.
Make the app faster.
###Release 3
Checkout the master branch locally again and implement the Bullet gem. After seeing how it can help with SQL optimization checkout your branch and implement Bullet to ensure you addressed all opportunities for optimization.

##Want More?

Congratulations you finished the exercise! Pat yourself on the back. Here's what we'll do next.

#### Caching - Query Caching using Memcache
- Implement a query cache using Memcache. When are good times to use query caches? Implement another feature that would benefit from a query cache.

#### Indexes - Ordered Indexes, Btree alternatives
- Indexes are super cool! I think I should add an index to every column! Is this a good idea?
- Implement an ordered index.
- What is a Btree index? Implement a feature that would benefit from another type of index.

#### Active Record Query Interface
- What are the differences between #count, #size, #length?
- Implement three features that would benefit from each method.

#### Profiling - New Relic
- Most shops use New Relic for production app monitoring. Create a test account and implement the newrelic_rpm gem on our application.
- Learn something cool about New Relic to share with the group.

##### Note

This application is an extension of an exercise I originally had at [Dev Bootcamp](http://devbootcamp.com/) San Francisco. Thanks DBC!
