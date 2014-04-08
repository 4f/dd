#encoding: UTF-8
module ApplicationHelper


  def text_field_tag(name, value = nil, options = {})
    options.merge! placeholder: :field
    super(name, value, options)
    
  end

  def tag_to_link tag, p, p2, inverse = true  #obj, query_name_active, query_name_secotnd
    # debugger
    if inverse && params[p].include?(tag.id.to_s)
      link_to tag.name, {p2 => params[p2], p => (params[p] - [tag.id.to_s])}, class: 'active'
    else
      link_to tag.name, p2 => params[p2], p => (params[p] + [tag.id.to_s])
    end

  end

  def rows_by_cols_and_content(str, cols, incr = 1)
    str ||= ''
    {rows: ( ( cols + 6 + str.size ) / cols + incr ), cols: cols}
  end

  def h1andcontent str
    content_for :title, str
    raw "<h1>#{str}</h1><div id='notice'>#{notice}</div>"
  end

  def wrap(str, l = 20, endd = '...')
    return '-' if str.blank?
    str.size > l ? str[0..(l - endd.size)] + endd : str
  end

  def remove_http str, plh = ''
    str.blank? ? plh : str.gsub(/\Ahttps?:\/\//, '')
  end
  
end
