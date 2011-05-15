package com.ug.util;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.ug.domain.Department;
import com.ug.domain.Grantneededfor;
import com.ug.domain.Programstudy;
import com.ug.domain.State;
import com.ug.domain.University;

public class LoadFirstTimeData {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		loadSates("C:/ug/xml/univ.xml");
		// loadUniversities("C:/ug/xml/univ.xml");
		// loadDepartment("C:/ug/xml/department.xml");
		// loadProgramStrudy("C:/ug/xml/studyprogram.xml");

	}

	public static Document parseXmlFile(String fileLocation) {
		// get the factory
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		Document dom = null;
		try {
			// Using factory get an instance of document builder
			DocumentBuilder db = dbf.newDocumentBuilder();

			// parse using builder to get DOM representation of the XML file
			dom = db.parse(fileLocation);

		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (SAXException se) {
			se.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}

		return dom;

	}

	public static void loadDepartment(String fileName) {
		// get the root element
		Document docEle = parseXmlFile(fileName);

		// get a nodelist of elements
		NodeList nl = docEle.getElementsByTagName("department");
		if (nl != null && nl.getLength() > 0) {
			for (int i = 0; i < nl.getLength(); i++) {

				// get the employee element
				Element el = (Element) nl.item(i);

				// get the Employee object
				Department e = getDepartment(el);

				e.persist();
			}
		}
	}

	private static Department getDepartment(Element el) {
		Department dept = new Department();
		String deptName = el.getAttribute("name");
		dept.setDepartmentName(deptName);
		dept.setDepartmentDescription(deptName);

		return dept;
	}

	public static void loadProgramStrudy(String fileName) {
		// get the root element
		Document docEle = parseXmlFile(fileName);

		// get a nodelist of elements
		NodeList nl = docEle.getElementsByTagName("program");
		if (nl != null && nl.getLength() > 0) {
			for (int i = 0; i < nl.getLength(); i++) {

				// get the employee element
				Element el = (Element) nl.item(i);

				// get the Employee object
				Programstudy e = getProgramStudy(el);

				e.persist();
			}
		}
	}

	private static Programstudy getProgramStudy(Element el) {
		Programstudy dept = new Programstudy();
		String deptName = el.getAttribute("name");
		dept.setProgramStudyName(deptName);
		dept.setProgramStudyDescription(deptName);
		return dept;
	}

	public static void loadSates(String fileName) {
		// get the root element
		Document docEle = parseXmlFile(fileName);

		// get a nodelist of elements
		NodeList nl = docEle.getElementsByTagName("state");
		if (nl != null && nl.getLength() > 0) {
			for (int i = 0; i < nl.getLength(); i++) {

				// get the employee element
				Element el = (Element) nl.item(i);

				// get the Employee object
				State e = getStates(el);

				e.persist();
			}
		}
	}

	private static State getStates(Element el) {
		State dept = new State();
		String deptName = el.getAttribute("name");
		dept.setStateName(deptName);
		dept.setStateDescription(deptName);
		return dept;
	}

	public static void loadUniversities(String fileName) {
		// get the root element
		Document docEle = parseXmlFile(fileName);

		// get a nodelist of elements
		NodeList nl = docEle.getElementsByTagName("university");
		if (nl != null && nl.getLength() > 0) {
			for (int i = 0; i < nl.getLength(); i++) {

				// get the employee element
				Element el = (Element) nl.item(i);

				// get the Employee object
				University e = getUniversity(el);

				e.persist();
			}
		}
	}

	private static University getUniversity(Element el) {
		University dept = new University();
		String deptName = el.getAttribute("name");
		dept.setUniversityName(deptName);
		return dept;
	}
	
	public static void loadLoanNeeds(String fileName) {
		// get the root element
		Document docEle = parseXmlFile(fileName);

		// get a nodelist of elements
		NodeList nl = docEle.getElementsByTagName("request");
		if (nl != null && nl.getLength() > 0) {
			for (int i = 0; i < nl.getLength(); i++) {

				// get the employee element
				Element el = (Element) nl.item(i);

				// get the Employee object
				Grantneededfor e = getLoanNeeds(el);

				e.persist();
			}
		}
	}

	private static Grantneededfor getLoanNeeds(Element el) {
		Grantneededfor dept = new Grantneededfor();
		String deptName = el.getAttribute("name");
		dept.setGrantNeed(deptName);
		dept.setGrantNeedDescription(deptName);
		return dept;
	}

}