Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A47771752B7
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 05:32:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3E0C3C695C
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 05:32:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 91F633C690F
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 05:32:35 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380108.outbound.protection.outlook.com [40.107.138.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A1E4C1000B2C
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 05:32:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7IrLfZqqWzNtzu23fYALYbJmiDsqlCr+h3saEqtA529LXA/y8BG/CW3cLW3JC7wizLvt+UbljWxIKTrQ/kZP/FUCLoM2dglhmoC+L5MnS5Xr9OhAmSC+7EsawibvVFIpICVcThIFak1erYpCjIGSc8atozcO9NdMyIgkqFClDf2FYgqPjhjYQm0kmZs1GmnqP2t7cFgkU2BbbDZAS/vxeaTAN1HFKU8hCY4bnS2+N8PnElz0ig1Ao67xcurIuCcO6jTtIkMvapMlP+OLlGaxVEewkVx8ZwXJg/etili+NmgwzQMmZFUI2yQx8r3GK7IYlyj/ZixBgELnqZzGwCVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9VxGJlIWeE9tyBD4j+aRjbphAisAhhz5Zt+SOKZdWA=;
 b=hBTZTcPGYR3DV1TwNCohPFIG3aY1eoSyhElj+3xJphA+KMDNQuFrIF+qCFc0o0DiHFPY/CRaesjTGM2e6ityrYpQkqgplMBFoaQ4u45IMtz3iwZL+xXEVtnCCohvjoUWSqGH52zvmL+unnRRBtqmxELJJdiuchabKaTorRG8RmndomXDfDjK06mStQ80dwdRMt/KfGLKr9kcdgM00LsMfzF8gi26O8bHORAiTkzyaUZRO7YTCGu+uet1zL7cLqRf428D0dXjqesP62JjFGq9DkRn9l8DZBji4SNW3i/Kuf+61UoBhhrx0efT7QkXcpo7pWglm2MBah0fkBzIDNveQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9VxGJlIWeE9tyBD4j+aRjbphAisAhhz5Zt+SOKZdWA=;
 b=nbZnY6+v5Ojz93gKARrgx0bxC/bqA1/Wb0HpDqxWNjWo3FeAsSNfqH6U7VlqboDgg2PJ/QHUVKQBoBzAPr0AE5O+WkGfPcGtOu/W0GR0oIiu+RV53HcdJFiplGJO2XGhuR4CjShfIsffxDly5DUXawz2gmSwDa5MFURiyhta7fo=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1338.INDPRD01.PROD.OUTLOOK.COM (52.134.130.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Mon, 2 Mar 2020 04:32:31 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 04:32:31 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] netns_netlink test failure
Thread-Index: AQHV7gWTY21LVV77S0ewHm9hor5oP6gwVMWAgARmJR4=
Date: Mon, 2 Mar 2020 04:32:31 +0000
Message-ID: <MAXPR0101MB1468032C8109347B258800B7EEE70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB14681590CE13BB4E2ED97CFEEEE80@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>,
 <20200228092107.GB31181@rei>
In-Reply-To: <20200228092107.GB31181@rei>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c721b428-7776-49d3-888d-08d7be62b8d7
x-ms-traffictypediagnostic: MAXPR0101MB1338:
x-microsoft-antispam-prvs: <MAXPR0101MB1338698F7E5F3ABCD411608AEEE70@MAXPR0101MB1338.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(2906002)(316002)(4326008)(66476007)(66556008)(64756008)(66446008)(6506007)(53546011)(71200400001)(52536014)(55236004)(86362001)(26005)(5660300002)(33656002)(4744005)(19627405001)(76116006)(55016002)(9686003)(8676002)(8936002)(81156014)(6916009)(66946007)(81166006)(7696005)(508600001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1338;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oPOyVxAVCGGBuAb4Y5sg9IeV2vCp3q53AbZ7D0P40OlPCu4t34qIDGj6yq/6lyt7lwKaU4+9qlalZ4Ue9m1Xo4ieXOVpEmkskG0JEnMrYHViS+RV7l89uG59BhCpM8whLjL5h+iGaBDwH+GeBiXmRk/ikIMEKpOpjUpAoW2eXMHOq1mQW9rm5T0ReKg9rRI1GL5uqHKN6S5h46/ZPAzrpUSXrfcPlOOUCKEg6cDyn9ipGt3ea0GK0MneGgowvCEP+sxOSAplyoeKG9/5i+bPR2jlWzGfuyyH4QwfgP+MAXTvDw/DdEXsefr0LC+xspUuseXh2pGDTi9vxBoYI7+0vLjMa+6JyMh9WpMa7OuRP64CAmF6q5aGTRR8WkTKQnMOMmf15cuXHRcMaRh5AA3unsiu7aePQ8cx6xABvawNLAjRfhRo/WBpX3/5NzBCsann
x-ms-exchange-antispam-messagedata: PJ3lO98yj9ZMhyokV2eA+1m/yMC3Q09wFn6id9FzTwZLm3ifyEpBej7ey/LLotrO3xq+5B2Lz5G/F9wB8/Bq4thoXrooWtwwJOBYuGbE+Kw7r9Veh7s/qnB+8K9LV58vRuY43NOU9ki8YFMwAa9DAw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c721b428-7776-49d3-888d-08d7be62b8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 04:32:31.1160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SbFC/PkkqJVbE29JYSCJjm5gKShE+VAuuwib8fl1H/tyzZCu817sdR+U0bQ/sEn0DN8/4y4PvFlUHbpFxLjwilib/5fEjkQ4KpT+czU3tmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1338
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] netns_netlink test failure
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1622502649=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1622502649==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1468032C8109347B258800B7EEE70MAXPR0101MB1468_"

--_000_MAXPR0101MB1468032C8109347B258800B7EEE70MAXPR0101MB1468_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
What could be the possible reason behind failing,any guess??
________________________________
From: Cyril Hrubis <chrubis@suse.cz>
Sent: Friday, February 28, 2020 2:51 PM
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] netns_netlink test failure

