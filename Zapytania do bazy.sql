SELECT i.Number AS 'Nr.faktury', c.FirstName AS 'Imiê', c.LastName AS 'Nazwisko'
FROM Invoices i
INNER JOIN Clients c ON c.Id = i.ClientNumber

SELECT ip.InvoiceId AS 'Nr.faktury', p.Name AS 'Nazwa produktu', p.Price AS 'Cena'
FROM InvoicePositions ip
INNER JOIN Products p ON p.Id = ip.ProductId;

SELECT ip.InvoiceId AS 'Nr. faktury', ip.Quantity AS 'Iloœæ sztuk'
FROM InvoicePositions ip

SELECT ip.InvoiceId AS 'Nr. faktury', SUM(p.Price * ip.Quantity) AS 'Cena ca³kowita'
FROM InvoicePositions ip
INNER JOIN Products p ON p.Id = ip.ProductId
GROUP BY ip.InvoiceId