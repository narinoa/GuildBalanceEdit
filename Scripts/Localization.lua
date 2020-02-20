Global("localization", nil)

Global("Locales", {
	["rus"] = { -- Russian, Win-1251
    ["GBEHeader"] = "Изменение баланса гильдии",
    ["Message"] = "Баланс успешно изменен!",
    ["Button"] = "Изменить",
    ["Comment"] = "Комментарий",
    ["Size"] = "Сумма в золоте",
    ["Members"] = "Список персонажей",
    ["Accept"] = "Подтвердить операцию",
    ["CheckCorrect"] = "Проверьте корректность ввода",
    ["СheckComm"] = "Добавьте комментарий",
    ["СheckSize"] = "Введите сумму",
    ["СheckMember"] = "Добавьте персонажей",
	},
		
	["eng_eu"] = { -- English, Latin-1
    ["GBEHeader"] = "Guild Balance Edit",
	["Message"] = "Balance changed successfully!",
	["Button"] = "Change",
	["Comment"] = "Comment",
    ["Size"] = "Amount in gold",
    ["Members"] = "List of characters",
    ["Accept"] = "Confirm operation",
	["CheckCorrect"] = "Verify is correct input",
    ["СheckComm"] = "Add comment",
    ["СheckSize"] = "Enter amount",
    ["СheckMember"] = "Add characters",
	}
})

--We can now use an official method to get the client language
localization = common.GetLocalization()
function GTL( strTextName )
	return Locales[ localization ][ strTextName ] or Locales[ "eng_eu" ][ strTextName ] or strTextName
end
