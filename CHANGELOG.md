# [3.0.1] 2022-03-19
#### Fix
- remove 'part of' files from list of imports

# [3.0.0] 2022-03-07
#### Break
- Spelling fixes: `--exclude-sufix` becomes `--exclude-suffix`

# [2.0.1] 2022-02-28
- fix windows compatibility

# [2.0.0] 2022-02-27

#### Break
- The root project folder must to be the same name as the package name.
    - Use the `--package-name` argument, in order to define the correct package name, if the root folder is not the same name.

example:
```shell
dlcov -c 80 -p flutter_project_name
dlcov -c 80 --package-name flutter_project_name

- Remove `file` argument (always uses default: coverage/lcov.info)
```
#### Added
- workaround to make it consider all dart files in code coverage reports (It is not yet natively supported by Flutter.)
#### Chore
- fix repo issues link

# [1.0.1] 2021-10-19
#### Added
- refactor app with arg params (see README.md)
- --exclude-sufix in order to remove generated files from results
- --log param to create log in root folder (dlcov.log)
#### Break
- Need to enter the arguments --file and --coverage
#### Chore
- format files


## 0.1.0
#### Added 2021-09-16
- Initial version.
