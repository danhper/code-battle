var I18n = I18n || {};
I18n.translations = {"en":{"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"]},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match %{attribute}","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","present":"must be blank","too_long":"is too long (maximum is %{count} characters)","too_short":"is too short (minimum is %{count} characters)","wrong_length":"is the wrong length (should be %{count} characters)","not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","other_than":"must be other than %{count}","odd":"must be odd","even":"must be even","taken":"has already been taken","already_confirmed":"was already confirmed, please try signing in","confirmation_period_expired":"needs to be confirmed within %{period}, please request a new one","expired":"has expired, please request a new one","not_found":"not found","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"}}},"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"one":"Cannot delete record because a dependent %{record} exists","many":"Cannot delete record because dependent %{record} exist"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"},"actions":"Actions","links":{"back":"Back","cancel":"Cancel","confirm":"Are you sure?","destroy":"Delete","new":"New","edit":"Edit"},"titles":{"edit":"Edit %{model}","save":"Save %{model}","new":"New %{model}","delete":"Delete %{model}"}},"will_paginate":{"previous_label":"Previous","next_label":"Previous","page_gap":"\u0026hellip;","page_entries_info":{"single_page":{"zero":"No %{model} found","one":"Displaying 1 %{model}","other":"Displaying all %{count} %{model}"},"single_page_html":{"zero":"No %{model} found","one":"Displaying \u003Cb\u003E1\u003C/b\u003E %{model}","other":"Displaying \u003Cb\u003Eall\u0026nbsp;%{count}\u003C/b\u003E %{model}"},"multi_page":"Displaying %{model} %{from} - %{to} of %{count} in total","multi_page_html":"Displaying %{model} \u003Cb\u003E%{from}\u0026nbsp;-\u0026nbsp;%{to}\u003C/b\u003E of \u003Cb\u003E%{count}\u003C/b\u003E in total"}},"devise":{"confirmations":{"confirmed":"Your account was successfully confirmed.","confirmed_and_signed_in":"Your account was successfully confirmed. You are now signed in.","send_instructions":"You will receive an email with instructions about how to confirm your account in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive an email with instructions about how to confirm your account in a few minutes."},"failure":{"already_authenticated":"You are already signed in.","inactive":"Your account is not activated yet.","invalid":"Invalid email or password.","invalid_token":"Invalid authentication token.","locked":"Your account is locked.","not_found_in_database":"Invalid email or password.","timeout":"Your session expired. Please sign in again to continue.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your account before continuing."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock Instructions"}},"omniauth_callbacks":{"failure":"Could not authenticate you from %{kind} because \"%{reason}\".","success":"Successfully authenticated from %{kind} account."},"passwords":{"no_token":"You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.","send_instructions":"You will receive an email with instructions about how to reset your password in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.","updated":"Your password was changed successfully. You are now signed in.","updated_not_active":"Your password was changed successfully."},"registrations":{"destroyed":"Bye! Your account was successfully cancelled. We hope to see you again soon.","signed_up":"Welcome! You have signed up successfully.","signed_up_but_inactive":"You have signed up successfully. However, we could not sign you in because your account is not yet activated.","signed_up_but_locked":"You have signed up successfully. However, we could not sign you in because your account is locked.","signed_up_but_unconfirmed":"A message with a confirmation link has been sent to your email address. Please open the link to activate your account.","update_needs_confirmation":"You updated your account successfully, but we need to verify your new email address. Please check your email and click on the confirm link to finalize confirming your new email address.","updated":"You updated your account successfully."},"sessions":{"signed_in":"Signed in successfully.","signed_out":"Signed out successfully."},"unlocks":{"send_instructions":"You will receive an email with instructions about how to unlock your account in a few minutes.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions about how to unlock it in a few minutes.","unlocked":"Your account has been unlocked successfully. Please sign in to continue."}}},"ja":{"general":{"introduction":"CodeBattleは、プログラミングコードの戦場です。\nあなたは中世さながらのプログラミング戦士となり、\nPythonやC#、Scala、Erlangといったギルド(言語)に所属します。\nクエスト(課題)が現れたら、まずはギルド内で最強の戦士が選ばれ、\n各ギルド一番の戦士が一騎打ち！勝者はCode大陸で領土を広げます。\nそれは、あなたの愛する言語が地上を征服する日まで、、、\n","sub_header_alt":"ようこそ、Codeの最前線へ。","to_top":"\u0026lt;\u0026lt; クエストページへ","submit":"投稿","time":{"before":"%{time}前"}},"quest":{"foo":"bar","quest":"クエスト","current_best":"現在の一位","from":"%{username}からのクエスト","answers_number":"合計回答数","posted_date":"クエスト出現日","title":"お題","input_title":"タイトルを入力","title_placehoder":"(例) 素数を数えるプログラムを作りたまえ","input_description":"問題の説明文を入力","post_explanation":"このページからクエストを投稿することができます。\u003Cbr\u003E\n投稿のさいには、\u003Cstrong\u003E自分もコードを書くことが必須です。\u003C/strong\u003E\u003Cbr\u003E\n好きな言語を選んで、まずは自分で自分の問題を解いてから投稿しましょう。\n"},"code":{"author":"回答者","read_more":"続きを読む","written_by":"%{username}の実装","used_language":"%{language}で回答したぞ！","other_used_language":"%{language}で行く!","vote_for":"%{language}に一票を投じる","unvote":"%{language}の投票を取り消す","others":"ほかのユーザーの回答","choose_guild":"自分が使用する言語を選択","placeholder":"ここにコードを入力してください。","publish_warning":"投稿したコードは、Web全体に公開されます。","can_be_voted":"この回答が%{language}ギルドの中では現在\"+1\"数がNo.1です。\nそのため、他言語との決選に挑んでいる最中です。\n"},"comment":{"post":"コメントを投稿","count":{"one":"1件のコメント","other":"%{count}件のコメント"}},"guild":{"house":"ギルドハウス","conquer":"%{language}を使い、Code大陸を征服せよ！","members_count_label":"メンバー数","members_count":{"one":"100人","other":"%{count}人"},"territory":"現在の領土","possession_rate":"支配率","rank":"%{number}位"},"user":{"guilds":"所属ギルド"},"will_paginate":{"previous_label":"前","next_label":"次"},"date":{"abbr_day_names":["日","月","火","水","木","金","土"],"abbr_month_names":[null,"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],"day_names":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"formats":{"default":"%Y/%m/%d","long":"%Y年%m月%d日(%a)","short":"%m/%d","date_only":"%Y-%m-%d"},"month_names":[null,"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],"order":["year","month","day"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"約1時間","other":"約%{count}時間"},"about_x_months":{"one":"約1ヶ月","other":"約%{count}ヶ月"},"about_x_years":{"one":"約1年","other":"約%{count}年"},"almost_x_years":{"one":"1年弱","other":"%{count}年弱"},"half_a_minute":"30秒前後","less_than_x_minutes":{"one":"1分以内","other":"%{count}分以内"},"less_than_x_seconds":{"one":"1秒以内","other":"%{count}秒以内"},"over_x_years":{"one":"1年以上","other":"%{count}年以上"},"x_days":{"one":"1日","other":"%{count}日"},"x_minutes":{"one":"1分","other":"%{count}分"},"x_months":{"one":"1ヶ月","other":"%{count}ヶ月"},"x_seconds":{"one":"1秒","other":"%{count}秒"}},"prompts":{"day":"日","hour":"時","minute":"分","month":"月","second":"秒","year":"年"}},"errors":{"format":"%{attribute}%{message}","messages":{"accepted":"を受諾してください。","blank":"を入力してください。","confirmation":"と確認の入力が一致しません。","empty":"を入力してください。","equal_to":"は%{count}にしてください。","even":"は偶数にしてください。","exclusion":"は予約されています。","greater_than":"は%{count}より大きい値にしてください。","greater_than_or_equal_to":"は%{count}以上の値にしてください。","inclusion":"は一覧にありません。","invalid":"は不正な値です。","less_than":"は%{count}より小さい値にしてください。","less_than_or_equal_to":"は%{count}以下の値にしてください。","not_a_number":"は数値で入力してください。","not_an_integer":"は整数で入力してください。","odd":"は奇数にしてください。","record_invalid":"バリデーションに失敗しました。 %{errors}","taken":"はすでに存在します。","too_long":"は%{count}文字以内で入力してください。","too_short":"は%{count}文字以上で入力してください。","wrong_length":"は%{count}文字で入力してください。"},"template":{"body":"次の項目を確認してください。","header":{"one":"%{model}にエラーが発生しました。","other":"%{model}に%{count}個のエラーが発生しました。"}}},"helpers":{"select":{"prompt":"選択してください。"},"submit":{"create":"登録する","submit":"保存する","update":"更新する"}},"number":{"currency":{"format":{"delimiter":",","format":"%n%u","precision":0,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"円"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"十億","million":"百万","quadrillion":"千兆","thousand":"千","trillion":"兆","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n%u","units":{"byte":"バイト","gb":"ギガバイト","kb":"キロバイト","mb":"メガバイト","tb":"テラバイト"}}},"percentage":{"format":{"delimiter":""}},"precision":{"format":{"delimiter":""}}},"support":{"array":{"last_word_connector":"と","two_words_connector":"と","words_connector":"と"}},"time":{"am":"午前","formats":{"default":"%Y/%m/%d %H:%M:%S","long":"%Y年%m月%d日(%a) %H時%M分%S秒 %z","short":"%y/%m/%d %H:%M","date_only":"%Y-%m-%d"},"pm":"午後"},"activemodel":{"errors":{"format":"%{attribute}%{message}","messages":{"accepted":"を受諾してください。","blank":"を入力してください。","confirmation":"と確認の入力が一致しません。","empty":"を入力してください。","equal_to":"は%{count}にしてください。","even":"は偶数にしてください。","exclusion":"は予約されています。","greater_than":"は%{count}より大きい値にしてください。","greater_than_or_equal_to":"は%{count}以上の値にしてください。","inclusion":"は一覧にありません。","invalid":"は不正な値です。","less_than":"は%{count}より小さい値にしてください。","less_than_or_equal_to":"は%{count}以下の値にしてください。","not_a_number":"は数値で入力してください。","not_an_integer":"は整数で入力してください。","odd":"は奇数にしてください。","record_invalid":"バリデーションに失敗しました。 %{errors}","taken":"はすでに存在します。","too_long":"は%{count}文字以内で入力してください。","too_short":"は%{count}文字以上で入力してください。","wrong_length":"は%{count}文字で入力してください。"},"template":{"body":"次の項目を確認してください。","header":{"one":"%{model}にエラーが発生しました。","other":"%{model}に%{count}個のエラーが発生しました。"}}}},"activerecord":{"errors":{"format":"%{attribute}%{message}","messages":{"accepted":"を受諾してください。","blank":"を入力してください。","confirmation":"と確認の入力が一致しません。","empty":"を入力してください。","equal_to":"は%{count}にしてください。","even":"は偶数にしてください。","exclusion":"は予約されています。","greater_than":"は%{count}より大きい値にしてください。","greater_than_or_equal_to":"は%{count}以上の値にしてください。","inclusion":"は一覧にありません。","invalid":"は不正な値です。","less_than":"は%{count}より小さい値にしてください。","less_than_or_equal_to":"は%{count}以下の値にしてください。","not_a_number":"は数値で入力してください。","not_an_integer":"は整数で入力してください。","odd":"は奇数にしてください。","record_invalid":"バリデーションに失敗しました。 %{errors}","taken":"はすでに存在します。","too_long":"は%{count}文字以内で入力してください。","too_short":"は%{count}文字以上で入力してください。","wrong_length":"は%{count}文字で入力してください。"},"template":{"body":"次の項目を確認してください。","header":{"one":"%{model}にエラーが発生しました。","other":"%{model}に%{count}個のエラーが発生しました。"}}}}}};