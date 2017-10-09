class VendasController < ApplicationController

    def new
        @vendas = Vendas.new
    end

    def create
        begin
            receita_bruta = Vendas.processa_arquivo params[:vendas][:file_name]
            flash[:success] = "A receita bruta total das vendas informadas no arquivo é de R$ #{receita_bruta}"
            
        rescue => e 
            flash[:error] = "Erro ao fazer o upload do arquivo!"
        end

        redirect_to "/vendas/new"
    end
end
