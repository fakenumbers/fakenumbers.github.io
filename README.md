# fakenumbers.github.io
A list of publicly known fake credentials (e.g. mobile phone numbers)

You can simply use it as an API enpoint by doing a HTTP HEAD (or any other verb) request and evaluate the HTTP status

E.g. call

`curl --head "https://fakenumbers.github.io/mobile/4915903921132"`

| HTTP Status | Description |
| --- | --- |
| 200 | The number is on the black list, be careful before accepting a user with these credentials |
| 404 | Number not (yet) blacklisted |

Doing "bulk" checks against your database using HTTP request is of course **not recommended**. Rather clone the repo at https://github.com/fakenumbers/fakenumbers.github.io/ and do an offline search (+ contribute your tool later on)

To add new numbers, you can use the CLI script `./scripts/bulkadd.sh`, e.g.

```
$ ./scripts/bulkadd.sh mobile "Add SMS numbers of freesmsverification.com"
Enter numbers line by line, press ENTER if you are done
4915735983161
19704009215
17578283856
447481344869

Commit as "Add SMS numbers of freesmsverification.com"
[master c501cde] Add SMS numbers of freesmsverification.com
 4 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mobile/17578283856
 create mode 100644 mobile/19704009215
 create mode 100644 mobile/447481344869
 create mode 100644 mobile/4915735983161
```

`Usage: bulkadd.sh <category> "<commit message>" [<list.file>]`

(`<list.file>` You can also prepare a text file with one number per line)
  
If this is to complicate for you, feel free to contribute by sending an emial with the numbers and the source to fake.number.checker@gmail.com Don't worry - your mail address won't be published.
