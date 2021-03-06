package com.jhta.neocom.config;

import javax.sql.DataSource;


import com.jhta.neocom.service.CustomSecurityUsersService;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
    @Autowired
    private CustomSecurityUsersService customSecurityUsersService;

    @Autowired
    private DataSource dataSource;

    @Bean
    public PersistentTokenRepository tokenRepository() {
        JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
        jdbcTokenRepository.setDataSource(dataSource);
        return jdbcTokenRepository;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customSecurityUsersService);
        authProvider.setPasswordEncoder(passwordEncoder());

        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        super.configure(auth);
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/static/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // http.authorizeRequests().antMatchers("/**").permitAll().anyRequest().authenticated().and().httpBasic();
        // http.cors().and();
        http.csrf().disable();
        http.authorizeRequests() // ?????? ????????? ????????? ??? ????????? ?????? ????????? ????????? ??? ??????.

                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/member/**").hasAnyRole("ADMIN", "MANAGER", "USER")
                .antMatchers("/**").permitAll()//.and().formLogin()    
                .and().formLogin()
                .loginPage("/account/login") // ???????????? ?????? ??? ??????
                .loginProcessingUrl("/account/login")// ?????????form??? action??? ????????????????????? ???.
                .defaultSuccessUrl("/") // ????????? ?????? ??? ????????? ??????.
                .failureUrl("/account/login?error=true").permitAll() // ????????? ???????????? ??? ???????????? ?????? url, ????????? form?????? ???????????????
                                                                     // error=true??? ??????

                .and().logout().permitAll().logoutUrl("/account/logout").logoutSuccessUrl("/").and().exceptionHandling()
                .accessDeniedPage("/account/denied"); // ????????? ?????? ????????? ????????????????????? ???
       

        http.rememberMe().key("jpa").userDetailsService(customSecurityUsersService).tokenRepository(tokenRepository());
    }

}