# Q0: Why is this error being thrown?

	A0: The error is being thrown becasue we have not made the Pokemon model yet.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

	A1: The wild pokemon are being produced by first generating a list of existing pokemon who do not have a trainer and then randomly (using .sample) chosing one of those pokemon to render on the view. The common factor between all wild pokemon that appear is that they do not have a triner.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

	A2: The button, with display name "Throw a Pokeball!", when pressed will send a patch request to the capture_path which is a path shortcut specified in the prefix section of the corresponding route in routes.rb. This will let it know what URL to go to (the prefix path is mapped to a url path and a method). Along this request, the client will send, as params, with a key :id and a value @pokemon (in this case, the integer id corresponding to the wild pokemon we are trying to catch).
# Question 3: What would you name your own Pokemon?

	A3: Craig

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

	A4: I passed in the trainer id of the owner of the pokemon being damaged into the trainer path shortcut, as so: redirect_to trainer_path(trainerid) (I store the pokemon's .trainer_id in a variable called trainerid, I do this at the begingin of the method before any destroying takes place, just in case the pokemon get's destroyed we still know which trainer to redirect to). 
	You can do this because trainer_path maps to GET /trainers/:id(.:format), where the argument we pass in is the id of the
	owner trainer. This works because devise has given that route the prefix trainer and because the pokemon we are damaging is associated with the trainer through id and we can use that id to redirect to their profile.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

	A5: When an error occurs, in this case, it is stored in @pokemon as an error attribute. Flash is a temperary session which goes away after the next request. So here is setting flash to have a key called error with the error caused when submitting the form. Now the reason this gets displayed when the page is rendered is because in application.html.erb there is a section of code that searches flash for any types of messages, including error messages. Application.html.erb is a layout and therefor is run prior to rendinering a view. 

# Give us feedback on the project and decal below!

	This was fun! I hope that now that we have learned most of the material that we can have a runthrough frequently used commands and commands we have learned. I would also love a lecture on debugging in rails. I have spent hours trying to figure out how to make a form or how the params look. Figuring out how a method or form is sending information in params and how it looks is one of my biggest time sinks.

# Extra credit: Link your Heroku deployed app
