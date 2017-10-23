class PokemonsController < ApplicationController

	def new
		@pokemon = Pokemon.new
	end

	def create
		p '*'*80 
		p params[:pokemon]
		p params[:pokemon][:name]
		@pokemon = Pokemon.new(name: params[:pokemon][:name], level: 1, health: 100, trainer_id: current_trainer.id)
		if @pokemon.save
			redirect_to trainer_path(current_trainer.id)
		else
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to makeform_path
		end
	end

	def capture
		pokemon = Pokemon.find(params[:id])
		pokemon.update(trainer_id: current_trainer.id)

		redirect_to root_path
	end

	def damage
		pokemon = Pokemon.find(params[:id])
		current_health = pokemon.health
		pokemon.update(health: current_health - 10)

		if(pokemon.health <= 0)
			pokemon.destroy
		end
		
		redirect_to trainer_path(current_trainer.id)
	end

end
