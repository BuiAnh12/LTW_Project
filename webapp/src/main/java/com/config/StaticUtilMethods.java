package com.config;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class StaticUtilMethods {

    @Autowired
    private final Map<String, String> responseMessages = null;

    public ModelAndView customResponseModelView(
            @NonNull HttpServletRequest request,
            @NonNull Map<String, Object> model, 
            String pageModel) {

        ModelAndView modelAndView = new ModelAndView(pageModel);

        Object errCode = model.getOrDefault("errorCode", null);
        if (errCode == null)
            errCode = request.getSession().getAttribute("errorCode");
        if (errCode != null) {
            modelAndView.addObject("errorMessage", responseMessages.get(errCode.toString()));
            request.getSession().invalidate();
        }

        Object succeedCode = model.getOrDefault("succeedCode", null);
        if (succeedCode == null)
            succeedCode = request.getSession().getAttribute("succeedCode");
        if (succeedCode != null) {
            modelAndView.addObject("succeedMessage", responseMessages.get(succeedCode.toString()));
            request.getSession().invalidate();
        }

        return modelAndView;
    }
}
