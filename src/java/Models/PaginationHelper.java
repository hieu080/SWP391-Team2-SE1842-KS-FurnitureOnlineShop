package Models;

import java.util.ArrayList;
import java.util.List;

public class PaginationHelper<T> {

    private List<T> items;
    private int pageSize;

    public PaginationHelper(List<T> items, int pageSize) {
        this.items = items;
        this.pageSize = pageSize;
    }

    public List<T> getPage(int pageNumber) {
        int totalPages = getTotalPages();

        if (pageNumber < 0 || pageNumber >= totalPages) {
            return new ArrayList<>();
        }

        int fromIndex = pageNumber * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, items.size());

        return items.subList(fromIndex, toIndex);
    }

    public int getTotalPages() {
        return (int) Math.ceil((double) items.size() / pageSize);
    }

    public int[] getPageNumbers() {
        int totalPages = getTotalPages();
        int[] pageNumbers = new int[totalPages];
        for (int i = 0; i < totalPages; i++) {
            pageNumbers[i] = i + 1;
        }
        return pageNumbers;
    }
}
