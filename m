Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDD632B5
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 10:10:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2359E3C1B49
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 10:10:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E4DFE3C003C
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 10:10:50 +0200 (CEST)
Received: from m9a0002g.houston.softwaregrp.com
 (m9a0002g.houston.softwaregrp.com [15.124.64.67])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E9A791A00E4B
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 10:10:45 +0200 (CEST)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  9 Jul 2019 08:10:44 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 9 Jul 2019 08:10:37 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 9 Jul 2019 08:10:37 +0000
Received: from MW2PR18MB2234.namprd18.prod.outlook.com (52.132.183.31) by
 MW2PR18MB2201.namprd18.prod.outlook.com (52.132.183.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 08:10:36 +0000
Received: from MW2PR18MB2234.namprd18.prod.outlook.com
 ([fe80::693b:dcc1:c2c4:33a4]) by MW2PR18MB2234.namprd18.prod.outlook.com
 ([fe80::693b:dcc1:c2c4:33a4%6]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 08:10:36 +0000
From: Christian Amann <camann@suse.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH v1] syscalls/ioctl08: Add check for btrfs
Thread-Index: AQHVNiiIGf23cybj00O3DuKcztBSnqbB7su5
Date: Tue, 9 Jul 2019 08:10:35 +0000
Message-ID: <MW2PR18MB2234061990DCAD3F1D38941FABF10@MW2PR18MB2234.namprd18.prod.outlook.com>
References: <20190709073228.18707-1-camann@suse.com>
In-Reply-To: <20190709073228.18707-1-camann@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=camann@suse.com; 
x-originating-ip: [2620:113:80c0:5::2222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73c575be-b3e6-4889-8e4b-08d70444ec20
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MW2PR18MB2201; 
x-ms-traffictypediagnostic: MW2PR18MB2201:
x-microsoft-antispam-prvs: <MW2PR18MB2201C2AC512998D5CC49139EABF10@MW2PR18MB2201.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(199004)(189003)(229853002)(4326008)(6606003)(316002)(81156014)(91956017)(6436002)(6246003)(76116006)(66476007)(66446008)(66556008)(5640700003)(64756008)(68736007)(478600001)(2906002)(81166006)(66946007)(19627405001)(7736002)(73956011)(71200400001)(1730700003)(14454004)(102836004)(71190400001)(476003)(86362001)(186003)(76176011)(6506007)(486006)(25786009)(5660300002)(53546011)(52536014)(256004)(6116002)(14444005)(6916009)(53936002)(9686003)(33656002)(2351001)(8676002)(11346002)(446003)(74316002)(99286004)(7696005)(2501003)(55016002)(8936002)(54896002)(46003)(17423001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR18MB2201;
 H:MW2PR18MB2234.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7gPGoanqJG7tRD2teDNXF+Ubklx80yI9BThzol6T7vfqshEohb8yMqbvsF+2kD++emW6W1QtbgDL4MwuuaENOsQfyYVpZMAPcyMRXh1aE3OvM9E1HZ4z0O1g6/ZxcklTnUOT57E5yZG7Ivi5WlvkiFLVZ6z2EH2SqHxxcW0XM8pgdmGrSQs8LsIT4pCj3/ysIUMlP5sEmgvxAHq4u13FlPZxt0naYd6OHYjeC8HLg/g/EXUkZ2njW0JEtibetLe4MJw1e7DH4xO1HjmrkUKVFE5gnztxMejSqQpZLiSLoSpYnHqwhKhpF60YvGKytmPChSlw3BP2vsjCXt8qMCS1F5YZ51Og6xDk7npHv41fBxK957KhfqP1US3Frj0diO99PEziPC3Ea1Pd/v9A6cQ9CPi3/5koNMTPlXPcTY/Lwfs=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c575be-b3e6-4889-8e4b-08d70444ec20
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 08:10:35.9979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: camann@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2201
X-OriginatorOrg: suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] syscalls/ioctl08: Add check for btrfs
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
Content-Type: multipart/mixed; boundary="===============0910781785=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0910781785==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MW2PR18MB2234061990DCAD3F1D38941FABF10MW2PR18MB2234namp_"

--_000_MW2PR18MB2234061990DCAD3F1D38941FABF10MW2PR18MB2234namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, I just found out that my mail forwarding stopped working so I didn't=
 see that there's already a patch for that.

Please Ignore this, thanks!


Regards,

Christian


________________________________
From: Christian Amann
Sent: Tuesday, July 9, 2019 9:32:28 AM
To: ltp@lists.linux.it
Cc: amir73il@gmail.com; Christian Amann
Subject: [PATCH v1] syscalls/ioctl08: Add check for btrfs

This test used to fail on systems with missing btrfs support. Now it
ends with TCONF.

Reported-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Christian Amann <camann@suse.com>
---
 testcases/kernel/syscalls/ioctl/ioctl08.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl08.c b/testcases/kernel/s=
yscalls/ioctl/ioctl08.c
index 8de80048c..c39423b8b 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl08.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl08.c
@@ -112,9 +112,15 @@ static void setup(void)
                         sizeof(struct file_dedupe_range_info));
 }

