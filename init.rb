require_plugin 'tog_core'
require_plugin 'seo_urls'

Tog::Interface.sections(:site).add "Blogs", "/blogs"     

Tog::Interface.sections(:member).add "Blogs", "/member/conversatio/blogs"

Tog::Plugins.helpers Conversatio::BlogsHelper
          
