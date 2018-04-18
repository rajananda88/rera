package com.reraapp.master.stateut.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "StateUtModel")
@Table(name = "TM_STATE_UT")
public class StateUtModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "STATE_UT_ID")
	private Long stateUtId;

	public Long getStateUtId() {
		return stateUtId;
	}

	public void setStateUtId(Long stateUtId) {
		this.stateUtId = stateUtId;
	}

	public String getStateUtName() {
		return stateUtName;
	}

	public void setStateUtName(String stateUtName) {
		this.stateUtName = stateUtName;
	}

	@Column(name = "STATE_UT_NAME", length = 50)
	private String stateUtName;

}
