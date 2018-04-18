package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;

import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "ProjectDetailsModel")
@Table(name = "TL_PROJECT_DETAILS")
public class ProjectDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PROJECT_DELS_ID")
	private Long projectDetailsId;

	@Column(name = "PROJECT_NAME", length = 100)
	private String projectName;

	@Column(name = "PROJECT_DESC", length = 400)
	private String projectDescription;

	@Column(name = "PROJECT_TYPE")
	private String projectType;

	@Column(name = "PROJECT_STATUS")
	private String projectStatus;

	@Column(name = "TOTAL_LAND_AREA")
	private Double totalAreaOfLand;

	@Column(name = "TOTAL_OPEN_AREA")
	private Double totalOpenArea;

	@Column(name = "TOTAL_COVERED_AREA")
	private Double totalCoverdArea;

	
	
	@Column(name = "START_DATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar  startDate;

	@Column(name = "COMPLETION_DATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar  completionDate;

	// Changes done on 7/7/17
	
	@Column(name = "KHESRA_NO")
	private Double khesraNo;

	@Column(name = "LATITUDE_END_POINT")
	private Double latitudeEndPt;

	
	@Column(name = "LONGITUDE_END_POINT")
	private Double longitudeEndPt;
	//
	@Column(name = "NO_OF_GARAGE_FOR_SALE")
	private Double noOfGarageForSale;

	@Column(name = "AREA_OF_GARAGE_FOR_SALE")
	private Double areaOfGarageForSale;

	@ManyToOne
	@JoinColumn(name = "SUB_DISTRICT_ID")
	private SubDistrictModel subDistrictModel;
	
	
	@ManyToOne
	@JoinColumn(name = "DISTRICT_ID")
	private DistrictModel districtModel;
	
	
	@OneToOne
	@JoinColumn(name = "COMPELETION_CERT_DOC_ID")
	private Document compeletionCertDoc;

	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	private List<ProjectStatusModel> statusList;
	 
	 @Column(name = "REASON_FOR_DELAYED")
	 private String reasonForDelayed;
	
		@Column(name = "NO_OF_MONTHS_DELAYED")
		  private Integer noOfMonthDelayed=new Integer(0);
			@Column(name = "GARAGE_SOLDOUT" )
		  private Integer garageSoldout =new Integer(0);;
			@Column(name = "PARKING_SOLDOUT")
		  private Integer parkingSoldout =new Integer(0);;
			
	@Column(name="LAST_UPDATED_ON")
	private Calendar updatedOn;		
	
	public String getReasonForDelayed() {
		return reasonForDelayed;
	}

	public void setReasonForDelayed(String reasonForDelayed) {
		this.reasonForDelayed = reasonForDelayed;
	}

	public Calendar getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Calendar updatedOn) {
		this.updatedOn = updatedOn;
	}

	public Document getCompeletionCertDoc() {
				return compeletionCertDoc;
			}

			public void setCompeletionCertDoc(Document compeletionCertDoc) {
				this.compeletionCertDoc = compeletionCertDoc;
			}

			public List<ProjectStatusModel> getStatusList() {
				return statusList;
			}

			public void setStatusList(List<ProjectStatusModel> statusList) {
				this.statusList = statusList;
			}

			public int getNoOfMonthDelayed() {
			    if(this.noOfMonthDelayed==null)
			    	return 0;
			    
				return noOfMonthDelayed;
			}

			public void setNoOfMonthDelayed(int noOfMonthDelayed) {
				this.noOfMonthDelayed = noOfMonthDelayed;
			}

			public int getGarageSoldout() {
				if(this.garageSoldout==null)
					return 0;
				
				return garageSoldout;
			}

			public void setGarageSoldout(int garageSoldout) {
				this.garageSoldout = garageSoldout;
			}

			public int getParkingSoldout() {
				
				if(this.parkingSoldout==null)
					return 0;
				
				return parkingSoldout;
			}

			public void setParkingSoldout(int parkingSoldout) {
			this.parkingSoldout = parkingSoldout;
			}

	public Calendar  getStartDate() {
		return startDate;
	}

	public void setStartDate(Calendar  startDate) {
		this.startDate = startDate;
	}

	public Calendar  getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Calendar  completionDate) {
		this.completionDate = completionDate;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public Double getTotalAreaOfLand() {
		return totalAreaOfLand;
	}

	public void setTotalAreaOfLand(Double totalAreaOfLand) {
		this.totalAreaOfLand = totalAreaOfLand;
	}

	public Double getTotalOpenArea() {
		return totalOpenArea;
	}

	public void setTotalOpenArea(Double totalOpenArea) {
		this.totalOpenArea = totalOpenArea;
	}

	public Double getTotalCoverdArea() {
		return totalCoverdArea;
	}

	public void setTotalCoverdArea(Double totalCoverdArea) {
		this.totalCoverdArea = totalCoverdArea;
	}
	

	public Double getKhesraNo() {
		return khesraNo;
	}
	public void setKhesraNo(Double khesraNo) {
		this.khesraNo = khesraNo;
	}

	public Double getLatitudeEndPt() {
		return latitudeEndPt;
	}

	public void setLatitudeEndPt(Double latitudeEndPt) {
		this.latitudeEndPt = latitudeEndPt;
	}

	public Double getLongitudeEndPt() {
		return longitudeEndPt;
	}

	public void setLongitudeEndPt(Double longitudeEndPt) {
		this.longitudeEndPt = longitudeEndPt;
	}
	public Double getNoOfGarageForSale() {
		return noOfGarageForSale;
	}

	public void setNoOfGarageForSale(Double noOfGarageForSale) {
		this.noOfGarageForSale = noOfGarageForSale;
	}

	public Double getAreaOfGarageForSale() {
		return areaOfGarageForSale;
	}

	public void setAreaOfGarageForSale(Double areaOfGarageForSale) {
		this.areaOfGarageForSale = areaOfGarageForSale;
	}

	public Double getNoOfParkinfForSale() {
		return noOfParkinfForSale;
	}

	public void setNoOfParkinfForSale(Double noOfParkinfForSale) {
		this.noOfParkinfForSale = noOfParkinfForSale;
	}

	public Double getAreaOfParkinfForSale() {
		return areaOfParkinfForSale;
	}

	public void setAreaOfParkinfForSale(Double areaOfParkinfForSale) {
		this.areaOfParkinfForSale = areaOfParkinfForSale;
	}

	

	public SubDistrictModel getSubDistrictModel() {
		return subDistrictModel;
	}

	public void setSubDistrictModel(SubDistrictModel subDistrict) {
		this.subDistrictModel = subDistrict;
	}

	@Column(name = "NO_OF_PARKING_FOR_SALE")
	private Double noOfParkinfForSale;

	@Column(name = "AREA_OF_PARKING_FOR_SALE")
	private Double areaOfParkinfForSale;

	@Column(name = "ADDRESS_LINE_1")
	private String addressLine1;

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	@Column(name = "ADDRESS_LINE_2")
	private String addressLine2;


	public Long getProjectDetailsId() {
		return projectDetailsId;
	}

	public void setProjectDetailsId(Long projectDetailsId) {
		this.projectDetailsId = projectDetailsId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	
  @Override
  public String toString(){
	return startDate.toString();
	  
  }
  
  

	public DistrictModel getDistrictModel() {
	return districtModel;
}

public void setDistrictModel(DistrictModel district) {
	this.districtModel = district;
}

	public void populateModel(ProjectDetailsModel model){
		this.addressLine1=model.getAddressLine1();
		this.addressLine2=model.getAddressLine2();
		this.areaOfGarageForSale=model.getNoOfGarageForSale();

		
		
		
		this.projectName = model.getProjectName();
		this.projectDescription = model.getProjectDescription();
		this.projectType = model.getProjectType();
		
		this.projectStatus = model.getProjectStatus();
		this.totalAreaOfLand = model.getTotalAreaOfLand();
		this.totalOpenArea = model.getTotalOpenArea();
		this.totalCoverdArea = model.getTotalCoverdArea();
		this.startDate = model.getStartDate();
		this.completionDate = model.getCompletionDate();
		
		this.areaOfGarageForSale = model.getAreaOfGarageForSale();
		this.noOfParkinfForSale = model.getNoOfParkinfForSale();;
		this.areaOfParkinfForSale = model.getAreaOfParkinfForSale();;
		
		this.noOfMonthDelayed=model.getNoOfMonthDelayed();
		this.reasonForDelayed=model.getReasonForDelayed();
		this.khesraNo=model.getKhesraNo();
		this.latitudeEndPt=model.getLatitudeEndPt();
		this.longitudeEndPt=model.getLongitudeEndPt();
	}

}
