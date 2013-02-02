##	Heroku ##

###	Deploying the application on Heroku ###

Follow the instructions given below to deploy the application on Heroku.

#### Creating rails application ####

[Follow the instructions mentioned here][1] and create a rails application.

#### git repo for the project ####

```shell
git init .
git add .
git commit -m 'first commit'
```

#### Getting Heroku gem ####

```shell
gem install heroku
gem update heroku
```

#### Changes to Gemfile ####

Open Gemfile of your application and add following lines.

```
group :production, :staging do
  gem 'pg'
  gem 'thin'
  gem 'fog'
end

group :development, :test do
  gem 'sqlite3'
end
```

Notice that in the last line I moved the line <ins>gem 'sqlite3'</ins> inside the group <ins>:development, :test</ins>. Heroku does not work well with <ins>sqlite3</ins> gem so ensure that this gem is only present for <ins>development</ins> and <ins>test</ins> group.


#### Create a Heroku application ####

```shell
heroku create
```

Let's say that our Heroku app name is  <ins>rocky-temple-39</ins>.

Create bucket for AWS S3. Login at [AWS Management Console][2] and create a bucket. The bucket name could be anything like indichai-staging. It is recommended that you do not have a dot in the bucket name. Next configure aws s3 settings in the application.

```shell
heroku config:add S3_ACCESS_KEY_ID=xxxxxxxxxxxxxx --app rocky-temple-39
heroku config:add S3_SECRET_ACCESS_KEY=xxxxxxxxxx --app rocky-temple-39
heroku config:add S3_BUCKET_NAME=xxxxxxxxxxxxxxxx --app rocky-temple-39
```

#### Push your code ####

```shell
git push heroku master
```

#### Run migrations ####

Run migrations by executing following command.

```shell
heroku run rake db:migrate --app rocky-temple-39
```

#### Run setup ####

Configure store with default settings and load products by executing following command.

```shell
heroku run rake nimbleshop:setup:db --app rocky-temple-39
```

#### Visting site ####

Visit staging site at [http://rocky-temple-39.herokuapp.com][3].

[1]: http://nimbleshop.org/getting_started.html
[2]: https://console.aws.amazon.com/s3/home
[3]: http://rocky-temple-39.herokuapp.com
