-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-11-2012 a las 14:14:32
-- Versión del servidor: 5.1.33
-- Versión de PHP: 5.2.9
--
-- Nueva base de datos para Nestle
--

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `jwwwadas_test2211`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_areas`
--

CREATE TABLE IF NOT EXISTS `0_areas` (
  `area_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`area_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `0_areas`
--

INSERT INTO `0_areas` (`area_code`, `description`, `inactive`) VALUES
(1, 'Global', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_attachments`
--

CREATE TABLE IF NOT EXISTS `0_attachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `type_no` int(11) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `unique_name` varchar(60) NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `filename` varchar(60) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filetype` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type_no` (`type_no`,`trans_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_attachments`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_audit_trail`
--

CREATE TABLE IF NOT EXISTS `0_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `trans_no` int(11) unsigned NOT NULL DEFAULT '0',
  `user` smallint(6) unsigned NOT NULL DEFAULT '0',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(60) DEFAULT NULL,
  `fiscal_year` int(11) NOT NULL,
  `gl_date` date NOT NULL DEFAULT '0000-00-00',
  `gl_seq` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscal_year` (`fiscal_year`,`gl_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_audit_trail`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_bank_accounts`
--

CREATE TABLE IF NOT EXISTS `0_bank_accounts` (
  `account_code` varchar(11) NOT NULL DEFAULT '',
  `account_type` smallint(6) NOT NULL DEFAULT '0',
  `bank_account_name` varchar(60) NOT NULL DEFAULT '',
  `bank_account_number` varchar(100) NOT NULL DEFAULT '',
  `bank_name` varchar(60) NOT NULL DEFAULT '',
  `bank_address` tinytext,
  `bank_curr_code` char(3) NOT NULL DEFAULT '',
  `dflt_curr_act` tinyint(1) NOT NULL DEFAULT '0',
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `last_reconciled_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ending_reconcile_balance` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bank_account_name` (`bank_account_name`),
  KEY `bank_account_number` (`bank_account_number`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `0_bank_accounts`
--

INSERT INTO `0_bank_accounts` (`account_code`, `account_type`, `bank_account_name`, `bank_account_number`, `bank_name`, `bank_address`, `bank_curr_code`, `dflt_curr_act`, `id`, `last_reconciled_date`, `ending_reconcile_balance`, `inactive`) VALUES
('1060', 0, 'Current account', 'N/A', 'N/A', '', 'USD', 1, 1, '0000-00-00 00:00:00', 0, 0),
('1065', 3, 'Petty Cash account', 'N/A', 'N/A', '', 'USD', 0, 2, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_bank_trans`
--

CREATE TABLE IF NOT EXISTS `0_bank_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `bank_act` varchar(11) DEFAULT NULL,
  `ref` varchar(40) DEFAULT NULL,
  `trans_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` double DEFAULT NULL,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) NOT NULL DEFAULT '0',
  `person_id` tinyblob,
  `reconciled` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_act` (`bank_act`,`ref`),
  KEY `type` (`type`,`trans_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_bank_trans`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_bom`
--

CREATE TABLE IF NOT EXISTS `0_bom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` char(20) NOT NULL DEFAULT '',
  `component` char(20) NOT NULL DEFAULT '',
  `workcentre_added` int(11) NOT NULL DEFAULT '0',
  `loc_code` char(5) NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`parent`,`component`,`workcentre_added`,`loc_code`),
  KEY `component` (`component`),
  KEY `id` (`id`),
  KEY `loc_code` (`loc_code`),
  KEY `parent` (`parent`,`loc_code`),
  KEY `Parent_2` (`parent`),
  KEY `workcentre_added` (`workcentre_added`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_bom`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_budget_trans`
--

CREATE TABLE IF NOT EXISTS `0_budget_trans` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `type_no` bigint(16) NOT NULL DEFAULT '1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(11) NOT NULL DEFAULT '',
  `memo_` tinytext NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0',
  `person_type_id` int(11) DEFAULT NULL,
  `person_id` tinyblob,
  PRIMARY KEY (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_budget_trans`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_chart_class`
--

CREATE TABLE IF NOT EXISTS `0_chart_class` (
  `cid` int(11) NOT NULL DEFAULT '0',
  `class_name` varchar(60) NOT NULL DEFAULT '',
  `ctype` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_chart_class`
--

INSERT INTO `0_chart_class` (`cid`, `class_name`, `ctype`, `inactive`) VALUES
(1, 'Assets', 1, 0),
(2, 'Liabilities', 2, 0),
(3, 'Income', 4, 0),
(4, 'Costs', 6, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_chart_master`
--

CREATE TABLE IF NOT EXISTS `0_chart_master` (
  `account_code` varchar(11) NOT NULL DEFAULT '',
  `account_code2` varchar(11) DEFAULT '',
  `account_name` varchar(60) NOT NULL DEFAULT '',
  `account_type` int(11) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_code`),
  KEY `account_code` (`account_code`),
  KEY `account_name` (`account_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_chart_master`
--

INSERT INTO `0_chart_master` (`account_code`, `account_code2`, `account_name`, `account_type`, `inactive`) VALUES
('1060', '', 'Checking Account', 1, 0),
('1065', '', 'Petty Cash', 1, 0),
('1200', '', 'Accounts Receivables', 1, 0),
('1205', '', 'Allowance for doubtful accounts', 1, 0),
('1510', '', 'Inventory', 2, 0),
('1520', '', 'Stocks of Raw Materials', 2, 0),
('1530', '', 'Stocks of Work In Progress', 2, 0),
('1540', '', 'Stocks of Finsihed Goods', 2, 0),
('1550', '', 'Goods Received Clearing account', 2, 0),
('1820', '', 'Office Furniture &amp; Equipment', 3, 0),
('1825', '', 'Accum. Amort. -Furn. &amp; Equip.', 3, 0),
('1840', '', 'Vehicle', 3, 0),
('1845', '', 'Accum. Amort. -Vehicle', 3, 0),
('2100', '', 'Accounts Payable', 4, 0),
('2110', '', 'Accrued Income Tax - Federal', 4, 0),
('2120', '', 'Accrued Income Tax - State', 4, 0),
('2130', '', 'Accrued Franchise Tax', 4, 0),
('2140', '', 'Accrued Real &amp; Personal Prop Tax', 4, 0),
('2145', '', 'Purchase Tax', 4, 0),
('2150', '', 'Sales Tax', 4, 0),
('2160', '', 'Accrued Use Tax Payable', 4, 0),
('2210', '', 'Accrued Wages', 4, 0),
('2220', '', 'Accrued Comp Time', 4, 0),
('2230', '', 'Accrued Holiday Pay', 4, 0),
('2240', '', 'Accrued Vacation Pay', 4, 0),
('2310', '', 'Accr. Benefits - 401K', 4, 0),
('2320', '', 'Accr. Benefits - Stock Purchase', 4, 0),
('2330', '', 'Accr. Benefits - Med, Den', 4, 0),
('2340', '', 'Accr. Benefits - Payroll Taxes', 4, 0),
('2350', '', 'Accr. Benefits - Credit Union', 4, 0),
('2360', '', 'Accr. Benefits - Savings Bond', 4, 0),
('2370', '', 'Accr. Benefits - Garnish', 4, 0),
('2380', '', 'Accr. Benefits - Charity Cont.', 4, 0),
('2620', '', 'Bank Loans', 5, 0),
('2680', '', 'Loans from Shareholders', 5, 0),
('3350', '', 'Common Shares', 6, 0),
('3590', '', 'Retained Earnings - prior years', 7, 0),
('4010', '', 'Sales', 8, 0),
('4430', '', 'Shipping &amp; Handling', 9, 0),
('4440', '', 'Interest', 9, 0),
('4450', '', 'Foreign Exchange Gain', 9, 0),
('4500', '', 'Prompt Payment Discounts', 9, 0),
('4510', '', 'Discounts Given', 9, 0),
('5010', '', 'Cost of Goods Sold - Retail', 10, 0),
('5020', '', 'Material Usage Varaiance', 10, 0),
('5030', '', 'Consumable Materials', 10, 0),
('5040', '', 'Purchase price Variance', 10, 0),
('5050', '', 'Purchases of materials', 10, 0),
('5060', '', 'Discounts Received', 10, 0),
('5100', '', 'Freight', 10, 0),
('5410', '', 'Wages &amp; Salaries', 11, 0),
('5420', '', 'Wages - Overtime', 11, 0),
('5430', '', 'Benefits - Comp Time', 11, 0),
('5440', '', 'Benefits - Payroll Taxes', 11, 0),
('5450', '', 'Benefits - Workers Comp', 11, 0),
('5460', '', 'Benefits - Pension', 11, 0),
('5470', '', 'Benefits - General Benefits', 11, 0),
('5510', '', 'Inc Tax Exp - Federal', 11, 0),
('5520', '', 'Inc Tax Exp - State', 11, 0),
('5530', '', 'Taxes - Real Estate', 11, 0),
('5540', '', 'Taxes - Personal Property', 11, 0),
('5550', '', 'Taxes - Franchise', 11, 0),
('5560', '', 'Taxes - Foreign Withholding', 11, 0),
('5610', '', 'Accounting &amp; Legal', 12, 0),
('5615', '', 'Advertising &amp; Promotions', 12, 0),
('5620', '', 'Bad Debts', 12, 0),
('5660', '', 'Amortization Expense', 12, 0),
('5685', '', 'Insurance', 12, 0),
('5690', '', 'Interest &amp; Bank Charges', 12, 0),
('5700', '', 'Office Supplies', 12, 0),
('5760', '', 'Rent', 12, 0),
('5765', '', 'Repair &amp; Maintenance', 12, 0),
('5780', '', 'Telephone', 12, 0),
('5785', '', 'Travel &amp; Entertainment', 12, 0),
('5790', '', 'Utilities', 12, 0),
('5795', '', 'Registrations', 12, 0),
('5800', '', 'Licenses', 12, 0),
('5810', '', 'Foreign Exchange Loss', 12, 0),
('9990', '', 'Year Profit/Loss', 12, 0),
('2146', '', 'Impuesto Contribuyentes', 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_chart_types`
--

CREATE TABLE IF NOT EXISTS `0_chart_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `class_id` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '-1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcar la base de datos para la tabla `0_chart_types`
--

INSERT INTO `0_chart_types` (`id`, `name`, `class_id`, `parent`, `inactive`) VALUES
(1, 'Current Assets', 1, -1, 0),
(2, 'Inventory Assets', 1, -1, 0),
(3, 'Capital Assets', 1, -1, 0),
(4, 'Current Liabilities', 2, -1, 0),
(5, 'Long Term Liabilities', 2, -1, 0),
(6, 'Share Capital', 2, -1, 0),
(7, 'Retained Earnings', 2, -1, 0),
(8, 'Sales Revenue', 3, -1, 0),
(9, 'Other Revenue', 3, -1, 0),
(10, 'Cost of Goods Sold', 4, -1, 0),
(11, 'Payroll Expenses', 4, -1, 0),
(12, 'General &amp; Administrative expenses', 4, -1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_comments`
--

CREATE TABLE IF NOT EXISTS `0_comments` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date DEFAULT '0000-00-00',
  `memo_` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_comments`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_company`
--

CREATE TABLE IF NOT EXISTS `0_company` (
  `coy_code` int(11) NOT NULL DEFAULT '1',
  `coy_name` varchar(60) NOT NULL DEFAULT '',
  `gst_no` varchar(25) NOT NULL DEFAULT '',
  `coy_no` varchar(25) NOT NULL DEFAULT '0',
  `tax_prd` int(11) NOT NULL DEFAULT '1',
  `tax_last` int(11) NOT NULL DEFAULT '1',
  `postal_address` tinytext NOT NULL,
  `phone` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `coy_logo` varchar(100) NOT NULL DEFAULT '',
  `domicile` varchar(55) NOT NULL DEFAULT '',
  `curr_default` char(3) NOT NULL DEFAULT '',
  `debtors_act` varchar(11) NOT NULL DEFAULT '',
  `pyt_discount_act` varchar(11) NOT NULL DEFAULT '',
  `creditors_act` varchar(11) NOT NULL DEFAULT '',
  `bank_charge_act` varchar(11) NOT NULL DEFAULT '',
  `exchange_diff_act` varchar(11) NOT NULL DEFAULT '',
  `profit_loss_year_act` varchar(11) NOT NULL DEFAULT '',
  `retained_earnings_act` varchar(11) NOT NULL DEFAULT '',
  `freight_act` varchar(11) NOT NULL DEFAULT '',
  `default_sales_act` varchar(11) NOT NULL DEFAULT '',
  `default_sales_discount_act` varchar(11) NOT NULL DEFAULT '',
  `default_prompt_payment_act` varchar(11) NOT NULL DEFAULT '',
  `default_inventory_act` varchar(11) NOT NULL DEFAULT '',
  `default_cogs_act` varchar(11) NOT NULL DEFAULT '',
  `default_adj_act` varchar(11) NOT NULL DEFAULT '',
  `default_inv_sales_act` varchar(11) NOT NULL DEFAULT '',
  `default_assembly_act` varchar(11) NOT NULL DEFAULT '',
  `payroll_act` varchar(11) NOT NULL DEFAULT '',
  `allow_negative_stock` tinyint(1) NOT NULL DEFAULT '0',
  `po_over_receive` int(11) NOT NULL DEFAULT '10',
  `po_over_charge` int(11) NOT NULL DEFAULT '10',
  `default_credit_limit` int(11) NOT NULL DEFAULT '1000',
  `default_workorder_required` int(11) NOT NULL DEFAULT '20',
  `default_dim_required` int(11) NOT NULL DEFAULT '20',
  `past_due_days` int(11) NOT NULL DEFAULT '30',
  `use_dimension` tinyint(1) DEFAULT '0',
  `f_year` int(11) NOT NULL DEFAULT '1',
  `no_item_list` tinyint(1) NOT NULL DEFAULT '0',
  `no_customer_list` tinyint(1) NOT NULL DEFAULT '0',
  `no_supplier_list` tinyint(1) NOT NULL DEFAULT '0',
  `base_sales` int(11) NOT NULL DEFAULT '-1',
  `foreign_codes` tinyint(1) NOT NULL DEFAULT '0',
  `accumulate_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `legal_text` tinytext NOT NULL,
  `default_delivery_required` smallint(6) NOT NULL DEFAULT '1',
  `version_id` varchar(11) NOT NULL DEFAULT '',
  `time_zone` tinyint(1) NOT NULL DEFAULT '0',
  `add_pct` int(5) NOT NULL DEFAULT '-1',
  `round_to` int(5) NOT NULL DEFAULT '1',
  `login_tout` smallint(6) NOT NULL DEFAULT '600',
  PRIMARY KEY (`coy_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_company`
--

INSERT INTO `0_company` (`coy_code`, `coy_name`, `gst_no`, `coy_no`, `tax_prd`, `tax_last`, `postal_address`, `phone`, `fax`, `email`, `coy_logo`, `domicile`, `curr_default`, `debtors_act`, `pyt_discount_act`, `creditors_act`, `bank_charge_act`, `exchange_diff_act`, `profit_loss_year_act`, `retained_earnings_act`, `freight_act`, `default_sales_act`, `default_sales_discount_act`, `default_prompt_payment_act`, `default_inventory_act`, `default_cogs_act`, `default_adj_act`, `default_inv_sales_act`, `default_assembly_act`, `payroll_act`, `allow_negative_stock`, `po_over_receive`, `po_over_charge`, `default_credit_limit`, `default_workorder_required`, `default_dim_required`, `past_due_days`, `use_dimension`, `f_year`, `no_item_list`, `no_customer_list`, `no_supplier_list`, `base_sales`, `foreign_codes`, `accumulate_shipping`, `legal_text`, `default_delivery_required`, `version_id`, `time_zone`, `add_pct`, `round_to`, `login_tout`) VALUES
(1, 'Training Co.', '', '', 1, 1, 'N/A', '', '', '', '', '', 'USD', '1200', '5060', '2100', '5690', '4450', '9990', '3590', '4430', '4010', '4510', '4500', '1510', '5010', '5040', '4010', '1530', '5000', 0, 10, 10, 1000, 20, 20, 30, 0, 5, 0, 0, 0, 1, 0, 0, '', 1, '2.2', 0, -1, 1, 600);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_credit_status`
--

CREATE TABLE IF NOT EXISTS `0_credit_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason_description` char(100) NOT NULL DEFAULT '',
  `dissallow_invoices` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reason_description` (`reason_description`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `0_credit_status`
--

INSERT INTO `0_credit_status` (`id`, `reason_description`, `dissallow_invoices`, `inactive`) VALUES
(1, 'Buen Record', 0, 0),
(3, 'No facturar hasta recibir pago pendiente', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_currencies`
--

CREATE TABLE IF NOT EXISTS `0_currencies` (
  `currency` varchar(60) NOT NULL DEFAULT '',
  `curr_abrev` char(3) NOT NULL DEFAULT '',
  `curr_symbol` varchar(10) NOT NULL DEFAULT '',
  `country` varchar(100) NOT NULL DEFAULT '',
  `hundreds_name` varchar(15) NOT NULL DEFAULT '',
  `auto_update` tinyint(1) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`curr_abrev`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_currencies`
--

INSERT INTO `0_currencies` (`currency`, `curr_abrev`, `curr_symbol`, `country`, `hundreds_name`, `auto_update`, `inactive`) VALUES
('US Dollars', 'USD', '$', 'United States', 'Cents', 1, 0),
('CA Dollars', 'CAD', '$', 'Canada', 'Cents', 1, 0),
('Euro', 'EUR', '?', 'Europe', 'Cents', 1, 0),
('Pounds', 'GBP', '?', 'England', 'Pence', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_cust_allocations`
--

CREATE TABLE IF NOT EXISTS `0_cust_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amt` double unsigned DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_cust_allocations`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_cust_branch`
--

CREATE TABLE IF NOT EXISTS `0_cust_branch` (
  `branch_code` int(11) NOT NULL AUTO_INCREMENT,
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `br_name` varchar(60) NOT NULL DEFAULT '',
  `branch_ref` varchar(30) NOT NULL DEFAULT '',
  `br_address` tinytext NOT NULL,
  `area` int(11) DEFAULT NULL,
  `salesman` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `phone2` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `contact_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `default_location` varchar(5) NOT NULL DEFAULT '',
  `tax_group_id` int(11) DEFAULT NULL,
  `sales_account` varchar(11) DEFAULT NULL,
  `sales_discount_account` varchar(11) DEFAULT NULL,
  `receivables_account` varchar(11) DEFAULT NULL,
  `payment_discount_account` varchar(11) DEFAULT NULL,
  `default_ship_via` int(11) NOT NULL DEFAULT '1',
  `disable_trans` tinyint(4) NOT NULL DEFAULT '0',
  `br_post_address` tinytext NOT NULL,
  `group_no` int(11) NOT NULL DEFAULT '0',
  `notes` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_code`,`debtor_no`),
  KEY `branch_code` (`branch_code`),
  KEY `br_name` (`br_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_cust_branch`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_debtors_master`
--

CREATE TABLE IF NOT EXISTS `0_debtors_master` (
  `debtor_no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `debtor_ref` varchar(30) NOT NULL,
  `address` tinytext,
  `email` varchar(100) NOT NULL DEFAULT '',
  `tax_id` varchar(55) NOT NULL DEFAULT '',
  `curr_code` char(3) NOT NULL DEFAULT '',
  `sales_type` int(11) NOT NULL DEFAULT '1',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `credit_status` int(11) NOT NULL DEFAULT '0',
  `payment_terms` int(11) DEFAULT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `pymt_discount` double NOT NULL DEFAULT '0',
  `credit_limit` float NOT NULL DEFAULT '1000',
  `notes` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`debtor_no`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_debtors_master`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_debtor_trans`
--

CREATE TABLE IF NOT EXISTS `0_debtor_trans` (
  `trans_no` int(11) unsigned NOT NULL DEFAULT '0',
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `version` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `debtor_no` int(11) unsigned DEFAULT NULL,
  `branch_code` int(11) NOT NULL DEFAULT '-1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` varchar(60) NOT NULL DEFAULT '',
  `tpe` int(11) NOT NULL DEFAULT '0',
  `order_` int(11) NOT NULL DEFAULT '0',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `ov_freight` double NOT NULL DEFAULT '0',
  `ov_freight_tax` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `ship_via` int(11) DEFAULT NULL,
  `trans_link` int(11) NOT NULL DEFAULT '0',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_no`,`type`),
  KEY `debtor_no` (`debtor_no`,`branch_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_debtor_trans`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_debtor_trans_details`
--

CREATE TABLE IF NOT EXISTS `0_debtor_trans_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debtor_trans_no` int(11) DEFAULT NULL,
  `debtor_trans_type` int(11) DEFAULT NULL,
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  `standard_cost` double NOT NULL DEFAULT '0',
  `qty_done` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_debtor_trans_details`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_dimensions`
--

CREATE TABLE IF NOT EXISTS `0_dimensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `type_` tinyint(1) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_dimensions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_exchange_rates`
--

CREATE TABLE IF NOT EXISTS `0_exchange_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curr_code` char(3) NOT NULL DEFAULT '',
  `rate_buy` double NOT NULL DEFAULT '0',
  `rate_sell` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `curr_code` (`curr_code`,`date_`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_exchange_rates`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_fiscal_year`
--

CREATE TABLE IF NOT EXISTS `0_fiscal_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begin` date DEFAULT '0000-00-00',
  `end` date DEFAULT '0000-00-00',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `0_fiscal_year`
--

INSERT INTO `0_fiscal_year` (`id`, `begin`, `end`, `closed`) VALUES
(5, '2012-01-01', '2012-12-31', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_gl_trans`
--

CREATE TABLE IF NOT EXISTS `0_gl_trans` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `type_no` bigint(16) NOT NULL DEFAULT '1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(11) NOT NULL DEFAULT '',
  `memo_` tinytext NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) DEFAULT NULL,
  `person_id` tinyblob,
  PRIMARY KEY (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_gl_trans`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_grn_batch`
--

CREATE TABLE IF NOT EXISTS `0_grn_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `purch_order_no` int(11) DEFAULT NULL,
  `reference` varchar(60) NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `loc_code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_grn_batch`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_grn_items`
--

CREATE TABLE IF NOT EXISTS `0_grn_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grn_batch_id` int(11) DEFAULT NULL,
  `po_detail_item` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `qty_recd` double NOT NULL DEFAULT '0',
  `quantity_inv` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_grn_items`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_groups`
--

CREATE TABLE IF NOT EXISTS `0_groups` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `0_groups`
--

INSERT INTO `0_groups` (`id`, `description`, `inactive`) VALUES
(1, 'Small', 0),
(2, 'Medium', 0),
(3, 'Large', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_item_codes`
--

CREATE TABLE IF NOT EXISTS `0_item_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(20) NOT NULL,
  `stock_id` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `category_id` smallint(6) unsigned NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `is_foreign` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_id` (`stock_id`,`item_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=195 ;

--
-- Volcar la base de datos para la tabla `0_item_codes`
--

INSERT INTO `0_item_codes` (`id`, `item_code`, `stock_id`, `description`, `category_id`, `quantity`, `is_foreign`, `inactive`) VALUES
(1, '8503124', '8503124', 'NESCAFE CON LECHE 24X300g', 14, 1, 0, 0),
(2, '8507401', '8507401', 'NESQUIK CHOCOLATE 24X400g LATA', 11, 1, 0, 0),
(3, '11001159', '11001159', 'NAN SOYA 6X400g', 9, 1, 0, 0),
(4, '11295488', '11295488', 'POLLO Y FIDEO 12(12X60g)', 1, 1, 0, 0),
(5, '11295490', '11295490', 'SOPA POLLO CARACOLITO 12(12X60g)', 1, 1, 0, 0),
(6, '11295491', '11295491', 'SOPA POLLO LETRAS 12(12X60g)', 1, 1, 0, 0),
(7, '11295492', '11295492', 'SOPA POLLO C/ARROZ 12(12X60g)', 1, 1, 0, 0),
(8, '11295493', '11295493', 'SOPA RES FIDEOS 12(12X60g)', 1, 1, 0, 0),
(9, '11295494', '11295494', 'CREMA DE ESPARRAGOS 12(12X66g)', 7, 1, 0, 0),
(10, '11295495', '11295495', 'CREMA DE HONGOS 12X(12X65g)', 7, 1, 0, 0),
(11, '11295496', '11295496', 'CREMA DE TOMATE 12(12X76g)', 7, 1, 0, 0),
(12, '11295971', '11295971', 'CUBITOS POLLO 200(10X4g)', 8, 1, 0, 0),
(13, '11295984', '11295984', 'SUPER CUBO POLLO 32(48X10g)', 8, 1, 0, 0),
(14, '11296001', '11296001', 'CONSOME DE POLLO 40(12X10g) TIRA', 8, 1, 0, 0),
(15, '11296005', '11296005', '4 PACK CONS POLLO 150(4x10g)', 8, 1, 0, 0),
(16, '11296014', '11296014', '4 PACK CONS CAMARON 150(4x10g)', 8, 1, 0, 0),
(17, '11296025', '11296025', '4 PACK CONS COST RES 150(4x10g)', 8, 1, 0, 0),
(18, '11296052', '11296052', 'POLLO Y FIDEO EXH. 24(12X30g)', 1, 1, 0, 0),
(19, '11296053', '11296053', 'SOPA POLLO C/FIDEO LAM 24(12x30g)', 1, 1, 0, 0),
(20, '11296068', '11296068', 'CREMA DE MARISCOS 12(12X80g)', 7, 1, 0, 0),
(21, '11296072', '11296072', 'SOPA COLA DE RES 12(12X76g)', 1, 1, 0, 0),
(22, '11296100', '11296100', 'SOPA COSTILLA CRIOLLA 12(12X58g)', 1, 1, 0, 0),
(23, '11296374', '11296374', 'POLLO Y FIDEO 12(13X60g)', 6, 1, 0, 0),
(24, '11296536', '11296536', 'NESCAFE TRAD 32x36x2g DISPLAY', 14, 1, 0, 0),
(25, '11296598', '11296598', 'CUBITOS POLLO 60(25X4g) A/FACIL', 8, 1, 0, 0),
(26, '11296702', '11296702', 'MUSUN POLVO 120x40x2g DISPLAY', 14, 1, 0, 0),
(27, '11296703', '11296703', 'MUSUN POLVO 60x80x2g DISPLAY', 14, 1, 0, 0),
(28, '11296704', '11296704', 'MUSUN POLVO 24x 50g', 14, 1, 0, 0),
(29, '11296705', '11296705', 'MUSUN POLVO 12x150g', 14, 1, 0, 0),
(30, '11296706', '11296706', 'MUSUN POLVO 12x250g', 14, 1, 0, 0),
(31, '11296711', '11296711', 'MUSUN TIRA 12(30x8g)', 14, 1, 0, 0),
(32, '11296747', '11296747', 'PASO 1 Colado Zanahoria 24x70g XP', 10, 1, 0, 0),
(33, '11296753', '11296753', 'PASO 1 Colado Banano 24x70g XP', 10, 1, 0, 0),
(34, '11296754', '11296754', 'PASO 1 Colado Manzana 24x70g XP', 10, 1, 0, 0),
(35, '11296755', '11296755', 'PASO 1 Colado Pera 24x70g XP', 10, 1, 0, 0),
(36, '11296756', '11296756', 'PASO 1 Colado Melocoton 24x70g XP', 10, 1, 0, 0),
(37, '11296758', '11296758', 'PASO 1 Colado Mango 24x70g XP', 10, 1, 0, 0),
(38, '11296850', '11296850', 'PASO 2 Colado Verdura Pll 24x113g', 19, 1, 0, 0),
(39, '11296851', '11296851', 'PASO 2 Colado Verd Car Res 24x113g', 19, 1, 0, 0),
(40, '11296868', '11296868', 'PASO 2 Postre Fruta 24x113g N1', 19, 1, 0, 0),
(41, '11296869', '11296869', 'PASO 2 Post Manzana Canela 24x113g', 19, 1, 0, 0),
(42, '12012403', '12012403', 'NESQUIK KEVLAR 20X230g', 15, 1, 0, 0),
(43, '12015084', '12015084', 'NESTUM PLUS ARR MANZANI 24X270g', 15, 1, 0, 0),
(44, '12016492', '12016492', 'NESQUIK CEREAL 16x380g', 15, 1, 0, 0),
(45, '12016714', '12016714', 'COOKIE CRISP CRAZY 16X360g', 15, 1, 0, 0),
(46, '12018171', '12018171', 'TRIX CEREAL 16x340g', 15, 1, 0, 0),
(47, '12022894', '12022894', 'LECHERA FLAKES 16X440g', 15, 1, 0, 0),
(48, '12037100', '12037100', 'SOPA CHIPILIN CRIOLLA 12(12x60g)', 1, 1, 0, 0),
(49, '12039446', '12039446', 'SAZONADOR COSTILLA SHAKER 24x225g', 25, 1, 0, 0),
(50, '12039689', '12039689', 'NESCAFE TRAD GRAN 24X100g', 14, 1, 0, 0),
(51, '12039734', '12039734', 'NESCAFE TRAD GRAN 12X200g', 14, 1, 0, 0),
(52, '12039816', '12039816', 'NESCAFE TRAD GRAN 24X50g', 14, 1, 0, 0),
(53, '12047948', '12047948', 'LUCKY CHARMS KEVLAR 16X326g', 15, 1, 0, 0),
(54, '12048270', '12048270', 'NIDO INSTANTANEA 24X360g', 17, 1, 0, 0),
(55, '12048271', '12048271', 'NIDO INSTANTANEA 48X120g', 17, 1, 0, 0),
(56, '12048284', '12048284', 'NIDO INSTANTANEA 12X 800g', 17, 1, 0, 0),
(57, '12048286', '12048286', 'NIDO INSTANTANEA 6X1600g', 17, 1, 0, 0),
(58, '12048771', '12048771', 'NIDO INSTANTANEA 6X2200g', 17, 1, 0, 0),
(59, '12049707', '12049707', 'NIDO CRECIMIENTO 1+ 48X120g', 17, 1, 0, 0),
(60, '12049872', '12049872', 'SOPA CHIPILIN CRIO 12(13x60g)', 1, 1, 0, 0),
(61, '12049959', '12049959', 'NIDO CRECIMIENTO 1+ 24X360g', 17, 1, 0, 0),
(62, '12049980', '12049980', 'NIDO PREESCOLAR 3+ 24X360g', 17, 1, 0, 0),
(63, '12049981', '12049981', 'NIDO ESCOLAR 6+ 24X360g', 17, 1, 0, 0),
(64, '12050033', '12050033', 'NIDO CRECIMIENTO 1+ 12X800g', 17, 1, 0, 0),
(65, '12050176', '12050176', 'NIDO ESCOLAR 6+ 6X800g', 17, 1, 0, 0),
(66, '12050177', '12050177', 'NIDO PREESCOLAR 3+ 6X1600g', 17, 1, 0, 0),
(67, '12050178', '12050178', 'NIDO PREESCOLAR 3+ 12X800g', 17, 1, 0, 0),
(68, '12050180', '12050180', 'NIDO CRECIMIENTO 1+ 6X2200g', 17, 1, 0, 0),
(69, '12050181', '12050181', 'NIDO CRECIMIENTO 1+ 6X1600g', 17, 1, 0, 0),
(70, '12052191', '12052191', 'SVELTY ACTIFIBRAS 12X800g Verde', 17, 1, 0, 0),
(71, '12057714', '12057714', 'SOPA GALL INDIA CRIOLLA 12(12x60g)', 1, 1, 0, 0),
(72, '12058260', '12058260', 'NAN PRO 1 24X400g', 9, 1, 0, 0),
(73, '12058633', '12058633', 'NAN HA B GOLD 12X400g', 9, 1, 0, 0),
(74, '12059185', '12059185', 'NAN PRO 1 12X900g', 9, 1, 0, 0),
(75, '12059192', '12059192', 'NAN PRO 2 24X400g', 9, 1, 0, 0),
(76, '12059194', '12059194', 'NAN PRO 2 12X900g', 9, 1, 0, 0),
(77, '12059619', '12059619', 'NAN LACTOSE FREE 12X400g', 9, 1, 0, 0),
(78, '12059677', '12059677', 'NESTUM PLUS AVENA CIRUE 24X270g', 15, 1, 0, 0),
(79, '12059794', '12059794', 'NESTUM PLUS ARROZ MANZ. 24X270g', 15, 1, 0, 0),
(80, '12063341', '12063341', 'NESQUIK FRESA 12X380g', 11, 1, 0, 0),
(81, '12069225', '12069225', 'NIDO ESENCIAL 24X500g', 17, 1, 0, 0),
(82, '12069226', '12069226', 'NESQUIK FRESA BOLSA 10X200g', 11, 1, 0, 0),
(83, '12071485', '12071485', 'SVELTY ACTIFIBRAS 12X800g Azul', 17, 1, 0, 0),
(84, '12072566', '12072566', 'NESCAFE DIPLOMAT 12x115g', 14, 1, 0, 0),
(85, '12073848', '12073848', 'NIDO ESENCIAL 24X360g', 17, 1, 0, 0),
(86, '12076504', '12076504', 'NESCAFE TRAD GRAN 12X200g + TAZA', 14, 1, 0, 0),
(87, '12076546', '12076546', 'SOPA GALL INDIA CRIO 12(13x60g)', 6, 1, 0, 0),
(88, '12076893', '12076893', 'CUBITO DE POLLO 32(150x4g)', 8, 1, 0, 0),
(89, '12170504', '12170504', 'NESTOGENO 8X135g Bolsa', 12, 1, 0, 0),
(90, '12082540', '12082540', 'NIDO INSTANTANEA 6x2200g Bolsa', 17, 1, 0, 0),
(91, '12083115', '12083115', 'NESTUM CI ARROZ 24X200g', 18, 1, 0, 0),
(92, '12083134', '12083134', 'NESTUM CI 8 CEREALES 24X 200g', 18, 1, 0, 0),
(93, '12083136', '12083136', 'NESTUM VAINILLA 24X250g', 18, 1, 0, 0),
(94, '12083143', '12083143', 'NESTUM CI AVENA 24X200g', 18, 1, 0, 0),
(95, '12083148', '12083148', 'NESTUM CHOCOLATE 24X250g', 18, 1, 0, 0),
(96, '12083149', '12083149', 'NESTUM FRUTILLA 24X250g', 18, 1, 0, 0),
(97, '12083196', '12083196', 'NESTUM CI 5 CEREALES 24X 200g', 18, 1, 0, 0),
(98, '12084015', '12084015', 'NESTUM CI TRIGO MIEL 24X 200g', 18, 1, 0, 0),
(99, '12086054', '12086054', 'NESTUM CI TRIGO C/LEC. 24X360g', 18, 1, 0, 0),
(100, '12089555', '12089555', 'NAN AR 12X400g', 9, 1, 0, 0),
(101, '12089815', '12089815', 'NIDO INSTANTANEA 24X12X26g', 17, 1, 0, 0),
(102, '12089991', '12089991', 'SAZONAD COST RES 40(12X10g) TIRA', 8, 1, 0, 0),
(103, '12090002', '12090002', 'SAZONADOR DE RES 40(12X10g) TIRA', 8, 1, 0, 0),
(104, '12090011', '12090011', 'GALLINITA MI SAZON 40(12X10g) TIRA', 8, 1, 0, 0),
(105, '12090013', '12090013', 'CONSOME CAMARON 40(12X10g) TIRA', 8, 1, 0, 0),
(106, '12090701', '12090701', 'PASO 2 Jugo de Pera 24X175ml', 22, 1, 0, 0),
(107, '12090711', '12090711', 'PASO 2 Jugo de Manzana 24X175ml', 22, 1, 0, 0),
(108, '12090922', '12090922', 'PASO 2 Jugo Manz Meloc 24X175ml', 22, 1, 0, 0),
(109, '12092148', '12092148', 'NESCAFE LISTO STICK 24(60X2g)', 14, 1, 0, 0),
(110, '12092235', '12092235', 'NESCAFE TRAD 24X60X2g DISPLAY', 14, 1, 0, 0),
(111, '12092601', '12092601', 'SOPA POLLO FID INTEGR 12x(12x60g)', 1, 1, 0, 0),
(112, '12093529', '12093529', 'NESQUIK Cereal 60x30g XU', 15, 1, 0, 0),
(113, '12094344', '12094344', 'LECHE EVAPORADA 48X315g', 17, 1, 0, 0),
(114, '12094813', '12094813', 'PASO 3 Jugo Manz y Peras 24X230ml', 23, 1, 0, 0),
(115, '12094814', '12094814', 'PASO 1 Jugo de Peras 24X118ml', 21, 1, 0, 0),
(116, '12094816', '12094816', 'PASO 1 Jugo de Uva Blanca 24X118ml', 21, 1, 0, 0),
(117, '12094838', '12094838', 'PASO 1 Jugo de Manzanas 24X118ml', 21, 1, 0, 0),
(118, '12094839', '12094839', 'PASO 3 Jugo Manzana 24x230ml', 23, 1, 0, 0),
(119, '12095078', '12095078', 'NESTEA Limon 24x680g', 24, 1, 0, 0),
(120, '12096957', '12096957', 'NESTEA SinCals Te Verde 6(18x9g)', 24, 1, 0, 0),
(121, '12097336', '12097336', 'NESTEA SinCals Limon 6(18x9g)', 24, 1, 0, 0),
(122, '12098357', '12098357', 'NESTEA Limon Sobres 12(10x85g)', 24, 1, 0, 0),
(123, '12098374', '12098374', 'NIDO ESENCIAL 48x120g', 17, 1, 0, 0),
(124, '12098601', '12098601', 'NESCAFE TASTER CHOICE 12x100g', 14, 1, 0, 0),
(125, '12099349', '12099349', 'NIDO CRECIMIENTO 1+ 6X2200g Bolsa', 17, 1, 0, 0),
(126, '12104295', '12104295', 'NAN PRO 3 12X800g', 9, 1, 0, 0),
(127, '12109152', '12109152', 'COFFEE-MATE 12X11oz 311g', 5, 1, 0, 0),
(128, '12109153', '12109153', 'COFFEE MATE 12X16oz 453g', 5, 1, 0, 0),
(129, '12109598', '12109598', 'COFFEE MATE 12X6oz 170g', 5, 1, 0, 0),
(130, '12109636', '12109636', 'NESCAFE LISTO TRAD Tira 12(10(12x2g))', 14, 1, 0, 0),
(131, '12112732', '12112732', 'COFFEE-MATE Original MP 12(50x3g)', 5, 1, 0, 0),
(132, '12115515', '12115515', 'PASO 2 Colado Mango 24x113g', 19, 1, 0, 0),
(133, '12115516', '12115516', 'PASO 2 Colado Ciruela Pasa 24x113g', 19, 1, 0, 0),
(134, '12115517', '12115517', 'PASO 2 Colado Guayaba 24x113g', 19, 1, 0, 0),
(135, '12115541', '12115541', 'PASO 3 Colado Meloc Mango 24x170g', 20, 1, 0, 0),
(136, '12115542', '12115542', 'PASO 3 Colado Pera 24x170g', 20, 1, 0, 0),
(137, '12118198', '12118198', 'CONSOME POLLO SHAKER 24x225g', 25, 1, 0, 0),
(138, '12118518', '12118518', 'NESTEA Te Verde Sobre 12(10x85g)', 24, 1, 0, 0),
(139, '12121932', '12121932', 'NESCAFE DECAF 12X100g', 14, 1, 0, 0),
(140, '12124049', '12124049', 'NESQUIK KEVLAR 14X750g', 15, 1, 0, 0),
(141, '12124060', '12124060', 'CORN FLAKES KEVLAR 14X660g', 15, 1, 0, 0),
(142, '12125227', '12125227', 'NESCAFE CAPPUCCINO 15(8x20g)', 14, 1, 0, 0),
(143, '12128374', '12128374', 'LECHE CONDENSADA 48X397g', 17, 1, 0, 0),
(144, '12131077', '12131077', 'PASO 3 Pure Pera Fru Trop 24x170g', 20, 1, 0, 0),
(145, '12131078', '12131078', 'PASO 3 Pure Manzana Meloc 24x170g', 20, 1, 0, 0),
(146, '12131199', '12131199', 'PASO 3 Pure Banano Fru Mxt 24x170g', 20, 1, 0, 0),
(147, '12133333', '12133333', 'PASO 2 Colado Pera Meloc 24x113g', 19, 1, 0, 0),
(148, '12133334', '12133334', 'PASO 2 Colado Manzana Bna 24x113g', 19, 1, 0, 0),
(149, '12133535', '12133535', 'NESTOGENO 1 12X900g', 12, 1, 0, 0),
(150, '12133537', '12133537', 'NESTOGENO 1 24X400g', 12, 1, 0, 0),
(151, '12133538', '12133538', 'NESTOGENO 2 24X400g', 12, 1, 0, 0),
(152, '12133560', '12133560', 'NESTOGENO 2 12X900g', 12, 1, 0, 0),
(153, '12133598', '12133598', 'PASO 2 Colado Banano 24x100g', 19, 1, 0, 0),
(154, '12133599', '12133599', 'PASO 2 Colado Pera 24x100g', 19, 1, 0, 0),
(155, '12133670', '12133670', 'PASO 2 Colado Manzana 24x100g', 19, 1, 0, 0),
(156, '12133671', '12133671', 'PASO 2 Colado Fruta Mixtas 24x100g', 19, 1, 0, 0),
(157, '12133680', '12133680', 'PASO 2 Colado Melocoton 24x100g', 19, 1, 0, 0),
(158, '12135836', '12135836', 'NESQUIK CHOCOLATE BOLSA 10X180g', 11, 1, 0, 0),
(159, '12141777', '12141777', 'FITNESS &amp; ALMONDS 18X430g', 15, 1, 0, 0),
(160, '12149146', '12149146', 'MUSUM SUAVE 12x 50g', 14, 1, 0, 0),
(161, '12149148', '12149148', 'MUSUM SUAVE 15x180g', 14, 1, 0, 0),
(162, '12149590', '12149590', 'MUSUM SUAVE 24x100g', 14, 1, 0, 0),
(163, '12150527', '12150527', 'FITNESS &amp; FRUITS 18X375g', 15, 1, 0, 0),
(164, '12150891', '12150891', 'FITNESS KEVLAR 18X365g', 15, 1, 0, 0),
(165, '12152211', '12152211', 'FITNESS &amp; FRUITS 14X600g', 15, 1, 0, 0),
(166, '12160746', '12160746', 'POLLO Y FIDEO 12(2(5X60g) Bolsa', 6, 1, 0, 0),
(167, '12162003', '12162003', 'DOBLE GUSTO 3X36(8X10g)', 8, 1, 0, 0),
(168, '12162058', '12162058', 'COFFEE-MATE 12X22oz 650g', 5, 1, 0, 0),
(169, '12162611', '12162611', 'TOQUE FINAL POLLO 24x180g', 25, 1, 0, 0),
(170, '12162612', '12162612', 'TOQUE FINAL RES 24x180g', 25, 1, 0, 0),
(171, '12162833', '12162833', 'DOBLE GUSTO 24(48X10g)', 8, 1, 0, 0),
(172, '12162887', '12162887', 'GALLINITA MI SAZON SHAKER 24x225g', 25, 1, 0, 0),
(173, '12163691', '12163691', 'NESQUIK Tira 16grms', 11, 1, 0, 0),
(174, '12164890', '12164890', 'NESCAFE LISTO DOYPACK 24X50g', 14, 1, 0, 0),
(175, '12165117', '12165117', 'NESCAFE MOKACCINO 15(6x25g)', 14, 1, 0, 0),
(176, '12169101', '12169101', 'CUBITO JIRAFA', 8, 1, 0, 0),
(177, '12172745', '12172745', 'PIMIENTA NEGRA 30(12x2.5g)', 26, 1, 0, 0),
(178, '12172746', '12172746', 'CANELA POLVO 30(12x3g)', 26, 1, 0, 0),
(179, '12172747', '12172747', 'SAL DE AJO 30(12x6g)', 26, 1, 0, 0),
(180, '12172748', '12172748', 'AJO PURO SHAKER 12x80g', 25, 1, 0, 0),
(181, '12172749', '12172749', 'OREGANO POLVO SHAKER 12x40g', 25, 1, 0, 0),
(182, '12172760', '12172760', 'SAL DE AJO SHAKER 12x100g', 25, 1, 0, 0),
(183, '12172762', '12172762', 'CANELA POLVO SHAKER 12x60g', 25, 1, 0, 0),
(184, '12172763', '12172763', 'PIMIENTA NEGRA SHAKER 12x55g', 25, 1, 0, 0),
(185, '12172764', '12172764', 'SAL DE CEBOLLA 30(12x6g)', 26, 1, 0, 0),
(186, '12172772', '12172772', 'AJO PURO 30(12x4g)', 26, 1, 0, 0),
(187, '12172774', '12172774', 'ABLANDADOR Y SAZONADOR 20(12x10g)', 26, 1, 0, 0),
(188, '12172779', '12172779', 'SAL DE CEBOLLA SHAKER 12x100g', 25, 1, 0, 0),
(189, '12177212', '12177212', 'MUSUN SUAVE 24x1.8g', 14, 1, 0, 0),
(190, '12177530', '12177530', 'NESCAFE 3 en 1 Sobre 24(4x90g)', 14, 1, 0, 0),
(191, '12173139', '12173139', 'NIDO 1+ PROTECTUS LEP Bolsa 48x120g', 17, 1, 0, 0),
(192, '12173132', '12173132', 'NIDO 1+ PROTECTUS LEP Bolsa 24x360g', 17, 1, 0, 0),
(193, '12173137', '12173137', 'NIDO 1+ PROTECTUS LEP Lata 12x800g', 17, 1, 0, 0),
(194, '12173131', '12173131', 'NIDO 1+ PROTECTUS LEP Lata 6x1,600g', 17, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_item_tax_types`
--

CREATE TABLE IF NOT EXISTS `0_item_tax_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `exempt` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `0_item_tax_types`
--

INSERT INTO `0_item_tax_types` (`id`, `name`, `exempt`, `inactive`) VALUES
(1, 'Regular', 0, 0),
(2, 'Exento', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_item_tax_type_exemptions`
--

CREATE TABLE IF NOT EXISTS `0_item_tax_type_exemptions` (
  `item_tax_type_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_tax_type_id`,`tax_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_item_tax_type_exemptions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_item_units`
--

CREATE TABLE IF NOT EXISTS `0_item_units` (
  `abbr` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `decimals` tinyint(2) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`abbr`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_item_units`
--

INSERT INTO `0_item_units` (`abbr`, `name`, `decimals`, `inactive`) VALUES
('ti.', 'Tira', 2, 0),
('un.', 'Unidad', 0, 0),
('fa.', 'Fardo', 2, 0),
('di.', 'Display', 2, 0),
('ca.', 'Caja', 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_locations`
--

CREATE TABLE IF NOT EXISTS `0_locations` (
  `loc_code` varchar(5) NOT NULL DEFAULT '',
  `location_name` varchar(60) NOT NULL DEFAULT '',
  `delivery_address` tinytext NOT NULL,
  `phone` varchar(30) NOT NULL DEFAULT '',
  `phone2` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `contact` varchar(30) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loc_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_locations`
--

INSERT INTO `0_locations` (`loc_code`, `location_name`, `delivery_address`, `phone`, `phone2`, `fax`, `email`, `contact`, `inactive`) VALUES
('DEF', 'Default', 'N/A', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_loc_stock`
--

CREATE TABLE IF NOT EXISTS `0_loc_stock` (
  `loc_code` char(5) NOT NULL DEFAULT '',
  `stock_id` char(20) NOT NULL DEFAULT '',
  `reorder_level` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loc_code`,`stock_id`),
  KEY `stock_id` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_loc_stock`
--

INSERT INTO `0_loc_stock` (`loc_code`, `stock_id`, `reorder_level`) VALUES
('DEF', '11001159', 0),
('DEF', '11295488', 0),
('DEF', '11295490', 0),
('DEF', '11295491', 0),
('DEF', '11295492', 0),
('DEF', '11295493', 0),
('DEF', '11295494', 0),
('DEF', '11295495', 0),
('DEF', '11295496', 0),
('DEF', '11295971', 0),
('DEF', '11295984', 0),
('DEF', '11296001', 0),
('DEF', '11296005', 0),
('DEF', '11296014', 0),
('DEF', '11296025', 0),
('DEF', '11296052', 0),
('DEF', '11296053', 0),
('DEF', '11296068', 0),
('DEF', '11296072', 0),
('DEF', '11296100', 0),
('DEF', '11296374', 0),
('DEF', '11296536', 0),
('DEF', '11296598', 0),
('DEF', '11296702', 0),
('DEF', '11296703', 0),
('DEF', '11296704', 0),
('DEF', '11296705', 0),
('DEF', '11296706', 0),
('DEF', '11296711', 0),
('DEF', '11296747', 0),
('DEF', '11296753', 0),
('DEF', '11296754', 0),
('DEF', '11296755', 0),
('DEF', '11296756', 0),
('DEF', '11296758', 0),
('DEF', '11296850', 0),
('DEF', '11296851', 0),
('DEF', '11296868', 0),
('DEF', '11296869', 0),
('DEF', '12012403', 0),
('DEF', '12015084', 0),
('DEF', '12016492', 0),
('DEF', '12016714', 0),
('DEF', '12018171', 0),
('DEF', '12022894', 0),
('DEF', '12037100', 0),
('DEF', '12039446', 0),
('DEF', '12039689', 0),
('DEF', '12039734', 0),
('DEF', '12039816', 0),
('DEF', '12047948', 0),
('DEF', '12048270', 0),
('DEF', '12048271', 0),
('DEF', '12048284', 0),
('DEF', '12048286', 0),
('DEF', '12048771', 0),
('DEF', '12049707', 0),
('DEF', '12049872', 0),
('DEF', '12049959', 0),
('DEF', '12049980', 0),
('DEF', '12049981', 0),
('DEF', '12050033', 0),
('DEF', '12050176', 0),
('DEF', '12050177', 0),
('DEF', '12050178', 0),
('DEF', '12050180', 0),
('DEF', '12050181', 0),
('DEF', '12052191', 0),
('DEF', '12057714', 0),
('DEF', '12058260', 0),
('DEF', '12058633', 0),
('DEF', '12059185', 0),
('DEF', '12059192', 0),
('DEF', '12059194', 0),
('DEF', '12059619', 0),
('DEF', '12059677', 0),
('DEF', '12059794', 0),
('DEF', '12063341', 0),
('DEF', '12069225', 0),
('DEF', '12069226', 0),
('DEF', '12071485', 0),
('DEF', '12072566', 0),
('DEF', '12073848', 0),
('DEF', '12076504', 0),
('DEF', '12076546', 0),
('DEF', '12076893', 0),
('DEF', '12082540', 0),
('DEF', '12083115', 0),
('DEF', '12083134', 0),
('DEF', '12083136', 0),
('DEF', '12083143', 0),
('DEF', '12083148', 0),
('DEF', '12083149', 0),
('DEF', '12083196', 0),
('DEF', '12084015', 0),
('DEF', '12086054', 0),
('DEF', '12089555', 0),
('DEF', '12089815', 0),
('DEF', '12089991', 0),
('DEF', '12090002', 0),
('DEF', '12090011', 0),
('DEF', '12090013', 0),
('DEF', '12090701', 0),
('DEF', '12090711', 0),
('DEF', '12090922', 0),
('DEF', '12092148', 0),
('DEF', '12092235', 0),
('DEF', '12092601', 0),
('DEF', '12093529', 0),
('DEF', '12094344', 0),
('DEF', '12094813', 0),
('DEF', '12094814', 0),
('DEF', '12094816', 0),
('DEF', '12094838', 0),
('DEF', '12094839', 0),
('DEF', '12095078', 0),
('DEF', '12096957', 0),
('DEF', '12097336', 0),
('DEF', '12098357', 0),
('DEF', '12098374', 0),
('DEF', '12098601', 0),
('DEF', '12099349', 0),
('DEF', '12104295', 0),
('DEF', '12109152', 0),
('DEF', '12109153', 0),
('DEF', '12109598', 0),
('DEF', '12109636', 0),
('DEF', '12112732', 0),
('DEF', '12115515', 0),
('DEF', '12115516', 0),
('DEF', '12115517', 0),
('DEF', '12115541', 0),
('DEF', '12115542', 0),
('DEF', '12118198', 0),
('DEF', '12118518', 0),
('DEF', '12121932', 0),
('DEF', '12124049', 0),
('DEF', '12124060', 0),
('DEF', '12125227', 0),
('DEF', '12128374', 0),
('DEF', '12131077', 0),
('DEF', '12131078', 0),
('DEF', '12131199', 0),
('DEF', '12133333', 0),
('DEF', '12133334', 0),
('DEF', '12133535', 0),
('DEF', '12133537', 0),
('DEF', '12133538', 0),
('DEF', '12133560', 0),
('DEF', '12133598', 0),
('DEF', '12133599', 0),
('DEF', '12133670', 0),
('DEF', '12133671', 0),
('DEF', '12133680', 0),
('DEF', '12135836', 0),
('DEF', '12141777', 0),
('DEF', '12149146', 0),
('DEF', '12149148', 0),
('DEF', '12149590', 0),
('DEF', '12150527', 0),
('DEF', '12150891', 0),
('DEF', '12152211', 0),
('DEF', '12160746', 0),
('DEF', '12162003', 0),
('DEF', '12162058', 0),
('DEF', '12162611', 0),
('DEF', '12162612', 0),
('DEF', '12162833', 0),
('DEF', '12162887', 0),
('DEF', '12163691', 0),
('DEF', '12164890', 0),
('DEF', '12165117', 0),
('DEF', '12169101', 0),
('DEF', '12170504', 0),
('DEF', '12172745', 0),
('DEF', '12172746', 0),
('DEF', '12172747', 0),
('DEF', '12172748', 0),
('DEF', '12172749', 0),
('DEF', '12172760', 0),
('DEF', '12172762', 0),
('DEF', '12172763', 0),
('DEF', '12172764', 0),
('DEF', '12172772', 0),
('DEF', '12172774', 0),
('DEF', '12172779', 0),
('DEF', '12173131', 0),
('DEF', '12173132', 0),
('DEF', '12173137', 0),
('DEF', '12173139', 0),
('DEF', '12177212', 0),
('DEF', '12177530', 0),
('DEF', '8503124', 0),
('DEF', '8507401', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_movement_types`
--

CREATE TABLE IF NOT EXISTS `0_movement_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `0_movement_types`
--

INSERT INTO `0_movement_types` (`id`, `name`, `inactive`) VALUES
(1, 'Ajustes', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_payment_terms`
--

CREATE TABLE IF NOT EXISTS `0_payment_terms` (
  `terms_indicator` int(11) NOT NULL AUTO_INCREMENT,
  `terms` char(80) NOT NULL DEFAULT '',
  `days_before_due` smallint(6) NOT NULL DEFAULT '0',
  `day_in_following_month` smallint(6) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`terms_indicator`),
  UNIQUE KEY `terms` (`terms`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `0_payment_terms`
--

INSERT INTO `0_payment_terms` (`terms_indicator`, `terms`, `days_before_due`, `day_in_following_month`, `inactive`) VALUES
(1, 'Pago a 15 dias', 15, 0, 0),
(2, 'Pago a 30 dias', 30, 0, 0),
(4, 'Solo Efectivo', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_prices`
--

CREATE TABLE IF NOT EXISTS `0_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `sales_type_id` int(11) NOT NULL DEFAULT '0',
  `curr_abrev` char(3) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `price` (`stock_id`,`sales_type_id`,`curr_abrev`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_prices`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_printers`
--

CREATE TABLE IF NOT EXISTS `0_printers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(60) NOT NULL,
  `queue` varchar(20) NOT NULL,
  `host` varchar(40) NOT NULL,
  `port` smallint(11) unsigned NOT NULL,
  `timeout` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `0_printers`
--

INSERT INTO `0_printers` (`id`, `name`, `description`, `queue`, `host`, `port`, `timeout`) VALUES
(1, 'QL500', 'Label printer', 'QL500', 'server', 127, 20),
(2, 'Samsung', 'Main network printer', 'scx4521F', 'server', 515, 5),
(3, 'Local', 'Local print server at user IP', 'lp', '', 515, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_print_profiles`
--

CREATE TABLE IF NOT EXISTS `0_print_profiles` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `profile` varchar(30) NOT NULL,
  `report` varchar(5) DEFAULT NULL,
  `printer` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile` (`profile`,`report`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcar la base de datos para la tabla `0_print_profiles`
--

INSERT INTO `0_print_profiles` (`id`, `profile`, `report`, `printer`) VALUES
(1, 'Out of office', '', 0),
(2, 'Sales Department', '', 0),
(3, 'Central', '', 2),
(4, 'Sales Department', '104', 2),
(5, 'Sales Department', '105', 2),
(6, 'Sales Department', '107', 2),
(7, 'Sales Department', '109', 2),
(8, 'Sales Department', '110', 2),
(9, 'Sales Department', '201', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_purch_data`
--

CREATE TABLE IF NOT EXISTS `0_purch_data` (
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `suppliers_uom` char(50) NOT NULL DEFAULT '',
  `conversion_factor` double NOT NULL DEFAULT '1',
  `supplier_description` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`supplier_id`,`stock_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_purch_data`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_purch_orders`
--

CREATE TABLE IF NOT EXISTS `0_purch_orders` (
  `order_no` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `comments` tinytext,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` tinytext NOT NULL,
  `requisition_no` tinytext,
  `into_stock_location` varchar(5) NOT NULL DEFAULT '',
  `delivery_address` tinytext NOT NULL,
  PRIMARY KEY (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_purch_orders`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_purch_order_details`
--

CREATE TABLE IF NOT EXISTS `0_purch_order_details` (
  `po_detail_item` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `qty_invoiced` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `act_price` double NOT NULL DEFAULT '0',
  `std_cost_unit` double NOT NULL DEFAULT '0',
  `quantity_ordered` double NOT NULL DEFAULT '0',
  `quantity_received` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`po_detail_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_purch_order_details`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_quick_entries`
--

CREATE TABLE IF NOT EXISTS `0_quick_entries` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(60) NOT NULL,
  `base_amount` double NOT NULL DEFAULT '0',
  `base_desc` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `description` (`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `0_quick_entries`
--

INSERT INTO `0_quick_entries` (`id`, `type`, `description`, `base_amount`, `base_desc`) VALUES
(1, 1, 'Maintenance', 0, 'Amount'),
(2, 4, 'Phone', 0, 'Amount'),
(3, 2, 'Cash Sales', 0, 'Amount');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_quick_entry_lines`
--

CREATE TABLE IF NOT EXISTS `0_quick_entry_lines` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `qid` smallint(6) unsigned NOT NULL,
  `amount` double DEFAULT '0',
  `action` varchar(2) NOT NULL,
  `dest_id` varchar(11) NOT NULL,
  `dimension_id` smallint(6) unsigned DEFAULT NULL,
  `dimension2_id` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `0_quick_entry_lines`
--

INSERT INTO `0_quick_entry_lines` (`id`, `qid`, `amount`, `action`, `dest_id`, `dimension_id`, `dimension2_id`) VALUES
(1, 1, 0, 't-', '1', 0, 0),
(2, 2, 0, 't-', '1', 0, 0),
(3, 3, 0, 't-', '1', 0, 0),
(4, 3, 0, '=', '4010', 0, 0),
(5, 1, 0, '=', '5765', 0, 0),
(6, 2, 0, '=', '5780', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_recurrent_invoices`
--

CREATE TABLE IF NOT EXISTS `0_recurrent_invoices` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `order_no` int(11) unsigned NOT NULL,
  `debtor_no` int(11) unsigned DEFAULT NULL,
  `group_no` smallint(6) unsigned DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT '0',
  `monthly` int(11) NOT NULL DEFAULT '0',
  `begin` date NOT NULL DEFAULT '0000-00-00',
  `end` date NOT NULL DEFAULT '0000-00-00',
  `last_sent` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_recurrent_invoices`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_refs`
--

CREATE TABLE IF NOT EXISTS `0_refs` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_refs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_salesman`
--

CREATE TABLE IF NOT EXISTS `0_salesman` (
  `salesman_code` int(11) NOT NULL AUTO_INCREMENT,
  `salesman_name` char(60) NOT NULL DEFAULT '',
  `salesman_phone` char(30) NOT NULL DEFAULT '',
  `salesman_fax` char(30) NOT NULL DEFAULT '',
  `salesman_email` varchar(100) NOT NULL DEFAULT '',
  `provision` double NOT NULL DEFAULT '0',
  `break_pt` double NOT NULL DEFAULT '0',
  `provision2` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`salesman_code`),
  UNIQUE KEY `salesman_name` (`salesman_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `0_salesman`
--

INSERT INTO `0_salesman` (`salesman_code`, `salesman_name`, `salesman_phone`, `salesman_fax`, `salesman_email`, `provision`, `break_pt`, `provision2`, `inactive`) VALUES
(1, 'Sales Person', '', '', '', 5, 1000, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_sales_orders`
--

CREATE TABLE IF NOT EXISTS `0_sales_orders` (
  `order_no` int(11) NOT NULL,
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `version` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `branch_code` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) NOT NULL DEFAULT '',
  `customer_ref` tinytext NOT NULL,
  `comments` tinytext,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `order_type` int(11) NOT NULL DEFAULT '0',
  `ship_via` int(11) NOT NULL DEFAULT '0',
  `delivery_address` tinytext NOT NULL,
  `contact_phone` varchar(30) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `deliver_to` tinytext NOT NULL,
  `freight_cost` double NOT NULL DEFAULT '0',
  `from_stk_loc` varchar(5) NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`trans_type`,`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_sales_orders`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_sales_order_details`
--

CREATE TABLE IF NOT EXISTS `0_sales_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `stk_code` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `qty_sent` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_sales_order_details`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_sales_pos`
--

CREATE TABLE IF NOT EXISTS `0_sales_pos` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(30) NOT NULL,
  `cash_sale` tinyint(1) NOT NULL,
  `credit_sale` tinyint(1) NOT NULL,
  `pos_location` varchar(5) NOT NULL,
  `pos_account` smallint(6) unsigned NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pos_name` (`pos_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `0_sales_pos`
--

INSERT INTO `0_sales_pos` (`id`, `pos_name`, `cash_sale`, `credit_sale`, `pos_location`, `pos_account`, `inactive`) VALUES
(1, 'Default', 1, 1, 'DEF', 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_sales_types`
--

CREATE TABLE IF NOT EXISTS `0_sales_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_type` char(50) NOT NULL DEFAULT '',
  `tax_included` int(1) NOT NULL DEFAULT '0',
  `factor` double NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_type` (`sales_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `0_sales_types`
--

INSERT INTO `0_sales_types` (`id`, `sales_type`, `tax_included`, `factor`, `inactive`) VALUES
(1, 'Al detalle - Factura', 1, 1, 0),
(2, 'Mayoreo', 0, 0.7, 0),
(3, 'Al detalle - CCF', 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_security_roles`
--

CREATE TABLE IF NOT EXISTS `0_security_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `sections` text,
  `areas` text,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcar la base de datos para la tabla `0_security_roles`
--

INSERT INTO `0_security_roles` (`id`, `role`, `description`, `sections`, `areas`, `inactive`) VALUES
(1, 'Inquiries', 'Inquiries', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;773;774;2822;3073;3075;3076;3077;3329;3330;3331;3332;3333;3334;3335;5377;5633;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8450;8451;10497;10753;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15622;15623;15624;15625;15626;15873;15882;16129;16130;16131;16132', 0),
(2, 'System Administrator', 'System Administrator', '256;512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;10496;10752;11008;13056;13312;15616;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;769;770;771;772;773;774;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;16129;16130;16131;16132', 0),
(3, 'Salesman', 'Salesman', '768;3072;5632;8192;15872', '773;774;3073;3075;3081;5633;8194;15873', 0),
(4, 'Stock Manager', 'Stock Manager', '2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '2818;2822;3073;3076;3077;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5889;5890;5891;8193;8194;8450;8451;10753;11009;11010;11012;13313;13315;15882;16129;16130;16131;16132', 0),
(5, 'Production Manager', 'Production Manager', '512;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5640;5889;5890;5891;8193;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132', 0),
(6, 'Purchase Officer', 'Purchase Officer', '512;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5377;5633;5635;5640;5640;5889;5890;5891;8193;8194;8196;8197;8449;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132', 0),
(7, 'AR Officer', 'AR Officer', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;771;773;774;2818;2819;2820;2821;2822;2823;3073;3073;3074;3075;3076;3077;3078;3079;3080;3081;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5633;5634;5637;5638;5639;5640;5640;5889;5890;5891;8193;8194;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132', 0),
(8, 'AP Officer', 'AP Officer', '512;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;769;770;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5635;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15876;15877;15880;15882;16129;16130;16131;16132', 0),
(9, 'Accountant', 'New Accountant', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132', 0),
(10, 'Sub Admin', 'Sub Admin', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15873;15874;15876;15877;15878;15879;15880;15882;16129;16130;16131;16132', 0),
(11, 'Preventas', 'Preventas', '768;3072;8192', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;773;774;2817;2818;2819;2820;2821;2822;2823;3075;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8194;8449;8450;8451;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;16129;16130;16131;16132', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_shippers`
--

CREATE TABLE IF NOT EXISTS `0_shippers` (
  `shipper_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipper_name` varchar(60) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `phone2` varchar(30) NOT NULL DEFAULT '',
  `contact` tinytext NOT NULL,
  `address` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipper_id`),
  UNIQUE KEY `name` (`shipper_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `0_shippers`
--

INSERT INTO `0_shippers` (`shipper_id`, `shipper_name`, `phone`, `phone2`, `contact`, `address`, `inactive`) VALUES
(1, 'Default', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_sql_trail`
--

CREATE TABLE IF NOT EXISTS `0_sql_trail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sql` text NOT NULL,
  `result` tinyint(1) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_sql_trail`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_stock_category`
--

CREATE TABLE IF NOT EXISTS `0_stock_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `dflt_tax_type` int(11) NOT NULL DEFAULT '1',
  `dflt_units` varchar(20) NOT NULL DEFAULT 'each',
  `dflt_mb_flag` char(1) NOT NULL DEFAULT 'B',
  `dflt_sales_act` varchar(11) NOT NULL DEFAULT '',
  `dflt_cogs_act` varchar(11) NOT NULL DEFAULT '',
  `dflt_inventory_act` varchar(11) NOT NULL DEFAULT '',
  `dflt_adjustment_act` varchar(11) NOT NULL DEFAULT '',
  `dflt_assembly_act` varchar(11) NOT NULL DEFAULT '',
  `dflt_dim1` int(11) DEFAULT NULL,
  `dflt_dim2` int(11) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `dflt_no_sale` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Volcar la base de datos para la tabla `0_stock_category`
--

INSERT INTO `0_stock_category` (`category_id`, `description`, `dflt_tax_type`, `dflt_units`, `dflt_mb_flag`, `dflt_sales_act`, `dflt_cogs_act`, `dflt_inventory_act`, `dflt_adjustment_act`, `dflt_assembly_act`, `dflt_dim1`, `dflt_dim2`, `inactive`, `dflt_no_sale`) VALUES
(1, 'SOPAS', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(5, 'COFFE MATE', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(6, 'SOPAS OFERTAS', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(7, 'CREMAS', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(8, 'CULINARIOS', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(9, 'NAN', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(10, 'GERBER - COLADOS PASO 1', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(11, 'BEBIDAS EN POLVO', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(12, 'NESTOGENO', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(18, 'NESTUM - CEREALES', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(14, 'CAFE', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(15, 'CPW', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(17, 'LACTEOS', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(19, 'GERBER - COLADOS PASO 2', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(20, 'GERBER - COLADOS PASO 3', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(21, 'JUGOS - PASO 1', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(22, 'JUGOS - PASO 2', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(23, 'JUGOS - PASO 3', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(24, 'NESTEA', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(25, 'SHAKER', 1, 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0),
(26, 'ESPECIAS Y SAZONADORES', 1, 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_stock_master`
--

CREATE TABLE IF NOT EXISTS `0_stock_master` (
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(200) NOT NULL DEFAULT '',
  `long_description` tinytext NOT NULL,
  `units` varchar(20) NOT NULL DEFAULT 'each',
  `mb_flag` char(1) NOT NULL DEFAULT 'B',
  `sales_account` varchar(11) NOT NULL DEFAULT '',
  `cogs_account` varchar(11) NOT NULL DEFAULT '',
  `inventory_account` varchar(11) NOT NULL DEFAULT '',
  `adjustment_account` varchar(11) NOT NULL DEFAULT '',
  `assembly_account` varchar(11) NOT NULL DEFAULT '',
  `dimension_id` int(11) DEFAULT NULL,
  `dimension2_id` int(11) DEFAULT NULL,
  `actual_cost` double NOT NULL DEFAULT '0',
  `last_cost` double NOT NULL DEFAULT '0',
  `material_cost` double NOT NULL DEFAULT '0',
  `labour_cost` double NOT NULL DEFAULT '0',
  `overhead_cost` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `no_sale` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_stock_master`
--

INSERT INTO `0_stock_master` (`stock_id`, `category_id`, `tax_type_id`, `description`, `long_description`, `units`, `mb_flag`, `sales_account`, `cogs_account`, `inventory_account`, `adjustment_account`, `assembly_account`, `dimension_id`, `dimension2_id`, `actual_cost`, `last_cost`, `material_cost`, `labour_cost`, `overhead_cost`, `inactive`, `no_sale`) VALUES
('11001159', 9, 1, 'NAN SOYA 6X400g', 'FORMULA INFANTIL SOYA NESTLE 400GRS', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295488', 1, 1, 'POLLO Y FIDEO 12(12X60g)', 'SOPA POLLO FIDEOS MAGGI 60GRS', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295490', 1, 1, 'SOPA POLLO CARACOLITO 12(12X60g)', 'SOPA POLLO CARACOLITOS MAGGI 60GRS', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295491', 1, 1, 'SOPA POLLO LETRAS 12(12X60g)', 'SOPA POLLO LETRAS MAGGI 60GRS', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295492', 1, 1, 'SOPA POLLO C/ARROZ 12(12X60g)', 'SOPA POLLO CON ARROZ MAGGI 60GRS', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295493', 1, 1, 'SOPA RES FIDEOS 12(12X60g)', 'SOPA RES CON FIDEOS MAGGI 60GRS', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295494', 7, 1, 'CREMA DE ESPARRAGOS 12(12X66g)', 'CREMA ESPARRAGOS MAGGI 66GRS', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295495', 7, 1, 'CREMA DE HONGOS 12X(12X65g)', 'CREMA HONGOS MAGGI 65GRS', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295496', 7, 1, 'CREMA DE TOMATE 12(12X76g)', 'CREMA TOMATE MAGGI 76GRS', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295971', 8, 1, 'CUBITOS POLLO 200(10X4g)', 'CUBITOS POLLO MAGGI 10UND', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11295984', 8, 1, 'SUPER CUBO POLLO 32(48X10g)', 'SUPER CUBO POLLO MAGGI 10g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296001', 8, 1, 'CONSOME DE POLLO 40(12X10g) TIRA', 'CONSOME POLLO MAGGI TIRA 10g', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296005', 8, 1, '4 PACK CONS POLLO 150(4x10g)', 'CONSOME DE POLLO 10g PAQUETE DE 4', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296014', 8, 1, '4 PACK CONS CAMARON 150(4x10g)', 'CONSOME DE CAMARON 10g PAQUETE DE 4', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296025', 8, 1, '4 PACK CONS COST RES 150(4x10g)', 'CONSOME COSTILLA DE RES 10g PAQUETE DE 4', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296052', 1, 1, 'POLLO Y FIDEO EXH. 24(12X30g)', 'SOPA POLLO Y FIDEOS 30g EXHIBIDORA', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296053', 1, 1, 'SOPA POLLO C/FIDEO LAM 24(12x30g)', '', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296068', 7, 1, 'CREMA DE MARISCOS 12(12X80g)', 'CREMA MARISCOS MAGGI 80GRS', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296072', 1, 1, 'SOPA COLA DE RES 12(12X76g)', 'SOPA COLA RES MAGGI 76GRS', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296100', 1, 1, 'SOPA COSTILLA CRIOLLA 12(12X58g)', 'SOPA COSTILLA CRIOLLA MAGGI 58GRS', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296374', 6, 1, 'POLLO Y FIDEO 12(13X60g)', 'SOPA POLLO Y FIDEOS 60g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296536', 14, 1, 'NESCAFE TRAD 32x36x2g DISPLAY', 'NESCAFE TRADICION 2g DISPLAY', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296598', 8, 1, 'CUBITOS POLLO 60(25X4g) A/FACIL', 'CUBITOS DE POLLO 4g ABRE FACIL', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296702', 14, 1, 'MUSUN POLVO 120x40x2g DISPLAY', 'CAFE MUSUN POLVO 2g DISPLAY', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296703', 14, 1, 'MUSUN POLVO 60x80x2g DISPLAY', 'CAFE MUSUN POLVO 2g DISPLAY', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296704', 14, 1, 'MUSUN POLVO 24x 50g', 'CAFE MUSUN POLVO 50g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296705', 14, 1, 'MUSUN POLVO 12x150g', 'CAFE MUSUN POLVO 150g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296706', 14, 1, 'MUSUN POLVO 12x250g', 'CAFE MUSUN POLVO 250g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296711', 14, 1, 'MUSUN TIRA 12(30x8g)', 'CAFE MUSUN TIRA 8g', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296747', 10, 1, 'PASO 1 Colado Zanahoria 24x70g XP', 'Gerber PASO 1 Colado Zanahoria 70g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296753', 10, 1, 'PASO 1 Colado Banano 24x70g XP', 'GERBER PASO 1 Colado Banano 70g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296754', 10, 1, 'PASO 1 Colado Manzana 24x70g XP', 'GERBER PASO 1 Colado Manzana 70g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296755', 10, 1, 'PASO 1 Colado Pera 24x70g XP', 'GERBER PASO 1 Colado Pera 70g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296756', 10, 1, 'PASO 1 Colado Melocoton 24x70g XP', 'GERBER PASO 1 Colado Melocoton 70g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296758', 10, 1, 'PASO 1 Colado Mango 24x70g XP', 'GERBER PASO 1 Colado Mango 70g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296850', 19, 1, 'PASO 2 Colado Verdura Pll 24x113g', 'GERBER PASO 2 Colado Verdura Pll 113g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296851', 19, 1, 'PASO 2 Colado Verd Car Res 24x113g', 'GERBER PASO 2 Colado Verd Car Res 113g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296868', 19, 1, 'PASO 2 Postre Fruta 24x113g N1', 'GERBER PASO 2 Postre Fruta 113g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11296869', 19, 1, 'PASO 2 Post Manzana Canela 24x113g', 'GERBER PASO 2 Post Manzana Canela 113g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12012403', 15, 1, 'NESQUIK KEVLAR 20X230g', 'NESQUIK KEVLAR 230g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12015084', 15, 1, 'NESTUM PLUS ARR MANZANI 24X270g', 'NESTUM PLUS ARR MANZANI 270g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12016492', 15, 1, 'NESQUIK CEREAL 16x380g', 'NESQUIK CEREAL CHOCOLATE 380g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12016714', 15, 1, 'COOKIE CRISP CRAZY 16X360g', 'COOKIE CRISP CRAZY 360g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12018171', 15, 1, 'TRIX CEREAL 16x340g', 'TRIX CEREAL 340g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12022894', 15, 1, 'LECHERA FLAKES 16X440g', 'LECHERA FLAKES 440g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12037100', 1, 1, 'SOPA CHIPILIN CRIOLLA 12(12x60g)', 'SOPA CHIPILIN CRIOLLA 60g', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12039446', 25, 1, 'SAZONADOR COSTILLA SHAKER 24x225g', 'SAZONADOR COSTILLA SHAKER 24x225g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12039689', 14, 1, 'NESCAFE TRAD GRAN 24X100g', 'NESCAFE TRADICION GRANDE 100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12039734', 14, 1, 'NESCAFE TRAD GRAN 12X200g', 'NESCAFE TRAD GRANDE 200g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12039816', 14, 1, 'NESCAFE TRAD GRAN 24X50g', 'NESCAFE TRAD GRANDE 50g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12047948', 15, 1, 'LUCKY CHARMS KEVLAR 16X326g', 'LUCKY CHARMS KEVLAR 326g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12048270', 17, 1, 'NIDO INSTANTANEA 24X360g', 'LECHE NIDO INSTANTANEA 360g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12048271', 17, 1, 'NIDO INSTANTANEA 48X120g', 'LECHE NIDO INSTANTANEA 120g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12048284', 17, 1, 'NIDO INSTANTANEA 12X 800g', 'LECHE NIDO INSTANTANEA 800g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12048286', 17, 1, 'NIDO INSTANTANEA 6X1600g', 'NIDO INSTANTANEA 1600g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12048771', 17, 1, 'NIDO INSTANTANEA 6X2200g', 'LECHE NIDO INSTANTANEA 2200g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12049707', 17, 1, 'NIDO CRECIMIENTO 1+ 48X120g', 'LECHE NIDO CRECIMIENTO 1+ 120g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12049872', 1, 1, 'SOPA CHIPILIN CRIO 12(13x60g)', 'SOPA CHIPILIN CRIOLLA 60g', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12049959', 17, 1, 'NIDO CRECIMIENTO 1+ 24X360g', 'LECHE NIDO CRECIMIENTO 1+ 360g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12049980', 17, 1, 'NIDO PREESCOLAR 3+ 24X360g', 'LECHE NIDO PREESCOLAR 3+ 360g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12049981', 17, 1, 'NIDO ESCOLAR 6+ 24X360g', 'NIDO ESCOLAR 6+ 360g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12050033', 17, 1, 'NIDO CRECIMIENTO 1+ 12X800g', 'NIDO CRECIMIENTO 1+ 800g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12050176', 17, 1, 'NIDO ESCOLAR 6+ 6X800g', 'LECHE NIDO ESCOLAR 6+ 800g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12050177', 17, 1, 'NIDO PREESCOLAR 3+ 6X1600g', 'LECHE NIDO PREESCOLAR 3+ 1600g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12050178', 17, 1, 'NIDO PREESCOLAR 3+ 12X800g', 'LECHE NIDO PREESCOLAR 3+ 800g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12050180', 17, 1, 'NIDO CRECIMIENTO 1+ 6X2200g', 'LECHE NIDO CRECIMIENTO 1+ 2200g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12050181', 17, 1, 'NIDO CRECIMIENTO 1+ 6X1600g', 'LECHE NIDO CRECIMIENTO 1+ 1600g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12052191', 17, 1, 'SVELTY ACTIFIBRAS 12X800g Verde', 'SVELTY ACTIFIBRAS 800g Verde', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12057714', 1, 1, 'SOPA GALL INDIA CRIOLLA 12(12x60g)', 'SOPA GALL INDIA CRIOLLA 60g', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12058260', 9, 1, 'NAN PRO 1 24X400g', 'FORMULA INFANTIL PROTECT PLUS 1 NESTLE 400GRS', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12058633', 9, 1, 'NAN HA B GOLD 12X400g', 'FORMULA INFANTIL NAN HA B GOLD 400g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12059185', 9, 1, 'NAN PRO 1 12X900g', 'FORMULA INFANTIL NAN PRO 1 900g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12059192', 9, 1, 'NAN PRO 2 24X400g', 'FORMULA INFANTIL NAN PRO 2 400g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12059194', 9, 1, 'NAN PRO 2 12X900g', 'FORMULA INFANTIL NAN PRO 2 900g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12059619', 9, 1, 'NAN LACTOSE FREE 12X400g', 'FORMULA INFANTIL NAN LACTOSE FREE 400g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12059677', 15, 1, 'NESTUM PLUS AVENA CIRUE 24X270g', 'NESTUM PLUS AVENA CIRUE 24X270g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12059794', 15, 1, 'NESTUM PLUS ARROZ MANZ. 24X270g', 'NESTUM PLUS ARROZ MANZANA 270g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12063341', 11, 1, 'NESQUIK FRESA 12X380g', 'NESQUIK FRESA 380g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12069225', 17, 1, 'NIDO ESENCIAL 24X500g', 'LECHE NIDO ESENCIAL 500g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12069226', 11, 1, 'NESQUIK FRESA BOLSA 10X200g', 'NESQUIK FRESA BOLSA 200g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12071485', 17, 1, 'SVELTY ACTIFIBRAS 12X800g Azul', 'SVELTY ACTIFIBRAS 800g Azul', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12072566', 14, 1, 'NESCAFE DIPLOMAT 12x115g', 'NESCAFE DIPLOMAT 115g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12073848', 17, 1, 'NIDO ESENCIAL 24X360g', 'LECHE NIDO ESENCIAL 360g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12076504', 14, 1, 'NESCAFE TRAD GRAN 12X200g + TAZA', 'NESCAFE TRADICION GRANDE 200g CON TAZA INCLUIDA', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12076546', 6, 1, 'SOPA GALL INDIA CRIO 12(13x60g)', 'SOPA GALL INDIA CRIOLLA 60g', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12076893', 8, 1, 'CUBITO DE POLLO 32(150x4g)', 'CUBITO DE POLLO 4g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12082540', 17, 1, 'NIDO INSTANTANEA 6x2200g Bolsa', 'LECHE NIDO INSTANTANEA 2200g Bolsa', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12083115', 18, 1, 'NESTUM CI ARROZ 24X200g', 'NESTUM CI ARROZ 24X200g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12083134', 18, 1, 'NESTUM CI 8 CEREALES 24X 200g', 'NESTUM CI 8 CEREALES 24X 200g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12083136', 18, 1, 'NESTUM VAINILLA 24X250g', 'NESTUM VAINILLA 24X250g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12083143', 18, 1, 'NESTUM CI AVENA 24X200g', 'NESTUM CI AVENA 24X200g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12083148', 18, 1, 'NESTUM CHOCOLATE 24X250g', 'NESTUM CHOCOLATE 24X250g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12083149', 18, 1, 'NESTUM FRUTILLA 24X250g', 'NESTUM FRUTILLA 24X250g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12083196', 18, 1, 'NESTUM CI 5 CEREALES 24X 200g', 'NESTUM CI 5 CEREALES 24X 200g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12084015', 18, 1, 'NESTUM CI TRIGO MIEL 24X 200g', 'NESTUM CI TRIGO MIEL 24X 200g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12086054', 18, 1, 'NESTUM CI TRIGO C/LEC. 24X360g', 'NESTUM CI TRIGO C/LEC. 24X360g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12089555', 9, 1, 'NAN AR 12X400g', 'NAN AR 12X400g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12089815', 17, 1, 'NIDO INSTANTANEA 24X12X26g', 'NIDO INSTANTANEA 24X12X26g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12089991', 8, 1, 'SAZONAD COST RES 40(12X10g) TIRA', 'SAZONAD COST RES 40(12X10g) TIRA', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12090002', 8, 1, 'SAZONADOR DE RES 40(12X10g) TIRA', 'SAZONADOR DE RES 40(12X10g) TIRA', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12090011', 8, 1, 'GALLINITA MI SAZON 40(12X10g) TIRA', 'GALLINITA MI SAZON 40(12X10g) TIRA', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12090013', 8, 1, 'CONSOME CAMARON 40(12X10g) TIRA', 'CONSOME DE CAMARON 40(12X10g) TIRA', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12090701', 22, 1, 'PASO 2 Jugo de Pera 24X175ml', 'PASO 2 Jugo de Pera 24X175ml', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12090711', 22, 1, 'PASO 2 Jugo de Manzana 24X175ml', 'PASO 2 Jugo de Manzana 24X175ml', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12090922', 22, 1, 'PASO 2 Jugo Manz Meloc 24X175ml', 'PASO 2 Jugo Manz Meloc 24X175ml', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12092148', 14, 1, 'NESCAFE LISTO STICK 24(60X2g)', 'NESCAFE LISTO STICK 24(60X2g)', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12092235', 14, 1, 'NESCAFE TRAD 24X60X2g DISPLAY', 'NESCAFE TRAD 24X60X2g DISPLAY', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12092601', 1, 1, 'SOPA POLLO FID INTEGR 12x(12x60g)', 'SOPA POLLO FID INTEGR 12x(12x60g)', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12093529', 15, 1, 'NESQUIK Cereal 60x30g XU', 'NESQUIK Cereal 60x30g XU', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12094344', 17, 1, 'LECHE EVAPORADA 48X315g', 'LECHE EVAPORADA 48X315g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12094813', 23, 1, 'PASO 3 Jugo Manz y Peras 24X230ml', 'PASO 3 Jugo Manz y Peras 24X230ml', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12094814', 21, 1, 'PASO 1 Jugo de Peras 24X118ml', 'PASO 1 Jugo de Peras 24X118ml', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12094816', 21, 1, 'PASO 1 Jugo de Uva Blanca 24X118ml', 'PASO 1 Jugo de Uva Blanca 24X118ml', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12094838', 21, 1, 'PASO 1 Jugo de Manzanas 24X118ml', 'PASO 1 Jugo de Manzanas 24X118ml', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12094839', 23, 1, 'PASO 3 Jugo Manzana 24x230ml', 'PASO 3 Jugo Manzana 24x230ml', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12095078', 24, 1, 'NESTEA Limon 24x680g', 'NESTEA Limon 24x680g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12096957', 24, 1, 'NESTEA SinCals Te Verde 6(18x9g)', 'NESTEA SinCals Te Verde 6(18x9g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12097336', 24, 1, 'NESTEA SinCals Limon 6(18x9g)', 'NESTEA SinCals Limon 6(18x9g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12098357', 24, 1, 'NESTEA Limon Sobres 12(10x85g)', 'NESTEA Limon Sobres 12(10x85g)', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12098374', 17, 1, 'NIDO ESENCIAL 48x120g', 'NIDO ESENCIAL 48x120g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12098601', 14, 1, 'NESCAFE TASTER CHOICE 12x100g', 'NESCAFE TASTER CHOICE 12x100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12099349', 17, 1, 'NIDO CRECIMIENTO 1+ 6X2200g Bolsa', 'NIDO CRECIMIENTO 1+ 6X2200g Bolsa', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12104295', 9, 1, 'NAN PRO 3 12X800g', 'NAN PRO 3 12X800g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12109152', 5, 1, 'COFFEE-MATE 12X11oz 311g', 'COFFEE-MATE 12X11oz 311g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12109153', 5, 1, 'COFFEE MATE 12X16oz 453g', 'COFFEE MATE 12X16oz 453g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12109598', 5, 1, 'COFFEE MATE 12X6oz 170g', 'COFFEE MATE 12X6oz 170g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12109636', 14, 1, 'NESCAFE LISTO TRAD Tira 12(10(12x2g))', 'NESCAFE LISTO TRAD Tira 12(10(12x2g))', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12112732', 5, 1, 'COFFEE-MATE Original MP 12(50x3g)', 'COFFEE-MATE Original MP 12(50x3g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12115515', 19, 1, 'PASO 2 Colado Mango 24x113g', 'PASO 2 Colado Mango 24x113g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12115516', 19, 1, 'PASO 2 Colado Ciruela Pasa 24x113g', 'PASO 2 Colado Ciruela Pasa 24x113g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12115517', 19, 1, 'PASO 2 Colado Guayaba 24x113g', 'PASO 2 Colado Guayaba 24x113g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12115541', 20, 1, 'PASO 3 Colado Meloc Mango 24x170g', 'PASO 3 Colado Meloc Mango 24x170g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12115542', 20, 1, 'PASO 3 Colado Pera 24x170g', 'PASO 3 Colado Pera 24x170g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12118198', 25, 1, 'CONSOME POLLO SHAKER 24x225g', 'CONSOME POLLO SHAKER 24x225g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12118518', 24, 1, 'NESTEA Te Verde Sobre 12(10x85g)', 'NESTEA Te Verde Sobre 12(10x85g)', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12121932', 14, 1, 'NESCAFE DECAF 12X100g', 'NESCAFE DECAF 12X100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12124049', 15, 1, 'NESQUIK KEVLAR 14X750g', 'NESQUIK KEVLAR 14X750g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12124060', 15, 1, 'CORN FLAKES KEVLAR 14X660g', 'CORN FLAKES KEVLAR 14X660g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12125227', 14, 1, 'NESCAFE CAPPUCCINO 15(8x20g)', 'NESCAFE CAPPUCCINO 15(8x20g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12128374', 17, 1, 'LECHE CONDENSADA 48X397g', 'LECHE CONDENSADA 48X397g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12131077', 20, 1, 'PASO 3 Pure Pera Fru Trop 24x170g', 'PASO 3 Pure Pera Fru Trop 24x170g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12131078', 20, 1, 'PASO 3 Pure Manzana Meloc 24x170g', 'PASO 3 Pure Manzana Meloc 24x170g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12131199', 20, 1, 'PASO 3 Pure Banano Fru Mxt 24x170g', 'PASO 3 Pure Banano Fru Mxt 24x170g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133333', 19, 1, 'PASO 2 Colado Pera Meloc 24x113g', 'PASO 2 Colado Pera Meloc 24x113g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133334', 19, 1, 'PASO 2 Colado Manzana Bna 24x113g', 'PASO 2 Colado Manzana Bna 24x113g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133535', 12, 1, 'NESTOGENO 1 12X900g', 'NESTOGENO 1 12X900g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133537', 12, 1, 'NESTOGENO 1 24X400g', 'NESTOGENO 1 24X400g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133538', 12, 1, 'NESTOGENO 2 24X400g', 'NESTOGENO 2 24X400g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133560', 12, 1, 'NESTOGENO 2 12X900g', 'NESTOGENO 2 12X900g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133598', 19, 1, 'PASO 2 Colado Banano 24x100g', 'PASO 2 Colado Banano 24x100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133599', 19, 1, 'PASO 2 Colado Pera 24x100g', 'PASO 2 Colado Pera 24x100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133670', 19, 1, 'PASO 2 Colado Manzana 24x100g', 'PASO 2 Colado Manzana 24x100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133671', 19, 1, 'PASO 2 Colado Fruta Mixtas 24x100g', 'PASO 2 Colado Fruta Mixtas 24x100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12133680', 19, 1, 'PASO 2 Colado Melocoton 24x100g', 'PASO 2 Colado Melocoton 24x100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12135836', 11, 1, 'NESQUIK CHOCOLATE BOLSA 10X180g', 'NESQUIK CHOCOLATE BOLSA 10X180g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12141777', 15, 1, 'FITNESS &amp; ALMONDS 18X430g', 'FITNESS &amp; ALMONDS 18X430g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12149146', 14, 1, 'MUSUM SUAVE 12x 50g', 'MUSUM SUAVE 12x 50g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12149148', 14, 1, 'MUSUM SUAVE 15x180g', 'MUSUM SUAVE 15x180g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12149590', 14, 1, 'MUSUM SUAVE 24x100g', 'MUSUM SUAVE 24x100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12150527', 15, 1, 'FITNESS &amp; FRUITS 18X375g', 'FITNESS &amp; FRUITS 18X375g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12150891', 15, 1, 'FITNESS KEVLAR 18X365g', 'FITNESS KEVLAR 18X365g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12152211', 15, 1, 'FITNESS &amp; FRUITS 14X600g', 'FITNESS &amp; FRUITS 14X600g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12160746', 6, 1, 'POLLO Y FIDEO 12(2(5X60g) Bolsa', 'POLLO Y FIDEO 12(2(5X60g) Bolsa', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12162003', 8, 1, 'DOBLE GUSTO 3X36(8X10g)', 'DOBLE GUSTO 3X36(8X10g)', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12162058', 5, 1, 'COFFEE-MATE 12X22oz 650g', 'COFFEE-MATE 12X22oz 650g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12162611', 25, 1, 'TOQUE FINAL POLLO 24x180g', 'TOQUE FINAL POLLO 24x180g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12162612', 25, 1, 'TOQUE FINAL RES 24x180g', 'TOQUE FINAL RES 24x180g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12162833', 8, 1, 'DOBLE GUSTO 24(48X10g)', 'DOBLE GUSTO 24(48X10g)', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12162887', 25, 1, 'GALLINITA MI SAZON SHAKER 24x225g', 'GALLINITA MI SAZON SHAKER 24x225g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12163691', 11, 1, 'NESQUIK Tira 16grms', 'NESQUIK Tira 16grms', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12164890', 14, 1, 'NESCAFE LISTO DOYPACK 24X50g', 'NESCAFE LISTO DOYPACK 24X50g', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12165117', 14, 1, 'NESCAFE MOKACCINO 15(6x25g)', 'NESCAFE MOKACCINO 15(6x25g)', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12169101', 8, 1, 'CUBITO JIRAFA', 'CUBITO JIRAFA', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12170504', 12, 1, 'NESTOGENO 8X135g Bolsa', 'NESTOGENO 135g Bolsa', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172745', 26, 1, 'PIMIENTA NEGRA 30(12x2.5g)', 'PIMIENTA NEGRA 30(12x2.5g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172746', 26, 1, 'CANELA POLVO 30(12x3g)', 'CANELA POLVO 30(12x3g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172747', 26, 1, 'SAL DE AJO 30(12x6g)', 'SAL DE AJO 30(12x6g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172748', 25, 1, 'AJO PURO SHAKER 12x80g', 'AJO PURO SHAKER 12x80g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172749', 25, 1, 'OREGANO POLVO SHAKER 12x40g', 'OREGANO POLVO SHAKER 12x40g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172760', 25, 1, 'SAL DE AJO SHAKER 12x100g', 'SAL DE AJO SHAKER 12x100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172762', 25, 1, 'CANELA POLVO SHAKER 12x60g', 'CANELA POLVO SHAKER 12x60g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172763', 25, 1, 'PIMIENTA NEGRA SHAKER 12x55g', 'PIMIENTA NEGRA SHAKER 12x55g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172764', 26, 1, 'SAL DE CEBOLLA 30(12x6g)', 'SAL DE CEBOLLA 30(12x6g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172772', 26, 1, 'AJO PURO 30(12x4g)', 'AJO PURO 30(12x4g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172774', 26, 1, 'ABLANDADOR Y SAZONADOR 20(12x10g)', 'ABLANDADOR Y SAZONADOR 20(12x10g)', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12172779', 25, 1, 'SAL DE CEBOLLA SHAKER 12x100g', 'SAL DE CEBOLLA SHAKER 12x100g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12173131', 17, 1, 'NIDO 1+ PROTECTUS LEP Lata 6x1,600g', 'NIDO 1+ PROTECTUS LEP Lata 6x1,600g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12173132', 17, 1, 'NIDO 1+ PROTECTUS LEP Bolsa 24x360g', 'NIDO 1+ PROTECTUS LEP Bolsa 24x360g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12173137', 17, 1, 'NIDO 1+ PROTECTUS LEP Lata 12x800g', 'NIDO 1+ PROTECTUS LEP Lata 12x800g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12173139', 17, 1, 'NIDO 1+ PROTECTUS LEP Bolsa 48x120g', 'NIDO 1+ PROTECTUS LEP Bolsa 48x120g', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12177212', 14, 1, 'MUSUN SUAVE 24x1.8g', 'MUSUN SUAVE 24x1.8g', 'ti.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12177530', 14, 1, 'NESCAFE 3 en 1 Sobre 24(4x90g)', 'NESCAFE 3 en 1 Sobre 24(4x90g) MX', 'di.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8503124', 14, 1, 'NESCAFE CON LECHE 24X300g', 'CAFE LECHE SOLUBLE NESCAFE NESTLE 300GR', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8507401', 11, 1, 'NESQUIK CHOCOLATE 24X400g LATA', 'MEZCLA PARA CHOCOLATE NESQUIK 400 GR', 'un.', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_stock_moves`
--

CREATE TABLE IF NOT EXISTS `0_stock_moves` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `loc_code` char(5) NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `person_id` int(11) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `reference` char(40) NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '1',
  `discount_percent` double NOT NULL DEFAULT '0',
  `standard_cost` double NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`trans_id`),
  KEY `type` (`type`,`trans_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_stock_moves`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_suppliers`
--

CREATE TABLE IF NOT EXISTS `0_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_name` varchar(60) NOT NULL DEFAULT '',
  `supp_ref` varchar(30) NOT NULL DEFAULT '',
  `address` tinytext NOT NULL,
  `supp_address` tinytext NOT NULL,
  `phone` varchar(30) NOT NULL DEFAULT '',
  `phone2` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `gst_no` varchar(25) NOT NULL DEFAULT '',
  `contact` varchar(60) NOT NULL DEFAULT '',
  `supp_account_no` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL DEFAULT '',
  `bank_account` varchar(60) NOT NULL DEFAULT '',
  `curr_code` char(3) DEFAULT NULL,
  `payment_terms` int(11) DEFAULT NULL,
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0',
  `tax_group_id` int(11) DEFAULT NULL,
  `credit_limit` double NOT NULL DEFAULT '0',
  `purchase_account` varchar(11) DEFAULT NULL,
  `payable_account` varchar(11) DEFAULT NULL,
  `payment_discount_account` varchar(11) DEFAULT NULL,
  `notes` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplier_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `0_suppliers`
--

INSERT INTO `0_suppliers` (`supplier_id`, `supp_name`, `supp_ref`, `address`, `supp_address`, `phone`, `phone2`, `fax`, `gst_no`, `contact`, `supp_account_no`, `email`, `website`, `bank_account`, `curr_code`, `payment_terms`, `dimension_id`, `dimension2_id`, `tax_group_id`, `credit_limit`, `purchase_account`, `payable_account`, `payment_discount_account`, `notes`, `inactive`) VALUES
(1, 'Nestle S.A.', 'Nestle', 'Apartado (06) 497\nCentro Corporativo Madreselva\nAvenido El Espino y Calzada El Almendro\nAntiguo Cuscatlán', 'Centro Corporativo Madreselva\nAvenido El Espino y Calzada El Almendro\nAntiguo Cuscatlán', '2288-8400', '', '2243-9615', '', '', '', '', 'http://www.nestle-centroamerica.com', '', 'USD', 2, 0, 0, 1, 0, '5010', '2100', '5060', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_supp_allocations`
--

CREATE TABLE IF NOT EXISTS `0_supp_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amt` double unsigned DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_supp_allocations`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_supp_invoice_items`
--

CREATE TABLE IF NOT EXISTS `0_supp_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_trans_no` int(11) DEFAULT NULL,
  `supp_trans_type` int(11) DEFAULT NULL,
  `gl_code` varchar(11) NOT NULL DEFAULT '0',
  `grn_item_id` int(11) DEFAULT NULL,
  `po_detail_item_id` int(11) DEFAULT NULL,
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `description` tinytext,
  `quantity` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `memo_` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_supp_invoice_items`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_supp_trans`
--

CREATE TABLE IF NOT EXISTS `0_supp_trans` (
  `trans_no` int(11) unsigned NOT NULL DEFAULT '0',
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `supplier_id` int(11) unsigned DEFAULT NULL,
  `reference` tinytext NOT NULL,
  `supp_reference` varchar(60) NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `alloc` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_no`,`type`),
  KEY `supplier_id` (`supplier_id`),
  KEY `SupplierID_2` (`supplier_id`,`supp_reference`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_supp_trans`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_sys_types`
--

CREATE TABLE IF NOT EXISTS `0_sys_types` (
  `type_id` smallint(6) NOT NULL DEFAULT '0',
  `type_no` int(11) NOT NULL DEFAULT '1',
  `next_reference` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_sys_types`
--

INSERT INTO `0_sys_types` (`type_id`, `type_no`, `next_reference`) VALUES
(0, 17, '1'),
(1, 7, '1'),
(2, 4, '1'),
(4, 3, '1'),
(10, 16, '1'),
(11, 2, '1'),
(12, 6, '1'),
(13, 1, '1'),
(16, 2, '1'),
(17, 2, '1'),
(18, 1, '1'),
(20, 6, '1'),
(21, 1, '1'),
(22, 3, '1'),
(25, 1, '1'),
(26, 1, '1'),
(28, 1, '1'),
(29, 1, '1'),
(30, 0, '1'),
(32, 0, '1'),
(35, 1, '1'),
(40, 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_tags`
--

CREATE TABLE IF NOT EXISTS `0_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_tags`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_tag_associations`
--

CREATE TABLE IF NOT EXISTS `0_tag_associations` (
  `record_id` varchar(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  UNIQUE KEY `record_id` (`record_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_tag_associations`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_tax_groups`
--

CREATE TABLE IF NOT EXISTS `0_tax_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `tax_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `0_tax_groups`
--

INSERT INTO `0_tax_groups` (`id`, `name`, `tax_shipping`, `inactive`) VALUES
(1, 'Impuesto de Compras', 0, 0),
(2, 'Exento de Impuestos', 0, 0),
(3, 'Impuesto de Ventas', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_tax_group_items`
--

CREATE TABLE IF NOT EXISTS `0_tax_group_items` (
  `tax_group_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_group_id`,`tax_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_tax_group_items`
--

INSERT INTO `0_tax_group_items` (`tax_group_id`, `tax_type_id`, `rate`) VALUES
(1, 1, 13),
(1, 2, 1),
(3, 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_tax_types`
--

CREATE TABLE IF NOT EXISTS `0_tax_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL DEFAULT '0',
  `sales_gl_code` varchar(11) NOT NULL DEFAULT '',
  `purchasing_gl_code` varchar(11) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `0_tax_types`
--

INSERT INTO `0_tax_types` (`id`, `rate`, `sales_gl_code`, `purchasing_gl_code`, `name`, `inactive`) VALUES
(1, 13, '2150', '2145', 'IVA', 0),
(2, 1, '2146', '2146', 'IGC', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_trans_tax_details`
--

CREATE TABLE IF NOT EXISTS `0_trans_tax_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `tran_date` date NOT NULL,
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `ex_rate` double NOT NULL DEFAULT '1',
  `included_in_price` tinyint(1) NOT NULL DEFAULT '0',
  `net_amount` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `memo` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_trans_tax_details`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_useronline`
--

CREATE TABLE IF NOT EXISTS `0_useronline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(15) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `file` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_useronline`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_users`
--

CREATE TABLE IF NOT EXISTS `0_users` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `real_name` varchar(100) NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '1',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `date_format` tinyint(1) NOT NULL DEFAULT '0',
  `date_sep` tinyint(1) NOT NULL DEFAULT '0',
  `tho_sep` tinyint(1) NOT NULL DEFAULT '0',
  `dec_sep` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL DEFAULT 'default',
  `page_size` varchar(20) NOT NULL DEFAULT 'A4',
  `prices_dec` smallint(6) NOT NULL DEFAULT '2',
  `qty_dec` smallint(6) NOT NULL DEFAULT '2',
  `rates_dec` smallint(6) NOT NULL DEFAULT '4',
  `percent_dec` smallint(6) NOT NULL DEFAULT '1',
  `show_gl` tinyint(1) NOT NULL DEFAULT '1',
  `show_codes` tinyint(1) NOT NULL DEFAULT '0',
  `show_hints` tinyint(1) NOT NULL DEFAULT '0',
  `last_visit_date` datetime DEFAULT NULL,
  `query_size` tinyint(1) DEFAULT '10',
  `graphic_links` tinyint(1) DEFAULT '1',
  `pos` smallint(6) DEFAULT '1',
  `print_profile` varchar(30) NOT NULL DEFAULT '1',
  `rep_popup` tinyint(1) DEFAULT '1',
  `sticky_doc_date` tinyint(1) DEFAULT '0',
  `startup_tab` varchar(20) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `0_users`
--

INSERT INTO `0_users` (`id`, `user_id`, `password`, `real_name`, `role_id`, `phone`, `email`, `language`, `date_format`, `date_sep`, `tho_sep`, `dec_sep`, `theme`, `page_size`, `prices_dec`, `qty_dec`, `rates_dec`, `percent_dec`, `show_gl`, `show_codes`, `show_hints`, `last_visit_date`, `query_size`, `graphic_links`, `pos`, `print_profile`, `rep_popup`, `sticky_doc_date`, `startup_tab`, `inactive`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 2, '', 'jorgefloresu@gmail.com', 'es_SV', 1, 0, 0, 0, 'fancy', 'Letter', 2, 2, 4, 1, 1, 0, 0, '2012-11-30 11:46:58', 10, 1, 1, '', 1, 0, 'orders', 0),
(2, 'user', 'f8032d5cae3de20fcec887f395ec9a6a', 'Usuario', 11, '', '', 'es_SV', 0, 0, 0, 0, 'fancy', 'Letter', 2, 2, 4, 1, 1, 0, 0, '2012-11-28 11:22:55', 10, 1, 1, '', 1, 0, 'orders', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_voided`
--

CREATE TABLE IF NOT EXISTS `0_voided` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `memo_` tinytext NOT NULL,
  UNIQUE KEY `id` (`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `0_voided`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_workcentres`
--

CREATE TABLE IF NOT EXISTS `0_workcentres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `description` char(50) NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_workcentres`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_workorders`
--

CREATE TABLE IF NOT EXISTS `0_workorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_ref` varchar(60) NOT NULL DEFAULT '',
  `loc_code` varchar(5) NOT NULL DEFAULT '',
  `units_reqd` double NOT NULL DEFAULT '1',
  `stock_id` varchar(20) NOT NULL DEFAULT '',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required_by` date NOT NULL DEFAULT '0000-00-00',
  `released_date` date NOT NULL DEFAULT '0000-00-00',
  `units_issued` double NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `released` tinyint(1) NOT NULL DEFAULT '0',
  `additional_costs` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wo_ref` (`wo_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_workorders`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_wo_issues`
--

CREATE TABLE IF NOT EXISTS `0_wo_issues` (
  `issue_no` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `loc_code` varchar(5) DEFAULT NULL,
  `workcentre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`issue_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_wo_issues`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_wo_issue_items`
--

CREATE TABLE IF NOT EXISTS `0_wo_issue_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` varchar(40) DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `qty_issued` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_wo_issue_items`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_wo_manufacture`
--

CREATE TABLE IF NOT EXISTS `0_wo_manufacture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) DEFAULT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_wo_manufacture`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `0_wo_requirements`
--

CREATE TABLE IF NOT EXISTS `0_wo_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) NOT NULL DEFAULT '',
  `workcentre` int(11) NOT NULL DEFAULT '0',
  `units_req` double NOT NULL DEFAULT '1',
  `std_cost` double NOT NULL DEFAULT '0',
  `loc_code` char(5) NOT NULL DEFAULT '',
  `units_issued` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `0_wo_requirements`
--

