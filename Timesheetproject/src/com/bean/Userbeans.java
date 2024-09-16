package com.bean;

public class Userbeans
{
	private int id;
	private String Name;
	private String password;
	private String mobileno;
	private String role;
	private int superemp;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return Name;
	}

	public void setName(String name)
	{
		Name = name;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getMobileno()
	{
		return mobileno;
	}

	public void setMobileno(String mobileno)
	{
		this.mobileno = mobileno;
	}

	public String getRole()
	{
		return role;
	}

	public void setRole(String role)
	{
		this.role = role;
	}

	public int getSuperemp()
	{
		return superemp;
	}

	public void setSuperemp(int superemp)
	{
		this.superemp = superemp;
	}

	/*
	 * @Override public String toString() { return id+" : "+Name+" : "+role; }
	 */
}
