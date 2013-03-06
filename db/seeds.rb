#!/bin/env ruby
# encoding: utf-8

def find_out_what_table(id)
    @country_id = nil
    @operation_id = nil
    @unit_id = nil
    @date_id = nil
    if country = Country.find_by_old_id(id)
        @country_id = country.id
    elsif operation = Operation.find_by_old_id(id)
        @operation_id = operation.id
    elsif unit = Unit.find_by_old_id(id)
        @unit_id = unit.id
    elsif date = EventDate.find_by_old_id(id)
        @date_id = date.name
    else
        return
    end
end

EventDate.destroy_all

EventDate.create([
    {:old_id=>988, :name=>"1944-06-04"}, {:old_id=>879, :name=>"1944-06-05"}, {:old_id=>8, :name=>"1944-06-06"}, {:old_id=>7, :name=>"1944-06-07"}, {:old_id=>9, :name=>"1944-06-08"}, {:old_id=>10, :name=>"1944-06-09"}, {:old_id=>11, :name=>"1944-06-10"}, {:old_id=>12, :name=>"1944-06-11"}, {:old_id=>13, :name=>"1944-06-12"}, {:old_id=>14, :name=>"1944-06-13"}, {:old_id=>15, :name=>"1944-06-14"}, {:old_id=>16, :name=>"1944-06-15"}, {:old_id=>17, :name=>"1944-06-16"}, {:old_id=>18, :name=>"1944-06-17"}, {:old_id=>20, :name=>"1944-06-18"}, {:old_id=>21, :name=>"1944-06-19"}, {:old_id=>22, :name=>"1944-06-20"}, {:old_id=>23, :name=>"1944-06-21"}, {:old_id=>24, :name=>"1944-06-22"}, {:old_id=>25, :name=>"1944-06-23"}, {:old_id=>26, :name=>"1944-06-24"}, {:old_id=>27, :name=>"1944-06-25"}, {:old_id=>28, :name=>"1944-06-26"}, {:old_id=>29, :name=>"1944-06-27"}, {:old_id=>30, :name=>"1944-06-28"}, {:old_id=>31, :name=>"1944-06-29"}, {:old_id=>32, :name=>"1944-06-30"}, {:old_id=>33, :name=>"1944-07-01"}, {:old_id=>34, :name=>"1944-07-02"}, {:old_id=>35, :name=>"1944-07-03"}, {:old_id=>36, :name=>"1944-07-04"}, {:old_id=>37, :name=>"1944-07-05"}, {:old_id=>38, :name=>"1944-07-06"}, {:old_id=>39, :name=>"1944-07-07"}, {:old_id=>40, :name=>"1944-07-08"}, {:old_id=>41, :name=>"1944-07-09"}, {:old_id=>42, :name=>"1944-07-10"}, {:old_id=>43, :name=>"1944-07-11"}, {:old_id=>44, :name=>"1944-07-12"}, {:old_id=>45, :name=>"1944-07-13"}, {:old_id=>46, :name=>"1944-07-14"}, {:old_id=>47, :name=>"1944-07-15"}, {:old_id=>48, :name=>"1944-07-16"}, {:old_id=>49, :name=>"1944-07-17"}, {:old_id=>50, :name=>"1944-07-18"}, {:old_id=>51, :name=>"1944-07-19"}, {:old_id=>52, :name=>"1944-07-20"}, {:old_id=>53, :name=>"1944-07-21"}, {:old_id=>54, :name=>"1944-07-22"}, {:old_id=>55, :name=>"1944-07-23"}, {:old_id=>56, :name=>"1944-07-24"}, {:old_id=>57, :name=>"1944-07-25"}, {:old_id=>58, :name=>"1944-07-26"}, {:old_id=>59, :name=>"1944-07-27"}, {:old_id=>60, :name=>"1944-07-28"}, {:old_id=>61, :name=>"1944-07-29"}, {:old_id=>62, :name=>"1944-07-30"}, {:old_id=>63, :name=>"1944-07-31"}, {:old_id=>64, :name=>"1944-08-01"}, {:old_id=>65, :name=>"1944-08-02"}, {:old_id=>66, :name=>"1944-08-03"}, {:old_id=>67, :name=>"1944-08-04"}, {:old_id=>68, :name=>"1944-08-05"}, {:old_id=>69, :name=>"1944-08-06"}, {:old_id=>70, :name=>"1944-08-07"}, {:old_id=>71, :name=>"1944-08-08"}, {:old_id=>72, :name=>"1944-08-09"}, {:old_id=>73, :name=>"1944-08-10"}, {:old_id=>74, :name=>"1944-08-11"}, {:old_id=>75, :name=>"1944-08-12"}, {:old_id=>76, :name=>"1944-08-13"}, {:old_id=>77, :name=>"1944-08-14"}, {:old_id=>78, :name=>"1944-08-15"}, {:old_id=>79, :name=>"1944-08-16"}, {:old_id=>97, :name=>"1944-08-17"}, {:old_id=>83, :name=>"1944-08-18"}, {:old_id=>84, :name=>"1944-08-19"}, {:old_id=>85, :name=>"1944-08-20"}, {:old_id=>86, :name=>"1944-08-21"}, {:old_id=>87, :name=>"1944-08-22"}, {:old_id=>88, :name=>"1944-08-23"}, {:old_id=>89, :name=>"1944-08-24"}, {:old_id=>90, :name=>"1944-08-25"}, {:old_id=>91, :name=>"1944-08-26"}, {:old_id=>92, :name=>"1944-08-27"}, {:old_id=>93, :name=>"1944-08-28"}, {:old_id=>94, :name=>"1944-08-29"}, {:old_id=>95, :name=>"1944-08-30"}, {:old_id=>96, :name=>"1944-08-31"}, {:old_id=>98, :name=>"1944-09-01"}, {:old_id=>99, :name=>"1944-09-02"}, {:old_id=>100, :name=>"1944-09-03"}, {:old_id=>101, :name=>"1944-09-04"}, {:old_id=>102, :name=>"1944-09-05"}, {:old_id=>103, :name=>"1944-09-06"}, {:old_id=>104, :name=>"1944-09-07"}, {:old_id=>105, :name=>"1944-09-08"}, {:old_id=>106, :name=>"1944-09-09"}, {:old_id=>107, :name=>"1944-09-10"}, {:old_id=>108, :name=>"1944-09-11"}, {:old_id=>109, :name=>"1944-09-12"}, {:old_id=>110, :name=>"1944-09-13"}, {:old_id=>111, :name=>"1944-09-14"}, {:old_id=>112, :name=>"1944-09-15"}, {:old_id=>113, :name=>"1944-09-16"}, {:old_id=>114, :name=>"1944-09-17"}, {:old_id=>115, :name=>"1944-09-18"}, {:old_id=>116, :name=>"1944-09-19"}, {:old_id=>117, :name=>"1944-09-20"}, {:old_id=>118, :name=>"1944-09-21"}, {:old_id=>119, :name=>"1944-09-22"}, {:old_id=>120, :name=>"1944-09-23"}, {:old_id=>121, :name=>"1944-09-24"}, {:old_id=>122, :name=>"1944-09-25"}, {:old_id=>123, :name=>"1944-09-26"}, {:old_id=>124, :name=>"1944-09-27"}, {:old_id=>125, :name=>"1944-09-28"}, {:old_id=>126, :name=>"1944-09-29"}, {:old_id=>127, :name=>"1944-09-30"}, {:old_id=>128, :name=>"1944-10-01"}, {:old_id=>129, :name=>"1944-10-02"}, {:old_id=>130, :name=>"1944-10-03"}, {:old_id=>131, :name=>"1944-10-04"}, {:old_id=>132, :name=>"1944-10-05"}, {:old_id=>133, :name=>"1944-10-06"}, {:old_id=>134, :name=>"1944-10-07"}, {:old_id=>135, :name=>"1944-10-08"}, {:old_id=>136, :name=>"1944-10-09"}, {:old_id=>137, :name=>"1944-10-10"}, {:old_id=>138, :name=>"1944-10-11"}, {:old_id=>139, :name=>"1944-10-12"}, {:old_id=>140, :name=>"1944-10-13"}, {:old_id=>141, :name=>"1944-10-14"}, {:old_id=>142, :name=>"1944-10-15"}, {:old_id=>143, :name=>"1944-10-16"}, {:old_id=>144, :name=>"1944-10-17"}, {:old_id=>145, :name=>"1944-10-18"}, {:old_id=>146, :name=>"1944-10-19"}, {:old_id=>147, :name=>"1944-10-20"}, {:old_id=>149, :name=>"1944-10-21"}, {:old_id=>150, :name=>"1944-10-22"}, {:old_id=>151, :name=>"1944-10-23"}, {:old_id=>152, :name=>"1944-10-24"}, {:old_id=>153, :name=>"1944-10-25"}, {:old_id=>154, :name=>"1944-10-26"}, {:old_id=>155, :name=>"1944-10-27"}, {:old_id=>156, :name=>"1944-10-28"}, {:old_id=>157, :name=>"1944-10-29"}, {:old_id=>158, :name=>"1944-10-30"}, {:old_id=>159, :name=>"1944-10-31"}, {:old_id=>160, :name=>"1944-11-01"}, {:old_id=>161, :name=>"1944-11-02"}, {:old_id=>162, :name=>"1944-11-03"}, {:old_id=>163, :name=>"1944-11-04"}, {:old_id=>164, :name=>"1944-11-05"}, {:old_id=>165, :name=>"1944-11-06"}, {:old_id=>166, :name=>"1944-11-07"}, {:old_id=>167, :name=>"1944-11-08"}, {:old_id=>168, :name=>"1944-11-09"}, {:old_id=>170, :name=>"1944-11-10"}, {:old_id=>173, :name=>"1944-11-11"}, {:old_id=>174, :name=>"1944-11-12"}, {:old_id=>175, :name=>"1944-11-13"}, {:old_id=>176, :name=>"1944-11-14"}, {:old_id=>177, :name=>"1944-11-15"}, {:old_id=>178, :name=>"1944-11-16"}, {:old_id=>179, :name=>"1944-11-17"}, {:old_id=>180, :name=>"1944-11-18"}, {:old_id=>181, :name=>"1944-11-19"}, {:old_id=>182, :name=>"1944-11-20"}, {:old_id=>183, :name=>"1944-11-21"}, {:old_id=>184, :name=>"1944-11-22"}, {:old_id=>185, :name=>"1944-11-23"}, {:old_id=>186, :name=>"1944-11-24"}, {:old_id=>187, :name=>"1944-11-25"}, {:old_id=>188, :name=>"1944-11-26"}, {:old_id=>189, :name=>"1944-11-27"}, {:old_id=>190, :name=>"1944-11-28"}, {:old_id=>191, :name=>"1944-11-29"}, {:old_id=>192, :name=>"1944-11-30"}, {:old_id=>194, :name=>"1944-12-01"}, {:old_id=>195, :name=>"1944-12-02"}, {:old_id=>196, :name=>"1944-12-03"}, {:old_id=>197, :name=>"1944-12-04"}, {:old_id=>198, :name=>"1944-12-05"}, {:old_id=>199, :name=>"1944-12-06"}, {:old_id=>200, :name=>"1944-12-07"}, {:old_id=>201, :name=>" 1944-12-08"}, {:old_id=>202, :name=>"1944-12-09"}, {:old_id=>203, :name=>"1944-12-10"}, {:old_id=>204, :name=>"1944-12-11"}, {:old_id=>205, :name=>"1944-12-12"}, {:old_id=>206, :name=>"1944-12-13"}, {:old_id=>207, :name=>"1944-12-14"}, {:old_id=>208, :name=>"1944-12-15"}, {:old_id=>209, :name=>"1944-12-16"}, {:old_id=>211, :name=>"1944-12-17"}, {:old_id=>213, :name=>"1944-12-18"}, {:old_id=>214, :name=>"1944-12-19"}, {:old_id=>215, :name=>"1944-12-20"}, {:old_id=>216, :name=>"1944-12-21"}, {:old_id=>217, :name=>"1944-12-22"}, {:old_id=>218, :name=>"1944-12-23"}, {:old_id=>219, :name=>"1944-12-24"}, {:old_id=>220, :name=>"1944-12-25"}, {:old_id=>221, :name=>"1944-12-26"}, {:old_id=>222, :name=>"1944-12-27"}, {:old_id=>223, :name=>"1944-12-28"}, {:old_id=>224, :name=>"1944-12-29"}, {:old_id=>225, :name=>"1944-12-30"}, {:old_id=>226, :name=>"1944-12-31"}, {:old_id=>227, :name=>"1945-01-01"}, {:old_id=>248, :name=>"1945-01-02"}, {:old_id=>249, :name=>"1945-01-03"}, {:old_id=>250, :name=>"1945-01-04"}, {:old_id=>251, :name=>"1945-01-05"}, {:old_id=>252, :name=>"1945-01-06"}, {:old_id=>253, :name=>"1945-01-07"}, {:old_id=>254, :name=>"1945-01-08"}, {:old_id=>255, :name=>"1945-01-09"}, {:old_id=>256, :name=>"1945-01-10"}, {:old_id=>257, :name=>"1945-01-11"}, {:old_id=>258, :name=>"1945-01-12"}, {:old_id=>259, :name=>"1945-01-13"}, {:old_id=>260, :name=>"1945-01-14"}, {:old_id=>261, :name=>"1945-01-15"}, {:old_id=>262, :name=>"1945-01-16"}, {:old_id=>263, :name=>"1945-01-17"}, {:old_id=>264, :name=>"1945-01-18"}, {:old_id=>265, :name=>"1945-01-19"}, {:old_id=>266, :name=>"1945-01-20"}, {:old_id=>267, :name=>"1945-01-21"}, {:old_id=>268, :name=>"1945-01-22"}, {:old_id=>269, :name=>"1945-01-23"}, {:old_id=>271, :name=>"1945-01-24"}, {:old_id=>272, :name=>"1945-01-25"}, {:old_id=>273, :name=>"1945-01-26"}, {:old_id=>274, :name=>"1945-01-27"}, {:old_id=>275, :name=>"1945-01-28"}, {:old_id=>276, :name=>"1945-01-29"}, {:old_id=>277, :name=>"1945-01-30"}, {:old_id=>278, :name=>"1945-01-31"}, {:old_id=>279, :name=>"1945-02-01"}, {:old_id=>281, :name=>"1945-02-02"}, {:old_id=>282, :name=>"1945-02-03"}, {:old_id=>283, :name=>"1945-02-04"}, {:old_id=>284, :name=>"1945-02-05"}, {:old_id=>285, :name=>"1945-02-06"}, {:old_id=>286, :name=>"1945-02-07"}, {:old_id=>287, :name=>"1945-02-08"}, {:old_id=>288, :name=>"1945-02-09"}, {:old_id=>289, :name=>"1945-02-10"}, {:old_id=>290, :name=>"1945-02-11"}, {:old_id=>291, :name=>"1945-02-12"}, {:old_id=>292, :name=>"1945-02-13"}, {:old_id=>293, :name=>"1945-02-14"}, {:old_id=>294, :name=>"1945-02-15"}, {:old_id=>295, :name=>"1945-02-16"}, {:old_id=>296, :name=>"1945-02-17"}, {:old_id=>297, :name=>"1945-02-18"}, {:old_id=>298, :name=>"1945-02-19"}, {:old_id=>299, :name=>"1945-02-20"}, {:old_id=>300, :name=>"1945-02-21"}, {:old_id=>301, :name=>"1945-02-22"}, {:old_id=>302, :name=>"1945-02-23"}, {:old_id=>303, :name=>"1945-02-24"}, {:old_id=>304, :name=>"1945-02-25"}, {:old_id=>305, :name=>"1945-02-26"}, {:old_id=>306, :name=>"1945-02-27"}, {:old_id=>307, :name=>"1945-02-28"}, {:old_id=>312, :name=>"1945-03-01"}, {:old_id=>309, :name=>"1945-03-02"}, {:old_id=>311, :name=>"1945-03-03"}, {:old_id=>313, :name=>"1945-03-04"}, {:old_id=>314, :name=>"1945-03-05"}, {:old_id=>315, :name=>"1945-03-06"}, {:old_id=>316, :name=>"1945-03-07"}, {:old_id=>317, :name=>"1945-03-08"}, {:old_id=>318, :name=>"1945-03-09"}, {:old_id=>319, :name=>"1945-03-10"}, {:old_id=>320, :name=>"1945-03-11"}, {:old_id=>321, :name=>"1945-03-12"}, {:old_id=>322, :name=>"1945-03-13"}, {:old_id=>323, :name=>"1945-03-14"}, {:old_id=>324, :name=>"1945-03-15"}, {:old_id=>325, :name=>"1945-03-16"}, {:old_id=>326, :name=>"1945-03-17"}, {:old_id=>327, :name=>"1945-03-18"}, {:old_id=>328, :name=>"1945-03-19"}, {:old_id=>329, :name=>"1945-03-20"}, {:old_id=>330, :name=>"1945-03-21"}, {:old_id=>331, :name=>"1945-03-22"}, {:old_id=>332, :name=>"1945-03-23"}, {:old_id=>333, :name=>"1945-03-24"}, {:old_id=>334, :name=>"1945-03-25"}, {:old_id=>335, :name=>"1945-03-26"}, {:old_id=>336, :name=>"1945-03-27"}, {:old_id=>337, :name=>"1945-03-28"}, {:old_id=>338, :name=>"1945-03-29"}, {:old_id=>339, :name=>"1945-03-30"}, {:old_id=>340, :name=>"1945-03-31"}, {:old_id=>343, :name=>"1945-04-01"}, {:old_id=>342, :name=>"1945-04-02"}, {:old_id=>344, :name=>"1945-04-03"}, {:old_id=>345, :name=>"1945-04-04"}, {:old_id=>346, :name=>"1945-04-05"}, {:old_id=>347, :name=>"1945-04-06"}, {:old_id=>348, :name=>"1945-04-07"}, {:old_id=>349, :name=>"1945-04-08"}, {:old_id=>350, :name=>"1945-04-09"}, {:old_id=>351, :name=>"1945-04-10"}, {:old_id=>352, :name=>"1945-04-11"}, {:old_id=>353, :name=>"1945-04-12"}, {:old_id=>354, :name=>"1945-04-13"}, {:old_id=>355, :name=>"1945-04-14"}, {:old_id=>356, :name=>"1945-04-15"}, {:old_id=>357, :name=>"1945-04-16"}, {:old_id=>358, :name=>"1945-04-17"}, {:old_id=>359, :name=>"1945-04-18"}, {:old_id=>360, :name=>"1945-04-19"}, {:old_id=>361, :name=>"1945-04-20"}, {:old_id=>362, :name=>"1945-04-21"}, {:old_id=>363, :name=>"1945-04-22"}, {:old_id=>364, :name=>"1945-04-23"}, {:old_id=>365, :name=>"1945-04-24"}, {:old_id=>366, :name=>"1945-04-25"}, {:old_id=>367, :name=>"1945-04-26"}, {:old_id=>368, :name=>"1945-04-27"}, {:old_id=>369, :name=>"1945-04-28"}, {:old_id=>370, :name=>"1945-04-29"}, {:old_id=>371, :name=>"1945-04-30"}, {:old_id=>374, :name=>"1945-05-01"}, {:old_id=>373, :name=>"1945-05-02"}, {:old_id=>375, :name=>"1945-05-03"}, {:old_id=>376, :name=>"1945-05-04"}, {:old_id=>377, :name=>"1945-05-05"}, {:old_id=>378, :name=>"1945-05-06"}, {:old_id=>379, :name=>"1945-05-07"}, {:old_id=>380, :name=>"1945-05-08"}
    ])

