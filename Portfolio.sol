// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Portfolio {
 struct Project{
    uint id;
    string name;
    string discription;
    string image;
    string githubLink;
 }
 struct Education{
    uint id;
    string date;
    string degree;
    string knowledgeAcquired;
    string instutionName;
 }
 Project[3] public projects;
 Education[3] public educationDetails;
uint projectCount;
uint educationCount;
address public manager;
string public myImage="QmXRZUMwdamvzEBXBJP7NGzE9DDjZMXQzZngggkjDV8jdy";
string public imageLink="QmcoxaqHeKBGEskYT9nkkBruXoBsYw6Scfn59vah4Rsq7t";
string public description="I am a student at uvpce";
string public resumeLink="QmUvw35BRan6Q9KGqGDCx5tXgnHsqf9WiKT8knrB2imiSF";
constructor(){
    manager=msg.sender;
}
  modifier onlyManger(){
    require(manager==msg.sender);
    _;
  }
    function insertProject(string calldata _name,string calldata _desctiption,string calldata _image,string calldata _githubLink) external{
        require(projectCount<3,"Only 3 project allowed");
    projects[projectCount]= Project(projectCount,_name,_desctiption,_image,_githubLink);
    projectCount++;
    }

    function changeProject(string calldata _name,string calldata _description,string calldata _image,string calldata _githubLink,uint _projectCount) external onlyManger{
    require(_projectCount>=0 && _projectCount<3,"Only 3 project allowed");
    projects[projectCount]= Project(_projectCount,_name,_description,_image,_githubLink);
    }

    function allProject() external view returns (Project[3] memory){
     return projects;   
    }

    // Funtion for Education
    
    function insertEducation(string calldata _date,string calldata _degree,string calldata _knowledgeAcquired,string calldata _instutionName) external onlyManger{
        require(educationCount<3,"Only 3 education allowed");
    educationDetails[educationCount]= Education(educationCount,_date,_degree,_knowledgeAcquired,_instutionName);
    educationCount++;
    }

    function changeEducation(string calldata _date,string calldata _degree,string calldata _knowledgeAcquired,string calldata _instutionName,uint _educationDetailCount) external onlyManger{
    require(_educationDetailCount>=0 && _educationDetailCount<3,"Only 3 Education allowed");
    educationDetails[_educationDetailCount]= Education(_educationDetailCount,_date,_degree,_knowledgeAcquired,_instutionName);
    }

    function allEducation() external view returns (Education[3] memory){
     return educationDetails;   
    }
    
    function changeDescription(string calldata _description) external onlyManger{
        description=_description;
    }

    function changeResume(string calldata _resumeLink ) external onlyManger{
        resumeLink=_resumeLink;
    }
    function changeImage(string calldata _imageLink) external onlyManger{
        imageLink=_imageLink;
    }

    function donate() public payable {
        payable (manager).transfer(msg.value);
    }

}
      