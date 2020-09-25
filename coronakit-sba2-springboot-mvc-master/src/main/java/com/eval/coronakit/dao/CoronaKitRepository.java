package com.eval.coronakit.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.eval.coronakit.entity.CoronaKit;

@Repository
public interface CoronaKitRepository extends JpaRepository<CoronaKit, Integer>{
	@Query("select max(id) from CoronaKit")
	int getMaxCoronaKitId();
}
