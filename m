Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5325B90F
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 05:13:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33A1B3C5A7B
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Sep 2020 05:13:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 6AFCA3C2D78
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 05:13:10 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 61C581400C47
 for <ltp@lists.linux.it>; Thu,  3 Sep 2020 05:13:07 +0200 (CEST)
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0833D5fv020264; Thu, 3 Sep 2020 03:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=/QqjTVmelen2Ocv0yQDLw65jXYUCtNE6GzyOzjYHykc=;
 b=m9ohru9+PzhO5Qm2Hwm0M1GtdobRue6eh3fUsy9pM2sCxrjYBDxAe5gBtLqySWWmO7yT
 xaVs+s6do7cL769PbFMmit9rg8O6HkkvikroThLjhyFgql3nXCXsU26C3//hpC0MklDC
 y2pDQ3+SxLWhY7IQtO+B7DtlAZAE5xciOeXVb8A3yEb4FJfxTkhgX/MhbEjafu8oG8SW
 golj4Q7RMIOAca5NJTgF2DUTocnyGFiT5rTpHjf/dbATMKjJsYo/HM4uyxK8qZIAsBiI
 TsTpPoJgaT3f07khJcx9kXRJdeBFWS5zwzHjTHtOkTGHbrb80pFJzEFgyp4JlH1Vxrpz sA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx08-001d1705.pphosted.com with ESMTP id 337g6kttfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Sep 2020 03:13:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yq3ZtYE7SXc8dN3czppq68GVjzVfAVYUE3X/BPVxQXDSN+lPIBeER9XEWz9zHkWD2UbIJ769E0t9HahLnXt8l2Uc2huHfxtGMFVEMILoG+gMhBFNLiKX/zIBFno1R6Pm0M8tuHtDevSXtQ+64lzW2CXbcd+KbG1pOBKWQ9I9PMx5nP5fplssLekfjWndI/pSgw904WKAE4BUhIpZ0tkcn+bkEjDX5rM6saRntLv9gB84jYXuGOgDopvYlQ2Py/4wv1XhvPkKe8UT2KJOUfs/t9PThKHu0QlWzBPIBhEJHb0YCQ3ZTNp9IykU7MUdITiOCCO7I2hB91tAOVPBxDosGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QqjTVmelen2Ocv0yQDLw65jXYUCtNE6GzyOzjYHykc=;
 b=j/wlysv8yhBMNZBwvCTQgC9YJH6otkIYr3sn/nPH8b++5fGSHSf96TMd6iRF7uJjhOF6eH7tLoOGAInGP0KHlldzqnlPDxDvTiODBDYP3Q1yfUpA5ZW9ahC823mfmxutRf7IhovDhccV8VlQm8jlyOw8ra/3dIPPpmBGArg61WQSxI2FuJpDxcqNxszXl+Tson5hhqw1GztZml6MsoHfPb0f38KcLu4BN9SLCeoPF5mWOWy/hqp6GZnj/hxFw+pP/AxK54+t+j4UzBfmg6/d0oR7XEBQiX719Z37FLuB1rEvO8CDCi8PN15TQyrsmUdjLz5xjRBPyoMMZR8POkFURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1720.namprd13.prod.outlook.com (2603:10b6:903:158::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.8; Thu, 3 Sep
 2020 03:13:02 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::5c0c:3d3a:c493:efa]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::5c0c:3d3a:c493:efa%11]) with mapi id 15.20.3370.008; Thu, 3 Sep 2020
 03:13:01 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cixi Geng <gengcixi@gmail.com>
