package Helper;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class PaginationHelper<T> {

    private List<T> items;
    private int pageSize;

    public PaginationHelper() {
    }

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
    
    public void Pagination(HttpServletRequest request, List<T> list, ServletContext context, String itemsPerPage, String attribute){
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        int pageSize = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, itemsPerPage);
        PaginationHelper<T> paginationHelper = new PaginationHelper<>(list, pageSize);
        int[] pagenumber = paginationHelper.getPageNumbers();
        request.setAttribute("pagenumber", pagenumber);

        String pageStr = request.getParameter("page");
        int page = 0;

        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                page = Integer.parseInt(pageStr) - 1;
            } catch (NumberFormatException e) {
                page = 0; // default to first page if there's an error in parsing
            }
        }

        List<T> paginatedProductList = paginationHelper.getPage(page);
        request.setAttribute(attribute, paginatedProductList);
    }
}
