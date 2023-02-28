(asdf:defsystem "geotools"
  :description "A tool for surveyors"
  :version "0.0.1"
  :licence "GPLv3"
  :author "geobius"
  :depends-on ("alexandria")
  :components ((:file "package")
	       (:file "angle_converter")))
	       
