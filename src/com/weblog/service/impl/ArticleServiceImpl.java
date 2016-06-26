package com.weblog.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.wltea.analyzer.lucene.IKAnalyzer;
import org.wltea.analyzer.lucene.IKSimilarity;

import com.weblog.base.DaoSupportImpl;
import com.weblog.domain.Article;
import com.weblog.service.ArticleService;
import com.weblog.util.SearchBean;

@Service
@Transactional
public class ArticleServiceImpl extends DaoSupportImpl<Article> implements ArticleService {

	/** 索引页面缓冲 */
	private int maxBufferedDocs = 500;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findAllByUsername(String username) {
		return  getSession()
				.createQuery(//
						"FROM Article WHERE username = ?")//
				.setString(0, username)
				.list();
	}
	@SuppressWarnings("unchecked")
	public Article findAllByUsernameAndDate(String username,Date date) {
		return  (Article) getSession()
				.createQuery(//
						"FROM Article WHERE username = ?AND date=?")//
				.setString(0, username)
				.setDate(1, date)
				.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	public List<Article> findLatest() {
		return  getSession()
				.createQuery(//
						"FROM Article order by id desc LIMIT 5")//
				.setMaxResults(5)
				.list();
	}
	
	public void createIndexBean(Article article) throws Exception {
		SearchBean bean = new SearchBean();
		System.out.println("ArticleServiceImpl.createIndexBean()"+article.getId());
		bean.setId(article.getId());
		bean.setTitle(article.getTitle());
		
		
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

}
