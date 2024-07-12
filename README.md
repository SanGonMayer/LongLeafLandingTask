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

3. **Install ruby-build**:
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

1. **Clone the repository:**
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
