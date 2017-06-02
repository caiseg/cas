package org.jasig.cas.util;

import java.util.Map;
import javax.validation.constraints.NotNull;

import org.jasig.cas.adaptors.jdbc.AbstractJdbcUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.handler.AuthenticationException;
import org.jasig.cas.authentication.handler.BadUsernameOrPasswordAuthenticationException;
import org.jasig.cas.authentication.principal.UsernamePasswordCredentials;
import org.springframework.dao.IncorrectResultSizeDataAccessException;

public class CustomQueryDatabaseAuthenticationHandler extends
		AbstractJdbcUsernamePasswordAuthenticationHandler {

	private static final String ERROR_1 = "error.authentication.usernameorpwd";
	private static final String ERROR_2 = "error.authentication.username.deleted";
	private static final String ERROR_3 = "error.authentication.username.enable";
	private static final String ERROR_4 = "error.authentication.username.exist";
	
	@NotNull
    private String sql;
	
	@Override
	protected boolean authenticateUsernamePasswordInternal(
			UsernamePasswordCredentials credentials) throws AuthenticationException {
		final String username = getPrincipalNameTransformer().transform(credentials.getUsername());
        final String password = credentials.getPassword();
        final String encryptedPassword = this.getPasswordEncoder().encode(
            password);
        
        try {
        	final Map userMap = getJdbcTemplate().queryForMap(sql, username);
        	final String dbPassword = userMap.get("password").toString();
        	//final String isEnable = userMap.get("is_enable").toString();
        	//final String isDelete = userMap.get("is_deleted").toString();
        	String isDelete = "0";//默认是未删除的
        	String isEnable = "1";//默认是可用的
        	if (dbPassword == null || dbPassword.isEmpty() || dbPassword.length() == 0){
        		throw new BadUsernameOrPasswordAuthenticationException(ERROR_4);
        	}
        	if (!dbPassword.equals(encryptedPassword)){
        		throw new BadUsernameOrPasswordAuthenticationException(ERROR_1);
        	}
        	if (isDelete.equals("1")){
        		throw new BadUsernameOrPasswordAuthenticationException(ERROR_2);
        	}
        	if (isEnable.equals("0")){
        		throw new BadUsernameOrPasswordAuthenticationException(ERROR_3);
        	}
            return true;
        } catch (final IncorrectResultSizeDataAccessException e) {
            return false;
        }
	}
	
	public void setSql(final String sql) {
        this.sql = sql;
    }

}
