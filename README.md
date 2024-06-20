# Project

[Finance_tracker](https://finance-tracker-wuob.onrender.com/)

## Install

### Clone the repository

```shell
git clone git@github.com:Ikl0/finance_tracker.git
cd finance_tracker
```

### Check your Ruby version

```shell
ruby -v
```

The required ruby version is '3.2.2'

If not, install the right ruby version using [rvm](https://rvm.io/) (it could take a while):

```shell
rvm install 3.2.2
```
### Install dependencies

Using [Bundler](https://github.com/bundler/bundler), [Yarn](https://github.com/yarnpkg/yarn) and [Node.js](https://nodejs.org/en/)

```shell
bundle 
```
```shell
install yarn 
```
```shell
install node.js 
```
```shell
 bundle exec rake webpacker:install
```
### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Or just

```shell
rails db:setup
```

## Now start the server

```shell
rails s
```
