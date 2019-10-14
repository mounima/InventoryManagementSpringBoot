package trg.talentsprint.starterkit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
//import org.springframework.retry.annotation.Backoff;
//import org.springframework.retry.annotation.Retryable;

import trg.talentsprint.starterkit.model.Invoice;
import trg.talentsprint.starterkit.repository.InvoiceRepository;

@Service
@Transactional
public class InvoiceService
{
  @Autowired
  private InvoiceCodeGenerator invoiceCodeGenerator;

  @Autowired
  private InvoiceRepository invoiceRepository;

  /**
   * Generates an invoice.
   *
   * @return The generated {@link Invoice}.
   */
  public Invoice generateInvoice()
  {
    return invoiceRepository.save(new Invoice(String.format("%010d", invoiceCodeGenerator.next())));
  }
  
  public Invoice saveInvoice(Invoice invoice) {
	  return invoiceRepository.save(invoice);
	  
  }
  
  public Invoice findInvoiceByCartId(int cartid) {
	  return invoiceRepository.findByCart(cartid);
  }
  
  
}
