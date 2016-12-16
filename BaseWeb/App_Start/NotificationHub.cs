using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace BaseWeb.App_Start
{
    public class NotificationHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }

        public void SendNotifications(string message)
        {
            Clients.All.receiveNotification(message);
        }
    }
}