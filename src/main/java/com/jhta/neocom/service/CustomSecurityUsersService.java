package com.jhta.neocom.service;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.repository.MemberRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomSecurityUsersService implements UserDetailsService {
    @Autowired
    private MemberRepository memberRepository;
    boolean a = false;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberVo memberVo = memberRepository.findById(username)
                .orElseThrow(() -> new UsernameNotFoundException("아이디 또는 비밀번호가 틀렸습니다."));
        // System.out.println("vo"+memberVo);
        // System.out.println("b "+memberVo.getRoles());

        memberVo.getRoles().forEach((e) -> {

            if (e.getRoleName().equals("ROLE_NOTUSER")) {
                a = true;
            }
        });
        if (a == true) {
            return null;
        }

        return new CustomUserDetails(memberVo);
    }
}
