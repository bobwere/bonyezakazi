const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);

const db = admin.firestore();

exports.sendNormalMessageNotification = functions.firestore
    .document("chatrooms/{chatroomsany}/chats/{chatsany}")
    .onCreate(async (snap, context) => {
        const doc = snap.data();

        const idTo = doc.to;
        const idFrom = doc.sender;
        const contentMessage = doc.text;

        //get notification settings  for user notification is being sent to

        const userNotificationSettingsRef = db.doc(
            `users/${idTo}/notificationsettings/notificationsettings`
        );
        const userNotificationSettingsSnap = await userNotificationSettingsRef.get();
        const userNotificationSettingsData = userNotificationSettingsSnap.data();
        const inboxmessages = userNotificationSettingsData.inboxmessages;

        if (inboxmessages === true) {
            if (
                doc.serverMessageType === "normal" ||
                doc.serverMessageType === "image"
            ) {
                //get push token for user notification is being sent to
                const userPushTokenRef = db.doc(`users/${idTo}`);
                const userPushTokenSnap = await userPushTokenRef.get();
                const userPushTokenRefData = userPushTokenSnap.data();
                const pushToken = userPushTokenRefData.pushToken;

                //get name of sender of this notification
                const userNameRef = db.doc(`users/${idFrom}`);
                const userNameSnap = await userNameRef.get();
                const userNameRefData = userNameSnap.data();
                const textFrom = userNameRefData.name;

                const payload = {
                    notification: {
                        title: `Message from ${textFrom}`,
                        body: contentMessage,
                        badge: "1",
                        sound: "default",
                    },
                };
                // Let push to the target device
                await admin
                    .messaging()
                    .sendToDevice(pushToken, payload)
                    .catch((e) => {
                        console.log(e);
                    });
                console.log("notification sent");
            }
        } else {
            console.log("inbox messages notifications turned off");
        }
        return null;
    });

exports.sendJobRequestMessageNotification = functions.firestore
    .document("chatrooms/{chatroomsany}/chats/{chatsany}")
    .onCreate(async (snap, context) => {
        const doc = snap.data();

        const idTo = doc.to;
        const idFrom = doc.idFrom;
        const contentMessage = doc.bookingText;

        //get notification settings  for user notification is being sent to

        const userNotificationSettingsRef = db.doc(
            `users/${idTo}/notificationsettings/notificationsettings`
        );
        const userNotificationSettingsSnap = await userNotificationSettingsRef.get();
        const userNotificationSettingsData = userNotificationSettingsSnap.data();
        const jobrequestmessages =
            userNotificationSettingsData.jobrequestmessages;

        if (jobrequestmessages === true) {
            if (
                doc.serverMessageType === "enquiry" &&
                doc.serverMessageStatus === "enquiry_sent"
            ) {
                //get push token for user notification is being sent to
                const userPushTokenRef = db.doc(`users/${idTo}`);
                const userPushTokenSnap = await userPushTokenRef.get();
                const userPushTokenRefData = userPushTokenSnap.data();
                const pushToken = userPushTokenRefData.pushToken;

                //get name of sender of this notification
                const userNameRef = db.doc(`users/${idFrom}`);
                const userNameSnap = await userNameRef.get();
                const userNameRefData = userNameSnap.data();
                const textFrom = userNameRefData.name;

                const payload = {
                    notification: {
                        title: `Message from ${textFrom}`,
                        body: contentMessage,
                        badge: "1",
                        sound: "default",
                    },
                };
                // Let push to the target device
                await admin
                    .messaging()
                    .sendToDevice(pushToken, payload)
                    .catch((e) => {
                        console.log(e);
                    });
                console.log("notification sent");
            }
        } else {
            console.log("job request notifications turned off");
        }
        return null;
    });

exports.sendJobCompletedMessageNotification = functions.firestore
    .document("chatrooms/{chatroomsany}/chats/{chatsany}")
    .onUpdate(async (snap, context) => {
        const doc = snap.after.data();

        const idTo = doc.to;
        const idFrom = doc.idFrom;
        const contentMessage = doc.bookingText;

        //get notification settings  for user notification is being sent to

        const userNotificationSettingsRef = db.doc(
            `users/${idTo}/notificationsettings/notificationsettings`
        );
        const userNotificationSettingsSnap = await userNotificationSettingsRef.get();
        const userNotificationSettingsData = userNotificationSettingsSnap.data();
        const jobcompletedmessages =
            userNotificationSettingsData.jobcompletedmessages;

        if (jobcompletedmessages === true) {
            if (
                doc.serverMessageType === "work_completed" &&
                doc.serverMessageStatus === "unrated"
            ) {
                //get push token for user notification is being sent to
                const userPushTokenRef = db.doc(`users/${idTo}`);
                const userPushTokenSnap = await userPushTokenRef.get();
                const userPushTokenRefData = userPushTokenSnap.data();
                const pushToken = userPushTokenRefData.pushToken;

                //get name of sender of this notification
                const userNameRef = db.doc(`users/${idFrom}`);
                const userNameSnap = await userNameRef.get();
                const userNameRefData = userNameSnap.data();
                const textFrom = userNameRefData.name;

                const payload = {
                    notification: {
                        title: `Job Completed by ${textFrom}`,
                        body: contentMessage,
                        badge: "1",
                        sound: "default",
                    },
                };
                // Let push to the target device
                await admin
                    .messaging()
                    .sendToDevice(pushToken, payload)
                    .catch((e) => {
                        console.log(e);
                    });
                console.log("notification sent");
            }
        } else {
            console.log("Job Completed messages notifications turned off");
        }
        return null;
    });

