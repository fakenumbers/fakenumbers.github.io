# [fakenumbers.github.io](https://fakenumbers.github.io/)
A list of publicly known fake credentials (e.g. mobile phone numbers)

You can simply use it as an API enpoint by doing a HTTP HEAD (or any other verb) request and evaluate the HTTP status

E.g. call

`curl --head "https://fakenumbercheck.tk/mobile/4915903921132"`

| HTTP Status | Description | Example |
| --- | --- | --- |
| 200 | The number is on the black list, be careful before accepting a user with these credentials | [4915903921132](https://fakenumbercheck.tk/mobile/4915903921132) |
| 404 | Number not (yet) blacklisted | [123456789](https://fakenumbercheck.tk/mobile/123456789) |

Doing "bulk" checks against using HTTP request is of course **not recommended**. Rather clone the repo at [github.com/fakenumbers/](https://github.com/fakenumbers/fakenumbers.github.io/) and do an offline search using the CLI [bulkcheck.sh](https://github.com/fakenumbers/fakenumbers.github.io/blob/master/scripts/bulkcheck.sh) script.

To add new numbers, you can use the CLI script `./scripts/bulkadd.sh`, e.g.

```
$ ./scripts/bulkadd.sh mobile "Add SMS numbers of freesmsverification.com"
Enter numbers line by line or paste a list, press ENTER if you are done
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
  
If this is to complicate for you, feel free to contribute by sending an emial with the numbers and the source to [fake.number.checker@gmail.com](mailto:fake.number.checker@gmail.com) Don't worry - your mail address won't be published.

## ways to contribute
* Discover more services, that offer fake numbers, one-time emails, IBANs, etc. and [let us know](mailto:fake.number.checker@gmail.com)
* Add more numbers, as described above
* Create a bot / scraper, that crawls for changes at one of the know [Online SMS services](https://github.com/fakenumbers/fakenumbers.github.io/tree/master/sms-services) and automatically creates a pull request here on any update
* Create a crawler (e.g. by doing a simple [Google search for "IBAN GmbH"](https://www.google.com/search?q=iban%20gmbh)) that collects all these published IBAN, used for SEPA direct debit elsewhere in the web
* Create a script that does an online search engine lookup of contributed numbers, to automatically check their public availability. E.g. [googling for an SMS fake number 447481344869](https://www.google.com/search?q=447481344869) reveals way more results than googling for a legit number.

## disclaimer
Though we try to carefully review submitted numbers and check their source, it's possible that this list contains valid, legit credentials. So please do not soley rely on this data source. [Looking up a potential fake number](https://www.google.com/search?q=447481344869) in an online search gives also a good indication, if the number is "public" and likely "abused" or not. In the field of mobile phone numbers [there are other paid services](https://www.google.com/search?q=mobile%20phone%20number%20scoring), that provice scoring solutions, sometimes in tight connection with operators, applying maschine learning to their data, to detect suspicious numbers. For IBANs there are [domestic black list services](https://www.google.com/search?q=Rücklastschriften-Präventions-Pool), that combine fraud reports of connected merchants to score their quality. For credit card BINs you can find [paid online databases](https://www.google.com/search?q=credit%20card%20bin%20database), that try to tell "gift cards", "prepaid" and "KYC" cards apart.