puts "Dates created: #{EventDate.count}"

Country.destroy_all

Country.create([
    {:old_id=>855, :name=>"United States"},
    {:old_id=>854, :name=>"United Kingdom"},
    {:old_id=>856, :name=>"Canada"},
    {:old_id=>857, :name=>"France"},
    {:old_id=>858, :name=>"Poland"},
    {:old_id=>859, :name=>"Norway"},
    {:old_id=>860, :name=>"Australia"},
    {:old_id=>861, :name=>"New Zealand"},
    {:old_id=>862, :name=>"Netherlands"},
    {:old_id=>868, :name=>"Czechoslovakia"},
    {:old_id=>863, :name=>"Belgium"},
    {:old_id=>865, :name=>"Greece"},
    {:old_id=>867, :name=>"South Africa"},
    {:old_id=>866, :name=>"India"}
  ])

puts "Countries created: #{Country.count}"

UnitType.destroy_all
UnitType.create([
    {name:"Brigade"},
    {name:"Division"},
    {name:"Group"},
    {name:"Squadron"},
    {name:"Regiment"},
    {name:"Company"},
    {name:"Battalion"}
    ])

puts "Unit Types created: #{UnitType.count}"

Unit.destroy_all
Unit.create([
    {:old_id=>383, :name=>"Western Taskforce"}, {:old_id=>384, :name=>"Eastern Taskforce"}, {:old_id=>796, :name=>"Army Groups Royal Artillery"}, {:old_id=>815, :name=>"5 AGRA"},{:old_id=>411, :name=>"1st Special Service Brigade (UK)"}, {:old_id=>419, :name=>"4th Special Service Brigade (UK)"}, {:old_id=>697, :name=>"- No. 41 (Royal Marine) Commando"}, {:old_id=>663, :name=>"- No. 47 (Royal Marine) Commando"}, {:old_id=>696, :name=>"Demi Brigade (French)"}, {:old_id=>722, :name=>"The Belgians S.A.S. Parachutists"}, {:old_id=>664, :name=>"11 Line of Communication Area"}, {:old_id=>764, :name=>"79th Armoured Division (UK)"}, {:old_id=>765, :name=>"- 30 Armoured Brigade"}, {:old_id=>785, :name=>"- - 1 Lothians and Border Horse Yeomanry"}, {:old_id=>849, :name=>"4th Cavalry Group, Mechanized"}, {:old_id=>850, :name=>"- 759th Tank Battalion (USA)"}, {:old_id=>821, :name=>"113th Cavalry Group"}, {:old_id=>822, :name=>"- 113th Cavalry Squadron"}, {:old_id=>823, :name=>"- 125th Cavalry Squadron"}, {:old_id=>1099, :name=>"117th Cavalry Reconnaissance Squadron (Mecz)"}, {:old_id=>804, :name=>"- "}, {:old_id=>829, :name=>"17th Armored Engineer Battalion (USA)"}, {:old_id=>840, :name=>"1104th Engineer Combat Group"}, {:old_id=>841, :name=>"1106th Engineer Combat Group"}, {:old_id=>842, :name=>"- 237th Engineer Combat Battalion"}, {:old_id=>843, :name=>"1142nd Engineers Combat Group"}, {:old_id=>844, :name=>"- 172nd Engineer Combat Battalion"}, {:old_id=>741, :name=>"150th Engineer Combat Battalion"}, {:old_id=>834, :name=>"234th Engineer Combat Battalion"}, {:old_id=>836, :name=>"246th Engineer Combat Battalion"}, {:old_id=>830, :name=>"324th Engineer Combat Battalion"}, {:old_id=>831, :name=>"326 Airborne Engineer Battalion"}, {:old_id=>739, :name=>"505th Engineer Light Ponton Company "}, {:old_id=>550, :name=>"2nd Armored Division (USA)"}, {:old_id=>878, :name=>"- 99th Infantry Battalion (Separate) (USA)"}, {:old_id=>816, :name=>"- 17th Armored Engineer Battalion (USA)"}, {:old_id=>833, :name=>"- 234th Engineer Combat Battalion"}, {:old_id=>835, :name=>"- 246th Engineer Combat Battalion"}, {:old_id=>817, :name=>"- 41st Infantry Regiment (USA)"}, {:old_id=>818, :name=>"- 67th Armor Regiment (USA)"}, {:old_id=>832, :name=>"- 744th Light Tank Battalion"}, {:old_id=>828, :name=>"- 82nd Armored Reconnaissance Battalion (USA)"}, {:old_id=>839, :name=>"- 803rd Tank Destroyer Battalion"}, {:old_id=>580, :name=>"2nd Armored Division (France) "}, {:old_id=>552, :name=>"3rd Armored Division (USA) "}, {:old_id=>792, :name=>"31 Tank Brigade"}, {:old_id=>794, :name=>"- 7 Royal Tank Regiment"}, {:old_id=>554, :name=>"4th Armored Division (USA)"}, {:old_id=>417, :name=>"4th Armoured Brigade (UK)"}, {:old_id=>245, :name=>"- 2nd Battalion The King's Royal Rifle Corps"}, {:old_id=>798, :name=>"- 3 County of London Yeomanry"}, {:old_id=>799, :name=>"- 4th Royal Horse Artillery"}, {:old_id=>636, :name=>"- 44 Royal Tank Regiment"}, {:old_id=>791, :name=>"- Royal Scots Greys (2 Dragoons)"}, {:old_id=>556, :name=>"5th Armored Division (USA)"}, {:old_id=>559, :name=>"6th Armored Division (USA)"}, {:old_id=>561, :name=>"7th Armored Division (USA)"}, {:old_id=>742, :name=>"7th Armoured Division (UK)"}, {:old_id=>746, :name=>"- 131 Infantry Brigade "}, {:old_id=>747, :name=>"- - 1/5 The Queen's Royal Regiment"}, {:old_id=>755, :name=>"- - 1/6 The Queen's Royal Regiment"}, {:old_id=>754, :name=>"- - 1/7 The Queen's Royal Regiment"}, {:old_id=>744, :name=>"- 22 Armoured Brigade"}, {:old_id=>750, :name=>"- - 4 County of London Yeomanry"}, {:old_id=>753, :name=>"- - 1 Royal Tank Regiment "}, {:old_id=>756, :name=>"- - 1 The Rifle Brigade"}, {:old_id=>758, :name=>"- - 5 Royal Inniskilling Dragoon Guards"}, {:old_id=>745, :name=>"- - 5 Royal Tank Regiment"}, {:old_id=>748, :name=>"- 8 Hussars"}, {:old_id=>749, :name=>"- 11 Hussars"}, {:old_id=>752, :name=>"- 3rd Regiment Royal Horse Artillery "}, {:old_id=>751, :name=>"- 5th Regiment Royal Horse Artillery "}, {:old_id=>563, :name=>"8th Armored Division (USA)"}, {:old_id=>565, :name=>"9th Armored Division (USA)"}, {:old_id=>567, :name=>"10th Armored Division (USA) "}, {:old_id=>385, :name=>"11th Armored Division (USA)"}, {:old_id=>381, :name=>"- 41st Recon Squad"}, {:old_id=>229, :name=>"11th Armoured Division (UK)"}, {:old_id=>681, :name=>"- 15th/19th The King's Royal Hussars "}, {:old_id=>680, :name=>"- 29 Armoured Brigade"}, {:old_id=>242, :name=>"- - 3rd Royal Tank Regiment"}, {:old_id=>238, :name=>"- - 23rd Hussars"}, {:old_id=>786, :name=>"- 159 Infantry Brigade "}, {:old_id=>787, :name=>"- - 1 The Herefordshire Regiment"}, {:old_id=>788, :name=>"- - \t3 The Monmouthshire Regiment"}, {:old_id=>570, :name=>"12th Armored Division (USA) "}, {:old_id=>572, :name=>"13th Armored Division (USA) "}, {:old_id=>574, :name=>"14th Armored Division (USA) "}, {:old_id=>1100, :name=>" - 48th Tank Battalion (USA)"}, {:old_id=>576, :name=>"16th Armored Division (USA) "}, {:old_id=>578, :name=>"20th Armored Division (USA)"}, {:old_id=>759, :name=>"27th Armoured Brigade (UK)"}, {:old_id=>760, :name=>"- 13th/18th Royal Hussars"}, {:old_id=>761, :name=>"- East Riding of Yorkshire Yeomanry "}, {:old_id=>762, :name=>"- Staffordshire Yeomanry "}, {:old_id=>769, :name=>"A I R B O R N E "}, {:old_id=>594, :name=>"1st Airborne Division (UK)"}, {:old_id=>421, :name=>"6th Airborne Division (UK)"}, {:old_id=>881, :name=>"- 1st Parachute Brigade"}, {:old_id=>882, :name=>"- 2nd Parachute Brigade"}, {:old_id=>423, :name=>"- 3rd Parachute Brigade"}, {:old_id=>880, :name=>"- - 1st Canadian Parachute Battalion"}, {:old_id=>443, :name=>"5th Parachute Brigade"}, {:old_id=>410, :name=>"- 12th (Yorkshire) Parachute Battalion"}, {:old_id=>444, :name=>"- 13th (Lancashire) Parachute Battalion"}, {:old_id=>409, :name=>"- 7th (Light Infantry) Parachute Battalion"}, {:old_id=>440, :name=>"6th Airlanding Brigade"}, {:old_id=>407, :name=>"- Oxfordshire and Buckinghamshire Light Infantry "}, {:old_id=>441, :name=>"286th Field Park Company, Royal Engineers"}, {:old_id=>442, :name=>"53rd (Worcester Yeomanry) Airlanding Light Regiment)"}, {:old_id=>479, :name=>"13th Airborne Division (USA)"}, {:old_id=>481, :name=>"17th Airborne Division (USA) "}, {:old_id=>518, :name=>"82nd Airborne Division (USA) "}, {:old_id=>585, :name=>"- 504th Parachute Infantry Regiment"}, {:old_id=>586, :name=>"- 505th Parachute Infantry Regiment"}, {:old_id=>428, :name=>"101st Airborne Division"}, {:old_id=>446, :name=>"- 321 Glider Field Artillery Battalion"}, {:old_id=>447, :name=>"- 326 Airborne Engineer Battalion"}, {:old_id=>448, :name=>"- 327th Infantry Regiment (USA)"}, {:old_id=>449, :name=>"- 377 Parachute Field Artillery Battalion"}, {:old_id=>450, :name=>"- 401 Glider Infantry Regiment"}, {:old_id=>451, :name=>"- 501 Parachute Infantry Regiment"}, {:old_id=>452, :name=>"- 502 Parachute Infantry Regiment"}, {:old_id=>171, :name=>"- 506 Parachute Infantry Regiment Easy Company"}, {:old_id=>453, :name=>"- 65 Armored Field Artillery Battalion"}, {:old_id=>454, :name=>"- 81 Airborne Antiaircraft Artillery Battalion"}, {:old_id=>455, :name=>"- 907 Glider Field Artillery Battalion"}, {:old_id=>768, :name=>"D I V I S I O N S - USA"}, {:old_id=>466, :name=>"1st Infantry Division (USA) "}, {:old_id=>838, :name=>"- 1st Cavalry Reconnaissance Troop "}, {:old_id=>970, :name=>"- 16th Infantry Regiment (USA)"}, {:old_id=>837, :name=>"- 18th Infantry Regiment (USA)"}, {:old_id=>972, :name=>" - 26th Infantry Regiment (USA)"}, {:old_id=>464, :name=>"2nd Infantry Division (USA)"}, {:old_id=>468, :name=>"3rd Infantry Division (USA) "}, {:old_id=>228, :name=>"- 7th Infantry Regiment (USA)"}, {:old_id=>390, :name=>"4th Infantry Division (USA)"}, {:old_id=>391, :name=>"- 8th Infantry Regiment (USA)"}, {:old_id=>813, :name=>"- 12th Infantry Regiment (USA)"}, {:old_id=>814, :name=>"- 22nd Infantry Regiment (USA)"}, {:old_id=>473, :name=>"5th Infantry Division (USA) "}, {:old_id=>475, :name=>"8th Infantry Division (USA) "}, {:old_id=>477, :name=>"9th Infantry Division (USA)"}, {:old_id=>483, :name=>"26th Infantry Division (USA) "}, {:old_id=>485, :name=>"28th Infantry Division (USA)"}, {:old_id=>246, :name=>"29th Infantry Division"}, {:old_id=>695, :name=>"- 115th Infantry Regiment (USA)"}, {:old_id=>247, :name=>"- 116th Infantry Regiment (USA)"}, {:old_id=>851, :name=>"- - 2nd Ranger Battalion (USA)"}, {:old_id=>852, :name=>"- - 5th Ranger Battalion (USA)"}, {:old_id=>727, :name=>"- 175th Infantry Regiment"}, {:old_id=>487, :name=>"30th Infantry Division (USA) "}, {:old_id=>825, :name=>"- 117th Infantry Regiment (USA)"}, {:old_id=>819, :name=>"- 119th Infantry Regiment (USA)"}, {:old_id=>826, :name=>"- 120th Infantry Regiment (USA)"}, {:old_id=>827, :name=>"- 743rd Tank Battalion (USA)"}, {:old_id=>489, :name=>"35th Infantry Division (USA)"}, {:old_id=>491, :name=>"36th Infantry Division (USA) "}, {:old_id=>569, :name=>"- 442nd Infantry Regiment (USA) "}, {:old_id=>493, :name=>"42nd Infantry Division (USA) "}, {:old_id=>973, :name=>" - 222nd Infantry Regiment (USA)"}, {:old_id=>974, :name=>" - 232nd Infantry Regiment (USA)"}, {:old_id=>975, :name=>" - 242nd Infantry Regiment (USA)"}, {:old_id=>406, :name=>"44th Infantry Division (USA) "}, {:old_id=>496, :name=>"45th Infantry Division (USA)"}, {:old_id=>498, :name=>"63rd Infantry Division (USA)"}, {:old_id=>500, :name=>"65th Infantry Division (USA) "}, {:old_id=>502, :name=>"66th Infantry Division (USA) "}, {:old_id=>504, :name=>"69th Infantry Division (USA)"}, {:old_id=>506, :name=>"70th Infantry Division (USA) "}, {:old_id=>976, :name=>" - 274th Infantry Regiment (USA)"}, {:old_id=>508, :name=>"71th Infantry Division (USA) "}, {:old_id=>510, :name=>"75th Infantry Division (USA)"}, {:old_id=>512, :name=>"76th Infantry Division (USA) "}, {:old_id=>514, :name=>"78th Infantry Division (USA)"}, {:old_id=>516, :name=>"79th Infantry Division (USA)"}, {:old_id=>977, :name=>" - 313th Infantry Regiment (USA)"}, {:old_id=>978, :name=>" - 314th Infantry Regiment (USA)"}, {:old_id=>979, :name=>" - 315th Infantry Regiment (USA)"}, {:old_id=>456, :name=>"80th Infantry Division"}, {:old_id=>524, :name=>"83th Infantry Division (USA)"}, {:old_id=>521, :name=>"84th Infantry Division (USA) "}, {:old_id=>525, :name=>"86th Infantry Division (USA) "}, {:old_id=>527, :name=>"87th Infantry Division (USA) "}, {:old_id=>529, :name=>"89th Infantry Division (USA) "}, {:old_id=>531, :name=>"90th Infantry Division (USA)"}, {:old_id=>533, :name=>"94th Infantry Division (USA) "}, {:old_id=>535, :name=>"95th Infantry Division (USA)"}, {:old_id=>537, :name=>"97th Infantry Division (USA)"}, {:old_id=>539, :name=>"99th Infantry Division (USA) "}, {:old_id=>738, :name=>"- 324th Engineer Combat Battalion"}, {:old_id=>541, :name=>"100th Infantry Division (USA) "}, {:old_id=>986, :name=>" - 781st Tank Battalion"}, {:old_id=>543, :name=>"102nd Infantry Division (USA)"}, {:old_id=>546, :name=>"103rd Infantry Division (USA) "}, {:old_id=>983, :name=>" - 409th Infantry Regiment (USA) "}, {:old_id=>984, :name=>" - 410th Infantry Regiment (USA) "}, {:old_id=>985, :name=>" - 411th Infantry Regiment (USA) "}, {:old_id=>382, :name=>"104th Timberwolf Army Infantry Division "}, {:old_id=>522, :name=>"- "}, {:old_id=>548, :name=>"106th Infantry Division (USA) "}, {:old_id=>770, :name=>"D I V I S I O N S UK"}, {:old_id=>781, :name=>"Royal Pioneer Corps"}, {:old_id=>230, :name=>"3rd Infantry Division (UK)"}, {:old_id=>459, :name=>" - 8th Infantry Brigade (UK)"}, {:old_id=>460, :name=>" - - 1 The South Lancashire Regiment"}, {:old_id=>461, :name=>" - - 1 The Suffolk Regiment"}, {:old_id=>462, :name=>" - - 2 The East Yorkshire Regiment"}, {:old_id=>394, :name=>" - 92nd (Loyals) Light Anti-Aircraft Regiment, Royal Artillery"}, {:old_id=>634, :name=>" - 9th Infantry Brigade (UK)"}, {:old_id=>810, :name=>" - - 2 The Royal Ulster Rifles"}, {:old_id=>393, :name=>" - 185th Infantry Brigade (UK)"}, {:old_id=>414, :name=>" - - 1 The Royal Norfolk Regiment"}, {:old_id=>675, :name=>" - - 2 The Royal Warwickshire Regiment"}, {:old_id=>458, :name=>" - - 2 The King's Shropshire Light Infantry"}, {:old_id=>412, :name=>"- - * King's Shropshire Light Infantry 4th (Territorial) Battalion"}, {:old_id=>463, :name=>" - - * King's Shropshire Light Infantry 2nd Battalion"}, {:old_id=>234, :name=>"15th (Scottish) Infantry Division"}, {:old_id=>235, :name=>"- 227th Infantry Brigade (UK)"}, {:old_id=>657, :name=>"- - 10 The Highland Light Infantry"}, {:old_id=>801, :name=>"- - 2 The Gordon Highlanders"}, {:old_id=>955, :name=>"- - 2nd (Reconstituted) Battalion The Argyll and Sutherland Highlanders"}, {:old_id=>232, :name=>"- 44th (Lowland) Infantry Brigade (UK)"}, {:old_id=>667, :name=>"- - 6th King's Own Scottish Borderers"}, {:old_id=>809, :name=>"- - \t6 The Royal Scots Fusiliers"}, {:old_id=>233, :name=>"- 46th (Highland) Brigade (UK)"}, {:old_id=>802, :name=>"- - 2 The Glasgow Highlanders"}, {:old_id=>811, :name=>"- - 7 The Seaforth Highlanders"}, {:old_id=>812, :name=>"- - 9 The Cameronians"}, {:old_id=>236, :name=>"- Glasgow Highlanders"}, {:old_id=>239, :name=>"43rd (Wessex) Infantry Division (UK)"}, {:old_id=>243, :name=>"- 1st Battalion, The Worcestershire Regiment"}, {:old_id=>763, :name=>"- 5th Duke of Cornwall's Light Infantry "}, {:old_id=>244, :name=>"- 7th Battalion, The Somerset Light Infantry (Prince Albert's)"}, {:old_id=>416, :name=>"- Middlesex Regiment"}, {:old_id=>583, :name=>"* XXX Corps (UK) "}, {:old_id=>231, :name=>"49th (West Riding) Infantry Division"}, {:old_id=>587, :name=>"Guards Armoured Division (UK) "}, {:old_id=>956, :name=>" - 153rd Field Regiment RA"}, {:old_id=>584, :name=>"2nd Household Cavalry Regiment "}, {:old_id=>401, :name=>"50th (Northumbrian) Infantry Division"}, {:old_id=>420, :name=>"- 151st Infantry Brigade"}, {:old_id=>779, :name=>"- - 9 The Durham Light Infantry"}, {:old_id=>403, :name=>"- 231st Infantry Brigade"}, {:old_id=>780, :name=>"- - 2 The Devonshire Regiment"}, {:old_id=>404, :name=>"- 56th Infantry Brigade"}, {:old_id=>405, :name=>"- 69th Infantry Brigade"}, {:old_id=>679, :name=>"- - 5 The East Yorkshire Regiment"}, {:old_id=>661, :name=>"- 8th Armoured Brigade (UK) "}, {:old_id=>400, :name=>"-- 4th/7th Royal Dragoon Guards"}, {:old_id=>240, :name=>"51st (Highland) Infantry Division (UK)"}, {:old_id=>241, :name=>"- 152nd (Highland) Infantry Brigade "}, {:old_id=>735, :name=>"- - 2 The Seaforth Highlanders"}, {:old_id=>893, :name=>"- - 5 The Queens Own Cameron Highlanders"}, {:old_id=>733, :name=>"- 153nd (Highland) Infantry Brigade "}, {:old_id=>734, :name=>"- - 5 The Black Watch"}, {:old_id=>800, :name=>"- - \t1 The Gordon Highlanders"}, {:old_id=>653, :name=>"- 154nd (Highland) Infantry Brigade "}, {:old_id=>678, :name=>"52nd (Lowland) Infantry Division (UK)"}, {:old_id=>789, :name=>"- 155th Infantry Brigade "}, {:old_id=>790, :name=>"- - 7th/9th Bn. The Royal Scots (The Royal Regiment)"}, {:old_id=>665, :name=>"53rd (Welsh) Infantry Division (UK)"}, {:old_id=>671, :name=>"- 158th Infantry Brigade"}, {:old_id=>847, :name=>"- - 1st Battalion, East Lancashire Regiment "}, {:old_id=>848, :name=>"- - 1/5th Battalion, Welch Regiment "}, {:old_id=>807, :name=>"- - 4th Battalion, Royal Welch Fusiliers"}, {:old_id=>672, :name=>"- 160th Infantry Brigade"}, {:old_id=>846, :name=>"- - 2nd Battalion, Monmouthshire Regiment"}, {:old_id=>845, :name=>"- - 4th Battalion, Welch Regiment "}, {:old_id=>673, :name=>"- 71st Infantry Brigade (UK)"}, {:old_id=>674, :name=>"- - 1 Oxford and Buckinghamshire Light Infantry"}, {:old_id=>808, :name=>"- - 1 Highland Light Infantry"}, {:old_id=>668, :name=>"59th (Staffordshire) Infantry Division (UK)"}, {:old_id=>670, :name=>"- 7th Battalion, The Royal Northumberland Fusiliers"}, {:old_id=>771, :name=>"C A N A D I A  N"}, {:old_id=>592, :name=>"1st Canadian Corps"}, {:old_id=>591, :name=>"1st Canadian Infantry Division "}, {:old_id=>698, :name=>"- 1st Canadian Infantry Brigade"}, {:old_id=>702, :name=>"- - 1st Canadian Infantry Brigade Ground Defence Platoon (Lorne Scots)"}, {:old_id=>703, :name=>"- - 48th Highlanders of Canada"}, {:old_id=>704, :name=>"- - The Hastings and Prince Edward Regiment"}, {:old_id=>705, :name=>"- - The Royal Canadian Regiment"}, {:old_id=>699, :name=>"- 2nd Canadian Infantry Brigade"}, {:old_id=>706, :name=>"- - 2nd Canadian Infantry Brigade Ground Defence Platoon (Lorne Scots)"}, {:old_id=>651, :name=>"- - Princess Patricia's Canadian Light Infantry "}, {:old_id=>707, :name=>"- - The Loyal Edmonton Regiment"}, {:old_id=>708, :name=>"- - The Seaforth Highlanders of Canada"}, {:old_id=>700, :name=>"- 3rd Canadian Infantry Brigade"}, {:old_id=>709, :name=>"- - 3rd Canadian Infantry Brigade Ground Defence Platoon (Lorne Scots)"}, {:old_id=>710, :name=>"- - Royal 22e Régiment"}, {:old_id=>711, :name=>"- - The Carleton and York Regiment"}, {:old_id=>712, :name=>"- - The West Nova Scotia Regiment"}, {:old_id=>728, :name=>"- 2nd Canadian Armoured Brigade"}, {:old_id=>729, :name=>"- - The Fort Garry Horse "}, {:old_id=>731, :name=>"- Royal Canadian Dragoons"}, {:old_id=>676, :name=>"4th Canadian (Armoured) Division"}, {:old_id=>683, :name=>"- 10th Canadian Infantry Brigade"}, {:old_id=>677, :name=>"- - The Algonquin Regiment "}, {:old_id=>237, :name=>"- - 9th Battalion The Argyll and Sutherland Highlanders (Princess Louise's)"}, {:old_id=>689, :name=>"- - The Lincoln and Welland Regiment"}, {:old_id=>684, :name=>"- 4th Canadian Armoured Brigade "}, {:old_id=>685, :name=>"- - 21st Armoured Regiment (The Governor General's Foot Guards)"}, {:old_id=>686, :name=>"- - 22nd Armoured Regiment (The Canadian Grenadier Guards)"}, {:old_id=>687, :name=>"- - 28th Armoured Regiment (The British Columbia Regiment)"}, {:old_id=>688, :name=>"- - The Lake Superior Regiment (Motor)"}, {:old_id=>736, :name=>"- 29th Canadian Armoured Reconnaissance Regiment (The South Alberta Regiment) "}, {:old_id=>737, :name=>"- The New Brunswick Rangers"}, {:old_id=>632, :name=>"5th Canadian (Armoured) Division "}, {:old_id=>691, :name=>"- 5th Canadian Armoured Brigade"}, {:old_id=>690, :name=>"- 11th Canadian Infantry Brigade "}, {:old_id=>645, :name=>"- - Perth Regiment"}, {:old_id=>721, :name=>"- - The Cape Breton Highlanders"}, {:old_id=>637, :name=>"2nd Canadian Corps"}, {:old_id=>730, :name=>"2nd Canadian Infantry Division"}, {:old_id=>682, :name=>"12th Manitoba Dragoons "}, {:old_id=>713, :name=>"7th Reconnaissance Regiment (Duke of York's Royal Canadian Hussars) "}, {:old_id=>638, :name=>"2nd Canadian Infantry Division"}, {:old_id=>646, :name=>"- The Royal Hamilton Light Infantry (Wentworth Regiment)"}, {:old_id=>715, :name=>"- 8th Reconnaissance Regiment (14th Canadian Hussars) "}, {:old_id=>716, :name=>"- The Essex Scottish Regiment"}, {:old_id=>714, :name=>"- 4th Infantry Brigade (Canada)"}, {:old_id=>639, :name=>"- 5th Infantry Brigade (Canada)"}, {:old_id=>640, :name=>"- Le Régiment de Maisonneuve"}, {:old_id=>650, :name=>"- The South Saskatchewan Regiment"}, {:old_id=>718, :name=>"- The Toronto Scottish Regiment (Queen Elizabeth The Queen Mother's Own) "}, {:old_id=>641, :name=>"3rd Canadian Infantry Division"}, {:old_id=>655, :name=>"- 7 Canadian Infantry Brigade "}, {:old_id=>656, :name=>"- - 1 The Regina Rifle Regiment"}, {:old_id=>720, :name=>"- - 1 The Royal Winnipeg Rifles"}, {:old_id=>732, :name=>"- - 1 The Canadian Scottish Regiment"}, {:old_id=>643, :name=>"- 8 Canadian Infantry Brigade "}, {:old_id=>644, :name=>"- - 1 The North Shore (New Brunswick) Regiment"}, {:old_id=>652, :name=>"- - Régiment de la Chaudière "}, {:old_id=>654, :name=>"- - 1 The Queens Own Rifles of Canada"}, {:old_id=>647, :name=>"- 9 Canadian Infantry Brigade "}, {:old_id=>6, :name=>"- - 1st Battalion, The North Nova Scotia Highlanders"}, {:old_id=>648, :name=>"- - 1 The Highland Light Infantry of Canada"}, {:old_id=>649, :name=>"- - The Stormont: Dundas and Glengarry Highlanders"}, {:old_id=>725, :name=>"D U T C H "}, {:old_id=>5, :name=>"Princess Irene Brigade"}, {:old_id=>717, :name=>"Regiment Stoottroepen Prins Bernhard"}, {:old_id=>1101, :name=>"Dutch National Battalion"}, {:old_id=>803, :name=>"N O R W A Y  "}, {:old_id=>806, :name=>"No. 5 Norwegian Troops"}, {:old_id=>726, :name=>"P O L I S H"}, {:old_id=>397, :name=>"1st Polish Armoured Division"}, {:old_id=>590, :name=>"1st Independent Parachute Brigade (Poland) "}, {:old_id=>772, :name=>"B EL G I A N "}, {:old_id=>724, :name=>"1st Belgian Infantry Brigade (Piron)"}, {:old_id=>982, :name=>" -"}, {:old_id=>981, :name=>"F R E N C H"}, {:old_id=>980, :name=>"1st Army (France)"}
    ])

