module ApplicationHelper
  
    # クイズのジャンルのトグルがBootstrap上で正しく選択されるようにするための処理
    # FIXME: 本来は quizes_helper.rbを作成してそこにかくべき。
    # 
    # @params c 'ユーザーの選択しているカテゴリ値'
    # @params input_category '画面上のカテゴリ値。form側で指定'
    # return "active" || "" activeを返すことでBootstrap上で指定されたカテゴリのトグルの色が付く
    def is_active(c, input_category)
      return "active" if c == input_category
      return ""
    end
end
