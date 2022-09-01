module Api
  module V1
    class PokemonsController < ApplicationController
      def index
        pokemons = Pokemon.order('created_at DESC')
        render json: { status: 'success', data: pokemons }, status: :ok
      end

      def show
        id = params[:id]
        pokemon = Pokemon.find(id)

        render json: { status: 'success', data: pokemon }, status: :ok
      end

      def create
        new_pokemon = Pokemon.new(article_params)

        if new_pokemon.save
          render json: { status: 'success', data: new_pokemon }, status: :ok
        else
          render json: { status: 'error', data: new_pokemon.errors }, status: :unprocessable_entity
        end
      end

      def update
        updated_pokemon = Pokemon.find(params[:id])

        if updated_pokemon.update(article_params)
          render json: { status: 'success', data: updated_pokemon }, status: :ok
        else
          render json: { status: 'error', data: updated_pokemon.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        deleted_pokemon = Pokemon.find(params[:id])
        deleted_pokemon.destroy

        render json: { status: 'success', data: deleted_pokemon }, status: :ok
      end

      def article_params
        params.permit(:name, :number, :type1, :type2)
      end
    end
  end
end