unittotal = Unit.count
puts "Units created: #{unittotal}"

Unit.all.each do |unit|
    unit.name = unit.name.gsub("-","").lstrip
    unit.save
end


Unit.all.each do |unit|
    if unit.name.downcase.include? "usa"
        unit.country_id = Country.find_by_name("United States").id

    elsif unit.name.downcase.include?("canad" || "toronto" ||"nova scotia" || "new brunswick" || "winnipeg")
        unit.country_id = Country.find_by_name("Canada").id

    elsif unit.name.downcase.include? "uk"
        unit.country_id = Country.find_by_name("United Kingdom").id

    elsif (unit.name.downcase.include?("france" || "french"))
        unit.country_id = Country.find_by_name("France").id

    elsif (unit.name.downcase.include?("poland" || "polish"))
        unit.country_id = Country.find_by_name("Poland").id

    end
    unit.save
end

puts "Units mapped to country: #{Unit.where("country_id > 0").count} out of #{unittotal}"

Unit.all.each do |unit|
    if unit.name.downcase.include?("dragoon")
        unit.unit_type_id = UnitType.find_by_name("Brigade").id
        unit.save
    elsif unit.name.downcase.include?("brigade")
        unit.unit_type_id = UnitType.find_by_name("Brigade").id
        unit.save
    elsif unit.name.downcase.include?("squad")
        unit.unit_type_id = UnitType.find_by_name("Squadron").id
        unit.save
    elsif unit.name.downcase.include?("squadron")
        unit.unit_type_id = UnitType.find_by_name("Squadron").id
        unit.save
    elsif unit.name.downcase.include?("hussars")
        unit.unit_type_id = UnitType.find_by_name("Regiment").id
        unit.save
    elsif unit.name.downcase.include?("artillery")
        unit.unit_type_id = UnitType.find_by_name("Battalion").id
        unit.save
    elsif unit.name.downcase.include?("troop")
        unit.unit_type_id = UnitType.find_by_name("Company").id
        unit.save
    elsif unit.name.downcase.include?("company")
        unit.unit_type_id = UnitType.find_by_name("Company").id
        unit.save
    elsif unit.name.downcase.include?("rifles")
        unit.unit_type_id = UnitType.find_by_name("Regiment").id
        unit.save
    elsif unit.name.downcase.include?("gordon")
        unit.unit_type_id = UnitType.find_by_name("Regiment").id
        unit.save
    elsif unit.name.downcase.include?("borderers")
        unit.unit_type_id = UnitType.find_by_name("Regiment").id
        unit.save
    elsif unit.name.downcase.include?("fusiliers")
        unit.unit_type_id = UnitType.find_by_name("Regiment").id
        unit.save
    elsif unit.name.downcase.include?("glasgow")
        unit.unit_type_id = UnitType.find_by_name("Battalion").id
        unit.save
     elsif unit.name.downcase.include?("battalion")
        unit.unit_type_id = UnitType.find_by_name("Battalion").id
        unit.save
    elsif unit.name.downcase.include?("seaforth")
        unit.unit_type_id = UnitType.find_by_name("Regiment").id
        unit.save
    elsif unit.name.downcase.include?("regiment")
        unit.unit_type_id = UnitType.find_by_name("Regiment").id
        unit.save
    elsif unit.name.downcase.include?("cornwall")
        unit.unit_type_id = UnitType.find_by_name("Battalion").id
        unit.save
    elsif unit.name.downcase.include?("durham")
        unit.unit_type_id = UnitType.find_by_name("Battalion").id
        unit.save
    end
