pragma solidity ^0.8.17;
contract sturesult
{
    struct student
    {
        uint regno;
        uint [5] marks;
        uint totalmarks;
    }
    address chairper;
    address examiner;
    mapping (address => student) Students;
    constructor(address exam)
    {
        chairper=msg.sender;
        examiner=exam;
    }
    modifier onlycp(address u)
    {
        require(u==chairper);
        _;
    }
    modifier onlyexam(address u)
    {
        require(examiner==u);
        _;
    }
    function regstu(address stu,uint r) public onlycp(msg.sender)
    {
        // uint tmark;
        Students[stu].regno=r;
    }
    function calres(address da) private
    {
        uint res;
        for (uint i=0;i<5;i++)
        {
            res+=Students[da].marks[i];
        }
        Students[da].totalmarks=res;
    }
    function entermark(address i,uint m,uint sub) public onlyexam(msg.sender)
    {
        Students[i].marks[sub]=m;
    }
    function calresult(address ws) public
    {
        calres(ws);
    }
    function decresult(address fd) view public returns(uint)
    {
        return Students[fd].totalmarks;
    }
}
