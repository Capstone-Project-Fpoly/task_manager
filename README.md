# Task Manager

## Quy Tắc Viết Code

### 1. Tuân Thủ Quy Ước Về Tên

- **Biến và Hàm:** Sử dụng camelCase cho biến và hàm (ví dụ: `myVariable`, `calculateTotal()`).
- **Lớp và Đối Tượng:** Sử dụng PascalCase cho tên lớp và đối tượng (ví dụ: `MyClass`, `MyObject`).

### 2. Tổ Chức Mã Nguồn

- **Tổ Chức Thư Mục:** Tổ chức thư mục một cách có tổ chức và dễ đọc.
- **Module và Components:** Tách code thành các module và components để tăng sự tái sử dụng và dễ duy trì.
- **Tóm Lược Code:** Sử dụng comment để mô tả các đoạn mã quan trọng.
- **Làm đẹp code:** Chạy lệnh `npm run dart:format_fix` trước khi đẩy code lên github

### 3. Xử Lý Ngoại Lệ

- **Bắt và Xử Lý Ngoại Lệ Đầy Đủ:** Bảo đảm rằng mọi ngoại lệ đều được bắt và xử lý một cách đầy đủ để tránh lỗi không mong muốn.

### 4. Sử Dụng ES6/ES7

- **Sử Dụng Arrow Functions:** Sử dụng arrow functions khi có thể để giảm sự phức tạp của đoạn mã.

### 5. Đặt Chú Ý Đến Hiệu Năng

- **Tối Ưu Hóa Truy Vấn:** Tránh các truy vấn không hiệu quả, và sử dụng chỉ cần thiết các trường trong truy vấn GraphQL.

### 6. Hạn Chế Lồng If vào Nhau

- **Hạn Chế Lồng If vào Nhau:** Tránh lồng quá nhiều câu lệnh `if` vào nhau để giảm sự phức tạp và làm cho code dễ đọc hơn.
- **Sử Dụng Early Return:** Khi có thể, sử dụng cách trả về sớm để tránh lồng quá nhiều lệnh `if`. Ví dụ:
    ```javascript
    if (!<trường hợp sai>) {
      return;
    }
    // Xử lý cho trường hợp đúng
    ```
  
### 7. Quy tắc git

- Các tính năng mới nên được phát triển trong một nhánh riêng và sau đó tạo một yêu cầu kéo (pull request) để hợp nhất nó vào nhánh main.
- Yêu cầu kéo nên được xem xét bởi ít nhất một người khác trước khi hợp nhất vào nhánh main.
- Quy ước đặt tên cho branch là feature/<feature-name> hoặc viết tắt feat/<feature-name>. Đối với sửa lỗi bug, sử dụng fix/<bug-name> hoặc hotfix/<bug-name>.
- Thông điệp commit nên mô tả các thay đổi trong commit. Đừng viết commit mà không mô tả các thay đổi. Ví dụ, fix bug không phải là một thông điệp commit tốt. Thay vào đó, hãy viết fix: <bug-name>.
- Giữ thông điệp commit ngắn gọn và súc tích. Nếu bạn cần viết một thông điệp commit dài, hãy viết trong phần mô tả của yêu cầu kéo thay vì trong thông điệp commit.

## Cài Đặt Dự Án Trước Khi Chạy
1. Thêm 1 file .env vào thư mục gốc của dự án và sau đó chạy lệnh `npm run build:runner`. Nếu xảy ra lỗi hãy chạy lệnh `npm run build_runner:clean` rồi chạy lại lệnh `npm run build:runner`
2. Cài đặt các thư viện sử dụng lệnh `npm install`. Sau đó bạn chạy `npm run graphql:codegen`