end

puts "Units mapped to type: #{Unit.where('unit_type_id>0').count}"

Operation.destroy_all

Operation.create([
    {:old_id=>597, :name=>"Accumulator June 12-13"}, {:old_id=>719, :name=>"Amherst April 8-9"}, {:old_id=>598, :name=>"Archway March - May"}, {:old_id=>599, :name=>"Astonia September 10-12"}, {:old_id=>600, :name=>"Atlantic July 18–20"}, {:old_id=>601, :name=>"Axehead August"}, {:old_id=>602, :name=>"Berlin (Arnhem) Sept 25-26"}, {:old_id=>603, :name=>"Blackcock Jan 14-26"}, {:old_id=>604, :name=>"Blockbuster late Feb - early March"}, {:old_id=>605, :name=>"Bluecoat July 30 – Aug 7"}, {:old_id=>606, :name=>"Charnwood July 8-9"}, {:old_id=>607, :name=>"Clipper November 18"}, {:old_id=>388, :name=>"Cobra July 25-31"}, {:old_id=>608, :name=>"Constellation Sept 30 - Oct 18 "}, {:old_id=>408, :name=>"Deadstick June 6th"}, {:old_id=>609, :name=>"Defoe July 9 - Aug 23"}, {:old_id=>610, :name=>"Dingson June 5-18"}, {:old_id=>611, :name=>"Dove Aug 15th"}, {:old_id=>612, :name=>"Dragoon Aug 15th"}, {:old_id=>387, :name=>"Epsom June 26-30"}, {:old_id=>613, :name=>"Fusilade Sept 1th"}, {:old_id=>614, :name=>"Goodwood July 18-20"}, {:old_id=>615, :name=>"Grenade Feb 23"}, {:old_id=>616, :name=>"Houndsmith June 6"}, {:old_id=>617, :name=>"Infatuate Nov 1-8"}, {:old_id=>618, :name=>"Jupiter July 10"}, {:old_id=>619, :name=>"Lost June 23 -July 18"}, {:old_id=>620, :name=>"Loyton Aug 12 - Oct 9"}, {:old_id=>621, :name=>"Manna April 29- May 8"}, {:old_id=>389, :name=>"Market Garden Sept 17-21"}, {:old_id=>622, :name=>"Martlet 25 June - 1 July"}, {:old_id=>386, :name=>"Neptune June 6-30"}, {:old_id=>623, :name=>"Pegasus Oct 22-23"}, {:old_id=>624, :name=>"Plunder March 23"}, {:old_id=>625, :name=>"Queen Nov 16th"}, {:old_id=>757, :name=>"Spring July 25–27"}, {:old_id=>626, :name=>"Switchback Oct 6-12"}, {:old_id=>627, :name=>"Tonga June 6-7"}, {:old_id=>398, :name=>"Totalize August 7-10"}, {:old_id=>399, :name=>"Tractable August 14-21"}, {:old_id=>628, :name=>"Varsity March 24"}, {:old_id=>629, :name=>"Veritable Feb 8- March 1"}, {:old_id=>630, :name=>"Vitality Oc 24"}, {:old_id=>631, :name=>"Windsor July 4-5"}
    ])

