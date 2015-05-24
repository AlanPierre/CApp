# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150425165532) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

 
  create_table "cidades", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "estado_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cliente_comentarios", force: :cascade do |t|
    t.string   "comentario", limit: 255
    t.integer  "cliente_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "ancestry",   limit: 255
  end

  add_index "cliente_comentarios", ["ancestry"], name: "index_cliente_comentarios_on_ancestry", using: :btree

  create_table "cliente_contatos", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "email",      limit: 255
    t.integer  "telefone",   limit: 4
    t.string   "observacao", limit: 255
    t.integer  "cliente_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cliente_enderecos", force: :cascade do |t|
    t.integer  "cliente_id",       limit: 4
    t.integer  "cidade_id",        limit: 4
    t.integer  "estado_id",        limit: 4
    t.string   "bairro",           limit: 255
    t.string   "rua",              limit: 255
    t.integer  "numero",           limit: 4
    t.string   "complemento",      limit: 255
    t.string   "cep",              limit: 255
    t.integer  "rota",             limit: 4
    t.string   "name",             limit: 255
    t.integer  "forma_entrega_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "observacao",       limit: 255
  end

  create_table "cliente_faturamentos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cliente_ramos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cliente_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nome_fantasia",          limit: 255
    t.string   "razao_social",           limit: 255
    t.integer  "cnpj",                   limit: 4
    t.string   "inscricao_municipal",    limit: 255
    t.string   "inscricao_estadual",     limit: 255
    t.integer  "cliente_faturamento_id", limit: 4
    t.integer  "cliente_status_id",      limit: 4
    t.integer  "user_id",                limit: 4
    t.string   "observacao",             limit: 255
    t.boolean  "notificacao",            limit: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "cliente_ramo_id",        limit: 4
  end

  create_table "codigo_barras", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "departamentos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "uf",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "forma_entregas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "forma_pagamentos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "impressora_configs", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.boolean  "active",        limit: 1
    t.string   "impressora_id", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "impressoras", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "layouts", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.integer  "cliente_id",              limit: 4
    t.date     "data_aprovacao"
    t.integer  "pedido_layout_status_id", limit: 4
    t.integer  "impressora_id",           limit: 4
    t.integer  "impressora_config_id",    limit: 4
    t.integer  "produto_id",              limit: 4
    t.integer  "material_id",             limit: 4
    t.integer  "codigo_barra_id",         limit: 4
    t.integer  "digitos",                 limit: 4
    t.string   "observacao",              limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "materials_produtos", id: false, force: :cascade do |t|
    t.integer "produto_id",  limit: 4
    t.integer "material_id", limit: 4
  end

  create_table "mix_produtos", force: :cascade do |t|
    t.integer  "produto_id",  limit: 4
    t.integer  "material_id", limit: 4
    t.boolean  "active",      limit: 1
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "orcamento_contatos", force: :cascade do |t|
    t.integer  "orcamento_id", limit: 4
    t.date     "data_contato"
    t.string   "descricao",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "orcamento_item_descricaos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "descricao",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orcamento_items", force: :cascade do |t|
    t.integer  "orcamento_id", limit: 4
    t.integer  "quantidade",   limit: 4
    t.decimal  "preco",                    precision: 10
    t.decimal  "desconto",                 precision: 10
    t.integer  "produto_id",   limit: 4
    t.integer  "material_id",  limit: 4
    t.string   "descricao",    limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "orcamento_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orcamentos", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.integer  "cliente_id",          limit: 4
    t.date     "data_solicitacao"
    t.date     "data_aprovacao"
    t.string   "referencia",          limit: 255
    t.string   "condicoes",           limit: 255
    t.integer  "orcamento_status_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "cliente_endereco_id", limit: 4
  end

  create_table "ordem_procucao_items", force: :cascade do |t|
    t.integer  "ordem_producao_id", limit: 4
    t.integer  "produto_id",        limit: 4
    t.integer  "material_id",       limit: 4
    t.integer  "user_id",           limit: 4
    t.integer  "layout_id",         limit: 4
    t.integer  "quantidade",        limit: 4
    t.integer  "perdas_quantidade", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "ordem_producao_items", force: :cascade do |t|
    t.integer  "ordem_producao_id", limit: 4
    t.integer  "produto_id",        limit: 4
    t.integer  "material_id",       limit: 4
    t.integer  "user_id",           limit: 4
    t.integer  "layout_id",         limit: 4
    t.integer  "quantidade",        limit: 4
    t.integer  "perdas_quantidade", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "ordem_producao_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ordem_producaos", force: :cascade do |t|
    t.integer  "cliente_id",               limit: 4
    t.integer  "user_id",                  limit: 4
    t.integer  "ordem_producao_status_id", limit: 4
    t.date     "data_solicitacao"
    t.date     "data_entrega_previsao"
    t.date     "data_pdf"
    t.date     "data_finalizacao"
    t.date     "data_entrega"
    t.boolean  "abrir_pasta",              limit: 1
    t.boolean  "recibo",                   limit: 1
    t.boolean  "nota_fiscal",              limit: 1
    t.string   "dados_variaveis",          limit: 255
    t.string   "detalhes",                 limit: 255
    t.string   "detalhes_entrega",         limit: 255
    t.string   "tipo",                     limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "pedido_layout_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pedido_venda_items", force: :cascade do |t|
    t.integer  "pedido_venda_id", limit: 4
    t.integer  "quantidade",      limit: 4
    t.decimal  "valor",                     precision: 10
    t.decimal  "desconto",                  precision: 10
    t.integer  "mix_produto_id",  limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "material_id",     limit: 4
    t.integer  "produto_id",      limit: 4
  end

  create_table "pedido_venda_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pedido_vendas", force: :cascade do |t|
    t.integer  "user_id",                limit: 4
    t.integer  "cliente_id",             limit: 4
    t.date     "data_solicitacao"
    t.string   "detalhes",               limit: 255
    t.boolean  "recibo",                 limit: 1
    t.boolean  "nota_fiscal",            limit: 1
    t.integer  "forma_pagamento_id",     limit: 4
    t.integer  "pedido_venda_status_id", limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ribbons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "active",     limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "login",                  limit: 255
    t.integer  "departamento_id",        limit: 4
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roles_mask",             limit: 4
  end

  add_index "users", ["departamento_id"], name: "index_users_on_departamento_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
