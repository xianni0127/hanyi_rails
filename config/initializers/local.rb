I18n.load_path +=Dir[Rails.root.join('app','locale','*.{po}')]
I18n.available_locales = [:en, :pt,:de, :pl, :en_PR]
I18n.default_locale = :de
