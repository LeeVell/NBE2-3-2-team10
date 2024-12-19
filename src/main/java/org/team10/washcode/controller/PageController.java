package org.team10.washcode.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.team10.washcode.ResponseDTO.pickup.PickupDetailResDTO;
import org.team10.washcode.service.PickupService;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class PageController {
    private final PickupService pickupService;

    @RequestMapping("/shop-main")
    public String shopMain(Model model) {
        return "Shop/shop-main";
    }
    @RequestMapping("/pickup-check")
    public String pickupCheck(Model model) {
        List<PickupDetailResDTO> pickupList = pickupService.getPickupList(1L);
        model.addAttribute("pickupList", pickupList);
        return "Shop/pickup-check";
    }

    @RequestMapping("/pickup-list")
    public String pickupList(Model model) {
        return "Shop/pickup-list";
    }

    @RequestMapping("/pickup-detail")
    public String pickupDetail(Model model) {
        return "Shop/pickup-detail";
    }

    @RequestMapping("/sales-summary")
    public String salesSummary(Model model) {
        return "Shop/sales-summary";
    }

    @RequestMapping("/shop-review")
    public String shopReview(Model model) {
        return "Shop/shop-review";
    }

    @RequestMapping("/modify-shop-info")
    public String modifyShopInfo(Model model) {
        return "Shop/modify-shop-info";
    }
}
