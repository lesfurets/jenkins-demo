import com.lesfurets.jenkins.unit.cps.BaseRegressionTestCPS
import org.junit.Before
import org.junit.Test

class TestJenkinsfile extends BaseRegressionTestCPS {

    @Override
    @Before
    void setUp() throws Exception {
        super.setUp()
        helper.scriptRoots += 'src/main/groovy'
        helper.baseScriptRoot = ''
        binding.setVariable('scm', [
                $class                           : 'GitSCM',
                branches                         : [[name: 'AMX-12345_test']],
                doGenerateSubmoduleConfigurations: false,
                extensions                       : [],
                submoduleCfg                     : [],
                userRemoteConfigs                : [[ url          : "/var/git-repo" ]]
        ])
        helper.registerAllowedMethod('sh', [Map.class], { args ->
            if (args.script == 'git rev-parse HEAD') {
                return '2345aef'
            } else {
                throw new IllegalArgumentException()
            }
        })
        helper.registerAllowedMethod( 'writeFile', [Map.class], { args ->
            println "MOCK: Writing '${args.text}' to <${args.file}>"
        })
        helper.registerAllowedMethod('archive', [String.class], null)
    }

    @Test
    void testNonRegression() throws Exception {
        loadScript('Jenkinsfile')
        super.testNonRegression(false)
    }
}
