class ComentariosController < ApplicationController
	before_action :find_foro
	before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
	before_action :find_comment, only: [:destroy, :edit, :update]

	def create
		@comentario = @foro.comentarios.create(params[:comentario].permit(:contenido))
		@comentario.usuario_id = current_usuario.id
		@comentario.save

		if @comentario.save
			redirect_to foro_path(@foro)
		else
			render 'new'
		end
	end

	def destroy
		@comentario.destroy
		redirect_to foro_path(@foro)
	end

	def edit
		
	end

	def update
		if @comentario.update(params[:comentario].permit(:contenido))
			redirect_to foro_path(@foro)
		else
			render 'new'
		end
		
	end

	private

	def find_foro
		@foro = Foro.find(params[:foro_id])
		
	end

	def find_comment
		@comentario = @foro.comentarios.find(params[:id])
		
	end

	def comment_owner
		unless current_usuario.id == @comentario.usuario_id
			flash[:notice] = "You shall not pass!"
			redirect_to @foro
		end
	end
end
