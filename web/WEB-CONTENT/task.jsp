<%@ page import="java.util.ArrayList" %>
<%@ page import="Classes.Task" %>
<%@ page import="Classes.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tasks</title>
    <%@include file="./components/header.jsp"%>
</head>
<body>
    <%@include file="./components/navBar.jsp"%>
    <div class="mainContent">
        <button id="openPopupButton">+ Добавить задание</button>

        <div id="popup" class="popup">
            <div class="popup__body">
                <div class="popup__content">
                    <div class="popup__title">Новое задание</div>
                    <div class="popup__text">
                        Наименование:
                    </div>
                    <input type="text" class="popup__inputTitle" placeholder="Наименование">
                    <div class="popup__text">
                        Описание:
                    </div>
                    <input type="text" class="popup__inputArea" placeholder="Описание">
                    <div class="popup__text">
                        Крайний срок:
                    </div>
                    <input type="date" class="popup__inputDeadline">
                    <div class="popup_buttons">
                        <a class="popup__close" href="#">Закрыть</a>
                        <a class="popup__save" href="#">Сохранить</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="tableDiv">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Наименование</th>
                    <th scope="col">Крайний срок</th>
                    <th scope="col">Выполнено</th>
                    <th scope="col">Детали</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasksArray");

                    for(Task t: tasks) {
                        %>
                    <tr>
                        <th><%=t.getId()%></th>
                        <td><%=t.getName()%></td>
                        <td><%=t.getDeadline()%></td>
                        <td><%if(t.isStatus()) {
                                %>Выполнено<%
                                } else {
                            %>Не выполнено<%
                            }%></td>
                        <td><a class="detailsLink" href="">Детали</a></td>
                    </tr>
                <%
                    }
                %>

                </tbody>
            </table>
        </div>

    </div>

    <script>
        const openPopupButton = document.getElementById('openPopupButton');
        const popup = document.getElementById('popup');

        openPopupButton.addEventListener('click', function() {
            popup.style.opacity = '1';
            popup.style.visibility = 'visible';
        });

        document.querySelector('.popup__close').addEventListener('click', function() {
            popup.style.opacity = '0';
            popup.style.visibility = 'hidden';
        });

    </script>
</body>
</html>