puts "Operations created: #{Operation.count}"

Event.destroy_all
EventAttribute.destroy_all

#load in the events from a json file
raw_events = JSON.load(File.open( '/Users/bradolstad/dev/wwii_data/parsed_data.json', "r" ))

raw_events.each do |row|
    find_out_what_table(row["old_id"])
    event = Event.find_by_unique_id(row["unique_id"])

    if event.present?
        if @date_id
            event.event_date = DateTime.parse(@date_id)
            event.save
        end
        # if it exists check for an attributes record
        eventattribute = EventAttribute.find_by_event_id(event.id)

        if eventattribute.present?
            #if an attribute record exists, update it
            eventattribute.country_id = @country_id unless @country_id==nil
            eventattribute.operation_id = @operation_id unless @operation_id==nil
            eventattribute.unit_id = @unit_id unless @unit_id==nil
            eventattribute.save
        else #no eventattribute row yet
            EventAttribute.create([{event_id:event.id,country_id:@country_id,operation_id:@operation_id,unit_id:@unit_id}])
        end
    else #no event found
        new_event = Event.new(
            {
                :unique_id => row["unique_id"] ,
                :name => row["name"],
                :lat => row["lat"],
                :lng => row["lng"],
                :event_date => @date_id}
            )
        new_event.save

        EventAttribute.create([
            {event_id:new_event.id,country_id:@country_id,operation_id:@operation_id,unit_id:@unit_id}
            ])
    end #end for first if statement

end # end of main loop through rows

puts "Events created: #{Event.count}"
puts "Event Attributes created: #{EventAttribute.count}"

events = Event.all
events.each do |event|
    if eventdate = EventDate.find_by_old_id(event.old_id)
        event.event_date = DateTime.parse(eventdate.name)
        event.save
    end
end