Hi!
> <<<test_output>>>
> open: No such file or directory
> netns_netlink    1  TBROK  :  netns_netlink.c:143: system() failed
                                                 ^
                                                 This is a line number,
                                                 if you look a the
                                                 source code of the
                                                 test, you see:

        if (WEXITSTATUS(system("ip tuntap add dev dummy0 mode tap")))
                tst_brkm(TBROK, cleanup, "system() failed");

So that the failed command was "ip tuntap add dev dummy0 mode tap", it's up=
 to
you to figure out why...

--
Cyril Hrubis
chrubis@suse.cz
[EXT]

--_000_MAXPR0101MB1468032C8109347B258800B7EEE70MAXPR0101MB1468_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
What could be the possible reason behind failing,any guess??<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cyril Hrubis &lt;chru=
bis@suse.cz&gt;<br>
<b>Sent:</b> Friday, February 28, 2020 2:51 PM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] netns_netlink test failure</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi!<br>
&gt; &lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
&gt; open: No such file or directory<br>
&gt; netns_netlink&nbsp;&nbsp;&nbsp; 1&nbsp; TBROK&nbsp; :&nbsp; netns_netl=
ink.c:143: system() failed<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is a l=
ine number,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if you look=
 a the<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source code=
 of the<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test, you s=
ee:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (WEXITSTATUS(system(&quot;ip =
tuntap add dev dummy0 mode tap&quot;)))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; tst_brkm(TBROK, cleanup, &quot;system() failed&quot;);<br>
<br>
So that the failed command was &quot;ip tuntap add dev dummy0 mode tap&quot=
;, it's up to<br>
you to figure out why...<br>
<br>
--<br>
Cyril Hrubis<br>
chrubis@suse.cz<br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXPR0101MB1468032C8109347B258800B7EEE70MAXPR0101MB1468_--

--===============1622502649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1622502649==--
