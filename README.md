# Khung Báo Cáo LaTeX Chuẩn VNU-UET — Khai Phá Dữ Liệu (Multimodal RAG)

Bộ khung LaTeX được xây dựng theo đúng **quy chuẩn trình bày Báo cáo / Khóa luận tốt nghiệp của Trường Đại học Công nghệ – ĐHQGHN (VNU-UET)** kết hợp đầy đủ yêu cầu của môn học:
- **Trang bìa chuẩn VNU-UET:** Khung viền kép màu đen truyền thống, tiêu đề *ĐẠI HỌC QUỐC GIA HÀ NỘI / TRƯỜNG ĐẠI HỌC CÔNG NGHỆ*, logo vector chính thức của UET (`figures/UET_logo.pdf`), thông tin học phần, GVHD và bảng 3 thành viên.
- **Font & Cỡ chữ:** **Times New Roman** (Unicode, tự fallback sang TeX Gyre Termes nếu máy chưa cài sẵn Times New Roman), thân bài **13pt**, giãn dòng **1.3 lines**, thụt đầu dòng đoạn đầu **1.0cm** (`indentfirst`), khoảng cách đoạn **6pt**.
- **Căn lề chuẩn VNU-UET:** Lề trên `2.5cm`, lề dưới `3.0cm`, lề trái `3.0cm`, lề phải `2.0cm`.
- **Trình bày học thuật nghiêm túc:** Chương căn giữa in hoa đậm (`CHƯƠNG 1`), Mục lục / Danh mục hình vẽ / Danh mục bảng biểu / Danh mục từ viết tắt theo đúng thứ tự VNU-UET, đánh số trang La Mã phần đầu và Ả Rập từ Chương 1, liên kết ẩn màu đen chuẩn bản in (`hidelinks`), trích dẫn tự động chuẩn `IEEEtran` từ `references.bib`.
- **Hỗ trợ làm việc nhóm 3 người:**
  - Macro `\draftnote[TVx]{...}` hiển thị khung hướng dẫn viết nét đứt màu xanh nhạt; trước khi xuất PDF nộp bài chỉ cần đổi `\showdraftnotestrue` thành `\showdraftnotesfalse` trong `main.tex`.
  - Hai hộp học thuật trang nhã dùng cho nội dung chính: `\begin{keybox}{Tiêu đề}...\end{keybox}` và `\begin{examplebox}{Tiêu đề}...\end{examplebox}`.

---

## Cấu trúc thư mục và phân công 3 thành viên

| Đường dẫn | Vai trò | Người phụ trách |
| :--- | :--- | :--- |
| `main.tex`, `preamble.tex`, `latexmkrc` | Cấu hình chuẩn VNU-UET, ghép chương & biên dịch XeLaTeX | Điều phối (TV1) |
| `references.bib` | Danh mục BibTeX chuẩn (5 bài báo chính + baseline nền) | TV3 rà soát |
| `figures/UET_logo.pdf` | Logo vector chính thức của VNU-UET *(từ repo MIT `uet-graduation-latex`)* | Sẵn dùng |
| `figures/pipeline_overview.tex` | Sơ đồ TikZ đường ống 5 bài báo (Hình 1.1) | TV2 chuẩn hóa |
| `chapters/00_cover.tex` | Trang bìa chuẩn VNU-UET (điền GVHD, lớp, tên & MSSV nhóm) | TV1 |
| `chapters/00_allocation.tex` | Bảng phân công công việc 3 thành viên | Chung |
| `chapters/00_glossary.tex` | Bảng danh mục từ viết tắt & thuật ngữ chuẩn Anh–Việt | Chung |
| `chapters/01_introduction.tex` | Chương 1: Giới thiệu bài toán & chiến lược chọn bài | **TV1** |
| `chapters/02_background.tex` | Chương 2: Taxonomy & hướng tiếp cận nền tảng | **TV1** |
| `chapters/03_1_universalrag.tex` | Mục 3.1: Pre-Retrieval Routing (*UniversalRAG*) | **TV1** |
| `chapters/03_2_vision_doc_rag.tex` | Mục 3.2: Vision-space RAG (*ColPali* vs *VisRAG*) | **TV2** |
| `chapters/03_3_core_mmrag.tex` | Mục 3.3: Hòa giải xung đột (*CoRe-MMRAG*) | **TV3** |
| `chapters/03_4_integration.tex` | Mục 3.4: Bảng so sánh 4 bài & kiến trúc tích hợp | **TV3** |
| `chapters/04_experiments.tex` | Chương 4: Dữ liệu, độ đo, bảng số liệu & phản biện | **TV1 + TV2 + TV3** |
| `chapters/05_reproduction.tex` | Chương 5: Thực nghiệm kiểm chứng *(tùy chọn điểm cộng)* | Chung |
| `chapters/06_conclusion.tex` | Chương 6: Kết luận, xu hướng & khoảng trống nghiên cứu | **TV3** |

---

## Hướng dẫn biên dịch

### Cách 1: Dùng trên Overleaf (khuyên dùng cho nhóm 3 người)
1. Nén toàn bộ thư mục `KPDL` thành `.zip` → trên Overleaf chọn **New Project → Upload Project**.
2. Vào **Menu → Settings → Compiler**, chọn **`XeLaTeX`**.
3. Nhấn **Recompile**.

### Cách 2: Biên dịch cục bộ (MiKTeX / TeX Live)
```bash
latexmk -xelatex main.tex
```
hoặc:
```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

> **Lưu ý trước khi xuất bản nộp bài:** Nếu nhóm không làm Chương 5 (chạy lại code thực nghiệm), hãy comment dòng `\input{chapters/05_reproduction}` trong `main.tex`. Đổi `\showdraftnotestrue` thành `\showdraftnotesfalse` để ẩn toàn bộ hướng dẫn viết và kiểm tra số trang phần nội dung chính đạt **$\ge 30$ trang**.
