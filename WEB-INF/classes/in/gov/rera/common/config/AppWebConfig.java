package in.gov.rera.common.config;

import in.gov.rera.interceptor.AdminInterceptor;
import in.gov.rera.interceptor.AgentInterceptor;
import in.gov.rera.interceptor.AuthorityUserInterceptor;
import in.gov.rera.interceptor.OperatorUserInterceptor;
import in.gov.rera.interceptor.ProjectInterceptor;
import in.gov.rera.interceptor.SessionInterceptor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles2.TilesConfigurer;
import org.springframework.web.servlet.view.tiles2.TilesViewResolver;

@Configuration
@ComponentScan("in.gov.*")
@EnableWebMvc
public class AppWebConfig extends WebMvcConfigurerAdapter {

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer
				.setDefinitions(new String[] {"WEB-INF/tiles/homePageTiles.xml","WEB-INF/tiles/internalPagesTiles.xml","WEB-INF/tiles/adminPageTiles.xml","WEB-INF/tiles/agentPagesTiles.xml","WEB-INF/tiles/usersPageTiles.xml" });

		tilesConfigurer.setCheckRefresh(true);
		return tilesConfigurer;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	TilesViewResolver viewResolver() {
		TilesViewResolver viewResolver = new TilesViewResolver();
		return viewResolver;
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver createMultipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");
		resolver.setMaxInMemorySize(102030);
		return resolver;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		 registry.addInterceptor(getSessionInterceptor()).addPathPatterns("/**");
		 registry.addInterceptor(getAdminInterceptor()).addPathPatterns("/admin/**");
		 registry.addInterceptor(getAgentInterceptor()).addPathPatterns("/agent/**");
		 registry.addInterceptor(getProjectInterceptor()).addPathPatterns("/project/**");
		 registry.addInterceptor(getAuthorityUserInterceptor()).addPathPatterns("/authority/**");
		 registry.addInterceptor(getOperatorUserInterceptor()).addPathPatterns("/operator/**");
	      
	        
		//super.addInterceptors(registry);
	}
	
	@Bean
	public SessionInterceptor getSessionInterceptor() {
	    return new SessionInterceptor();
	}
	
	
	@Bean
	public AgentInterceptor getAgentInterceptor() {
	    return new AgentInterceptor();
	}
	@Bean
	public AdminInterceptor getAdminInterceptor() {
	    return new AdminInterceptor();
	}
	@Bean
	public ProjectInterceptor getProjectInterceptor() {
	    return new ProjectInterceptor();
	}
	@Bean
	public AuthorityUserInterceptor getAuthorityUserInterceptor() {
	    return new AuthorityUserInterceptor();
	}
	@Bean
	public OperatorUserInterceptor getOperatorUserInterceptor() {
	    return new OperatorUserInterceptor();
	}
	
}
