# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Doctor.delete_all
Doctor.create(:name => 'Fengling Zhang',
			 :introduction => %{<p>Jiangsu province<p>},
			 :skill => "paediatrics",
			 :username => "zfl")
#..
Man.delete_all
Man.create(:name => "zfl",
		  :hashed_password => "d1a17dd98309b9b0194f2eb6a4298174b662e044079fc995f4b375d27a256590",
		  :salt => "-6212819780.420778383271837",
		  :isDoctor => true)
Man.create(:name => "sxc",
           :hashed_password => "d1a17dd98309b9b0194f2eb6a4298174b662e044079fc995f4b375d27a256590",
           :salt => "-6212819780.420778383271837",
           :isDoctor =>false)
Disease.delete_all
Disease.create(:name => "稳定性心绞痛",:symp => "心肌缺血产生的心绞痛症状特征性地在胸骨后或跨过胸骨两侧感觉到，多见于以胸骨上段或中段的后方，也可出现于心前或其他不典型的部位，如颈及牙齿，心绞痛表现为范围弥散和难以准确定位。",:signal => "",:defi => "",:factor => "",:divi => "")
Disease.create(:name => "不稳定性心绞痛",:symp => "无论是疼痛部位、性质，不稳定性心绞痛与稳定性心绞痛是相似的，都是以胸骨后、心前区及咽部的压迫、憋闷或烧灼为多见，而不稳定性心绞痛的程度加重，范围更大，放散的部位更广泛，持续时间更长。",:signal => "",:defi => "满足下列条件之一即可诊断为不稳定性心绞痛：1.在稳定的劳累性心绞痛基础上出现的逐渐增强的心绞痛（程度、持续时间、发作频率均增加）；2.新出现的心绞痛（1个月内），由很轻的体力活动即可引起心绞痛；3.在休息或极轻体力活动后出现的心绞痛。",:factor => "",:divi => "")
Disease.create(:name => "心肌梗死",:symp => "缺血性胸痛是急性心肌梗死最常见的临床症状，疼痛持续时间长，往往超过30min，多较严重，甚至难以忍受，常伴有大汗、恶心、呕吐及濒死感。",:signal => "",:defi => "",:factor =>     "",:divi => "")
Disease.create(:name => "风湿性瓣膜病",:symp => "呼吸困难，依其狭窄程度可发生劳力性呼吸困难，夜间阵发性呼吸困难和端坐呼吸；咯血；胸痛，有时酷似心绞痛；声音嘶哑",:signal => "",:defi => "",:factor =>"",:divi => "")
Disease.create(:name => "感染性心内膜炎",:symp => "器质性心脏病患者不明原因发热一周以上；原无心脏杂音，突然出现心脏杂音；不明原因的动脉栓塞；不明原因的心衰或进行性心功能减退",:signal => "",:defi => "病源微生物，经血流直接感染心内膜，主要是心瓣膜而产生的炎症性病变。",:factor => "",:divi => "")
Disease.create(:name => "心疾病",:symp => "",:signal => "",:defi => "伴有心功能障碍的心肌疾病。",:factor =>"",:divi => "")
Disease.create(:name => "哮喘",:symp => "急性哮喘发作时常见症候包括呼吸急促（每分钟长达25~40次）、心动过速和奇脉。",:signal => "",:defi => "为一病因不明的临床综合症，以下3项明显特征：1.复发性气道阻塞，可以自行缓解，或为治疗所致；2.对非哮喘者作用甚微或无作用的刺激，可使患者发生强烈的支气管收缩反应；3.由不同检测标准阐明的气道炎症",:factor =>"",:divi => "")
Disease.create(:name => "囊状纤维变性",:symp => "咳嗽常为最先出现的症候，最初是间歇性的，有如急性呼吸道病。夜间和醒来时咳嗽加重。有时伴有喘息，婴幼儿中犹多。",:signal => "",:defi => "为一常染色体隐形遗传病，是为跨膜传导调节蛋白的编码基因突变所致。",:factor =>     "",:divi => "")
Disease.create(:name => "结节病",:symp => "",:signal => "",:defi => "原因不明，特征是一个以上脏器系统中有非干酪性肉芽肿。肺和纵隔及肺门淋巴结虽是最常受累部位。",:factor =>"",:divi => "")

