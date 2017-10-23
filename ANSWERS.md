# Q0: Why is this error being thrown?

	A0: The error is being thrown becasue we have not made the Pokemon model yet.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

	A1: The wild pokemon are being produced by first generating a list of existing pokemon who do not have a trainer and then randomly (using .sample) chosing one of those pokemon to render on the view. The common factor between all wild pokemon that appear is that they do not have a triner.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

# Question 3: What would you name your own Pokemon?

	A3: Craig

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

	A4: I passed in the current trainer's id into the trainer path shortcut, as so: redirect_to trainer_path(current_trainer.id). 
		You can do this because trainer_path maps to GET /trainers/:id(.:format), where the argument we pass in is the id of the
		current trainer. This works because devise has given that route the prefix trainer and because devise has stored the identity of the current trainer in the variable current_trainer.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app
