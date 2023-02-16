import { getData } from '@/api/get';
import create from 'zustand';

const useProductBrandStore = create((set, get) => ({
  productBrand: [],
  error: null,
  fetchAllProductBrand: async () => {
    if (get().productBrand.length) return;
    try {
      const response = await getData('productBrand');
      set({
        productBrand: response.data.data,
        error: null,
      });
    } catch (error) {
      set((state) => ({
        ...state,
        error: error.message,
      }));
    }
  },
  getProductBrandById: (productBrandId) => {
    return get().productType.filter(({ id }) => id === productTypeId)[0];
  },
}));

useProductBrandStore.subscribe(console.log);

export default useProductBrandStore;

