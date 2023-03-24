# e-hotels
This is for the e-hotel.

# Flask 🌶
Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries. (Taken from wikipedia).

Flask allows you to easily connect static html to a database of some kind. All you need is the database running, the credentials to access it (which you pass in the datatabase configuration .py file), and some template html to fill. 

You will find under the `/templates` folder the template .html files. They are called templates because as you will see upon opening them, the content is not entirely filled. It has special tags like `{% block title %} {% endblock %}` embedded in the html. These tags are called [Jinja](https://jinja.palletsprojects.com/en/3.1.x/). It allows you to add more 'code-like' functionality to basic html.

These include:
- looping through lists to fill a page with info from a database (see index.html line 5)
- variables to change the content (see any of the html files with the block notation)
- basically that's it

Then, in the app.py file, you create functions that request/post information to and from the database, and you pass that data as variables to the `render_template()` function, which in turn render the page. See the app.py file to understand.

Then, once you do `flask run`, you can access the page at the 5000 port and it should look something like this.
![image](https://user-images.githubusercontent.com/104949576/227397496-66ba9f17-3f81-48ee-ac25-c7e13a838887.png)
![image](https://user-images.githubusercontent.com/104949576/227397597-3bf44821-cad6-45b3-9401-ea6b1e9a7773.png)
![image](https://user-images.githubusercontent.com/104949576/227397616-628d48bf-2374-42a3-8c75-8d7e13696dc5.png)


