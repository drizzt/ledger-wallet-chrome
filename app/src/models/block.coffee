class @Block extends ledger.database.Model
  do @init

  @index 'hash'
  @has many: 'transactions', onDelete: 'destroy'

  @fromJson: (json, context = ledger.database.contexts.main) ->
    @findOrCreate(hash: json['hash'], json, context)

  @lastBlock: (context = ledger.database.contexts.main) ->
    @find({}, context).simpleSort('height', yes).data()[0]