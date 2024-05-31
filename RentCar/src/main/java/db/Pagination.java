package db;

import lombok.Data;

@Data
public class Pagination {
    private int count;
    private int currentPage;
    private int pageSize;
    private int pageBlock;

    private int number;
    private int startRow;
    private int endRow;

    private int pageCount;
    private int startPage;
    private int endPage;
    private int previousPage;
    private int nextPage;

    public Pagination(int count, int currentPage, int pageSize, int pageBlock) {
        this.count = count;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.pageBlock = pageBlock;

        this.startRow = (this.currentPage - 1) * pageSize + 1;
        this.endRow = this.currentPage * pageSize;
        this.number = this.count - (this.currentPage - 1) * pageSize;
        if (this.count > 0) {
            this.pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
        }

        if (currentPage % pageBlock != 0) {
            this.startPage = (int)(currentPage / pageBlock) * pageBlock + 1;
        } else {
            this.startPage = ((int)(currentPage / pageBlock) - 1) * pageBlock + 1;
        }
        this.endPage = this.startPage + pageBlock - 1;

        if (this.endPage > this.pageCount) {
            this.endPage = this.pageCount;
        }
        if (this.startPage > pageBlock) {
            this.previousPage = this.startPage - pageBlock;
        }
        if (this.endPage < this.pageCount) {
            this.nextPage = this.startPage + pageBlock;
        }
    }
}
