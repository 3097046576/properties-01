package com.my.exceptionCatch;

import com.my.excption.AccExistenceException;
import com.my.excption.AccNoFindException;
import com.my.util.ResultPage;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class UserException{
    private final String VIEW_NAME = "errorPage/error";
    private final String ERROR = "error";


    @ExceptionHandler( AccNoFindException.class )
    public ModelAndView accNoFind( AccNoFindException accessException){
        return operation(accessException);
    }

    @ExceptionHandler( AccExistenceException.class )
    @ResponseBody
    public ResultPage<String> accExistence(AccExistenceException accExistenceException ){
        return new ResultPage<String>(accExistenceException.getMessage(),"false");
    }

    @ExceptionHandler( NullPointerException.class )
    @ResponseBody
    public ResultPage<String> nullData(NullPointerException nullPointerException ){
        return new ResultPage<String>(nullPointerException.getMessage(),"false");
    }

    public ModelAndView operation( Exception exception ){

        ModelAndView modelAndView = new ModelAndView(VIEW_NAME);

        modelAndView.addObject(ERROR,exception.getMessage());

        return modelAndView;
    }

}
