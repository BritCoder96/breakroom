class ThemesController < ApplicationController
    before_action :authenticate_user!

    def index
        @themes = Theme.where(organization_id: [current_user.organization_id, nil]).includes(:topics).load
    end

    def new
        @theme = Theme.new
    end

    def show
        @theme = Theme.find_by(id: params[:id])
        @themes = Theme.where(organization_id: [current_user.organization_id, nil]).includes(:topics).load
    end

    def create
        @theme = Theme.new(theme_params)
        if @theme.save
            flash[:notice] = 'Theme added!'
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        @theme = Theme.find(params[:id])
    end

    def update
        @theme = Theme.find(params[:id])

        if @theme.update_attributes(theme_params)
            redirect_to @theme
        else
          render 'edit'
        end
    end

    def destroy
        @theme = Theme.find(params[:id]).destroy
        flash[:notice] = "User deleted"
        redirect_to root_path
    end

    private

    def theme_params
        params.require(:theme).permit(:name, :organization_id)
    end
end
