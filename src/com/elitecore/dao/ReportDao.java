package com.elitecore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.elitecore.model.DBMaster;
import com.elitecore.model.Report;

@Repository("Reportdao")
public class ReportDao {
		private EntityManager em1;
			
		@PersistenceContext
		public void setEntityManager(EntityManager em1)
		{
		    this.em1 = em1;
		}
		
		@Autowired
		JdbcTemplate template;
		

		public void saveReport(Report r) {
			System.out.println("in dao, before invoking add report persist");
			em1.persist(r);
			System.out.println("in dao, after invoking add report persist");
		}
		public int dltReport(int id) {
			
			String sql="delete from report where `id`='"+id+"'";
			template.update(sql);
			return template.update(sql);
		}

		public int getcount() throws DataAccessException{
			
			String sql="select count(`id`) from report";
			int total= template.queryForInt(sql);
			return total;
		}
		
		public List<Report> getReportByPage(int pageid,int total){
			String sql="select * from report";
			System.out.println(sql);
			return template.query(sql,new RowMapper<Report>(){
					public Report mapRow(ResultSet rs, int row) throws SQLException {
						Report e=new Report();
						e.setId(rs.getInt("id"));
						e.setDb_id(rs.getInt("db_id"));
						e.setQuery_id(rs.getInt("query_id"));
						e.setDisplay_name(rs.getString("display_name"));
						e.setReport_name(rs.getString("report_name"));
						return e;
				}
			});
		}

		public int multideleterep(String ids) {
			String sql = "delete from report WHERE id IN (" + ids + ")";
			return template.update(sql);
		}

		
}