Pod::Spec.new do |s|

s.name         = "LCFontManager"
s.version      = "0.0.1"
s.summary      = "自动下载 字体册 里面的字体"
s.homepage     = "https://github.com/iRemark/LCCopybook.git"
s.license      = "MIT"
s.author       = { "iRemark" => "lc081200@163.com" }
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/iRemark/LCCopybook.git", :tag => "0.0.1" }
s.source_files  = "LCFontManager/*"

s.requires_arc = true

s.frameworks = 'UIKit', 'Foundation'    

end