Pod::Spec.new do |s|

  s.name         = "JGLinkedStoryboard"
  s.version      = "1.0"
  s.summary      = "Makes transitioning between multiple storyboards easy."

  s.description  = <<-DESC
                   Makes transitioning between multiple storyboards easy.
                
                   DESC

  s.homepage     = "https://github.com/jeremygrenier/JGLinkedStoryboard"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  
  s.author             = { "Jeremy Grenier" => "jeremy.grenier@epitech.eu" }
  s.social_media_url   = "https://twitter.com/jeremygrenier"



  s.platform     = :ios
  s.platform     = :ios, "5.0"


  s.source       = { :git => "https://github.com/jeremygrenier/JGLinkedStoryboard", :tag => "1.0" }


  s.source_files  = "JGLinkedStoryboard", "JGLinkedStoryboard/*.{h,m}"


  s.frameworks = "Foundation"


  s.requires_arc = true

end