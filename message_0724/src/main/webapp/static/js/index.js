 $(function(){
	 
	   //ͨ��Ajax��ѯ��һҳ������Ա������
	 $.get("employee/selectPageJson.do",{"pageno":1,"pagesize":2},
				function(d){
		 
		            var data = d.data.pageInfo.list;          
				   $.each(data,function(index,obj){
					   var check=$("<input type=' ' name='${one.eid }' id='ids'>");
					   var empCheckTd=$("<td></td>").append(check);
					  var empEidTd=$("<td></td>").append(obj.eid);
					  var empNameTd=$("<td></td>").append(obj.name);
					  var empBirthdayTd=$("<td></td>").append(obj.birthday);
					  var empGenderTd=$("<td></td>").append(obj.gender);
					  var empSalaryTd=$("<td></td>").append(obj.salaty);
					 
					   var deptTd=$("<td></td>").append(obj.department.dname);

						var editBtn = $("<button></button>")
									.addClass("btn btn-primary update")
									.append($("<span></span>")
											.addClass("glyphicon glyphicon-pencil")
											.attr("aria-hidden",true))
									.append("�޸�");
						var delBtn = $("<button></button>")
								.addClass("btn btn-danger del")
								.append($("<span></span>")
										.addClass("glyphicon glyphicon-pencil")
										.attr("aria-hidden",true))
										.append("ɾ��");
				    	
						var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				         //��ӵ�tr��
						var tr=$("<tr></tr>")
						.append(empCheck)
						.append(empEidTd)
						.append(empNameTd)
						.append(empBirthdayTd)
						.append(empGenderTd)
						.append(empSalaryTd)
						.append(deptTd)
						.append(btnTd);
						//��trװ�뵽table��
						$("#empTable").append(tr);
				   });
				   
			   },"json"	   
			   );
	 
	 
	 
	 
	 
      //ɾ����ť
    $(".del").click(function(){
      var tr=$(this).parent().parent();
      var id=$(tr).find("td:eq(1)").text().trim();
      
      if(confirm("�Ƿ�ȷ��ɾ����")){
      location.href="${pageContext.request.contextPath}/employee/deleteEmployee.do?id="+id;
      }
    });
    
    $("#all").toggle(function(){
      $("input[type='checkbox']:gt(0)").attr("checked",true);
      },function(){
      $("input[type='checkbox']:gt(0)").attr("checked",false);
      });
      $("#but").click(function(){
        var array=new Array();
      $("input[type='checkbox']:gt(0):checked").each(function(){
          array.push($(this).parent().next().text());
      });
          
       if(array.length==0){
         alert("��ѡ��ɾ����Ϣ");
      }else{
      if(confirm("ȷ��ɾ����")){
     location.href="${pageContext.request.contextPath }/employee/deleteAll.do?ids="+array; 
    }
      } 
      
      });
      
        //����ģ̬��
      $("#addEmp").click(function(){
         $.post("department/selectDepartment.do",function(data){
                $("#sel").empty();
             $.each(data,function(index,obj){
             alert(obj.did);
              var option=$("<option value="+obj.did+">"+obj.dname+"</option>");
              $("#sel").append(option);
             });
         },"json"); 
         $("#addModal").modal('show');
      });
      //�޸�ģ̬��
      $(".update").click(function(){
      var tr=$(this).parent().parent();
      var did=$(tr).find("td:eq(1)").text().trim();
      $("#updateEmpModal :radio").attr("checked",false);
  	  $("#updateEmpModal select option").attr("selected",false);
  	   $.post("department/selectDepartment.do",function(data){
                $("#updatesel").empty();
             $.each(data,function(index,obj){
              var option=$("<option id='opt' value="+obj.did+">"+obj.dname+"</option>");
              $("#updatesel").append(option);
             });
         },"json"); 
         /*  var tr=$(this).parent().parent();
         var eid=$(tr).find("td:rq(1)").text().tirm();
         var name=$(tr).find("td:rq(2)").text().tirm();
         var birthday=$(tr).find("td:rq(3)").text().tirm();
         var gender=$(tr).find("td:rq(4)").text().tirm();
         var salary=$(tr).find("td:rq(5)").text().tirm(); 
         $("#updateModal input[name='eid']").val(eid);
         $("#updateModal input[name='name']").val(name);
         $("#updateModal input[name='birthday']").val(birthday);
         $("#updateModal :radio[value="+gender+"]").attr("checked",true);
         $("#updateModal input[name='salary']").val(salary); */
         $.post("employee/selectEmployee.do",{"id":did},function(data){
          $("#updateModal input[name='eid']").val(data.eid);
         $("#updateModal input[name='name']").val(data.name);
         $("#updateModal input[name='bb']").val(data.birthday);
         $("#updateModal :radio[value="+data.gender+"]").attr("checked",true);
         $("#updateModal input[name='salary']").val(data.salary);
         $("#updateModal select option[value="+data.department.did+"]").attr("selected",true);
         },"json"); 
         $("#updateModal").modal('show');
      });
      var name=false;
      //��֤
      $("#name").blur(function(){
        $("#namespan").empty();
         if($(this).val()==null || $(this).val()==""){
         $("#namediv").addClass("has-error");
         var span=$("<span id='namespan' style='color:red'>�û�������Ϊ��</span>");
         $(this).after(span);
         name=false;
         }else{
         name=true;
         }
      });
      //�ύ����ģ̬��
      $("#insertBut").click(function(){
      if(name==true){
       $("#form").submit();}
      });
       //�ύ�޸�ģ̬��
       $("#updateBut").click(function(){
      
       $("#updateform").submit();
     /*   $("#updateModal").modal('hide');
       window.location.reload(); */
       });
    }); 