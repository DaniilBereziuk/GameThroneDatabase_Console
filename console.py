import mysql.connector
from mysql.connector import Error
from datetime import datetime

class ChairSalesConsole:
    def __init__(self):
        self.connection = None
        self.cursor = None
        
    def connect_database(self):
        """Connect to the MySQL database"""
        try:
            self.connection = mysql.connector.connect(
                host='127.0.0.1',
                database='gamethrone',
                user='root',
                password=''  # Змініть пароль якщо потрібно
            )
            
            if self.connection.is_connected():
                self.cursor = self.connection.cursor()
                print("Успішно підключено до бази даних 'gamethrone'\n")
                return True
        except Error as e:
            print(f"Помилка підключення: {e}\n")
            return False
    
    def close_connection(self):
        """Close database connection"""
        if self.connection and self.connection.is_connected():
            self.cursor.close()
            self.connection.close()
            print("\nЗ'єднання закрито")
    
    def show_menu(self):
        """Display main menu"""
        print("=" * 60)
        print("         СИСТЕМА УПРАВЛІННЯ ПРОДАЖАМИ КРІСЕЛ")
        print("=" * 60)
        print("1.  Показати всі продукти")
        print("2.  Показати всіх покупців")
        print("3.  Показати всі замовлення")
        print("4.  Показати продажі по країнам")
        print("5.  Показати продажі по категоріям")
        print("6.  Показати топ-продавців (співробітники)")
        print("7.  Показати топ-покупців")
        print("8.  Показати залишки на складі")
        print("9.  Показати загальну статистику продажів")
        print("10. Показати замовлення по статусу")
        print("11. Показати історію транзакцій")
        print("12. Показати постачальників")
        print("13. Пошук продукту за назвою")
        print("14. Пошук покупця за email")
        print("0.  Вийти")
        print("=" * 60)
    
    def show_all_products(self):
        """Display all products"""
        query = """
            SELECT p.product_id, p.product_name, c.category_name, 
                   p.price, p.stock_quantity, p.color, p.material
            FROM products p
            LEFT JOIN categories c ON p.category_id = c.category_id
            WHERE p.is_active = 1
            ORDER BY p.product_id
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 100)
        print("СПИСОК ВСІХ ПРОДУКТІВ")
        print("=" * 100)
        print(f"{'ID':<5} {'Назва':<40} {'Категорія':<20} {'Ціна':<10} {'Склад':<8} {'Колір':<15}")
        print("-" * 100)
        
        for row in results:
            print(f"{row[0]:<5} {row[1]:<40} {row[2]:<20} {row[3]:<10} {row[4]:<8} {row[5]:<15}")
        
        print("-" * 100)
        print(f"Всього продуктів: {len(results)}\n")
    
    def show_all_customers(self):
        """Display all customers"""
        query = """
            SELECT customer_id, first_name, last_name, email, 
                   phone, city, country
            FROM customers
            ORDER BY country, city
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 120)
        print("СПИСОК ВСІХ ПОКУПЦІВ")
        print("=" * 120)
        print(f"{'ID':<5} {'Ім\'я':<20} {'Email':<30} {'Телефон':<18} {'Місто':<15} {'Країна':<15}")
        print("-" * 120)
        
        for row in results:
            full_name = f"{row[1]} {row[2]}"
            print(f"{row[0]:<5} {full_name:<20} {row[3]:<30} {row[4]:<18} {row[5]:<15} {row[6]:<15}")
        
        print("-" * 120)
        print(f"Всього покупців: {len(results)}\n")
    
    def show_all_orders(self):
        """Display all orders"""
        query = """
            SELECT o.order_id, c.first_name, c.last_name, 
                   o.order_date, o.final_amount, o.payment_status, 
                   o.order_status, c.country
            FROM orders o
            JOIN customers c ON o.customer_id = c.customer_id
            ORDER BY o.order_date DESC
            LIMIT 20
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 120)
        print("ОСТАННІ 20 ЗАМОВЛЕНЬ")
        print("=" * 120)
        print(f"{'ID':<5} {'Покупець':<25} {'Дата':<20} {'Сума':<12} {'Оплата':<12} {'Статус':<15} {'Країна':<15}")
        print("-" * 120)
        
        for row in results:
            full_name = f"{row[1]} {row[2]}"
            order_date = row[3].strftime("%Y-%m-%d %H:%M")
            print(f"{row[0]:<5} {full_name:<25} {order_date:<20} {row[4]:<12.2f} {row[5]:<12} {row[6]:<15} {row[7]:<15}")
        
        print("-" * 120)
        print(f"Показано замовлень: {len(results)}\n")
    
    def show_sales_by_country(self):
        """Display sales statistics by country"""
        query = """
            SELECT c.country, 
                   COUNT(o.order_id) as total_orders,
                   SUM(o.final_amount) as total_revenue,
                   AVG(o.final_amount) as avg_order_value,
                   SUM(oi.quantity) as total_chairs_sold
            FROM orders o
            JOIN customers c ON o.customer_id = c.customer_id
            JOIN order_items oi ON o.order_id = oi.order_id
            WHERE o.payment_status = 'paid'
            GROUP BY c.country
            ORDER BY total_revenue DESC
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 100)
        print("ПРОДАЖІ ПО КРАЇНАМ")
        print("=" * 100)
        print(f"{'Країна':<20} {'Замовлень':<12} {'Виручка':<15} {'Сер. чек':<15} {'Крісел продано':<15}")
        print("-" * 100)
        
        for row in results:
            print(f"{row[0]:<20} {row[1]:<12} {row[2]:<15.2f} {row[3]:<15.2f} {row[4]:<15}")
        
        print("-" * 100)
        print(f"Всього країн: {len(results)}\n")
    
    def show_sales_by_category(self):
        """Display sales by product category"""
        query = """
            SELECT cat.category_name,
                   COUNT(DISTINCT oi.order_id) as orders_count,
                   SUM(oi.quantity) as units_sold,
                   SUM(oi.subtotal) as total_revenue
            FROM order_items oi
            JOIN products p ON oi.product_id = p.product_id
            JOIN categories cat ON p.category_id = cat.category_id
            JOIN orders o ON oi.order_id = o.order_id
            WHERE o.payment_status = 'paid'
            GROUP BY cat.category_name
            ORDER BY total_revenue DESC
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 90)
        print("ПРОДАЖІ ПО КАТЕГОРІЯМ")
        print("=" * 90)
        print(f"{'Категорія':<25} {'Замовлень':<15} {'Одиниць продано':<20} {'Виручка':<20}")
        print("-" * 90)
        
        for row in results:
            print(f"{row[0]:<25} {row[1]:<15} {row[2]:<20} {row[3]:<20.2f}")
        
        print("-" * 90)
        print(f"Всього категорій: {len(results)}\n")
    
    def show_top_employees(self):
        """Display top sales employees"""
        query = """
            SELECT e.first_name, e.last_name, e.position,
                   COUNT(se.order_id) as orders_count,
                   SUM(se.commission_amount) as total_commission
            FROM sales_employee se
            JOIN employees e ON se.employee_id = e.employee_id
            GROUP BY e.employee_id
            ORDER BY total_commission DESC
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 90)
        print("ТОП-ПРОДАВЦІ")
        print("=" * 90)
        print(f"{'Ім\'я':<30} {'Посада':<25} {'Замовлень':<15} {'Комісія':<15}")
        print("-" * 90)
        
        for row in results:
            full_name = f"{row[0]} {row[1]}"
            print(f"{full_name:<30} {row[2]:<25} {row[3]:<15} {row[4]:<15.2f}")
        
        print("-" * 90)
        print(f"Всього продавців: {len(results)}\n")
    
    def show_top_customers(self):
        """Display top customers"""
        query = """
            SELECT c.first_name, c.last_name, c.country, c.city,
                   COUNT(o.order_id) as orders_count,
                   SUM(o.final_amount) as total_spent
            FROM customers c
            JOIN orders o ON c.customer_id = o.customer_id
            WHERE o.payment_status = 'paid'
            GROUP BY c.customer_id
            ORDER BY total_spent DESC
            LIMIT 10
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 100)
        print("ТОП-10 ПОКУПЦІВ")
        print("=" * 100)
        print(f"{'Ім\'я':<30} {'Країна':<15} {'Місто':<15} {'Замовлень':<12} {'Витрачено':<15}")
        print("-" * 100)
        
        for row in results:
            full_name = f"{row[0]} {row[1]}"
            print(f"{full_name:<30} {row[2]:<15} {row[3]:<15} {row[4]:<12} {row[5]:<15.2f}")
        
        print("-" * 100)
        print(f"Показано топ-10 покупців\n")
    
    def show_stock_levels(self):
        """Display stock levels"""
        query = """
            SELECT p.product_name, c.category_name, p.stock_quantity, 
                   p.price, (p.stock_quantity * p.price) as stock_value
            FROM products p
            JOIN categories c ON p.category_id = c.category_id
            WHERE p.is_active = 1
            ORDER BY p.stock_quantity ASC
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 110)
        print("ЗАЛИШКИ НА СКЛАДІ")
        print("=" * 110)
        print(f"{'Назва продукту':<45} {'Категорія':<20} {'Кількість':<12} {'Ціна':<12} {'Вартість':<15}")
        print("-" * 110)
        
        total_value = 0
        for row in results:
            print(f"{row[0]:<45} {row[1]:<20} {row[2]:<12} {row[3]:<12.2f} {row[4]:<15.2f}")
            total_value += row[4]
        
        print("-" * 110)
        print(f"Загальна вартість складу: {total_value:.2f} грн\n")
    
    def show_sales_statistics(self):
        """Display overall sales statistics"""
        query_total = """
            SELECT 
                COUNT(DISTINCT order_id) as total_orders,
                SUM(final_amount) as total_revenue,
                AVG(final_amount) as avg_order_value
            FROM orders
            WHERE payment_status = 'paid'
        """
        
        query_items = """
            SELECT SUM(oi.quantity) as total_chairs_sold
            FROM order_items oi
            JOIN orders o ON oi.order_id = o.order_id
            WHERE o.payment_status = 'paid'
        """
        
        query_pending = """
            SELECT COUNT(*) as pending_orders,
                   SUM(final_amount) as pending_revenue
            FROM orders
            WHERE payment_status = 'pending'
        """
        
        self.cursor.execute(query_total)
        total_stats = self.cursor.fetchone()
        
        self.cursor.execute(query_items)
        items_stats = self.cursor.fetchone()
        
        self.cursor.execute(query_pending)
        pending_stats = self.cursor.fetchone()
        
        print("\n" + "=" * 70)
        print("ЗАГАЛЬНА СТАТИСТИКА ПРОДАЖІВ")
        print("=" * 70)
        print(f"Всього оплачених замовлень: {total_stats[0]}")
        print(f"Загальна виручка: {total_stats[1]:.2f} грн")
        print(f"Середній чек: {total_stats[2]:.2f} грн")
        print(f"Всього продано крісел: {items_stats[0]}")
        print("-" * 70)
        print(f"Очікують оплати: {pending_stats[0]} замовлень")
        print(f"Очікувана виручка: {pending_stats[1]:.2f} грн")
        print("=" * 70 + "\n")
    
    def show_orders_by_status(self):
        """Display orders grouped by status"""
        query = """
            SELECT order_status, 
                   COUNT(*) as count,
                   SUM(final_amount) as total_amount
            FROM orders
            GROUP BY order_status
            ORDER BY count DESC
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 70)
        print("ЗАМОВЛЕННЯ ПО СТАТУСУ")
        print("=" * 70)
        print(f"{'Статус':<20} {'Кількість':<15} {'Загальна сума':<20}")
        print("-" * 70)
        
        for row in results:
            print(f"{row[0]:<20} {row[1]:<15} {row[2]:<20.2f}")
        
        print("=" * 70 + "\n")
    
    def show_inventory_transactions(self):
        """Display inventory transaction history"""
        query = """
            SELECT it.transaction_id, p.product_name, it.transaction_type,
                   it.quantity, it.transaction_date, it.notes
            FROM inventory_transactions it
            JOIN products p ON it.product_id = p.product_id
            ORDER BY it.transaction_date DESC
            LIMIT 20
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 120)
        print("ІСТОРІЯ ТРАНЗАКЦІЙ (ОСТАННІ 20)")
        print("=" * 120)
        print(f"{'ID':<5} {'Продукт':<40} {'Тип':<12} {'Кількість':<12} {'Дата':<20} {'Примітки':<30}")
        print("-" * 120)
        
        for row in results:
            trans_date = row[4].strftime("%Y-%m-%d %H:%M")
            notes = row[5][:30] if row[5] else ""
            print(f"{row[0]:<5} {row[1]:<40} {row[2]:<12} {row[3]:<12} {trans_date:<20} {notes:<30}")
        
        print("=" * 120 + "\n")
    
    def show_suppliers(self):
        """Display all suppliers"""
        query = """
            SELECT supplier_id, supplier_name, contact_person, 
                   email, phone, city, country
            FROM suppliers
        """
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        print("\n" + "=" * 110)
        print("СПИСОК ПОСТАЧАЛЬНИКІВ")
        print("=" * 110)
        print(f"{'ID':<5} {'Назва':<30} {'Контакт':<20} {'Email':<25} {'Місто':<15} {'Країна':<15}")
        print("-" * 110)
        
        for row in results:
            print(f"{row[0]:<5} {row[1]:<30} {row[2]:<20} {row[3]:<25} {row[5]:<15} {row[6]:<15}")
        
        print("=" * 110 + "\n")
    
    def search_product_by_name(self):
        """Search for products by name"""
        search_term = input("\nВведіть назву продукту для пошуку: ").strip()
        
        query = """
            SELECT p.product_id, p.product_name, c.category_name, 
                   p.price, p.stock_quantity, p.color
            FROM products p
            LEFT JOIN categories c ON p.category_id = c.category_id
            WHERE p.product_name LIKE %s AND p.is_active = 1
            ORDER BY p.product_name
        """
        self.cursor.execute(query, (f'%{search_term}%',))
        results = self.cursor.fetchall()
        
        if results:
            print("\n" + "=" * 100)
            print(f"РЕЗУЛЬТАТИ ПОШУКУ ДЛЯ: '{search_term}'")
            print("=" * 100)
            print(f"{'ID':<5} {'Назва':<45} {'Категорія':<20} {'Ціна':<10} {'Склад':<10}")
            print("-" * 100)
            
            for row in results:
                print(f"{row[0]:<5} {row[1]:<45} {row[2]:<20} {row[3]:<10.2f} {row[4]:<10}")
            
            print("-" * 100)
            print(f"Знайдено: {len(results)} продуктів\n")
        else:
            print(f"\nПродуктів з назвою '{search_term}' не знайдено\n")
    
    def search_customer_by_email(self):
        """Search for customer by email"""
        email = input("\nВведіть email покупця: ").strip()
        
        query = """
            SELECT c.customer_id, c.first_name, c.last_name, c.email,
                   c.phone, c.city, c.country,
                   COUNT(o.order_id) as orders_count,
                   COALESCE(SUM(o.final_amount), 0) as total_spent
            FROM customers c
            LEFT JOIN orders o ON c.customer_id = o.customer_id 
                              AND o.payment_status = 'paid'
            WHERE c.email LIKE %s
            GROUP BY c.customer_id
        """
        self.cursor.execute(query, (f'%{email}%',))
        results = self.cursor.fetchall()
        
        if results:
            print("\n" + "=" * 100)
            print(f"РЕЗУЛЬТАТИ ПОШУКУ ДЛЯ EMAIL: '{email}'")
            print("=" * 100)
            
            for row in results:
                print(f"ID покупця: {row[0]}")
                print(f"Ім'я: {row[1]} {row[2]}")
                print(f"Email: {row[3]}")
                print(f"Телефон: {row[4]}")
                print(f"Місто: {row[5]}, {row[6]}")
                print(f"Замовлень: {row[7]}")
                print(f"Витрачено: {row[8]:.2f} грн")
                print("-" * 100)
            
            print(f"Знайдено: {len(results)} покупців\n")
        else:
            print(f"\nПокупців з email '{email}' не знайдено\n")
    
    def run(self):
        """Main console loop"""
        if not self.connect_database():
            return
        
        while True:
            self.show_menu()
            choice = input("Виберіть опцію (0-14): ").strip()
            
            try:
                if choice == '1':
                    self.show_all_products()
                elif choice == '2':
                    self.show_all_customers()
                elif choice == '3':
                    self.show_all_orders()
                elif choice == '4':
                    self.show_sales_by_country()
                elif choice == '5':
                    self.show_sales_by_category()
                elif choice == '6':
                    self.show_top_employees()
                elif choice == '7':
                    self.show_top_customers()
                elif choice == '8':
                    self.show_stock_levels()
                elif choice == '9':
                    self.show_sales_statistics()
                elif choice == '10':
                    self.show_orders_by_status()
                elif choice == '11':
                    self.show_inventory_transactions()
                elif choice == '12':
                    self.show_suppliers()
                elif choice == '13':
                    self.search_product_by_name()
                elif choice == '14':
                    self.search_customer_by_email()
                elif choice == '0':
                    print("\nДякуємо за використання системи!")
                    break
                else:
                    print("\nНевірний вибір. Спробуйте ще раз.\n")
                
                input("Натисніть Enter для продовження...")
                print("\n" * 2)
                
            except Error as e:
                print(f"\nПомилка бази даних: {e}\n")
                input("Натисніть Enter для продовження...")
        
        self.close_connection()


if __name__ == "__main__":
    console = ChairSalesConsole()
    console.run()