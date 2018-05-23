package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plazasoftware.kushkipagos.gateway.CommonGateway;

import icg.gateway.common.CommonGatewayInterface;

@WebServlet(
        name = "webForm", 
        urlPatterns = {"/webForm"}
    )
public class WebForm extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		String total = req.getParameter("totalAmount");
		String paymentNumber = String.valueOf(new Date().getTime());
		response.sendRedirect("webform.jsp?urlAction=decodePaymentResponseServlet&publicMerchantId=10000002825331705579151380634343&paymentNumOrder="+paymentNumber+"&totalAmount="+total);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
