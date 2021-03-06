class SpeciesController < ApplicationController

  def index
    @species = Species.all
    @locations = Location.all
    render('species/index.html.erb')
  end

  def new
    @species = Species.all
    @new_species = Species.create({name: params[:name]})
    render('species/index.html.erb')
  end

  def view
    @species = Species.find_by(id: params[:id])
    @locations = Location.all
    render('species/view.html.erb')
  end

  def delete
    @locations = Location.all
    @species = Species.all
    @this_species = Species.find_by(id: params[:id])
    @this_species.destroy
    render('species/index.html.erb')
  end

  def edit
    @locations = Location.all
    @species = Species.find_by(id: params[:id])
    @species.name = params[:name]
    @species.save
    render('species/view.html.erb')
  end

  def new_sighting
    @locations = Location.all
    @species = Species.find_by(id: params[:id])
    @sighted_location = Location.find_by(id: params[:location])
    @species.locations << @sighted_location
    render('species/view.html.erb')
  end
end
