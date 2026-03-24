# Supplier Invoice Tracking App

## Project Overview
This project aims to provide a comprehensive solution for tracking supplier invoices, ensuring that businesses can efficiently manage and monitor their incoming invoices.

## Features
- User authentication
- Invoice management
- Supplier management
- Real-time updates and notifications
- Reporting tools

## System Requirements
- Node.js >= 14.x
- MongoDB >= 4.x
- A modern web browser (Chrome, Firefox, etc.)

## Installation Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/Kudzai-chikata/supplier-invoice-tracking-app.git
   cd supplier-invoice-tracking-app
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Set up the environment variables:
   Create a `.env` file in the root directory and add the necessary configurations:
   ```
   DB_URI=mongodb://<username>:<password>@localhost:27017/invoice_db
   PORT=3000
   ```
4. Start the application:
   ```bash
   npm start
   ```

## Database Schema
### Invoice
- `id`: ObjectId
- `supplierId`: ObjectId
- `amount`: Number
- `date`: Date
- `status`: String
- `description`: String

### Supplier
- `id`: ObjectId
- `name`: String
- `contactInfo`: String
- `paymentTerms`: String

## API Integration Details
- **Base URL**: `/api`
- **Endpoints**:
  - `GET /invoices`: Fetch all invoices.
  - `POST /invoices`: Create a new invoice.
  - `GET /suppliers`: Fetch all suppliers.
  - `POST /suppliers`: Add a new supplier.

## Troubleshooting Guide
- Ensure MongoDB is running and accessible.
- Check the `.env` configuration.
- If you experience any issues, try deleting `node_modules` and running `npm install` again.

For further assistance, refer to the [GitHub Issues](https://github.com/Kudzai-chikata/supplier-invoice-tracking-app/issues).