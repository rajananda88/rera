package in.gov.rera.transaction.projectregistration.model;

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

@Entity(name = "DevelopmentDetailsModel")
@Table(name = "TL_DEVELOPMENT_DETAILS")
public class DevelopmentDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DEV_ID")
	private Long devId;

	

	@Column(name = "TYPE_OF_INVENTORY", length = 100)
	private String typeOfInventory;
	
	@OneToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name = "DEV_STATUS_ID")
	private DevelopmentStatus currentStatus;
	
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	private List<DevelopmentStatus> developmentStatusList;
	
	
	
	@Column(name = "NO_OF_INVENTORY")
	private Integer noOfInventory;

	// Changes as on 7/7/17
	//....1
	@Column(name = "PROPOSED_FAR")
	private Double proposedFar; 
	@Column(name = "SANCTIONED_FAR")
	private Double sanctionedFar;
	@Column(name = "PROPOSED_BLDG_NO")
	private Integer proposedBldgNo;
	@Column(name = "SANCTIONED_BLDG_NO")
	private Integer sanctionedBldgNo;
	@Column(name = "PROPOSED_FLOORS")
	private Integer proposedFloors;
	@Column(name = "SANCTIONED_FLOORS")
	private Integer sanctionedFloors;
	@Column(name = "RECREATIONAL_OPEN_SPACE")
	private Double recreationalOpenSpace;
	@Column(name = "ARCH_DESIGN_STANDARD", length = 50)
	private String archDesignStandard;
	@Column(name = "TYPE_OF_CONSTRUCTION_TECH", length = 50)
	private String typeOfConstruction;
	@Column(name = "EARTHQUAKE_RESISTANT_MEASURES", length = 50)
	private String earthquakeResistant;
	
	//
	
	@Column(name = "CARPETAREA")
	private Double carpetArea;

	
	
	
	
	
	public DevelopmentStatus getCurrentStatus() {
		return currentStatus;
	}

	public void setCurrentStatus(DevelopmentStatus currentStatus) {
		this.currentStatus = currentStatus;
	}

	public List<DevelopmentStatus> getDevelopmentStatusList() {
		return developmentStatusList;
	}

	public void setDevelopmentStatusList(
			List<DevelopmentStatus> developmentStatusList) {
		this.developmentStatusList = developmentStatusList;
	}

	public Long getDevId() {
		return devId;
	}

	public void setDevId(Long devId) {
		this.devId = devId;
	}

	public String getTypeOfInventory() {
		return typeOfInventory;
	}

	public void setTypeOfInventory(String typeOfInventory) {
		this.typeOfInventory = typeOfInventory;
	}


	public Integer getNoOfInventory() {
		return noOfInventory;
	}

	public void setNoOfInventory(Integer noOfInventory) {
		this.noOfInventory = noOfInventory;
	}
	public Double getProposedFar() {
		return proposedFar;
	}

	public void setProposedFar(Double proposedFar) {
		this.proposedFar = proposedFar;
	}

	public Double getSanctionedFar() {
		return sanctionedFar;
	}

	public void setSanctionedFar(Double sanctionedFar) {
		this.sanctionedFar = sanctionedFar;
	}

	public Integer getProposedBldgNo() {
		return proposedBldgNo;
	}

	public void setProposedBldgNo(Integer proposedBldgNo) {
		this.proposedBldgNo = proposedBldgNo;
	}

	public Integer getSanctionedBldgNo() {
		return sanctionedBldgNo;
	}

	public void setSanctionedBldgNo(Integer sanctionedBldgNo) {
		this.sanctionedBldgNo = sanctionedBldgNo;
	}

	public Integer getProposedFloors() {
		return proposedFloors;
	}

	public void setProposedFloors(Integer proposedFloors) {
		this.proposedFloors = proposedFloors;
	}

	public Integer getSanctionedFloors() {
		return sanctionedFloors;
	}

	public void setSanctionedFloors(Integer sanctionedFloors) {
		this.sanctionedFloors = sanctionedFloors;
	}

	public Double getRecreationalOpenSpace() {
		return recreationalOpenSpace;
	}

	public void setRecreationalOpenSpace(Double recreationalOpenSpace) {
		this.recreationalOpenSpace = recreationalOpenSpace;
	}

	public String getArchDesignStandard() {
		return archDesignStandard;
	}

	public void setArchDesignStandard(String archDesignStandard) {
		this.archDesignStandard = archDesignStandard;
	}

	public String getTypeOfConstruction() {
		return typeOfConstruction;
	}

	public void setTypeOfConstruction(String typeOfConstruction) {
		this.typeOfConstruction = typeOfConstruction;
	}

	public String getEarthquakeResistant() {
		return earthquakeResistant;
	}

	public void setEarthquakeResistant(String earthquakeResistant) {
		this.earthquakeResistant = earthquakeResistant;
	}
	
	public Double getCarpetArea() {
		return carpetArea;
	}

	public void setCarpetArea(Double carpetArea) {
		this.carpetArea = carpetArea;
	}

	public Double getAreaOfExclusive() {
		return areaOfExclusive;
	}

	public void setAreaOfExclusive(Double areaOfExclusive) {
		this.areaOfExclusive = areaOfExclusive;
	}

	public Double getAreaOfExclusiveOpenTerrace() {
		return areaOfExclusiveOpenTerrace;
	}

	public void setAreaOfExclusiveOpenTerrace(Double areaOfExclusiveOpenTerrace) {
		this.areaOfExclusiveOpenTerrace = areaOfExclusiveOpenTerrace;
	}

	@Column(name = "ARE_OF_EXCLUSIVE")
	private Double areaOfExclusive;

	@Column(name = "ARE_OF_EXCLUSIVE_OPEN_TERRACE")
	private Double areaOfExclusiveOpenTerrace;

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((devId == null) ? 0 : devId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)	
			return false;
		if (getClass() != obj.getClass())
			return false;
		DevelopmentDetailsModel other = (DevelopmentDetailsModel) obj;
		if (devId == null) {
			if (other.devId != null)
				return false;
		} else if (!devId.equals(other.devId))
			return false;
		return true;
	}
	

}