exports.sendJobRatedMessageNotification = functions.firestore
    .document("chatrooms/{chatroomsany}/chats/{chatsany}")
    .onUpdate(async (snap, context) => {
        const doc = snap.after.data();

        const idTo = doc.to;
        const idFrom = doc.idFrom;
        const contentMessage = "recent work done has been rated";

        //get notification settings  for user notification is being sent to

        const userNotificationSettingsRef = db.doc(
            `users/${idTo}/notificationsettings/notificationsettings`
        );
        const userNotificationSettingsSnap = await userNotificationSettingsRef.get();
        const userNotificationSettingsData = userNotificationSettingsSnap.data();
        const leaveareviewmessages =
            userNotificationSettingsData.leaveareviewmessages;

        if (leaveareviewmessages === true) {
            if (
                doc.serverMessageType === "work_completed" &&
                doc.serverMessageStatus === "rated"
            ) {
                //get push token for user notification is being sent to
                const userPushTokenRef = db.doc(`users/${idTo}`);
                const userPushTokenSnap = await userPushTokenRef.get();
                const userPushTokenRefData = userPushTokenSnap.data();
                const pushToken = userPushTokenRefData.pushToken;

                //get name of sender of this notification
                const userNameRef = db.doc(`users/${idFrom}`);
                const userNameSnap = await userNameRef.get();
                const userNameRefData = userNameSnap.data();
                const textFrom = userNameRefData.name;

                const payload = {
                    notification: {
                        title: `Message from ${textFrom}`,
                        body: contentMessage,
                        badge: "1",
                        sound: "default",
                    },
                };
                // Let push to the target device
                await admin
                    .messaging()
                    .sendToDevice(pushToken, payload)
                    .catch((e) => {
                        console.log(e);
                    });
                console.log("notification sent");
            }
        } else {
            console.log("leave a review messages notifications turned off");
        }
        return null;
    });

exports.sendJobConfirmedMessageNotification = functions.firestore
    .document("chatrooms/{chatroomsany}/chats/{chatsany}")
    .onCreate(async (snap, context) => {
        const doc = snap.data();

        const idTo = doc.to;
        const idFrom = doc.idFrom;
        const contentMessage = "booking has been confirmed";

        //get notification settings  for user notification is being sent to

        const userNotificationSettingsRef = db.doc(
            `users/${idTo}/notificationsettings/notificationsettings`
        );
        const userNotificationSettingsSnap = await userNotificationSettingsRef.get();
        const userNotificationSettingsData = userNotificationSettingsSnap.data();
        const bookingconfirmedmessages =
            userNotificationSettingsData.bookingconfirmedmessages;

        if (bookingconfirmedmessages === true) {
            if (
                doc.serverMessageType === "booking_confirmed" &&
                doc.serverMessageStatus === "booking_confirmed"
            ) {
                //get push token for user notification is being sent to
                const userPushTokenRef = db.doc(`users/${idTo}`);
                const userPushTokenSnap = await userPushTokenRef.get();
                const userPushTokenRefData = userPushTokenSnap.data();
                const pushToken = userPushTokenRefData.pushToken;

                //get name of sender of this notification
                const userNameRef = db.doc(`users/${idFrom}`);
                const userNameSnap = await userNameRef.get();
                const userNameRefData = userNameSnap.data();
                const textFrom = userNameRefData.name;

                const payload = {
                    notification: {
                        title: `Message from "${textFrom}"`,
                        body: contentMessage,
                        badge: "1",
                        sound: "default",
                    },
                };
                // Let push to the target device
                await admin
                    .messaging()
                    .sendToDevice(pushToken, payload)
                    .catch((e) => {
                        console.log(e);
                    });
                console.log("notification sent");
            }
        } else {
            console.log("Job confirmed messages notifications turned off");
        }
        return null;
    });

exports.sendJobDeclinedMessageNotification = functions.firestore
    .document("chatrooms/{chatroomsany}/chats/{chatsany}")
    .onCreate(async (snap, context) => {
        const doc = snap.data();

        const idTo = doc.to;
        const idFrom = doc.idFrom;
        const contentMessage = "booking has been declined";

        //get notification settings  for user notification is being sent to

        const userNotificationSettingsRef = db.doc(
            `users/${idTo}/notificationsettings/notificationsettings`
        );
        const userNotificationSettingsSnap = await userNotificationSettingsRef.get();
        const userNotificationSettingsData = userNotificationSettingsSnap.data();
        const bookingdeclinedmessages =
            userNotificationSettingsData.bookingconfirmedmessages;

        if (bookingdeclinedmessages === true) {
            if (
                doc.serverMessageType === "booking_declined" &&
                doc.serverMessageStatus === "booking_declined"
            ) {
                //get push token for user notification is being sent to
                const userPushTokenRef = db.doc(`users/${idTo}`);
                const userPushTokenSnap = await userPushTokenRef.get();
                const userPushTokenRefData = userPushTokenSnap.data();
                const pushToken = userPushTokenRefData.pushToken;

                //get name of sender of this notification
                const userNameRef = db.doc(`users/${idFrom}`);
                const userNameSnap = await userNameRef.get();
                const userNameRefData = userNameSnap.data();
                const textFrom = userNameRefData.name;

                const payload = {
                    notification: {
                        title: `Message from "${textFrom}"`,
                        body: contentMessage,
                        badge: "1",
                        sound: "default",
                    },
                };
                // Let push to the target device
                await admin
                    .messaging()
                    .sendToDevice(pushToken, payload)
                    .catch((e) => {
                        console.log(e);
                    });
                console.log("notification sent");
            }
        } else {
            console.log("Job declined messages notifications turned off");
        }
        return null;
    });
