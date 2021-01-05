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
        show_spinner("Cadastrando os colaboradores...") { %x(rails dev:add_colaborattors) }
        show_spinner("Adicionar Função...") { %x(rails dev:add_function) }
        show_spinner("Adicionar Função Extra...") { %x(rails dev:add_function_extra) }
        show_spinner("Adicionar Cargo...") { %x(rails dev:add_office) }
        show_spinner("Adicionar Cargo Extra...") { %x(rails dev:add_office_extra) }
        show_spinner("Adicionar Valor da hora...") { %x(rails dev:add_financial) }
        show_spinner("Adicionar Valor da hora Extra...") { %x(rails dev:add_financial_extra) }
        show_spinner("Adicionar Vinculo...") { %x(rails dev:add_bond) }
        show_spinner("Adicionar Vinculo Extra...") { %x(rails dev:add_bond_extra) }
        show_spinner("Adicionar Setor...") { %x(rails dev:add_sector) }
        show_spinner("Adicionar Setor Extra...") { %x(rails dev:add_sector_extra) } 
        show_spinner("Adicionar Escala...") { %x(rails dev:add_schedule) } 
        show_spinner("Adicionar Escala Extra...") { %x(rails dev:add_schedule_extra) }
        show_spinner("Adicionar Horário...") { %x(rails dev:add_dailyhour) }
        show_spinner("Adicionar Horário Extra...") { %x(rails dev:add_dailyhour_extra) }
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

  dates_list = []
  10.times do
    dates_list << Time.now - rand(1..365).day
  end

  desc "Adiciona colaboradores "
  task add_colaborattors: :environment do
    50.times do |i|
      Colaborattor.create!(
        colaborattorname: Faker::Name.name,
        birthdate: dates_list.sample,
        gender: %i[male female].sample,
        email: Faker::Internet.email,
        status: %i[active inactive].sample,
        instruction: %i[middlelevel higherlevel].sample,
        pendecy: %i[complete pending].sample
      )
    end
  end

  desc "Adicionar Função"
  task add_function: :environment do
      Function.create!(
        namefunction: 'Técnico em enfermagem' 
      )
  end

  desc "Adicionar Função Extra "
  task add_function_extra: :environment do
      Function.create!(
        namefunction: 'Analista de RH' 
      )
  end

  desc "Adicionar Cargo "
  task add_office: :environment do
      Office.create!(
        description: 'Analista' 
      )
  end

  desc "Adicionar Cargo Extra"
  task add_office_extra: :environment do
      Office.create!(
        description: 'Técnico' 
      )
  end

  desc "Adicionar Valor da Hora"
  task add_financial: :environment do
      Financial.create!(
        hourvalue: '8,00'
      )
  end

  desc "Adicionar Valor da Hora extra"
  task add_financial_extra: :environment do
      Financial.create!(
        hourvalue: '12,00'
      )
  end

  desc "Adicionar Vinculo"
  task add_bond: :environment do
      Bond.create!(
        company: 'Coopvita',
        description: 'Cooperativa ADM',
        responsible: 'Antonio'
      )
  end

  desc "Adicionar Vinculo extra"
  task add_bond_extra: :environment do
      Bond.create!(
        company: 'Coopsersa',
        description: 'Cooperativa ENF',
        responsible: 'Samara'
      )
  end

  desc "Adicionar Setor"
  task add_sector: :environment do
      Sector.create!(
        description: 'Recursos Humanos',
        initials: 'APES',
        parentsector: 'GADH'
      )
  end

  desc "Adicionar Setor extra"
  task add_sector_extra: :environment do
      Sector.create!(
        description: 'Informatica',
        initials: 'NATI',
        parentsector: 'GADH'
      )
  end

  desc "Adicionar Escala"
  task add_schedule: :environment do
      Schedule.create!(
        typo: '12x36',
        description: 'Plantão'
      )
  end

  desc "Adicionar Escala Extra"
  task add_schedule_extra: :environment do
      Schedule.create!(
        typo: '8x5',
        description: 'Diarista'
      )
  end

  desc "Adicionar Horário"
  task add_dailyhour: :environment do
      DailyHour.create!(
        shift: 'Plantão',
        description: 'Colaborador Plantonista'
      )
  end

  desc "Adicionar Horário Extra"
  task add_dailyhour_extra: :environment do
      DailyHour.create!(
        shift: 'Diarista',
        description: 'Colaborador Diarista'
      )
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end
end