# Loan Application Form

This is a Ruby on Rails project that provides a step-by-step loan application form with email and PDF generation features.

## Prerequisites

Make sure you have the following installed on your system:
- Ruby 3.1.3
- Rails 7.1.3.4
- Node.js and Yarn
- Mailcatcher gem
- **Highly recommended:** WSL with Ubuntu (for Windows users)

### Installing WSL and Ubuntu

1. **Install WSL**:
    Open PowerShell as Administrator and run:
    ```sh
    wsl --install
    ```

2. **Install Ubuntu**:
    After installing WSL, install Ubuntu from the Microsoft Store.

3. **Set up Ubuntu**:
    Open Ubuntu from the Start menu and follow the initial setup steps.

### Installing rbenv for Ruby Version Management

1. **Install rbenv and ruby-build**:
    In your Ubuntu terminal, run:
    ```sh
    sudo apt update
    sudo apt install -y rbenv
    ```

2. **Add rbenv to your shell**:
    ```sh
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    exec $SHELL
    ```

3. **Install ruby-build** (if it is empty, there is no problem and you can skip this step):
    ```sh
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    ```

4. **Install Ruby**:
    ```sh
    rbenv install 3.1.3
    rbenv global 3.1.3
    ```

5. **Verify the installation**:
    ```sh
    ruby -v
    ```

## Installation

1. **Clone the repository:** (use your Ubuntu terminal)
    ```bash
    git clone https://github.com/SanGonMayer/LongleafLendingTask
    cd LongleafLendingTask
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

2. **Start Mailcatcher:** (open another console, go to the task directory and run the command)
    ```bash
    mailcatcher
    ```
If there is any problem when openning the mailcatcher, try this:
```bash
gem uninstall mailcatcher
gem install mailcatcher
```
Be sure your 1080 port is not beeing used so you can run:
```bash
mailcatcher --http-port 1080
```
Mailcatcher runs a web interface at [http://127.0.0.1:1080/](http://127.0.0.1:1080/).

3. **Visit the application:**
    Open your browser and navigate to [http://localhost:3000](http://localhost:3000).

## Using the Application

1. **Fill out the loan application form:**
    - Follow the step-by-step form to input the required details.

2. **Submit the form:**
    - Once you complete the form, submit it.

3. **Check the email:**
    - Open Mailcatcher at [http://127.0.0.1:1080/](http://127.0.0.1:1080/).
    - You should see the email sent by the application with the PDF attachment.
    - In case you don't see it, refresh the mailcatcher page.
    - Open the email and download the PDF.

## Design Justifications
**MVC Architecture:** 
The application follows the Model-View-Controller (MVC) architecture, which separates the data layer, business logic, and presentation layer. This makes the codebase more organized and easier to maintain.

Models: The models in our application represent the data and business logic. For example, the Loan model encapsulates all logic related to loans, including validations and relationships with other entities.
Views: The views are responsible for presenting information to the user. We use views in ERB (Embedded Ruby) to generate dynamic HTML based on data provided by the controllers.
Controllers: The controllers handle application logic and user interactions. For example, the LoansController manages requests related to loans, including the creation and display of forms.

**Service Pattern:**
The service pattern is used to encapsulate complex business logic that does not belong to a specific model. In the application, I have implemented the PdfGenerator and PdfFormatter as services to manage PDF generation.
PdfGenerator: This service is responsible for orchestrating the creation of the PDF, using PdfFormatter to apply the appropriate formatting. This follows the single responsibility principle, as each class has a single, clear responsibility.
PdfFormatter: This service is responsible for applying formatting to the PDF, including the addition of logos, headers, and formatted tables.

**Strategy Pattern**
The strategy pattern has been also used for the generation and formatting of the PDF. The methods in PdfFormatter act as different formatting strategies that can be used by PdfGenerator.

Formatting Methodologies: Methods such as add_logo, add_section_header, and add_table in PdfFormatter define different strategies for formatting the PDF content.

Flexibility and Extensibility: This allows PdfGenerator to use different formatting methods without modifying its own implementation, providing flexibility and extensibility.

**Form Validations:**
Client-side Validations: I use JavaScript to validate form fields before submission, providing immediate feedback to the user.

Server-side Validations: Model validations in Rails ensure that the submitted data is correct and complete before being processed and stored in the database.

**Email Sending:**
UserMailer: This class is responsible for setting up and sending emails. I have used Action Mailer to create customized emails with attachments, such as the generated loan PDF.

Mailcatcher: During development, I have used Mailcatcher to intercept and review sent emails, ensuring that the content and format are correct before deploying to production. Additionally, Mailcatcher is used for a more realistic simulation since it uses a different port and works as another server.

**Security:**
CSRF (Cross-Site Request Forgery) Protection:
Rails includes automatic CSRF protection. Each form includes an authenticity token that is validated on the server to ensure that requests are legitimate and originate from the same site.

Output Escaping:
Ensuring that all data output to views is properly escaped to prevent XSS (Cross-Site Scripting) attacks. Rails does this by default with ERB tags.

SQL Injection Protection:
Rails uses ActiveRecord, which automatically handles SQL query sanitization, preventing SQL injection attacks.
Apart from this, as it is a development environment it is quite convinient for implementation.

**Scalability:**
Decoupling Components:
Decompose business logic into services and design patterns such as the service pattern and strategy pattern. This facilitates horizontal scalability, as each component can be scaled independently.
