package com.elitecore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.elitecore.model.Query;
import com.elitecore.model.queryin;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@SuppressWarnings("unused")
@Repository("querydao")
public class querydao {
	private EntityManager em1;

	@PersistenceContext
	public void setEntityManager(EntityManager em1) {
		this.em1 = em1;
	}

	public void insertquery(Query query) {

		System.out.println(query.getQuery());
		em1.getTransaction().begin();
		em1.persist(query);
		em1.getTransaction().commit();
	}

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<Query> getqueryByPage(int pageid, int total) {
		String sql = "select * from query limit " + (pageid - 1) + "," + total;
		return template.query(sql, new RowMapper<Query>() {
			public Query mapRow(ResultSet rs, int row) throws SQLException {
				Query e = new Query();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setDescription(rs.getString("description"));
				e.setQuery(rs.getString("query"));
				e.setStatus(rs.getInt("status"));
				return e;
			}
		});
	}

	public List<Query> getqueryByPage(String keyword, int pageid, int total) {
		// SELECT * FROM Table WHERE Country LIKE '%keyword%'
		String sql = "select * from query where name LIKE '%" + keyword + "%' limit " + (pageid - 1) + "," + total;
		return template.query(sql, new RowMapper<Query>() {
			public Query mapRow(ResultSet rs, int row) throws SQLException {
				Query e = new Query();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setDescription(rs.getString("description"));
				e.setQuery(rs.getString("query"));
				e.setStatus(rs.getInt("status"));
				return e;
			}
		});

	}

	public List<Query> getbyname() {
		String sql = "select id,name,query from query";
		return template.query(sql, new RowMapper<Query>() {
			public Query mapRow(ResultSet rs, int row) throws SQLException {
				Query e = new Query();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setQuery(rs.getString("query"));
				return e;
			}
		});

	}

	public void saveQuery(Query query) {
		em1.persist(query);
	}

	public int editUser(Query query) {
		String sql = "UPDATE `query` SET `description`='" + query.getDescription() + "',`query`='" + query.getQuery()
				+ "' WHERE `id`='" + query.getId() + "'";
		return template.update(sql);

	}

	public int dltQuery(int id) {

		String sql = "delete from query where `id`='" + id + "'";
		String sq1 = "delete from queryin where `query_id`=" + id;
		template.update(sq1);
		return template.update(sql);
	}

	public int getcount(String key) {
		
		String sql="select count(id) as cnt from query where name LIKE '%"+key+"%'";
		int total= template.queryForInt(sql);
		return total;
	}

	public void addparamquery(List<queryin> list) {
		// TODO Auto-generated method stub

		System.out.println("break4" + " " + list.size());
		for (int i = 0; i < list.size(); i++) {

			System.out.println("break" + i + 7);
			queryin q = list.get(i);
			String sql = "select max(id) from query";

			q.setQuery_id(template.queryForInt(sql));
			em1.persist(q);
			System.out.println("break" + i + 10);

		}

	}

	public int multidelete(String ids) {
		String sql = "delete from query WHERE id IN (" + ids + ")";
		String sql1 = "delete from queryin WHERE query_id IN (" + ids + ")";
		template.update(sql1);
		return template.update(sql);
	}

	public HashMap getparams(List<Query> list) {
		
		Query query = new Query();
		int id;
		String myJson;
		HashMap params = new HashMap();
		System.out.println("STARTTT");
		for(int i=0; i<list.size(); i++)
		{
			query = list.get(i);
			id = query.getId();
			
			String sql = "select id, param_name, param_type from queryin WHERE query_id = " + id;
			System.out.println(sql);
			List<queryin> lq = get_queryin_params(sql);
			myJson = new Gson().toJson(lq);
			params.put(id,myJson);
		}
		return params;
	}

	private List<queryin> get_queryin_params(String sql) {
		return template.query(sql, new RowMapper<queryin>() {
			public queryin mapRow(ResultSet rs, int row) throws SQLException {
				
				queryin e = new queryin();
				e.setParam_name(rs.getString("param_name"));
				e.setParam_type(rs.getString("param_type"));
				return e;
			}
		});
	}

	public void updateparamquery(List<queryin> list, int id) {
		
		System.out.println("Start print");
		for (int i = 0; i < list.size(); i++) {

			queryin q = list.get(i);
			q.setQuery_id(id);
		
			String sql = "UPDATE `queryin` SET `param_name`='" + q.getParam_name() + "',`param_type`='" + q.getParam_type()
					+ "' WHERE `id`='" + id + "'";
			System.out.println(sql);
			 template.update(sql);

		}
		System.out.println("End print");

	}

}
