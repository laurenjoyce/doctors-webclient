class DoctorsController < ApplicationController
  def index
    @doctors = Unirest.get("http://localhost:3000/api/v1/doctors.json").body
    render "index.html.erb"
  end

  def show
    @doctor = Unirest.get("http://localhost:3000/api/v1/doctors/1").body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create 
    @doctor = Unirest.post(
      "http://localhost:3000/api/v1/doctors", 
      headers: { "Accept" => "application/json"},
      parameters: { 
        first_name: params[:first_name], 
        last_name: params[:last_name], 
        practice: params[:practice], 
        university: params[:university]
      }
    ).body
    redirect_to "/doctors/#{@doctor['id']}"
  end
end
