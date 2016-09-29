package com.elitecore.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.elitecore.model.DBMaster;
import com.elitecore.model.Query;
import com.elitecore.model.Report;
import com.elitecore.model.User;
import com.elitecore.services.manipulator;

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
		
		JdbcTemplate template1;
		
		int db_id;
		
		String user="root";
		String password="";
		String classname="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/spring";
		@SuppressWarnings("null")
		public void setDataSource() {
//			 	
//			 	Properties dbPropertises=null;
//			 	dbPropertises.setProperty("driver","com.mysql.jdbc.Driver");
//			 	dbPropertises.setProperty("jdbcUrl","jdbc:mysql://localhost:3306/de");
//			 	dbPropertises.setProperty("user",user);
//			 	dbPropertises.setProperty("password",password);
//			 	dbPropertises.setProperty("acquireIncrement","5");
//			 	dbPropertises.setProperty("idleConnectionTestPeriod","60");
//			 	dbPropertises.setProperty("maxPoolSize","10");
//			 	dbPropertises.setProperty("maxStatements","50");
//			 	dbPropertises.setProperty("minPoolSize","2");
//			 	dataSource.setDbProperties(dbPropertises);
				BasicDataSource datasource=new BasicDataSource();
				datasource.setDriverClassName(classname);
				datasource.setUsername(user);
				datasource.setPassword(password);
				datasource.setUrl(url);
		        template1 = new JdbcTemplate(datasource);
		}
		

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
		
		public List<Report> getReportByPage(int pageid,int total){
			String sql="select * from report LIMIT " + (pageid - 1) + "," + total;
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
		public List<Query> getbyid(int id)
		{
			String sql="select id,query from query where id="+id;
			return template.query(sql, new RowMapper<Query>() {
				public Query mapRow(ResultSet rs, int row) throws SQLException {
					Query e = new Query();
					e.setId(rs.getInt("id"));
					e.setQuery(rs.getString("query"));
					return e;
				}
			});
		}
		public List<Map<String,Object>> runner(int id, String disp_name, int db_id)
		{
			this.db_id=db_id;
			coreJdbc(db_id);
			DataSource dataSource=new DataSource();
			setDataSource();
			
			//printing the username and password of database from which we will generate the report..
			System.out.println("For particular Database...USERNAME= "+user+" and PASSWORD= "+password);
			
			String sql1="select query from query where id="+id;
			String sql="";
			List<Map<String,Object>> list=template.queryForList(sql1);
			
			for(int i=0;i<list.size();i++)
			{
				Map<String,Object> m=list.get(i);
				System.out.println("Map "+m);
				for(Map.Entry<String, Object> entry:m.entrySet())
				{
					sql=sql+(String)entry.getValue();
					System.out.println("inner For"+sql);
				}
			}	
			
			System.out.println("Final Query "+sql);
			String final_string=manipulator.convsql(sql, disp_name);
			System.out.println("Final String "+ final_string);
			return template1.queryForList(final_string);
		}

		private void coreJdbc(int db_id2) {
			
			String driverstring="com.mysql.jdbc.Driver";
			String connectionstring="jdbc:mysql://localhost:3306/spring?user=root";
			
			Scanner sc= new Scanner(System.in);
			
			try
			{
				Class.forName(driverstring);
				
				Connection con= DriverManager.getConnection(connectionstring);
				
				Statement st=con.createStatement();
				
							
				String query="select * from db_master where id="+db_id2;
				ResultSet rs= st.executeQuery(query);
				
				while(rs.next())
				{
					user=rs.getString("username");
					password=rs.getString("password");
					//classname =rs.getString("url");
					//url= rs.getString("url");
				}
				
				rs.close();
				st.close();
				con.close();			
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}


		public List<Map<String,Object>> runner1(String query, String disp_name, int db_id)
		{
			
			String final_string=manipulator.convsql(query, disp_name);			
			return template1.queryForList(final_string);
		}
		public List<Report> getReportBykeyword(String keyword,int pageid,int total){
			String sql = "select * from report where report_name LIKE '%" + keyword + "%' limit " + (pageid - 1) + "," + total;
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
		
		public int getcount(String key) {
			
			String sql="select count(id) as cnt from report where report_name LIKE '%"+key+"%'";
			int total= template.queryForInt(sql);
			return total;
		}

		public int getparams(int x)
		{
			String sql="select status from query where id="+x;
			return template.queryForInt(sql);
		}
		public List<User> sample() {
			String sql="select * from user";
			return template.query(sql,new RowMapper<User>(){
				public User mapRow(ResultSet rs, int row) throws SQLException {
					User u=new User();
					u.setId((long) rs.getInt("id"));
					u.setUserName(rs.getString("username"));
					u.setPassword(rs.getString("password"));
					return u;
				}
			});
		}
		
		public Map<String,Object> getScheduled_reportid(int i,int j)
		{
			System.out.println("Inside Dao"+i+" "+j);
			String sql="select report_id from scheduler where start_time='"+i+":"+j+"'";
			
			System.out.println(sql);
			int k=template.queryForInt(sql);
			Map<String,Object> k1=template.queryForMap(sql);
			System.out.println("Result Map"+k1);
			System.out.println();
			System.out.println("Result int"+k);
			return k1;
			
		}
}
