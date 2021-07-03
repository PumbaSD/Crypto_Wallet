module ApplicationHelper
    def idioma()
        I18n.locale == :en ? "Inglês-EUA" : "Português-BR"
    end
end