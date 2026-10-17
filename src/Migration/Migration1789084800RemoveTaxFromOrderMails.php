<?php declare(strict_types=1);

namespace Yoxa\MyPlugin\Migration;

use Doctrine\DBAL\Connection;
use Shopware\Core\Framework\Migration\MigrationStep;

class Migration1789084800RemoveTaxFromOrderMails extends MigrationStep
{
    public function getCreationTimestamp(): int
    {
        return 1789084800;
    }

    public function update(Connection $connection): void
    {
        $replacements = [
            ['order_confirmation_mail', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', '
    Net total: {{ order.amountNet|currency(currencyIsoCode) }}<br>
    {% for calculatedTax in order.price.calculatedTaxes %}
        {% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>
    {% endfor %}', ''],
            ['order_confirmation_mail', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', '
    {% if order.orderCustomer.vatIds %}
        Your VAT-ID: {{ order.orderCustomer.vatIds|first }}
        In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.<br>
    {% endif %}', ''],
            ['order_confirmation_mail', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', 'Rounded total gross:', 'Rounded total:'],
            ['order_confirmation_mail', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', 'Total gross:', 'Total:'],
            ['order_confirmation_mail', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', '
Net total: {{ order.amountNet|currency(currencyIsoCode) }}
{% for calculatedTax in order.price.calculatedTaxes %}
{% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}
{% endfor %}', ''],
            ['order_confirmation_mail', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', '
{% if order.orderCustomer.vatIds %}
Your VAT-ID: {{ order.orderCustomer.vatIds|first }}
In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.
{% endif %}', ''],
            ['order_confirmation_mail', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', 'Rounded total gross:', 'Rounded total:'],
            ['order_confirmation_mail', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', 'Total gross:', 'Total:'],
            ['order_confirmation_mail', 'd9712b5552674d669aeecd16a191373a', 'content_html', '
    Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}<br>
        {% for calculatedTax in order.price.calculatedTaxes %}
            {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>
        {% endfor %}', ''],
            ['order_confirmation_mail', 'd9712b5552674d669aeecd16a191373a', 'content_html', '
    {% if order.orderCustomer.vatIds %}
        Ihre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}
        Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland
        bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit. <br>
    {% endif %}', ''],
            ['order_confirmation_mail', 'd9712b5552674d669aeecd16a191373a', 'content_html', 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'],
            ['order_confirmation_mail', 'd9712b5552674d669aeecd16a191373a', 'content_html', 'Gesamtkosten Brutto:', 'Gesamtkosten:'],
            ['order_confirmation_mail', 'd9712b5552674d669aeecd16a191373a', 'content_plain', '
Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}
{% for calculatedTax in order.price.calculatedTaxes %}
{% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}
{% endfor %}', ''],
            ['order_confirmation_mail', 'd9712b5552674d669aeecd16a191373a', 'content_plain', '
{% if order.orderCustomer.vatIds %}
Ihre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}
Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland
bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit.
{% endif %}', ''],
            ['order_confirmation_mail', 'd9712b5552674d669aeecd16a191373a', 'content_plain', 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'],
            ['order_confirmation_mail', 'd9712b5552674d669aeecd16a191373a', 'content_plain', 'Gesamtkosten Brutto:', 'Gesamtkosten:'],
            ['order_transaction.state.cancelled', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', '
    Net total: {{ order.amountNet|currency(currencyIsoCode) }}<br>
    {% for calculatedTax in order.price.calculatedTaxes %}
        {% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>
    {% endfor %}', ''],
            ['order_transaction.state.cancelled', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', '
    {% if order.orderCustomer.vatIds %}
        Your VAT-ID: {{ order.orderCustomer.vatIds|first }}
        In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.<br>
    {% endif %}', ''],
            ['order_transaction.state.cancelled', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', 'Rounded total gross:', 'Rounded total:'],
            ['order_transaction.state.cancelled', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', 'Total gross:', 'Total:'],
            ['order_transaction.state.cancelled', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', '
Net total: {{ order.amountNet|currency(currencyIsoCode) }}
{% for calculatedTax in order.price.calculatedTaxes %}
{% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}
{% endfor %}', ''],
            ['order_transaction.state.cancelled', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', '
{% if order.orderCustomer.vatIds %}
Your VAT-ID: {{ order.orderCustomer.vatIds|first }}
In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.
{% endif %}', ''],
            ['order_transaction.state.cancelled', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', 'Rounded total gross:', 'Rounded total:'],
            ['order_transaction.state.cancelled', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', 'Total gross:', 'Total:'],
            ['order_transaction.state.cancelled', 'd9712b5552674d669aeecd16a191373a', 'content_html', '
    Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}<br>
        {% for calculatedTax in order.price.calculatedTaxes %}
            {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>
        {% endfor %}', ''],
            ['order_transaction.state.cancelled', 'd9712b5552674d669aeecd16a191373a', 'content_html', '
    {% if order.orderCustomer.vatIds %}
        Ihre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}
        Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland
        bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit. <br>
    {% endif %}', ''],
            ['order_transaction.state.cancelled', 'd9712b5552674d669aeecd16a191373a', 'content_html', 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'],
            ['order_transaction.state.cancelled', 'd9712b5552674d669aeecd16a191373a', 'content_html', 'Gesamtkosten Brutto:', 'Gesamtkosten:'],
            ['order_transaction.state.cancelled', 'd9712b5552674d669aeecd16a191373a', 'content_plain', '
Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}
    {% for calculatedTax in order.price.calculatedTaxes %}
        {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}
    {% endfor %}', ''],
            ['order_transaction.state.cancelled', 'd9712b5552674d669aeecd16a191373a', 'content_plain', '
{% if order.orderCustomer.vatIds %}
Ihre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}
Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland
bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit.
{% endif %}', ''],
            ['order_transaction.state.cancelled', 'd9712b5552674d669aeecd16a191373a', 'content_plain', 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'],
            ['order_transaction.state.cancelled', 'd9712b5552674d669aeecd16a191373a', 'content_plain', 'Gesamtkosten Brutto:', 'Gesamtkosten:'],
            ['order_transaction.state.paid', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', '
    Net total: {{ order.amountNet|currency(currencyIsoCode) }}<br>
    {% for calculatedTax in order.price.calculatedTaxes %}
        {% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>
    {% endfor %}', ''],
            ['order_transaction.state.paid', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', '
    {% if order.orderCustomer.vatIds %}
        Your VAT-ID: {{ order.orderCustomer.vatIds|first }}
        In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.<br>
    {% endif %}', ''],
            ['order_transaction.state.paid', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', 'Rounded total gross:', 'Rounded total:'],
            ['order_transaction.state.paid', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_html', 'Total gross:', 'Total:'],
            ['order_transaction.state.paid', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', '
Net total: {{ order.amountNet|currency(currencyIsoCode) }}
{% for calculatedTax in order.price.calculatedTaxes %}
{% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}
{% endfor %}', ''],
            ['order_transaction.state.paid', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', '
{% if order.orderCustomer.vatIds %}
Your VAT-ID: {{ order.orderCustomer.vatIds|first }}
In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.
{% endif %}', ''],
            ['order_transaction.state.paid', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', 'Rounded total gross:', 'Rounded total:'],
            ['order_transaction.state.paid', '2fbb5fe2e29a4d70aa5854ce7ce3e20b', 'content_plain', 'Total gross:', 'Total:'],
            ['order_transaction.state.paid', 'd9712b5552674d669aeecd16a191373a', 'content_html', '
    Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}<br>
        {% for calculatedTax in order.price.calculatedTaxes %}
            {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>
        {% endfor %}', ''],
            ['order_transaction.state.paid', 'd9712b5552674d669aeecd16a191373a', 'content_html', '
    {% if order.orderCustomer.vatIds %}
        Ihre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}
        Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland
        bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit. <br>
    {% endif %}', ''],
            ['order_transaction.state.paid', 'd9712b5552674d669aeecd16a191373a', 'content_html', 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'],
            ['order_transaction.state.paid', 'd9712b5552674d669aeecd16a191373a', 'content_html', 'Gesamtkosten Brutto:', 'Gesamtkosten:'],
            ['order_transaction.state.paid', 'd9712b5552674d669aeecd16a191373a', 'content_plain', '
Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}
{% for calculatedTax in order.price.calculatedTaxes %}
{% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}
{% endfor %}', ''],
            ['order_transaction.state.paid', 'd9712b5552674d669aeecd16a191373a', 'content_plain', '
{% if order.orderCustomer.vatIds %}
Ihre Umsatzsteuer-ID: {{ order.orderCustomer.vatIds|first }}
Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland
bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit.
{% endif %}', ''],
            ['order_transaction.state.paid', 'd9712b5552674d669aeecd16a191373a', 'content_plain', 'Gesamtkosten Brutto gerundet:', 'Gesamtkosten gerundet:'],
            ['order_transaction.state.paid', 'd9712b5552674d669aeecd16a191373a', 'content_plain', 'Gesamtkosten Brutto:', 'Gesamtkosten:'],
        ];

        foreach ($replacements as [$technicalName, $languageId, $column, $search, $replace]) {
            $connection->executeStatement(
                'UPDATE mail_template_translation mtt'
                . ' JOIN mail_template mt ON mt.id = mtt.mail_template_id'
                . ' JOIN mail_template_type mty ON mty.id = mt.mail_template_type_id'
                . ' SET mtt.' . $column . ' = REPLACE(mtt.' . $column . ', :search, :replace)'
                . ' WHERE mty.technical_name = :technicalName AND mtt.language_id = UNHEX(:languageId)',
                [
                    'search' => $search,
                    'replace' => $replace,
                    'technicalName' => $technicalName,
                    'languageId' => $languageId,
                ]
            );
        }
    }

    public function updateDestructive(Connection $connection): void
    {
    }
}
