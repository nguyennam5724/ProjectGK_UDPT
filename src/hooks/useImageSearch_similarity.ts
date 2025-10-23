import { useEffect, useState } from 'react';
import axios from 'axios';
import { _documentSchema } from '@/types/typesenseResponse';

/**
 * Hook tìm ảnh tương tự (Image Similarity Search)
 * bằng cách sử dụng vector embedding từ Typesense
 */
export default function useImageSearchSimilarity(imageId: string) {
  const [results, setResults] = useState<_documentSchema[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.post(
          `${process.env.NEXT_PUBLIC_TYPESENSE_API_URL}/collections/DiffusionDB/documents/search`,
          {
            q: '*',
            per_page: 25,
            vector_query: `embedding:([], id:${imageId}, distance_threshold: 0.8, k: 100)`,
            exclude_fields: ['embedding'],
          },
          {
            headers: {
              'X-TYPESENSE-API-KEY': process.env.NEXT_PUBLIC_TYPESENSE_API_KEY,
            },
          }
        );
        setResults(response.data.hits.map((h: any) => h.document));
      } catch (err) {
        console.error('Error fetching similarity results', err);
      }
    };
    fetchData();
  }, [imageId]);

  return results;
}
