package com.login.entity;

import java.lang.String;

privileged aspect UserEntity_Roo_ToString {
    
    public String UserEntity.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Roles: ").append(getRoles() == null ? "null" : getRoles().size()).append(", ");
        sb.append("Password: ").append(getPassword()).append(", ");
        sb.append("Username: ").append(getUsername()).append(", ");
        sb.append("AccountNonExpired: ").append(isAccountNonExpired()).append(", ");
        sb.append("AccountNonLocked: ").append(isAccountNonLocked()).append(", ");
        sb.append("CredentialsNonExpired: ").append(isCredentialsNonExpired()).append(", ");
        sb.append("Enabled: ").append(isEnabled());
        return sb.toString();
    }
    
}
