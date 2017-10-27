class PokemonsController < ApplicationController

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new(name: params[:pokemon][:name], level: 1, health: 100, trainer_id: current_trainer.id, exp: 0)
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
		trainerid = pokemon.trainer_id
		current_health = pokemon.health

		if pokemon.health > 0
			pokemon.update(health: current_health-10)
		end
		#this is the old code associated with destrying a pokemon before healing was implemented
		# if(pokemon.health <= 0)
		# 	pokemon.destroy
		# end

		pokemon_gaining_exp = Pokemon.find(params[:attack][:attacker_id].to_i)
		current_exp = pokemon_gaining_exp.exp
		current_level = pokemon_gaining_exp.level
		pokemon_gaining_exp.update(exp: current_exp+10)
		if(pokemon_gaining_exp.exp >= 100)
			pokemon_gaining_exp.update(level: current_level+1, exp: 0)
		end
		
		redirect_to trainer_path(trainerid)
	end

	def heal
		pokemon = Pokemon.find(params[:id])
		trainerid = pokemon.trainer_id
		current_health = pokemon.health
		if pokemon.health < 100
			pokemon.update(health: current_health+10)
		end
		
		redirect_to trainer_path(trainerid)
	end

end
