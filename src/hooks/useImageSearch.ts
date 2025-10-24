import { useEffect, useState } from 'react';
import axios from 'axios';
import { _documentSchema } from '@/types/typesenseResponse';

/**
 * Hook tìm ảnh bằng mô tả văn bản (Text-to-Image Search)
 */
export default function useImageSearchText(query: string) {
  const [results, setResults] = useState<_documentSchema[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.post(
          `${process.env.NEXT_PUBLIC_TYPESENSE_API_URL}/collections/DiffusionDB/documents/search`,
          {
            q: query,
            per_page: 25,
            query_by: 'prompt',
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
        console.error('Error fetching text search results', err);
      }
    };
    fetchData();
  }, [query]);

  return results;
}
