project 'picrate', 'http://maven.apache.org' do

  model_version '4.0.0'
  id 'ruby-processing:picrate:0.1.0'
  packaging 'jar'

  description 'An integrated processing-core (somewhat hacked), with additional java code for a jruby version of processing.'

  organization 'ruby-processing', 'https://ruby-processing.github.io'

  {
    'monkstone' => 'Martin Prout', 'benfry' => 'Ben Fry',
    'REAS' => 'Casey Reas', 'codeanticode' => 'Andres Colubri'
  }.each do |key, value|
    developer key do
      name value
      roles 'developer'
    end
  end
  license 'GPL 3', 'http://www.gnu.org/licenses/gpl-3.0-standalone.html'
  license 'LGPL 2', 'https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html'

  issue_management 'https://github.com/ruby-processing/PiCrate/issues', 'Github'

  properties( 'jogl.version' => '2.3.2',
    'jruby.api' => 'http://jruby.org/apidocs/',
    'source.directory' => 'src',
    'maven.compiler.target' => '1.8',
    'processing.api' => 'http://processing.github.io/processing-javadocs/core/',
    'picrate.basedir' => '${project.basedir}',
    'project.build.sourceEncoding' => 'utf-8',
    'polyglot.dump.pom' => 'pom.xml',
    'maven.compiler.source' => '1.8' )
    pom 'org.jruby:jruby:9.1.16.0'
    jar 'org.processing:video:3.0.2'
    jar 'org.jogamp.jogl:jogl-all:${jogl.version}'
    jar 'org.jogamp.gluegen:gluegen-rt-main:${jogl.version}'

    overrides do
      plugin :resources, '2.6'
      plugin :dependency, '2.10' do
        execute_goals( id: 'default-cli',
          artifactItems: [ { groupId:  'org.jogamp.jogl',
            artifactId:  'jogl-all',
            version:  '${jogl.version}',
            type:  'jar',
            outputDirectory: '${picrate.basedir}/lib'
          },
          { groupId:  'org.jogamp.gluegen',
            artifactId:  'gluegen-rt',
            version:  '${jogl.version}',
            type:  'jar',
            outputDirectory: '${picrate.basedir}/lib'
          },
          { groupId:  'org.jogamp.jogl',
            artifactId:  'jogl-all',
            version:  '${jogl.version}',
            classifier: 'natives-linux-amd64',
            type:  'jar',
            outputDirectory: '${picrate.basedir}/lib'
          },
          { groupId:  'org.jogamp.gluegen',
            artifactId:  'gluegen-rt',
            version:  '${jogl.version}',
            type:  'jar',
            classifier: 'natives-linux-amd64',
            outputDirectory: '${picrate.basedir}/lib'
          },
          # { groupId:  'org.jogamp.jogl',
          #   artifactId:  'jogl-all',
          #   version:  '${jogl.version}',
          #   classifier: 'natives-linux-aarch64',
          #   type:  'jar',
          #   outputDirectory: '${picrate.basedir}/lib'
          # },
          # { groupId:  'org.jogamp.gluegen',
          #   artifactId:  'gluegen-rt',
          #   version:  '${jogl.version}',
          #   type:  'jar',
          #   classifier: 'natives-linux-aarch64',
          #   outputDirectory: '${picrate.basedir}/lib'
          # }
          { groupId:  'org.jogamp.jogl',
            artifactId:  'jogl-all',
            version:  '${jogl.version}',
            classifier: 'natives-linux-armv6hf',
            type:  'jar',
            outputDirectory: '${picrate.basedir}/lib'
          },
          { groupId:  'org.jogamp.gluegen',
            artifactId:  'gluegen-rt',
            version:  '${jogl.version}',
            type:  'jar',
            classifier: 'natives-linux-armv6hf',
            outputDirectory: '${picrate.basedir}/lib'
          }
        ]
      )
    end
  end

  plugin( :resources, '2.7',
    'encoding' =>  'UTF-8' )
    plugin( :compiler, '3.7.0',
      'source' =>  '1.8',
      'target' =>  '1.8' )
      plugin( :pmd, '3.3',
        'sourceEncoding' =>  'utf-8',
        'minimumTokens' =>  '100',
        'targetJdk' =>  '${compileSource}' )
        build do
          resource do
            directory '${source.directory}/main/java'
            includes ['**/**/*.glsl', '**/*.jnilib']
            excludes '**/**/*.java'
          end
          resource do
            directory '${source.directory}/main/resources'
            includes ['**/*.png', '*.txt']
          end
        end
      end
