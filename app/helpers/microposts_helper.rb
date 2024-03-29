module MicropostsHelper

  def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_strings(s) }.join(' ')))
  end

  private
  
    def wrap_long_strings(text, max_width = 30)
      zero_width_space = "&#8230;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text :
                                  text.scan(regex).join(zero_width_space)
    end
end
