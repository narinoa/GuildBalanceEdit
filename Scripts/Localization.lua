Global("localization", nil)

Global("Locales", {
	["rus"] = { -- Russian, Win-1251
    ["GBEHeader"] = "��������� ������� �������",
    ["Message"] = "������ ������� �������!",
    ["Button"] = "��������",
    ["Comment"] = "�����������",
    ["Size"] = "����� � ������",
    ["Members"] = "������ ����������",
    ["Accept"] = "����������� ��������",
    ["CheckCorrect"] = "��������� ������������ �����",
    ["�heckComm"] = "�������� �����������",
    ["�heckSize"] = "������� �����",
    ["�heckMember"] = "�������� ����������",
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
    ["�heckComm"] = "Add comment",
    ["�heckSize"] = "Enter amount",
    ["�heckMember"] = "Add characters",
	}
})

--We can now use an official method to get the client language
localization = common.GetLocalization()
function GTL( strTextName )
	return Locales[ localization ][ strTextName ] or Locales[ "eng_eu" ][ strTextName ] or strTextName
end
