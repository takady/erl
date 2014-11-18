# erl

executable readline wrapper

## Description

`erl` is not only GNU readline wrapper. `erl` enable you to execute multiple queries from one console.  
And you can see all executed query status and results anytime you want.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'erl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install erl

## Usage
```
$ erl [options] <command>
```

## Options
You can set some options:
```
−f <file>  # Split file into words and add them to the completion word list.
−i         # Ignore case when completing.
-b         # Execute multiple queries on background.
```

## Example
```
$ erl -m mysql -uroot
mysql> select count(*) from table1;
1: select count(*) from table1;
mysql> select count(*) from table2;
2: select count(*) from table2;
mysql> ls
1: select count(*) from table1;
2: select count(*) from table2;
mysql>
:
:
# when any query has finished, star is shown on list.
mysql> ls
*1: select count(*) from table1;
2: select count(*) from table2;
*mysql> cat 1
+----------+
| count(*) |
+----------+
|      100 |
+----------+
1 row in set (0.01 sec)

mysql> rm 1
mysql> ls
2: select count(*) from table2;

```

## Contributing

1. Fork it ( https://github.com/takady/erl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
