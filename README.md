# Tournament Database Project
Tournament application that implements Swiss style.

## Prerequisite
-   Python (Recommend 2.7)
-   [Vagrant](https://www.vagrantup.com/) installed.
-   [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed.
-   Linux terminal (Ex. Git Bash...)

## Getting Started
1.  Clone or download repository.
2.  Open Linux terminal and change directory to `...\vagrant`
3.  Enter command `vagrant up`.
4.  Enter command `vagrant ssh`.
5.  At this point, you are already in the Virtual Machine. Enter command `cd /vagrant/tournament`.
6.  __Skip this step if a tournament database and data tables has been configured.__
    `psql tournament -f tournament.sql`
7.  Enter command `python tournament_test.py` to test if the database works.
8.  The rest is up to you!

## License
[MIT License](./LICENSE)
