package kr.co.toondra.base.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BaseDao extends SqlSessionDaoSupport {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	protected int insert(String statement) {
		return getSqlSession().insert(statement);
	}
	
	protected int insert(String statement, Object parameter) {
		return getSqlSession().insert(statement, parameter);
	}
	
	protected int update(String statement) {
		return getSqlSession().update(statement);
	}
	
	protected int update(String statement, Object parameter) {
		return getSqlSession().update(statement, parameter);
	}
	
	protected int delete(String statement) {
		return getSqlSession().delete(statement);
	}
	
	protected int delete(String statement, Object parameter) {
		return getSqlSession().delete(statement, parameter);
	}
	
	protected <T> T selectOne(String statement) {
		return getSqlSession().selectOne(statement);
	}
	
	protected <T> T selectOne(String statement, Object parameter) {
		return getSqlSession().selectOne(statement, parameter);
	}
	
	protected <E> List<E> selectList(String statement) {
		return getSqlSession().selectList(statement);
	}
	
	protected <E> List<E> selectList(String statement, Object parameter) {
		return getSqlSession().selectList(statement, parameter);
	}
}
