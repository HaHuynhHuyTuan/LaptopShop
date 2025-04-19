package com.example.demo.config;

import com.example.demo.service.CustomUserDetailsService;
import com.example.demo.service.UserService;
import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }

    @Bean
    public DaoAuthenticationProvider authProvider(
            PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) {

        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        authProvider.setHideUserNotFoundExceptions(false);

        return authProvider;
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler(UserService userService) {
        return new CustomSuccessHandler(userService);
    }

    @Bean
    public SpringSessionRememberMeServices rememberMeServices() {
        SpringSessionRememberMeServices rememberMeServices =
                new SpringSessionRememberMeServices();
        // optionally customize
        rememberMeServices.setAlwaysRemember(true);
        return rememberMeServices;
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http, UserService userService) throws Exception {
        http
                // Tắt CSRF tạm thời để form POST không bị chặn 403
//                .csrf(AbstractHttpConfigurer::disable)

                .authorizeHttpRequests(authorize -> authorize
                        // Cho phép servlet dispatcher (forward/include) đi qua
                        .dispatcherTypeMatchers(
                                DispatcherType.FORWARD,
                                DispatcherType.INCLUDE
                        ).permitAll()

                        // Cho phép truy cập công khai
                        .requestMatchers(
                                "/",
                                "/login",
                                "/client/**",
                                "/product/**",
                                "/css/**",
                                "/js/**",
                                "/images/**",
                                "/resources/**"
                        ).permitAll()

                        // (Tùy chọn) Chỉ ADMIN được truy cập /admin/**
                        .requestMatchers("/admin/**").hasRole("ADMIN")

                        // Các request khác phải authenticated
                        .anyRequest().authenticated()
                )

                .sessionManagement((sessionManagement) -> sessionManagement
                        .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                        .invalidSessionUrl("/logout?expired")
                        .maximumSessions(1)
                        .maxSessionsPreventsLogin(false))

                //.logout(logout->logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))


                .rememberMe(r ->
                        r.rememberMeServices(rememberMeServices()))

                .formLogin(form -> form
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .successHandler(customSuccessHandler(userService))
                        .permitAll()
                )
                .exceptionHandling(ex ->
                        ex.accessDeniedPage("/access-deny"));

        return http.build();
    }


}
