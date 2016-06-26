package com.weblog.util;

import java.io.File;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.TermVector;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Searcher;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;
import org.wltea.analyzer.lucene.IKSimilarity;

import com.weblog.domain.Article;
import com.weblog.domain.ArticleClass;
import com.weblog.service.ArticleService;
import com.weblog.service.impl.ArticleServiceImpl;

public class SearchUtil {
	/** 索引页面缓冲 */
	private int maxBufferedDocs = 500;

	private void createIndexDB(ResultSet rs) throws Exception {
		String searchDir = "E:\\Test\\Index";
		File indexFile = null;
		Directory directory = null;
		IndexWriter indexWriter = null;
		Analyzer analyzer = null;

		try {
			indexFile = new File(searchDir);
			if (!indexFile.exists()) {
				indexFile.mkdir();
			}
			directory = FSDirectory.open(indexFile);
			analyzer = new IKAnalyzer();

			indexWriter = new IndexWriter(directory, analyzer, true, IndexWriter.MaxFieldLength.UNLIMITED);
			indexWriter.setMaxBufferedDocs(maxBufferedDocs);
			Document doc = null;
			while (rs.next()) {
				doc = new Document();
				Field id = new Field("id", String.valueOf(rs.getInt("id")), Field.Store.YES, Field.Index.NOT_ANALYZED,
						TermVector.NO);
				Field username = new Field("username", rs.getString("username") == null ? "" : rs.getString("username"),
						Field.Store.YES, Field.Index.ANALYZED, TermVector.NO);
				doc.add(id);
				doc.add(username);
				indexWriter.addDocument(doc);
			}

			indexWriter.optimize();
			indexWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void createIndexBean(SearchBean bean) throws Exception {
		String searchDir = "E:\\Test\\Index";
		File indexFile = null;
		Directory directory = null;
		IndexWriter indexWriter = null;
		Analyzer analyzer = null;

		try {
//			indexFile = ;
//			if (!indexFile.exists()) {
//				indexFile.mkdir();
//			}
			directory = FSDirectory.open(new File(searchDir));
			analyzer = new IKAnalyzer();
			/*创建lucene索引
			 * directory是在磁盘 还是在内存上读取一个文件
			 * analyzer 是分词器
			 * create是否创建
			 * maxFieldLength 对每个Field限制建立分词索引的最大数目
			 */
			 
			indexWriter = new IndexWriter(directory, analyzer,IndexWriter.MaxFieldLength.LIMITED);
			indexWriter.setMaxBufferedDocs(maxBufferedDocs);
			Document doc = null;

			doc = new Document();
			/*
			 * field对象
			 * 名字
			 * 值
			 * 是否存储
			 * 是否分词
			 *  TermVector.NO不保存
			 */
			Field id = new Field("id", String.valueOf(bean.getId()), Field.Store.YES, Field.Index.NOT_ANALYZED);
			Field title = new Field("title", bean.getTitle() == null ? "" : bean.getTitle(), Field.Store.YES,
					Field.Index.ANALYZED);
			doc.add(id);
			doc.add(title);
			indexWriter.addDocument(doc);
			//合并cfs文本 
			//indexWriter.optimize();
			//设置合并因子，即满足3个cfs文本一合并
			//indexWriter.setMergeFactor(3);
			
			indexWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 搜索索引并将搜素到bean 存放在list集合中
	 * 
	 * @param queryStr
	 * @return
	 * @throws Exception
	 */
	public List<SearchBean> search(String queryStr) throws Exception {
		Searcher searcher = null;
		File indexFile = null;
		String searchDir = "E:\\Test\\Index";
		if (searcher == null) {
			indexFile = new File(searchDir);
			searcher = new IndexSearcher(FSDirectory.open(indexFile));
		}
		searcher.setSimilarity(new IKSimilarity());
		
		QueryParser parser = new QueryParser(Version.LUCENE_30, "title", new IKAnalyzer());
		Query query = parser.parse(queryStr);

		//查找符合条件的全部记录  用第二个参数限定
		TopDocs topDocs = searcher.search(query,searcher.maxDoc());
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
		List<SearchBean> listBean = new ArrayList<SearchBean>();
		SearchBean bean = null;

		for (int i = 0; i < scoreDocs.length; i++) {
			
			int docId = scoreDocs[i].doc;
			//根据编号去查找索引库原始记录表中的Document 对象
			Document doc = searcher.doc(docId);
			//转换为JavaBean
			bean = new SearchBean();
			bean.setId(Integer.parseInt(doc.get("id")));
			bean.setTitle(doc.get("title"));
			listBean.add(bean);
		}
		return listBean;
	}

//	public static void main(String[] args) {
//		
//     SearchUtil search = new SearchUtil();
//     SearchBean bean = new SearchBean();
//     List<Article> list;
//     ArticleService a = new ArticleServiceImpl();
//     list=a.findAll();
//     for(Article article:list){
//    	 bean.setId(article.getId());
//         bean.setTitle(article.getTitle());
//         try {
//        	search.createIndexBean(bean);
//        	System.out.println("添加");
//    	} catch (Exception e) {
//    		e.printStackTrace();
//    	}
//     }
//     
//     List<SearchBean> beanlist = null;
//	try {
//		beanlist = search.search("如何");
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//		for(SearchBean searchBean:beanlist){
//			System.out.println(searchBean.getId()+":"+searchBean.getTitle());
//		}
//     
//	}

}

