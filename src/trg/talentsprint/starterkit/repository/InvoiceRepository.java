package trg.talentsprint.starterkit.repository;

import trg.talentsprint.starterkit.model.Invoice;

public interface InvoiceRepository extends ModelRepository<Invoice>
{

	Invoice findByCart(int cartid);
	
	
}
