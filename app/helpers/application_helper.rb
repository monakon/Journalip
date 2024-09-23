module ApplicationHelper

  # フラッシュメッセージ デザインパターン
  def flash_background_color(type)
    case type.to_sym
    when :notice then "flex items-center p-4 mb-4 text-sm text-green-800 border border-green-300 rounded-lg bg-green-50"
    when :alert  then "flex items-center p-4 mb-4 text-sm text-red-800 border border-red-300 rounded-lg bg-red-50"
    when :error  then "flex items-center p-4 mb-4 text-sm text-red-800 border border-red-300 rounded-lg bg-red-50"
    else "bg-gray-500"
    end
  end

  # 基本的なOGPで表示する具体的なサイト内容
  def default_meta_tags
    {
      site: 'Journalip',
      title: '',
      reverse: true,
      separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
      description: 'Journalipで旅の思い出を振り返ろう',
      keywords: '旅行, 価値観',  #キーワードを「,」区切りで設定する
      canonical: request.original_url,   #優先するurlを指定する
      icon: [                    #favicon、apple用アイコンを指定する
        { href: image_url('icon.png') },
        { href: image_url('icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'Journalip',
        title: 'Journalip',
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('Xcard.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        title: 'Journalip',
        image: image_url('Xcard.png'),
      }
    }
  end

  # 投稿記事毎の動的OGP（画像は固定）
  def set_board_meta_tags(board, image_url)
    set_meta_tags(
      title: board.title,
      description: "旅行の思い出を投稿しました！#{board.title}",
      og: {
        title: board.title,
        description: "旅行の思い出を投稿しました！#{board.title}",
        url: request.original_url,
        image: image_url  # 固定画像
      },
      twitter: {
        title: board.title,
        description: "旅行の思い出を投稿しました！#{board.title}",
        image: image_url # 固定画像
      }
    )
  end
end
