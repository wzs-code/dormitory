package com.relam;
import model.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import service.UserService;

/**
 * @author fz
 * @create 2019-01-08 下午 4:41
 */
public class MyShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        return null;
    }

    /**
     * 获取验证信息
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        if(StringUtils.isBlank(usernamePasswordToken.getUsername())){
            return null;
        }else if(StringUtils.isBlank(String.valueOf(usernamePasswordToken.getPassword()))){
            return null;
        }
        /**
         * 下面可以写自己的验证逻辑（因为是测试用例，简单验证下）
         */

        User user = userService .findUserByUsername(usernamePasswordToken.getUsername());
        if(user == null){
            System.out.println("空");
            throw new AuthenticationException("用户信息认证失败");
        }else {
            System.out.println("用户信息认证成功");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(usernamePasswordToken.getUsername(), user.getPassword(), getName());
        return info;
    }



    public void setSecurityManager(DefaultWebSecurityManager securityManager) {
    }
}