Thread-Topic: [LTP] [RFC] ltp test add reboot function
Thread-Index: AQHWfTwJrXyUoa07s0uKrksDE2kaNqlNpkbggAiH+gCAABUJ8A==
Date: Thu, 3 Sep 2020 03:13:01 +0000
Message-ID: <CY4PR13MB1175D12431C4C2ACF954DEA1FD2C0@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
 <20200824074226.GB2466@yuki.lan>
 <CAF12kFvScxqxhY5wXTGL2RKnyM5vM0hEKDc+sHD-3Y=_C7FWcw@mail.gmail.com>
 <20200828130638.GD10501@yuki.lan>
 <CY4PR13MB11754F0072967B32B007D273FD520@CY4PR13MB1175.namprd13.prod.outlook.com>
 <CAF12kFspG2fQKUrA=HGWGQuHy=xJaL0gntqvksq+QmUK3mAdKw@mail.gmail.com>
In-Reply-To: <CAF12kFspG2fQKUrA=HGWGQuHy=xJaL0gntqvksq+QmUK3mAdKw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 268a0723-ec2a-468e-df70-08d84fb74479
x-ms-traffictypediagnostic: CY4PR13MB1720:
x-microsoft-antispam-prvs: <CY4PR13MB1720D7965C356133E178D536FD2C0@CY4PR13MB1720.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fr6SzNBZeOPsVnd66k5CxUZNlyg9KxqxZtETVy8exZhmXLYw6AtWY2QM3u6ACv4c8WooDxyE7cJaED56tRVkumQEaxjB1oRMUBlgWVxnKpaC2UuWqNTFnhp7+5aH6OHGw1UQJz0zLCvlzGV8AaiGIpD4k6LbQjYz4YQQh4tfDavzEew9zPyP3PJhcNg4of9tDCGf0pnGE5A91HLJSE4tKi8ccVpbthSdPuxXy/ihiz2BGoeRiah2XRWLRl9f9J5V8xiUGdQRM3v0Fuat8Dh4sRdJDiNUAwe0ZgvSigAtFKV88KKDavtXub+ZVR618C5CFlkB1SKPu3DIIJ7I3jge2I9c3qOgQ56BAGy99zdjEfhPZQ3bAQf331mt1aTQRUFoF5jMK+xa8LlPCTMG0q+7uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(4326008)(5660300002)(76116006)(71200400001)(2906002)(26005)(478600001)(9686003)(33656002)(55016002)(186003)(966005)(66946007)(52536014)(8936002)(64756008)(66446008)(54906003)(66476007)(316002)(86362001)(6916009)(6506007)(66556008)(83380400001)(7696005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Pb/buRr+8XEFxbr3rrucUqGLbAYADmZg5qLAtKoYMRHZaLbQD5qIHHCvIrljqg+Oo+iLU/cHs6TGSazPCimN/PwZNPyq1H3wPfZiob/GZI4mwKnEci3lLyPPwx21ZKIEK9vaR79dACQm0gohXto0Pk60uHm8TiyD9T8AbGKR4gYDSUvCHi6dQmxQAxDHXDL37Ve2I92VLGPISXz7KUTaVv+mVKBmQthn2Vpf5pnH8fQ1oW0W69X+sTp9gs3+AF3izev0tvky3ZdcHjdk88geY5YdJQUMpKofSmg5RywYQ7wSbK+Yngpwkf4tqbOyuSMbcPpTYeUP6CJ8FeSMymAR1W+4iD4WPmkj3/HchszlswGuk12ZuGMuawJesIduhxp/XNvI/CG6JMEPYwt8C1OaQ3TVOhSlzyXNU8Ahx0nsSA8Gd8plEogYfKFyyz17xvnsKCUuTt6T1m1Ie9H+hk4hAp2bOXlWVsdNXhmbJayJDMvfBHbC0zNZ6QE1963lnSPKA6CICi0Z/WSUNTKQDJB9fiqgSCVEnY9vCSWsYCI7M+Pwodxu7O4QGQAggY74WzDOASzE6pDArWkF7YnGKnOB8GNW+zaNLIu5ttullSTQTwsRzHSqVPlZqqzBcRGDFufmgIfXAY4ZN7B7iGsUb0XvCg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268a0723-ec2a-468e-df70-08d84fb74479
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2020 03:13:01.7673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A5Zd6WMYTq/dHsPbQFQ4gIvHc0/c8ozbuHLqbDMNvMPwMmlpMPOt46Im0+Xd5VPBEPlOHh4aPRkDmIBHqabHNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1720
X-Sony-Outbound-GUID: UdM9A7sZK8ppVn_krG6Q-2O4qJaxm-z9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_17:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009030029
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] ltp test add reboot function
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Orson Zhai <orsonzhai@gmail.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>,
 "xingfeng.kang@unisoc.com" <xingfeng.kang@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2l4aSBHZW5nIDxnZW5n
