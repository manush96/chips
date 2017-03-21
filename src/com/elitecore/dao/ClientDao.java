package com.elitecore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.elitecore.dto.Clientdto;
import com.elitecore.model.Client;
import com.elitecore.model.Query;
import com.elitecore.model.Report;

@Repository("Clientdao")
public class ClientDao {

	private EntityManager em1;
	
	Date date=new Date();
	String newDate=date.getYear()+1900+"-"+(date.getMonth()+1)+"-"+date.getDate();
	String date_time=newDate+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
	
	@PersistenceContext
	public void setEntityManager(EntityManager em1)
	{
	    this.em1 = em1;
	}
	@Autowired
	JdbcTemplate template;

	public int check_attempts(String contact) 
	{
		System.out.println("Client nu id leva jais....");
		String block_classifier="select id from client where contact='"+contact+"'";
		int client_id=template.queryForInt(block_classifier);
		
		System.out.println("main problem ahiya thiii jjj chalu thaay 6..... huhhh....");
		String sql2="select data_attempt from audit where client_id='"+client_id+"' AND date='"+newDate+"'";
		
		if(template.queryForList(sql2).size()!=0)
		{
			int data_attempt=template.queryForInt(sql2);
			System.out.println("data_attempt ni value su ave 6 evi to???? "+data_attempt+" --------");
			return data_attempt;
		}
		else{
			System.out.println("joyu ane ky style thi problem solving....");
			return 0;
		}
	}
	
	public int max_attempts()
	{
		String sql="select max_attempts from max_attempts";
		int max_attempts=template.queryForInt(sql);
		System.out.println("Maximum Allowed Attempts Are "+max_attempts);
		
		return max_attempts;
		
	}
	

	public void save_client(Client client, int OTP) {
		// TODO Auto-generated method stub
		System.out.println("Trying to Save Client data to the DataBase...");
		System.out.println(client.getId());
		System.out.println(client.getContact()+"---"+client.getUsername()+"---"+client.getBlocked());
		
		String sql="INSERT INTO `client`( `contact`, `OTP`, `username`) VALUES ('"+client.getContact()+"','"+OTP+"','"+client.getUsername()+"')";
		template.update(sql);
		
		System.out.println("Client Data Successfully saved to the database...");
	}

	public void change_limit(int maximum) {
		// TODO Auto-generated method stub
		String sql="update max_attempts set max_attnempts="+maximum+" where id='1'";
		template.update(sql);
		
		
	}

	public int check_client(String contact, String username) {
		// TODO Auto-generated method stub
		
		String sql="select blocked from client where contact='"+contact+"'";
		
		//to check if already registered client or not
		List<Map<String, Object>> client_blocked=template.queryForList(sql);		
		int isClient=client_blocked.size();
		System.out.println("value of isClient is="+isClient);
		//to get the blocked value
		
		if(isClient==0)
		{
			//making new client in the database
			System.out.println("in the if condition...");
			String join="insert into client(`contact`,`username`) values ('"+contact+"','"+username+"')";
			template.update(join);
			return -5;
		}
		else
		{
			int blocked=template.queryForInt(sql);
			System.out.println("Blocked is="+blocked);
			return blocked;
		}
	}

	public void check_otp_attempt(String contact) {
		// TODO Auto-generated method stub
		
		System.out.println("in the check_otp_attempt");
		String sql="select id from client where contact='"+contact+"'";
		int client_id=template.queryForInt(sql);
		
		System.out.println("response of client ID is"+client_id+"---------------------------------------");
		
		String sql2="select otp_attempt from audit where client_id='"+client_id+"' AND date='"+newDate+"'";
		List<Map<String, Object>> audit=template.queryForList(sql2);
		int is_entered_audit=audit.size();
		System.out.println("Is ENTERED AUDIT list size is ="+is_entered_audit);
		
		if(is_entered_audit==0)
		{
			
			String Sql3="insert into audit(`client_id`,`date`) values('"+client_id+"','"+newDate+"')";
			template.update(Sql3);
			System.out.println("After inserting into the Audit....");
		}
		else{
			
			System.out.println("Updating in the Audit of thr value of OTP ATTEMPT....");
			String sql4="update audit set otp_attempt=otp_attempt+1 where client_id='"+client_id+"' AND date='"+newDate+"'";
			template.update(sql4);
		}
	}

	public int add_data_attempt(String contact) {
		// TODO Auto-generated method stub
		String sql="select id from client where contact='"+contact+"'";
		int client_id=template.queryForInt(sql);
		
		String sql2="update audit set data_attempt=data_attempt+1 where client_id='"+client_id+"' AND date='"+newDate+"'";
		template.update(sql2);
		return client_id;
	}

	public void add_attempt(int client_id, int oTP) {
		// TODO Auto-generated method stub
		String sql="insert into attempts(`client_id`,`OTP`) values('"+client_id+"','"+oTP+"')";
		template.update(sql);
		
	}

	public List<Client> getReportBykeyword(String keyword,int pageid,int total){
		String sql = "select * from client where contact LIKE '%" + keyword + "%' limit " + (pageid - 1) + "," + total;
		System.out.println(sql);
		return template.query(sql,new RowMapper<Client>(){
				public Client mapRow(ResultSet rs, int row) throws SQLException {
					Client e=new Client();
					e.setId(rs.getLong("id"));
					e.setUsername(rs.getString("username"));
					e.setContact(rs.getString("contact"));
					e.setBlocked(rs.getInt("blocked"));
					e.setPrivilege(rs.getInt("privilege"));
					return e;
			}
		});
	}
	public int getcount(String key) {
		// TODO Auto-generated method stub
		String sql="select count(id) as cnt from client where contact LIKE '%"+key+"%'";
		int total= template.queryForInt(sql);
		return total;
	}
	
}
