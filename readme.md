# Quick Start
This is a repo to quickly start up new projects.


<br/>


### How to use?
Features can be added by simply using git. Some branch combinations
may have some small conflicts, but you're a smart cookie.


<br/>


### What to do after manually merging branches?
After merging branches, you need you can use your favorite IDE to:
1) Find and replace the following words to rename the project to what you want:
    * `QuickStart` -> `ProjectName`
    * `quick-start` -> `project-name`
    * `quick_start` -> `project_name`
2) Then Update `secret_key_base` in `config/secrets.yml`
3) Then Run `bundle install`, `npm install`, or any alternative package manager
4) Lastly, ofc, remove this readme and `QUICK_START` folder.

##### Example
```bash
git clone git@github.com:EdCordata/quick-start.git project-name
cd project-name
git merge --no-ff origin/rails-6
git merge --no-ff origin/rails-6-mysql
git merge --no-ff origin/rails-6-redis-resque
```


<br/>


### Documentation
Some branches include others and even require other branches
to be merged before them. See list bellow.

List of these requirements are listed bellow:
<table>
  <thead>
    <tr>
      <td>Branch name</td>
      <td>Branches included</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>rails-6</td>
      <td></td>
    </tr>
    <tr>
      <td>rails-6-pg</td>
      <td>rails-6</td>
    </tr>
    <tr>
      <td>rails-6-mysql</td>
      <td>rails-6</td>
    </tr>
    <tr>
      <td>rails-6-redis</td>
      <td>rails-6</td>
    </tr>
    <tr>
      <td>rails-6-redis-resque</td>
      <td>rails-6, rails-6-redis</td>
    </tr>
    <tr>
      <td>rails-6-bootstrap</td>
      <td>rails-6</td>
    </tr>
    <tr>
      <td>rails-6-bootstrap-users</td>
      <td>rails-6, rails-6-bootstrap</td>
    </tr>
    <tr>
      <td>rails-6-bootstrap-admin</td>
      <td>rails-6, rails-6-bootstrap</td>
    </tr>
    <tr>
      <td>rails-6-bootstrap-admin-users</td>
      <td>rails-6, rails-6-bootstrap, rails-6-bootstrap-admin, rails-6-bootstrap-users</td>
    </tr>
  </tbody>
</table>


<br/>


##### Branch features
* [rails-6](QUICK_START/docs/rails-6.md)
* [rails-6-pg](QUICK_START/docs/rails-6-pg.md)
* [rails-6-mysql](QUICK_START/docs/rails-6-mysql.md)
* [rails-6-redis](QUICK_START/docs/rails-6-redis.md)
* [rails-6-redis-resque](QUICK_START/docs/rails-6-redis-resque.md)
* [rails-6-bootstrap](QUICK_START/docs/rails-6-bootstrap.md)
* [rails-6-bootstrap-users](QUICK_START/docs/rails-6-bootstrap-users.md)
* [rails-6-bootstrap-admin](QUICK_START/docs/rails-6-bootstrap-admin.md)
* [rails-6-bootstrap-admin-users](QUICK_START/docs/rails-6-bootstrap-admin-users.md)