Y2l4aUBnbWFpbC5jb20+DQo+IA0KPiA+QWxzbyBJIGRvIGNvbnNpZGVyIHRoZSB3aG9sZSBjb25j
ZXB0IG9mIHJ1bm5pbmcgdGhlIHRlc3QgZXhlY3R1dGlvbg0KPiA+ZnJhbWV3b3JrIG9uIHRoZSBz
YW1lIG1hY2hpbmUgYXMgdGhlIHRlc3RjYXNlcyBicm9rZW4gYnkgZGVzaW5nIGZvcg0KPiA+a2Vy
bmVsIHJlbGF0ZWQgdGVzdHMuIFRoZSB3YXkgZm9yd2FyZCBpcyB0aGUgcGF0Y2hzZXQgc2VuZCBi
eSBSaWNoYXJkDQo+ID50aGF0IGltcGxlbWVudHMgc2ltcGxlIHRlc3QgZXhlY3V0b3IgdGhhdCBy
dW5zIG9uIHRoZSBtYWNoaW5lIHVuZGVyIHRlc3QNCj4gPmFuZCBjb21tdW5pY2F0ZXMgd2l0aCBh
IGV4ZWN1dGlvbiBmcmFtZXdvcmsgdGhhdCBydW5zIG9uIGEgY2VudHJhbA0KPiA+c2VydmVyLg0K
PiANCj4gSSBhZ3JlZSB3aXRoIHNvbWUgb2YgeW91ciB2aWV3c++8jCB0aGUgdGVzdCBhcmNoaXRl
Y3R1cmUgc2VydmVyL3NsYXZlIGlzIG1vc3QNCj4gY29tbW9uIHRlc3QgbWV0aG9kLiBidXQgSSBh
bHNvIHdhbnQgdG8ga25vdyB3aGF0IGtpbmQgb2YgY29ubmVjdGlvbg0KPiBtZXRob2QgYmV0d2Vl
biB0ZXN0IG1hY2hpbmUgYW5kIGNlbnRyYWwgc2VydmVyLCAgdGhlIHNzaCAsIGFkYiBvciBzZXJp
YWw/DQo+IA0KPiBiZWNhdXNlIG15IHRlc3QgbWFjaGluZSBpcyBhIGNlbGxwaG9uZSwgb3VyIHB1
cnBvc2UgaXMgdGVzdCB0aGUga2VybmVsIGJlZm9yZQ0KPiBhbmRyb2lkT1MgLCBzbyBJIGJ1aWxk
IGRlYmlhbk9TIG9uIG91ciBoYXJhd2FyZSwgYW5kIHdlIGNhbiBvbmx5IHVzZWQgdGhlDQo+IHNl
cmlhbCBwb3J0IGNvbW11bmljYXRlIHdpdGggb3VyIHRlc3RtYWNoaW5lLg0KDQpGdWVnbyBhbmQg
TEFWQSBib3RoIHN1cHBvcnQgc2VyaWFsIHBvcnQgYXMgYSBtZXRob2QgdG8gY29tbXVuaWNhdGUN
CmZyb20gYSB0ZXN0aW5nIGhvc3QgdG8gYSBkZXZpY2UgdW5kZXIgdGVzdC4gIFRoZSBkZWZhdWx0
IGlzIHVzdWFsbHkgc3NoLCBidXQgYm9hcmRzDQp3aXRoIG9ubHkgYSBzZXJpYWwgcG9ydCBhcmUg
YWxzbyBzdXBwb3J0ZWQuDQoNCkxBVkEgdXNlcyBzZXIybmV0IGFuZCBGdWVnbyB1c2VzIHNlcmlv
IGFuZCBzZXJsb2dpbi4gIFRob3NlIGFyZSB0aGUgdG9vbHMgSSdtDQptb3N0IGZhbWlsaWFyIHdp
dGggZm9yIGRvaW5nIHRlc3Rpbmcgb3BlcmF0aW9ucyBvdmVyIHRoZSBzZXJpYWwgcG9ydC4NCg0K
U2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9mcm93YW5kL3NlcmlvLmdpdA0KYW5kIGh0dHBzOi8vZ2l0
aHViLmNvbS90YmlyZDIwZC9zZXJsb2dpbi5naXQNCg0KPiANCj4gQmlyZCwgVGltIDxUaW0uQmly
ZEBzb255LmNvbT4g5LqOMjAyMOW5tDjmnIgyOOaXpeWRqOS6lCDkuIvljYgxMTozN+WGmemBk++8
mg0KPiA+DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
IEZyb206ICBDeXJpbCBIcnViaXMNCj4gPiA+DQo+ID4gPiBIaSENCj4gPiA+ID4gVGhhbmtzIGZv
ciB5b3UgZXhwZXJpZW5jZXMgb24gdGhlIHJlYm9vdD8/Pw0KPiA+ID4gPiBTbyBmYXIgbXkgb3Bp
bmlvbiBpcyBhZGQgYSByZWJvb3Qgc2VydmljZSBieSBjaGtjb25maWcgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4NCj4gPiA+ID4gdGhlIHNlcnZpY2Ugd2lsbCBzdGFydCBydW5sdHAgc2NyaXB0cyBm
cm9tIGxhc3QgYnJlYWsgb2ZmIHBvaW50Lg0KPiA+ID4gPiB3aGVuIHRoZSB0c3RfdGVzdCBoYXZl
IC50c3RfbmVlZHNfcmVib290ID0xIGZsYWcsIGl0IHdpbCBzdHJvcmUgdGhlDQo+ID4gPiA+IHJ1
biBzdGF0dXMgYW5kDQo+ID4gPiA+IHJlYm9vdCB0aGUgbWFjaGluZSBiZWZvcmUgcnVuIHRoZSB0
ZXN0IGNhc2UuDQo+ID4gPiA+IE5vdyBJIHdhbnQgdG8ga25vdyB3aGF0IG5lZWRzIHRvIGJlIHBy
ZXNlcnZlZD8/Pw0KPiA+ID4NCj4gPiA+IFRoZSBydW5sdHAgc2NyaXB0IGFuZCBsdHAtcGFuIGNh
bm5vdCBzYXZlIGFuZCByZXN0b3JlIGEgdGVzdHJ1biwNCj4gPiA+IGFsdGhvdWdoIHNvbWV0aGlu
ZyBsaWtlIHRoYXQgbWF5IGJlIHBvc3NpYmxlIHRvIGltcGxlbWVudCwgSSBkb3VidCB0aGF0DQo+
ID4gPiBpdCBjb3VsZCBiZSBlYXNpbHkgYWRkZWQgdG8gdGhlIGN1cnJlbnQgaW5mcmFzdHJ1Y3R1
cmUuIE5vdCB0byBtZW50aW9uDQo+ID4gPiB0aGF0IGx0cC1wYW4gaGFzIGJlZW4gaW4gYSBtYWlu
dGVuYW5jZSBtb2RlICh3aGljaCBtZWFucyBubyBuZXcNCj4gPiA+IGZlYXR1cmVzKSBmb3IgeWVh
cnMgbm93Lg0KPiA+ID4NCj4gPiA+IEFsc28gSSBkbyBjb25zaWRlciB0aGUgd2hvbGUgY29uY2Vw
dCBvZiBydW5uaW5nIHRoZSB0ZXN0IGV4ZWN0dXRpb24NCj4gPiA+IGZyYW1ld29yayBvbiB0aGUg
c2FtZSBtYWNoaW5lIGFzIHRoZSB0ZXN0Y2FzZXMgYnJva2VuIGJ5IGRlc2luZyBmb3INCj4gPiA+
IGtlcm5lbCByZWxhdGVkIHRlc3RzLiBUaGUgd2F5IGZvcndhcmQgaXMgdGhlIHBhdGNoc2V0IHNl
bmQgYnkgUmljaGFyZA0KPiA+ID4gdGhhdCBpbXBsZW1lbnRzIHNpbXBsZSB0ZXN0IGV4ZWN1dG9y
IHRoYXQgcnVucyBvbiB0aGUgbWFjaGluZSB1bmRlciB0ZXN0DQo+ID4gPiBhbmQgY29tbXVuaWNh
dGVzIHdpdGggYSBleGVjdXRpb24gZnJhbWV3b3JrIHRoYXQgcnVucyBvbiBhIGNlbnRyYWwNCj4g
PiA+IHNlcnZlci4NCj4gPg0KPiA+IEkgZG9uJ3QgaGF2ZSBhbnl0aGluZyB0byBjb250cmlidXRl
IHRvIHRoZSBwcmltYXJ5IGRpc2N1c3Npb24gdG9waWMsDQo+ID4gYnV0IEkganVzdCBoYXZlIHRv
IGNoaW1lIGluIGhlcmUgdGhhdCBpdCdzIHZlcnkgbmljZSB0byBoZWFyIHNvbWVvbmUNCj4gPiBl
bHNlIGV4cHJlc3MgdGhpcyBpZGVhLiAgRnVlZ28ncyBhcmNoaXRlY3R1cmUgaXMgYnVpbHQgb24g
aGF2aW5nIHRoZSB0ZXN0DQo+ID4gZXhlY3V0aW9uIGRyaXZlbiBmcm9tIGEgbWFjaGluZSBleHRl
cm5hbCB0byB0aGUgbWFjaGluZSB1bmRlciB0ZXN0Lg0KPiA+IFRvIG1lLCBoYXZpbmcgdGhlIG1h
Y2hpbmUgdW5kZXIgdGVzdCBkcml2ZSBpdHMgb3duIHRlc3QgZXhlY3V0aW9uIHNlZW1zIHdlaXJk
LA0KPiA+IGluIHRoYXQgaXQgcmVxdWlyZXMgdGhlIG1hY2hpbmUgdG8gcG90ZW50aWFsbHkgcGVy
Zm9ybSBhY3Rpb25zIChsaWtlIHJlYm9vdCwNCj4gPiBvciBzYXZpbmcgcGFuaWMgZGF0YSksIHRo
YXQgcmVxdWlyZSBvcGVyYXRpb25hbCBmaXRuZXNzIC0gd2hpY2ggaXMgdGhlIHZlcnkgdGhpbmcN
Cj4gPiBiZWluZyB0ZXN0ZWQuDQo+ID4NCj4gPiBTb3JyeSAtIGp1c3QgaGFkIHRvIHZlbnQgYSBs
aXR0bGUuICBJICJwcmVhY2giIHRoaXMgYSBsb3QsIGFuZCBpdCdzIG5pY2UgdG8gdGhlIHNhbWUN
Cj4gPiBvcGluaW9uIGZyb20gc29tZW9uZSBlbHNlLg0KPiA+ICAtLSBUaW0NCj4gPg0KCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
