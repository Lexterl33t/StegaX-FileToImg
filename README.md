<p align="center">
  <img width="460" height="300" src="https://www.solutions-numeriques.com/wp-content/uploads/2015/08/secu-loupe-code_istock-bale.jpg">
</p>

# StegaX - Library

The class Stega X is the class to easy create hide file in picture with class detach and attach

## Getting Started

```
gem install StegaX

```

```ruby
    require 'StegaX'
```

## Attach file to picture

```ruby

    stega = StegaX.new('text.txt', 'picture.png', 'output.png')
    stega.attach()

    #output => [text.txt, picture.png] => output.png
```

## Detach file

```ruby
stega = StegaX.new()

stega.detach("output.png", "lol.txt")
```





## Authors

* **Muham RB** - *Initial work* - [MuhamRB](https://github.com/MuhamRB)

* **Muham RB** - *RubyGems* - [MuhamRB](https://rubygems.org/profiles/MuhamRB)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

