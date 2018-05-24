package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;

import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.kushki.Kushki;
import com.kushki.KushkiException;
import com.kushki.enums.KushkiEnvironment;
import com.kushki.to.Amount;
import com.kushki.to.Transaction;
@WebServlet(
		name ="processPayment",
		urlPatterns = {"/processPayment"}
)
public class ProcessPayment extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Kushki kushki = new Kushki("10000002825366457629151380634343", "es", "COP",KushkiEnvironment.TESTING);
			BigDecimal totalAmount = new BigDecimal(req.getParameter("totalAmount")).movePointLeft(2);
			String token = req.getParameter("token");
			Amount amount = new Amount(totalAmount.doubleValue(), 0d,0d,0d);
	    	Transaction transaction =kushki.charge(token, amount, 0, new JSONObject());
	    	
	    	String v = voucher(transaction,req.getParameter("ccname"), req.getParameter("paymentNumOrder"),totalAmount);
	    	
	    	ServletOutputStream out = resp.getOutputStream();
	        out.write(v.getBytes());
	        out.flush();
	        out.close();
	        
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (KushkiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public String voucher(Transaction transaction, String name, String paymentNumber, BigDecimal totalAmount) {
		StringBuilder sb = new StringBuilder();
		if(transaction.isSuccessful()) {
			sb.append("<div class=\"paymentDiv\" style=\"padding:5%\"><table class=\"paymentTable\" style=\"border:5px solid black; width: 400px; border-radius: 5%; border-spacing:10px;\">");
			sb.append("<tr><td class=\"paymentTitle\" style=\"text-align: center;\" colspan=\"2\"><h1>Comprobante De Pago</h1></td></tr>");
			sb.append("<tr>	<td class=\"paymentLabel\" style=\"text-align:right; width: 50%; font-weight: bold;\">Client:</td>");
			sb.append("		<td class=\"paymentValue\" style=\"text-align: left; width: 50%;\"> "+name+"</td></tr>");
			sb.append("<tr>	<td class=\"paymentLabel\" style=\"text-align:right; width: 50%; font-weight: bold;\">Fecha:</td>");
			sb.append("		<td class=\"paymentValue paymentDate\" style=\"text-align: left; width: 50%;\"> "+new Date()+"</td></tr>");
			sb.append("<tr>	<td class=\"paymentLabel\" style=\"text-align:right; width: 50%; font-weight: bold;\">Numero de Orden:</td>");
			sb.append("		<td class=\"paymentValue\" style=\"text-align: left; width: 50%;\">#"+paymentNumber+"</td></tr>");
			sb.append("<tr>	<td class=\"paymentLabel\" style=\"text-align:right; width: 50%; font-weight: bold;\">Numero de Confirmacion:</td>");
			sb.append("		<td class=\"paymentValue\" style=\"text-align: left; width: 50%;\">#"+transaction.getTicketNumber()+"</td></tr>");
			sb.append("<tr>	<td class=\"paymentLabel\" style=\"text-align:right; width: 50%; font-weight: bold;\">Total:</td>");
			sb.append("		<td class=\"paymentValue paymentTotal\" style=\"text-align: left; width: 50%;\"> $"+totalAmount.toString()+"</td></tr>");
			sb.append("<tr>	<td class=\"paymentLabel\" style=\"text-align:right; width: 50%; font-weight: bold;\">Estado:</td>");
			sb.append("		<td class=\"paymentValue\" style=\"text-align: left; width: 50%;\"> Exitoso</td></tr>");
			sb.append("</table></div>");
		}else {
			sb.append("Error code:"+transaction.getResponseCode());
			sb.append("<br/>");
			sb.append("Message: "+transaction.getResponseText());
		}
		return sb.toString();
	}
}
