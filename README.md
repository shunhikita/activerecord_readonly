# Activerecord::Readonly

WIP

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord_readonly'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install activerecord_readonly

## Usage

```rb
# switch readonly mode
# 
# excepts
#   class name to exclude
#   default: []
# only
#   class name to limit
#   default: []
ActiverecordReadonly.switch!(current_user.readable?, excepts: ["User"], only: [])

# reset readonly mode
ActiverecordReadonly.reset_readonly!

# switch readonly mode only inside the block
ActiverecordReadonly.with(true) do
end

# reset readonly mode only inside the block
ActiverecordReadonly.with(false) do
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shunhikita/activerecord_readonly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/shunhikita/activerecord_readonly/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Activerecord::Readonly project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/shunhikita/activerecord_readonly/blob/master/CODE_OF_CONDUCT.md).
