# Motorista

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

> Motorista is an online magazine for the petrolheads, designed to host articles from all around the automotive and motorcycle world. The categories currently implemented are Cars, Motorcycles, Off-Road, and Racing. The features of this website are user creation/log-in, user profile with the most voted article featured at the top, and a list of the latest articles written by the author. For the articles section, we have the creation of new articles, a show page for each one of them featuring the article picture, title, and content. The home page is a webpage that displays the featured article at the top (Most voted) and a list of categories featuring the most recent article added to that section as cover. Signed-in users can upvote their favorite article to see it featured on the home page. The website is fully responsive, with an interactive sliding menu bar. The last feature I will mention here is the search option. You can search for a word or phrase and the related articles will be displayed. For a full experience on the web app, please make sure to visit it's [Live Version right here!]()

![screenshot1](app/assets/images/screenshot02.png)

![screenshot1](app/assets/images/screenshot01.png)

![screenshot1](app/assets/images/screenshot03.png)

![screenshot1](app/assets/images/screenshot04.png)

## Live Version

[Live Version](https://murmuring-thicket-07012.herokuapp.com/users/sign_in)

## Built With

- Ruby v2.6.5
- Ruby on Rails v5.2.4

## Getting Started

To get started with the app, cd to the directory where you would like the repo to live by typing on your terminal:

```
$ cd <directory>
```

Clone the repo typing:

```
$ git clone git@github.com:shubham14p3/ror-social-scaffold.git
```

Install the needed gems:

```
$ bundle install
```

Next, initialize the pre-build database with seeds :

```
$ rake db:seed
```

and then

```
$ rake db:setup

```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, start server:

```
$ rails server
```

Open `http://localhost:3000/` in your browser.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Run tests

```
  rpsec spec/features/users/users_spec.rb

  psec spec/features/users/friends_spec.rb

  rpsec spec/features/users/login_spec.rb
```

## Authors

👤 **Luis Angel Maldonado**

- Github: [@lmaldonadoch](https://github.com/lmaldonadoch)
- Twitter: [@LuisAngelMCh](https://twitter.com/LuisAngelMCh)
- Linkedin: [linkedin](https://www.linkedin.com/in/lmaldonadoch)

👤 **Shubham Raj**

- Github: [@ShubhamRaj](https://github.com/shubham14p3)
- Linkedin: [Shubham14p3](https://www.linkedin.com/in/shubham14p3/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/shubham14p3//ror-social-scaffold/issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Project requested by [Microverse Program](https://www.microverse.org/).

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/shubham14p3/members-only.svg?style=flat-square
[contributors-url]: https://github.com/shubham14p3/ror-social-scaffold/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/shubham14p3/members-only.svg?style=flat-square
[forks-url]: https://github.com/shubham14p3/ror-social-scaffold/network/members
[stars-shield]: https://img.shields.io/github/stars/shubham14p3/members-only.svg?style=flat-square
[stars-url]: https://github.com/shubham14p3/ror-social-scaffold/stargazers
[issues-shield]: https://img.shields.io/github/issues/shubham14p3/members-only.svg?style=flat-square
[issues-url]: https://github.com/shubham14p3/ror-social-scaffold/issues
