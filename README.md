# Branch
## The decentralized democracy and social platform

---

### What is it?
Branch was conceived by Chris Robertson and Jon Laing. The idea was to use the "matching" concept from online dating websites and combine it with the anonymous democracy concepts from popular websites like Reddit to allow ideas to form, grow, and change organically.

#### How it works

1. Upon signing up, a new user will take a quiz of sorts (still in the works) which will attempt to place them on a political scale. The political scale will be more sophisticated than just left-wing/right-wing.
2. After the user's placement on the political scale is determined, they are the matched up with other users who have similar political persuasions. The user is encouraged to "friend" or "follow" those they are matched with.
3. Once the user is matched up into their "borderless caucus" (a working term), they can start sharing ideas. A user will post their ideas for improving society in the form of a "proposal".
4. All of the user's "friends" can see their proposal, and interact with it by amending, commenting, or voting.
5. If a friend interacts with the proposal in any other way than a "downvote", it is then shared with their friends, and so-on.

The idea is that when users share ideas with those that are more politically similar to them, half-baked ideas are less likely to be dismissed off-the-bat, and more likely to be given constructive criticism. By the time the idea is shared outside of the original user's caucus, it should be more refined, and thus more palatteable to those that are *less* politically similar.

Eventually, top ideas will be published for everyone to see, regardless of their caucus. The purpose is an attempt to decouple political discourse to the buzz words of politicians and mass-media. It's also to break the myths about what each political ideology stands for, and to remove the necessity for people to abridge, or even betray their beliefs by feeling compelled to join a political party.

---

### Installation

Branch is built on Ruby 2 and Rails 4. At the time of writing this README, the app is only running on SQLite3. This is likely going to change, and I recommend checking the `config/db.yml` file to confirm this is still the case.

First, get the project:

````
$ git clone https://github.com/jonlaing/branch.git
````

Next, make sure you have [Bundler](https://github.com/jonlaing/branch.git) and [Ruby 2.0](https://www.ruby-lang.org/en/downloads/) installed. I personally recommend using [RVM](https://rvm.io/), but it is not required.

Once you have those dependencies installed, run:

````
$ bundle install
````

Next, you'll need to seed the dev environment. (It'd be really boring if you were the only person on the site.):

````
$ rake db:setup db:seed
````

To run the application, run:

````
$ rails server
````

---

### Contact

For inquiries, partnerships, questions, concerns, etc, email Jon Laing at **info [at] jonlaing [dot] com**.

**Note**

This is a side project that is likely to be slow going. Don't expect this thing to actually work at the moment, because it's in its very early stages.
