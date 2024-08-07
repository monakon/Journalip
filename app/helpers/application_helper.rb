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

  # OGPで表示する具体的なサイト内容
  def default_meta_tags
    {
      site: 'Journalip',
      title: 'Journalip',
      reverse: true,
      separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
      description: 'Journalipで価値観を見つけよう',
      keywords: 'Journalip,journalip',  #キーワードを「,」区切りで設定する
      canonical: request.original_url,   #優先するurlを指定する
      # noindex: ! Rails.env.production?,
      icon: [                    #favicon、apple用アイコンを指定する
        { href: image_url('icon.png') },
        { href: image_url('icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'Journalip',
        title: 'Journalip',
        description: 'Journalipで価値観を見つけよう',
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
end
