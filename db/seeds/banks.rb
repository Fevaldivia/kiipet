puts "loading ruby #{__FILE__}"

cc = BankAccountType.find_or_create_by name: 'Cuenta Corriente'
cv = BankAccountType.find_or_create_by name: 'Cuenta Vista'
cr = BankAccountType.find_or_create_by name: 'Cuenta Rut'
ce = BankAccountType.find_or_create_by name: 'Chequera Electrónica'
ca = BankAccountType.find_or_create_by name: 'Cuenta de Ahorro'



Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Santander')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Santander Banefe')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco BBVA')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco BICE')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Internacional')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Itaú')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco de Chile / Edwards-Citi')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Corpbanca')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Banco Crédito e Inversiones')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco del Desarrollo')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Falabella')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Security')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Scotiabank')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Rabobank')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'HSBC Bank')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Ripley')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Paris')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, ca.id]).find_or_create_by(name: 'Banco Consorcio')
Bank.create_with(bank_account_type_ids: [cc.id, cv.id, cr.id, ce.id, ca.id]).find_or_create_by(name: 'Banco Estado')
