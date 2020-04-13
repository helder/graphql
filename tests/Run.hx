package tests;

import tink.unit.TestBatch;
import tink.testrunner.Runner;
import tink.testrunner.Reporter;

class Run {
  static function main() {
    #if php
    php.Global.require_once('vendor/autoload.php');
    #end
    Runner.run(TestBatch.make([
      //
      //
      new TestRecursion(),
      new TestInputObject(),
      new TestInterfaces()
    ]), new BasicReporter(new AnsiFormatter())).handle(Runner.exit);
  }
}
