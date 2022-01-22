package com.koreait.blog.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.koreait.blog.service.BoardService;
import com.koreait.blog.service.BoardServiceImpl;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@PropertySource("classpath:mybatis/properties/db.properties")

@EnableScheduling
public class Config {
	
	@Value("${hikariConfig.driverClassName}") private String driverClassName;
	@Value("${hikariConfig.jdbcUrl}") private String jdbcUrl;
	@Value("${hikariConfig.username}") private String username;
	@Value("${hikariConfig.password}") private String password;
	
	@Bean
	public HikariConfig hikariConfig() {
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(driverClassName);
		hikariConfig.setJdbcUrl(jdbcUrl);
		hikariConfig.setUsername(username);
		hikariConfig.setPassword(password);
		return hikariConfig;
	}
	
	@Bean(destroyMethod="close")
	public HikariDataSource hikariDataSource() {
		return new HikariDataSource(hikariConfig());
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(hikariDataSource());
		sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/mapper/*.xml"));
		sqlSessionFactoryBean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:mybatis/config/mybatis-config.xml"));
		return sqlSessionFactoryBean.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}
	
	@Bean
	public BoardService boardService() throws Exception {
		return new BoardServiceImpl(sqlSession());
	}
	/*
	@Bean ReviewService reviewService() throws Exception {
		return new ReviewServiceImpl(sqlSession());
	}
	
	@Bean ArtService artService() throws Exception {
		return new ArtServiceImpl(sqlSession());
	}
	

	@Bean 
	public RentalService rentalService() throws Exception{
		return new RentalServiceImpl(sqlSession());
	}
	
	@Bean
	public CartService cartService() throws Exception{
		return new CartServiceImpl(sqlSession());
	}
	
	@Bean
	public CommentsService commentsService() throws Exception {
		return new CommentsServiceImpl(sqlSession());
	}
	
	@Bean
	public JavaMailSender javaMailSender() {
		
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost("smtp.gmail.com");
		sender.setPort(587);
		sender.setUsername("wispring08@gmail.com");  // 구글아이디
		sender.setPassword("qwert1234!@#$");            // 구글비밀번호
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		sender.setJavaMailProperties(properties);
		
		return sender;
		
	}
	 */
}
	
