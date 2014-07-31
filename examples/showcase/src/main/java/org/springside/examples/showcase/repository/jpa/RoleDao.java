/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.sxj.spring.examples.showcase.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.sxj.spring.examples.showcase.entity.Role;

public interface RoleDao extends PagingAndSortingRepository<Role, Long> {

}
