# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

InheritedResources.flash_keys = [ :success, :failure ]

# Include your application configuration below
Date::MONTHNAMES = [nil] + %w(Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro)
Date::DAYNAMES = %w(Domingo Segunda-Feira Terça-Feira Quarta-Feira Quinta-Feira Sexta-Feira Sábado)
Date::ABBR_MONTHNAMES = [nil] + %w(Jan Fev Mar Abr Mai Jun Jul Aug Set Out Nov Dez)
Date::ABBR_DAYNAMES = %w(Dom Seg Ter Qua Qui Sex Sab)

Time::MONTHNAMES = Date::MONTHNAMES
Time::DAYNAMES = Date::DAYNAMES
Time::ABBR_MONTHNAMES = Date::ABBR_MONTHNAMES
Time::ABBR_DAYNAMES = Date::ABBR_DAYNAMES