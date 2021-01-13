namespace :dev do

  DEFAULT_PASSWORD = 123456  

    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
      if Rails.env.development?
        show_spinner("Apagando BD...") { %x(rails db:drop) }
        show_spinner("Criando BD...") { %x(rails db:create) }
        show_spinner("Migrando BD...") { %x(rails db:migrate) }
        show_spinner("Cadastrando o administrador padrão...") { %x(rails dev:add_default_admin) }
        show_spinner("Cadastrando os administradores extras...") { %x(rails dev:add_extra_admins) }
        show_spinner("Cadastrando os usuários padrões...") { %x(rails dev:add_extra_users) }
        show_spinner("Cadastrando os usuários mamão...") { %x(rails dev:add_extra_papaya) }
        show_spinner("Adicionando Funções...") { %x(rails dev:add_function) }
        show_spinner("Adicionando Cargos...") { %x(rails dev:add_office) }
        show_spinner("Adicionando Valores de hora...") { %x(rails dev:add_financial) }
        show_spinner("Adicionando Vinculos...") { %x(rails dev:add_bond) }
        show_spinner("Adicionando Escalas...") { %x(rails dev:add_schedule) } 
        show_spinner("Adicionando Setores...") { %x(rails dev:add_sector) } 
      else
        puts "Você não está em ambiente de desenvolvimento!"
      end
    end
  
  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    User.create!(
      name: 'italo.david',
      document: '123456',
      role: 2,
      status: 0,
      notes: 'ok',
      email: 'italo@gmail.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona administradores extras"
  task add_extra_admins: :environment do
    2.times do |i|
      User.create!(
        name: Faker::Name.name,
        role: 2,
        status: 0,
        notes: 'ok',
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona usuários extras"
  task add_extra_users: :environment do
    2.times do |i|
      User.create!(
        name: Faker::Name.name,
        role: 0,
        status: 0,
        notes: 'ok',
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona usuários mamão "
  task add_extra_papaya: :environment do
    2.times do |i|
      User.create!(
        name: Faker::Name.name,
        role: 1,
        status: 0,
        notes: 'ok',
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adicionar Função"
  task add_function: :environment do
    10.times do |i|
      Function.create!(
        namefunction: Faker::Job.field 
      )
    end  
  end


  desc "Adicionar Cargo"
  task add_office: :environment do
    10.times do |i|
      Office.create!(
        description: Faker::Job.position
      )
    end  
  end

  desc "Adicionar Valor da Hora"
  task add_financial: :environment do
    10.times do |i|
      Financial.create!(
        hourvalue: Faker::Number.within(range: 8..20)
      )
    end  
  end

  desc "Adicionar Vinculo"
  task add_bond: :environment do
    10.times do |i|
      Bond.create!(
        company: Faker::Company.name,
        description: Faker::Company.type,
        responsible: Faker::DcComics.hero,
        admission: Faker::Date.in_date_period
      )
    end  
  end

  desc "Adicionar Escala"
  task add_schedule: :environment do
    10.times do |i|
      Schedule.create!(
        typo: Faker::Job.employment_type,
        description: Faker::Job.education_level
      )
    end  
  end

  desc "Adicionar Setor"
  task add_sector: :environment do
    10.times do |i|
      Sector.create!(
        description: Faker::Job.employment_type,
        initials: Faker::Name.initials,
        parentsector: Faker::Name.initials,
        collaboratorresp: Faker::DcComics.hero
      )
    end  
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end
end