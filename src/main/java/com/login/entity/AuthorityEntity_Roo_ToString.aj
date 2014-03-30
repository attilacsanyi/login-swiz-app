package com.login.entity;

import java.lang.String;

privileged aspect AuthorityEntity_Roo_ToString {
    
    public String AuthorityEntity.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Description: ").append(getDescription());
        return sb.toString();
    }
    
}
