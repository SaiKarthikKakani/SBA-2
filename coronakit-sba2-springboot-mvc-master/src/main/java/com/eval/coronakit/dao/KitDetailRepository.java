package com.eval.coronakit.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eval.coronakit.entity.KitDetail;

@Repository
public interface KitDetailRepository extends JpaRepository<KitDetail, Integer> {
	@Query("select k from KitDetail k where k.productId = :productId and k.coronaKitId = :coronaKitId")
	KitDetail findItemByProductIdAndCoronaKitId(@Param("productId") Integer productId,
			@Param("coronaKitId") Integer coronaKitId);
	
	@Query("select k1 from KitDetail k1 where k1.coronaKitId = :coronaKitId")
	List<KitDetail> findKitItemsByCoronaId(@Param("coronaKitId") Integer coronaKitId);
}
