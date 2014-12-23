# erl

a readline wrapper

## Description

`erl` is a GNU readline wrapper.

## Installation

```
$ gem install erl
```

## Usage

```
$ erl [options] <command>
```

## Options

You can set some options:

```
-h <file>  # history file path
```

## Example

```
$ erl mysql -uroot -h ~/.erl_history
mysql> select count(*) from foo;
+----------+
| count(*) |
+----------+
|      100 |
+----------+
1 row in set (0.01 sec)

mysql> exit;
Bye
```

## Contributing

1. Fork it ( https://github.com/takady/erl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
