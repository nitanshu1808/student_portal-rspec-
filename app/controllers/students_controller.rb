class StudentsController < ApplicationController
	def index
	end

	def new
	end

	def create
	end

	def show
		@student = Student.find_by(id: params[:id])
	end
end
