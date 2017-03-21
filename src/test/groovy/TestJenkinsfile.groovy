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
    }

    @Test
    void testJenkinsFile() throws Exception {
        loadScript('Jenkinsfile')
        printCallStack()
    }
}
