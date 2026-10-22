-- Remove tax information from order mails (order_confirmation_mail, order_transaction.state.paid, order_transaction.state.cancelled)
-- and from storefront/document snippets (footer VAT line, tax wording, "Incl. VAT" on documents).
-- Run against the Shopware database, e.g.: mysql --default-character-set=utf8mb4 -u shopware -p shopware < mail-template-tax-removal.sql

SET NAMES utf8mb4;

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_html = REPLACE(REPLACE(REPLACE(REPLACE(content_html, '\n    Net total: {{ order.amountNet|currency(currencyIsoCode) }}<br>\n    {% for calculatedTax in order.price.calculatedTaxes %}\n        {% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>\n    {% endfor %}', ''), '\n    {% if order.orderCustomer.vatIds %}\n        Your VAT-ID: {{ order.orderCustomer.vatIds|first }}\n        In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.<br>\n    {% endif %}', ''), 'Rounded total gross:', 'Rounded total:'), 'Total gross:', 'Total:')
WHERE mty.technical_name = 'order_confirmation_mail' AND mtt.language_id = UNHEX('2fbb5fe2e29a4d70aa5854ce7ce3e20b');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_plain = REPLACE(REPLACE(REPLACE(REPLACE(content_plain, '\nNet total: {{ order.amountNet|currency(currencyIsoCode) }}\n{% for calculatedTax in order.price.calculatedTaxes %}\n{% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}\n{% endfor %}', ''), '\n{% if order.orderCustomer.vatIds %}\nYour VAT-ID: {{ order.orderCustomer.vatIds|first }}\nIn case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.\n{% endif %}', ''), 'Rounded total gross:', 'Rounded total:'), 'Total gross:', 'Total:')
WHERE mty.technical_name = 'order_confirmation_mail' AND mtt.language_id = UNHEX('2fbb5fe2e29a4d70aa5854ce7ce3e20b');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_html = REPLACE(REPLACE(REPLACE(REPLACE(content_html, '\n    Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}<br>\n        {% for calculatedTax in order.price.calculatedTaxes %}\n            {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>\n        {% endfor %}', ''), '\n    {% if order.orderCustomer.vatIds %}\n        Ihre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}\n        Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland\n        bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit. <br>\n    {% endif %}', ''), 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'), 'Gesamtkosten Brutto:', 'Gesamtkosten:')
WHERE mty.technical_name = 'order_confirmation_mail' AND mtt.language_id = UNHEX('d9712b5552674d669aeecd16a191373a');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_plain = REPLACE(REPLACE(REPLACE(REPLACE(content_plain, '\nGesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}\n{% for calculatedTax in order.price.calculatedTaxes %}\n{% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}\n{% endfor %}', ''), '\n{% if order.orderCustomer.vatIds %}\nIhre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}\nBei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland\nbestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit.\n{% endif %}', ''), 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'), 'Gesamtkosten Brutto:', 'Gesamtkosten:')
WHERE mty.technical_name = 'order_confirmation_mail' AND mtt.language_id = UNHEX('d9712b5552674d669aeecd16a191373a');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_html = REPLACE(REPLACE(REPLACE(REPLACE(content_html, '\n    Net total: {{ order.amountNet|currency(currencyIsoCode) }}<br>\n    {% for calculatedTax in order.price.calculatedTaxes %}\n        {% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>\n    {% endfor %}', ''), '\n    {% if order.orderCustomer.vatIds %}\n        Your VAT-ID: {{ order.orderCustomer.vatIds|first }}\n        In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.<br>\n    {% endif %}', ''), 'Rounded total gross:', 'Rounded total:'), 'Total gross:', 'Total:')
WHERE mty.technical_name = 'order_transaction.state.cancelled' AND mtt.language_id = UNHEX('2fbb5fe2e29a4d70aa5854ce7ce3e20b');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_plain = REPLACE(REPLACE(REPLACE(REPLACE(content_plain, '\nNet total: {{ order.amountNet|currency(currencyIsoCode) }}\n{% for calculatedTax in order.price.calculatedTaxes %}\n{% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}\n{% endfor %}', ''), '\n{% if order.orderCustomer.vatIds %}\nYour VAT-ID: {{ order.orderCustomer.vatIds|first }}\nIn case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.\n{% endif %}', ''), 'Rounded total gross:', 'Rounded total:'), 'Total gross:', 'Total:')
WHERE mty.technical_name = 'order_transaction.state.cancelled' AND mtt.language_id = UNHEX('2fbb5fe2e29a4d70aa5854ce7ce3e20b');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_html = REPLACE(REPLACE(REPLACE(REPLACE(content_html, '\n    Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}<br>\n        {% for calculatedTax in order.price.calculatedTaxes %}\n            {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>\n        {% endfor %}', ''), '\n    {% if order.orderCustomer.vatIds %}\n        Ihre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}\n        Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland\n        bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit. <br>\n    {% endif %}', ''), 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'), 'Gesamtkosten Brutto:', 'Gesamtkosten:')
WHERE mty.technical_name = 'order_transaction.state.cancelled' AND mtt.language_id = UNHEX('d9712b5552674d669aeecd16a191373a');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_plain = REPLACE(REPLACE(REPLACE(REPLACE(content_plain, '\nGesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}\n    {% for calculatedTax in order.price.calculatedTaxes %}\n        {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}\n    {% endfor %}', ''), '\n{% if order.orderCustomer.vatIds %}\nIhre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}\nBei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland\nbestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit.\n{% endif %}', ''), 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'), 'Gesamtkosten Brutto:', 'Gesamtkosten:')
WHERE mty.technical_name = 'order_transaction.state.cancelled' AND mtt.language_id = UNHEX('d9712b5552674d669aeecd16a191373a');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_html = REPLACE(REPLACE(REPLACE(REPLACE(content_html, '\n    Net total: {{ order.amountNet|currency(currencyIsoCode) }}<br>\n    {% for calculatedTax in order.price.calculatedTaxes %}\n        {% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>\n    {% endfor %}', ''), '\n    {% if order.orderCustomer.vatIds %}\n        Your VAT-ID: {{ order.orderCustomer.vatIds|first }}\n        In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.<br>\n    {% endif %}', ''), 'Rounded total gross:', 'Rounded total:'), 'Total gross:', 'Total:')
WHERE mty.technical_name = 'order_transaction.state.paid' AND mtt.language_id = UNHEX('2fbb5fe2e29a4d70aa5854ce7ce3e20b');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_plain = REPLACE(REPLACE(REPLACE(REPLACE(content_plain, '\nNet total: {{ order.amountNet|currency(currencyIsoCode) }}\n{% for calculatedTax in order.price.calculatedTaxes %}\n{% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}\n{% endfor %}', ''), '\n{% if order.orderCustomer.vatIds %}\nYour VAT-ID: {{ order.orderCustomer.vatIds|first }}\nIn case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.\n{% endif %}', ''), 'Rounded total gross:', 'Rounded total:'), 'Total gross:', 'Total:')
WHERE mty.technical_name = 'order_transaction.state.paid' AND mtt.language_id = UNHEX('2fbb5fe2e29a4d70aa5854ce7ce3e20b');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_html = REPLACE(REPLACE(REPLACE(REPLACE(content_html, '\n    Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}<br>\n        {% for calculatedTax in order.price.calculatedTaxes %}\n            {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>\n        {% endfor %}', ''), '\n    {% if order.orderCustomer.vatIds %}\n        Ihre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}\n        Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland\n        bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit. <br>\n    {% endif %}', ''), 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'), 'Gesamtkosten Brutto:', 'Gesamtkosten:')
WHERE mty.technical_name = 'order_transaction.state.paid' AND mtt.language_id = UNHEX('d9712b5552674d669aeecd16a191373a');

UPDATE mail_template_translation mtt
JOIN mail_template mt ON mt.id = mtt.mail_template_id
JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id
SET mtt.content_plain = REPLACE(REPLACE(REPLACE(REPLACE(content_plain, '\nGesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}\n{% for calculatedTax in order.price.calculatedTaxes %}\n{% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}\n{% endfor %}', ''), '\n{% if order.orderCustomer.vatIds %}\nIhre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}\nBei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland\nbestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit.\n{% endif %}', ''), 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'), 'Gesamtkosten Brutto:', 'Gesamtkosten:')
WHERE mty.technical_name = 'order_transaction.state.paid' AND mtt.language_id = UNHEX('d9712b5552674d669aeecd16a191373a');

-- ---------------------------------------------------------------------------
-- Snippet values (stored in the `snippet` table; DB values override the
-- plugin's snippet JSON files at runtime, so both must be updated).
-- The same values live in YoxaMyPlugin/src/Resources/snippet/.
-- ---------------------------------------------------------------------------

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.includeVat', '* All prices incl. VAT. <a data-toggle="modal" data-bs-toggle="modal" href="%url%" data-url="%url%">Shipping costs</a> are charged additionally unless stated otherwise.', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.excludeVat', '* All prices incl. VAT. <a data-toggle="modal" data-bs-toggle="modal" href="%url%" data-url="%url%">Shipping costs</a> are charged additionally unless stated otherwise.', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'general.grossTaxInformation', 'Prices incl. VAT, excl. <a href="%url%" data-ajax-modal="true" data-url="%url%" class="btn btn-link-inline p-0 fs-6">shipping costs</a>', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'general.netTaxInformation', 'Prices incl. VAT, excl. <a href="%url%" data-ajax-modal="true" data-url="%url%" class="btn btn-link-inline p-0 fs-6">shipping costs</a>', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'checkout.cartHeaderTaxIncludeVat', '', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'checkout.cartHeaderTaxExcludeVat', '', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'document.lineItems.inclVAT', '', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.includeVat', '* Alle Preise inkl. gesetzl. MwSt. <a data-toggle="modal" data-bs-toggle="modal" href="%url%" data-url="%url%">Versandkosten</a> und ggf. Nachnahmegebühren werden zusätzlich berechnet, wenn nicht anders angegeben.', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.excludeVat', '* Alle Preise inkl. gesetzl. MwSt. <a data-toggle="modal" data-bs-toggle="modal" href="%url%" data-url="%url%">Versandkosten</a> und ggf. Nachnahmegebühren werden zusätzlich berechnet, wenn nicht anders angegeben.', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'general.grossTaxInformation', 'Preise inkl. MwSt., zzgl. <a href="%url%" data-ajax-modal="true" data-url="%url%" class="btn btn-link-inline p-0 fs-6">Versandkosten</a>', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'general.netTaxInformation', 'Preise inkl. MwSt., zzgl. <a href="%url%" data-ajax-modal="true" data-url="%url%" class="btn btn-link-inline p-0 fs-6">Versandkosten</a>', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'checkout.cartHeaderTaxIncludeVat', '', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'checkout.cartHeaderTaxExcludeVat', '', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'document.lineItems.inclVAT', '', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

-- ---------------------------------------------------------------------------
-- Shopware 6.5+ renamed the footer snippet keys (footer.includeVatTextPage /
-- footer.excludeVatTextPage). Update them as well for shops running 6.5+.
-- ---------------------------------------------------------------------------

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.includeVatTextPage', 'All prices incl. VAT. <a href="%url%">Shipping costs</a> are charged additionally unless stated otherwise.', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.excludeVatTextPage', 'All prices incl. VAT. <a href="%url%">Shipping costs</a> are charged additionally unless stated otherwise.', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.includeVatTextPage', 'Alle Preise inkl. gesetzl. MwSt. <a href="%url%">Versandkosten</a> und ggf. Nachnahmegebühren werden zusätzlich berechnet, wenn nicht anders angegeben.', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.excludeVatTextPage', 'Alle Preise inkl. gesetzl. MwSt. <a href="%url%">Versandkosten</a> und ggf. Nachnahmegebühren werden zusätzlich berechnet, wenn nicht anders angegeben.', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

-- ---------------------------------------------------------------------------
-- Support contact: e-mail instead of the service hotline. The %email%
-- placeholder is filled per sales channel by the storefront templates
-- (layout/header/header-minimal.html.twig, layout/footer/footer.html.twig):
-- uberstrike host -> hello@uberstrike.com, anything else -> hello@yoxa.eu.
-- ---------------------------------------------------------------------------

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'header.supportInfo', '<strong>Questions regarding your order?</strong><br /><strong><a href="mailto:%email%">%email%</a></strong>', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.serviceHotline', 'Support and counselling via: <a href="mailto:%email%">%email%</a>', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'en-GB'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'header.supportInfo', '<strong>Fragen zu Ihrer Bestellung?</strong><br /><strong><a href="mailto:%email%">%email%</a></strong>', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);

INSERT INTO snippet (id, snippet_set_id, translation_key, value, author, custom_fields, created_at, updated_at)
SELECT UNHEX(REPLACE(UUID(), '-', '')), ss.id, 'footer.serviceHotline', 'Unterstützung und Beratung unter: <a href="mailto:%email%">%email%</a>', 'YoxaMyPlugin', NULL, NOW(3), NOW(3)
FROM snippet_set ss WHERE ss.iso = 'de-DE'
ON DUPLICATE KEY UPDATE value = VALUES(value), updated_at = NOW(3);
