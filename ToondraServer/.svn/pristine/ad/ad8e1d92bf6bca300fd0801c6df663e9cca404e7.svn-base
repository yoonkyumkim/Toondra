package kr.co.toondra.base.property;

import java.io.File;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

public class BasePropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {

	/**
	 * get local server ip
	 * @return
	 */
	public String getLocalServerIp() {
		try {
			for (Enumeration<NetworkInterface> enNetIF = NetworkInterface.getNetworkInterfaces(); enNetIF.hasMoreElements(); ) {
				NetworkInterface netIF = enNetIF.nextElement();
				for (Enumeration<InetAddress> enInetAddr = netIF.getInetAddresses(); enInetAddr.hasMoreElements(); ) {
					InetAddress inetAddr = enInetAddr.nextElement();
					if (!inetAddr.isLoopbackAddress() && !inetAddr.isLinkLocalAddress() && inetAddr.getAddress().length == 4) {
						return inetAddr.getHostAddress();
					}
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * location setting
	 * @param location
	 */
	@Override
	public void setLocation(Resource location) {
		try {
			String fileDir = location.getFile().getParent();
			String fileName = location.getFilename();
			String newFileName = "";
			
			if (fileName.lastIndexOf(".") >= 0) {
				newFileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_" + getLocalServerIp() + fileName.substring(fileName.lastIndexOf("."));
			} else {
				newFileName = fileName + "_" + getLocalServerIp();
			}
			
			File newFile = new File(fileDir + System.getProperty("file.separator") + newFileName);
			if (newFile.exists()) {
				logger.info("load resource : " + newFile.getName());
				Resource resource = new FileSystemResource(newFile);
				super.setLocation(resource);
			} else {
				logger.info("load resource : " + location.getFilename());
				super.setLocation(location);
			}
		} catch (Exception e) {
			logger.debug("custom properties resource load fail");
			super.setLocation(location);
		}
	}
	
	/**
	 * location list setting
	 * @param locations
	 */
	@Override
	public void setLocations(Resource[] locations) {
		try {
			Resource[] newResource = new Resource[locations.length];
			for (int i=0; i<locations.length; i++) {
				String fileDir = locations[i].getFile().getParent();
				String fileName = locations[i].getFilename();
				String newFileName = "";
				
				if (fileName.lastIndexOf(".") >= 0) {
					newFileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_" + getLocalServerIp() + fileName.substring(fileName.lastIndexOf("."));
				} else {
					newFileName = fileName + "_" + getLocalServerIp();
				}
				
				File newFile = new File(fileDir + System.getProperty("file.separator") + newFileName);
				if (newFile.exists()) {
					//logger.info("load resource : " + newFile.getName());
					Resource resource = new FileSystemResource(newFile);
					newResource[i] = resource;
				} else {
					//logger.info("load resource : " + locations[i].getFilename());
					newResource[i] = locations[i];
				}
			}
			super.setLocations(newResource);
		} catch (Exception e) {
			logger.debug("custom properties resource list load fail");
			super.setLocations(locations);
		}
	}
	
	/**
	 * order setting
	 * @param order
	 */
	@Override
	public void setOrder(int order) {
		super.setOrder(order);
	}
}