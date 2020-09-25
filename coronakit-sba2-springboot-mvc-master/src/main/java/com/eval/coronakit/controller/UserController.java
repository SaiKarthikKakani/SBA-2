package com.eval.coronakit.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eval.coronakit.entity.CoronaKit;
import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.CoronaKitService;
import com.eval.coronakit.service.KitDetailService;
import com.eval.coronakit.service.ProductService;

@Controller
@RequestMapping("/user")
public class UserController {
	private int coronaKitInitialId;
	private int quantity;
	List<ProductMaster> productMasterList = new ArrayList<ProductMaster>();

	@Autowired
	ProductService productService;

	@Autowired
	CoronaKitService coronaKitService;

	@Autowired
	KitDetailService kitDetailService;

	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		CoronaKit coronaKit = new CoronaKit();
		this.coronaKitService.saveKit(coronaKit);

		coronaKitInitialId = this.coronaKitService.getMaxCoronaKitId();
		request.getSession().setAttribute("coronaKitUniqueId", coronaKitInitialId);
		quantity = 0;

		return "user-home";
	}

	@RequestMapping("/show-kit")
	public String showKit(Model model, HttpServletRequest request) {
		return "show-cart";
	}

	@RequestMapping("/show-list")
	public String showList(Model model) {
		List<ProductMaster> allProducts = this.productService.getAllProducts();
		model.addAttribute("allProducts", allProducts);

		return "show-all-item-user";
	}

	@RequestMapping("/add-to-cart/{productId}")
	public String showKit(@PathVariable("productId") int productId, Model model, HttpServletRequest request) {
		int totalAmount = 0;
		KitDetail kitDetail;

		ProductMaster productMaster = this.productService.getProductById(productId);

		KitDetail existingDetail = this.kitDetailService.getKitItemByProductIdAndCoronaKitId(productId,
				Integer.parseInt(request.getSession().getAttribute("coronaKitUniqueId").toString()));

		if (existingDetail != null) {
			quantity = existingDetail.getQuantity() + 1;
			existingDetail.setQuantity(quantity);
			existingDetail.setAmount(quantity * productMaster.getCost());

			this.kitDetailService.addKitItem(existingDetail);
		} else {
			productMasterList.add(productMaster);
			quantity = 1;
			kitDetail = new KitDetail();
			kitDetail.setCoronaKitId(
					Integer.parseInt(request.getSession().getAttribute("coronaKitUniqueId").toString()));
			kitDetail.setProductId(productId);
			kitDetail.setQuantity(quantity);
			kitDetail.setAmount(quantity * productMaster.getCost());

			this.kitDetailService.addKitItem(kitDetail);
		}

		List<KitDetail> allKitDetails = this.kitDetailService.getAllKitItemsOfAKit(
				Integer.parseInt(request.getSession().getAttribute("coronaKitUniqueId").toString()));
		for (KitDetail eachKit : allKitDetails) {
			totalAmount = totalAmount + eachKit.getAmount();
		}

		request.getSession().setAttribute("kitDetails", allKitDetails);
		request.getSession().setAttribute("product", productMasterList);
		request.getSession().setAttribute("totalAmount", totalAmount);

		return "show-cart";
	}

	@RequestMapping("/checkout")
	public String checkout(Model model) {
		return "checkout-address";
	}

	@RequestMapping("/finalize")
	public String finalizeOrder(String address, Model model, HttpServletRequest request) {
		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		CoronaKit coronaKitDetail = this.coronaKitService
				.getKitById(Integer.parseInt(request.getSession().getAttribute("coronaKitUniqueId").toString()));
		coronaKitDetail.setDeliveryAddress(address);
		coronaKitDetail.setOrderDate(dateFormat.format(date));
		coronaKitDetail.setTotalAmount(Integer.parseInt(request.getSession().getAttribute("totalAmount").toString()));
		
		this.coronaKitService.saveKit(coronaKitDetail);
		
		model.addAttribute("address", address);
		model.addAttribute("orderDate", dateFormat.format(date));
		model.addAttribute("totalAmount", Integer.parseInt(request.getSession().getAttribute("totalAmount").toString()));

		return "show-summary";
	}

	@RequestMapping("/delete/{itemId}")
	public String deleteItem(@PathVariable("itemId") int itemId, Model model, HttpServletRequest request) {
		int totalAmount = 0;

		this.kitDetailService.deleteKitItemById(itemId);

		List<KitDetail> allKitDetails = this.kitDetailService.getAllKitItemsOfAKit(
				Integer.parseInt(request.getSession().getAttribute("coronaKitUniqueId").toString()));

		for (KitDetail eachKit : allKitDetails) {
			totalAmount = totalAmount + eachKit.getAmount();
		}

		request.getSession().setAttribute("kitDetails", allKitDetails);
		request.getSession().setAttribute("totalAmount", totalAmount);

		return "show-cart";
	}
}
