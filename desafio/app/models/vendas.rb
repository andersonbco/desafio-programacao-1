class Vendas < ApplicationRecord
    attr_accessor :file_name

    def self.processa_arquivo arquivo_vendas
        receita_bruta = 0.0
        puts "dentro do processa arquivo"
        File.foreach( arquivo_vendas.path ).with_index do |line, index| 
            
            next if index == 0
            puts "processando arquivo"
            puts index
            puts line
            linha_venda = line.split(/\t/)
            Vendas.create(
                :purchaser_name => linha_venda[0],
                :item_description => linha_venda[1],
                :item_price => linha_venda[2],
                :purchase_count => linha_venda[3],
                :merchant_address => linha_venda[4],
                :merchant_name => linha_venda[5]
            )
            receita_bruta += linha_venda[2].to_f * linha_venda[3].to_i
        end
        return receita_bruta
    end


end
