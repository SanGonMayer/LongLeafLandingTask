# Loan Application Form

This is a Ruby on Rails project that provides a step-by-step loan application form with email and PDF generation features.

## Prerequisites

Make sure you have the following installed on your system:
- Ruby 3.1.3
- Rails 7.1.3.4
- Node.js and Yarn
- Mailcatcher gem

## Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/your-repo.git
    cd your-repo
    ```

2. **Install the required gems:**
    ```bash
    bundle install
    ```

3. **Install JavaScript dependencies:**
    ```bash
    yarn install
    ```

4. **Set up the database:**
    ```bash
    rails db:setup
    ```

5. **Precompile the assets:**
    ```bash
    rails assets:precompile
    ```

## Running the Application

1. **Start the Rails server:**
    ```bash
    rails server
    ```

2. **Start Mailcatcher:**
    ```bash
    mailcatcher
    ```

    Mailcatcher runs a web interface at [http://127.0.0.1:1080/](http://127.0.0.1:1080/).

3. **Visit the application:**
    Open your browser and navigate to [http://localhost:3000](http://localhost:3000).

## Using the Application

1. **Fill out the loan application form:**
    - Follow the step-by-step form to input the required details.

2. **Submit the form:**
    - Once you complete the form, submit it. You should receive a confirmation message.

3. **Check the email:**
    - Open Mailcatcher at [http://127.0.0.1:1080/](http://127.0.0.1:1080/).
    - You should see the email sent by the application with the PDF attachment.
    - Open the email and download the PDF.
