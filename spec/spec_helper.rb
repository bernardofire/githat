$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'githat'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

module Diff
  def files_names
    ['bar.rb', 'foo.rb']
  end
end

def _1_file_2_heads
  %{diff --git a/spec/githat_spec.rb b/spec/githat_spec.rb
index 0c55061..217f540 100644
--- a/spec/githat_spec.rb
+++ b/spec/githat_spec.rb
@@ -1,11 +1,5 @@
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

-module Diff
-  def files_names
-    ['bar.rb', 'foo.rb']
-  end
-end
-
describe "Githat" do
  before(:each) { extend Diff }

@@ -19,12 +13,12 @@ describe "Githat" do
    end

    it "files_names" do
+      files_names.should == ['bar.rb', 'foo.rb'] # mocked
    end

-    it "files_info" do
-    end
-
-    it "file_diff" do
+    it "split_heads" do
+      puts _1_file_2_heads
+      split_heads(_1_file_2_heads).should == []
    end
  end
end}
end

RSpec.configure do |config|
end