+static const char *kconfigs[] =3D {
+       "CONFIG_BTRFS_FS",
+       NULL
+};
+
 static struct tst_test test =3D {
         .test =3D verify_ioctl,
         .tcnt =3D ARRAY_SIZE(tcases),
+       .needs_kconfigs =3D kconfigs,
         .setup =3D setup,
         .cleanup =3D cleanup,
         .min_kver =3D "4.5",
--
2.16.4


--_000_MW2PR18MB2234061990DCAD3F1D38941FABF10MW2PR18MB2234namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFo=
nt&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoCo=
lorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymb=
ols;">
<p style=3D"margin-top:0; margin-bottom:0">Sorry, I just found out that my =
mail forwarding stopped working so I didn't see that there's already a patc=
h for that.</p>
<p style=3D"margin-top:0; margin-bottom:0">Please Ignore this, thanks!</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Regards,</p>
<p style=3D"margin-top:0; margin-bottom:0">Christian</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Christian Amann<br>
<b>Sent:</b> Tuesday, July 9, 2019 9:32:28 AM<br>
<b>To:</b> ltp@lists.linux.it<br>
<b>Cc:</b> amir73il@gmail.com; Christian Amann<br>
<b>Subject:</b> [PATCH v1] syscalls/ioctl08: Add check for btrfs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">This test used to fail on systems with missing btr=
fs support. Now it<br>
ends with TCONF.<br>
<br>
Reported-by: Amir Goldstein &lt;amir73il@gmail.com&gt;<br>
Signed-off-by: Christian Amann &lt;camann@suse.com&gt;<br>
---<br>
&nbsp;testcases/kernel/syscalls/ioctl/ioctl08.c | 6 &#43;&#43;&#43;&#43;&#4=
3;&#43;<br>
&nbsp;1 file changed, 6 insertions(&#43;)<br>
<br>
diff --git a/testcases/kernel/syscalls/ioctl/ioctl08.c b/testcases/kernel/s=
yscalls/ioctl/ioctl08.c<br>
index 8de80048c..c39423b8b 100644<br>
--- a/testcases/kernel/syscalls/ioctl/ioctl08.c<br>
&#43;&#43;&#43; b/testcases/kernel/syscalls/ioctl/ioctl08.c<br>
@@ -112,9 &#43;112,15 @@ static void setup(void)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeo=
f(struct file_dedupe_range_info));<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static const char *kconfigs[] =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CONFIG_BTRFS_FS&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL<br>
&#43;};<br>
&#43;<br>
&nbsp;static struct tst_test test =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .test =3D verify_ioctl,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .tcnt =3D ARRAY_SIZE(tcase=
s),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .needs_kconfigs =3D kconfigs,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .setup =3D setup,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cleanup =3D cleanup,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .min_kver =3D &quot;4.5&qu=
ot;,<br>
-- <br>
2.16.4<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MW2PR18MB2234061990DCAD3F1D38941FABF10MW2PR18MB2234namp_--

--===============0910781785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0910781785==--
