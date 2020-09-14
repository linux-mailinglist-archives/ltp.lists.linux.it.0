Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F3926874E
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 10:39:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88FDD3C4F20
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 10:39:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 81F143C224B
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 10:39:34 +0200 (CEST)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390131.outbound.protection.outlook.com [40.107.139.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9A1526000F9
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 10:39:33 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkhBpzRo9NZmOkbO6wfiEhY3VyLQLwaPH8agPYWOUzpPqT5k1OmAFDGGiTuuW22JM1AIZn1ze5L69VUxKsKWJHdpdh1XoFqJl9VsEjJrEqQXdw4/Y2Fhf/kSAW3tN/PAxdiIM4v0BpMNMsvChLP8xJQ7Ik+8WH34KMt57jenDgX3YdI5nTKBfdd8y2994Px54Vknu3VrPbAwITdsgrsi0GDiNAcsP8KURngghPmgGCsAMBqVtBUusc1mmSY6XaRYhm92PXmSiGrii5zbFn5/2UpJTpzbp7ipJx6Vj/EiML4yYIFMbOYw7YtuAsJPA1emaGt/vqucvFwC3pORbBw3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch9CjDVoQZDHNqX0D9RsCKTNJnNqBzoSIAeJEu+d984=;
 b=jsllzCy5v5gbkO3FpNz2VKGXQptzREzd+vo7f60FzOE8zdpv2OGVnkifef/NEAV3fPvdpKYY+AsPYm+caluhT/njy4z1QcPbXdE3qSTvy69wXRX7IE/yoYEvODkyf7L4xMh2sIWNV5jQcdWcj6qVrmSRJKMtlEMSijRHE93Pyak5Xgp6Mxe3R2U0q/Cc6RKOsCjmEKNfXDn9nQdAUaey7gjxCyDWtvbb5R3ifBQLjbCNotTnMWTWZgApS2X4alvLzLlKaH+flpJ2aVMmJwWfzHe9hfGVMJnDtiLex54CjRIH4K6zOIK8XiZc6gtqv9X672j+rkfdw0BhfRTFQ58/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch9CjDVoQZDHNqX0D9RsCKTNJnNqBzoSIAeJEu+d984=;
 b=qlP7wftThQ265cfuZ3pxkQz/BsmKJtGu8ptfw1v2NxuibS7qOETqMSmq6wYmZt2KtOV1rlvOxw1wtnjWfJsXN72tkGquxb3+cGZ3W9rGDx367eEkwl/YQ3jgeafrQVyQQtX+rjHWQWe5CvUXV27WeGEuydxGONvpqQObng+Usuk=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BM1PR01MB0899.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 08:39:31 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6144:6c26:b949:82c1]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6144:6c26:b949:82c1%5]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 08:39:31 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] Error with fs_fill
Thread-Index: AQHWiOb1wR+MxSPuakqLwclLaeYqcqln0nOAgAAADIo=
Date: Mon, 14 Sep 2020 08:39:31 +0000
Message-ID: <BMXPR01MB23441EA1A33E38BF93274ED1EE230@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB23445019F67B128E04B26612EE250@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>,
 <20200914083623.GA5524@yuki.lan>
In-Reply-To: <20200914083623.GA5524@yuki.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=exaleapsemi.com;
x-originating-ip: [157.33.150.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eef5360f-fd9e-47f4-4912-08d85889b322
x-ms-traffictypediagnostic: BM1PR01MB0899:
x-microsoft-antispam-prvs: <BM1PR01MB089931B937795F1468ECD158EE230@BM1PR01MB0899.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g5NrHvUwknOn9bd+mzRRTB5zaJlh+5ZzO+2OrS5C2tyLHrH5Wz4FG6163UNscxMrG29i1p5FhNBwL2fLT67ZS95TfmjIu/qTbmd4HUVM3bfykktFaY8BBwF9JpHRf+d8Pe2OcuSeoHmeo5L279azSqveoQKhRBuyQxJFD+Iy8eNfshIpWNH2c6MAUsIYVqdXvU3vZtdNdv/ud//BuItQh5xkljZEizDfB7DwZOxQ6y0GTyzTKS+UY0/HHIsaM0aF78WFdtWNTYy7FddbMVOc4xKrvymQd4JVeF+Qwo6qfXoNg6qEbEbbzHB5g57r6WtEcfBjgyq5pWKwdLa8NLVyGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39830400003)(366004)(346002)(376002)(136003)(396003)(4326008)(186003)(53546011)(76116006)(66446008)(26005)(66476007)(52536014)(66556008)(64756008)(6506007)(66946007)(7696005)(316002)(478600001)(5660300002)(6916009)(2906002)(33656002)(8676002)(8936002)(19627405001)(9686003)(55016002)(86362001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wFMh0qyPkF6IOpXRIs+Cr43oFFbLNGsGNi0vtya92Uux7hmAWsvOU4op3WiJvoqs/NMsza3Z6x+aGsWwnqRvdBUH14APdofM4s0V+JmR5LJPJXfh1yFOYk674msviRaFHQuLSa5mxypgyPHcjiyWRBllMkGC+DdQCYJ1x5rKlylFtaPy5AGqJh39nZ6PADMDHgXnhR5ThLIY3ppPMTOKrBsuObfTlEMAkuqBLbbRRnkVH4/vURYQGQdL3QAjmrGC+BAPGBZkNENZi/Ago6TvBAg935R72tKygfiqp6hy3uEkewiL1EE+2AVASiyXKDxeCXcPXncp+j1GMFCMFiHbCBVVHkEhqsGhaGxh5qxxhQvS58eqaXRtCtpeg/OZgtiLaQqdtYRWDBGR9CRZZdDDa+nWs/FASDLpFs8BsmXxOJUKb/nPUh4lvUsOEnstZzXWoS8s06OdbXUNzztZrzQrse75pofuTZDJvqjKaaiNzfkAsJrB81QFUMCos5lzh3yCJ5d/Gie9mmr5JqN6sA2BMK1LE/vmPH9ZpoD7Avguq9X8QVVYZr38nPUrVHrGfDYbElZ/+XaRlZq2cCajxOR49CAsnoIglo01QtdzJJRdl42Llh9xKGe8/Xxp9DvJOT2JhUU8F/EKx4bJeeVbx70TyA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eef5360f-fd9e-47f4-4912-08d85889b322
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 08:39:31.1148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iG3Oe8jgh6jJrPC8dPW6Lps49llIZt4Z1gNkG9erPSZ/UieYYyhW98Oe8RqDB0YwhWwbU3wFnoLktSwijKygta+Xwl0B4nE9TkuFhYTJrKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB0899
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Error with fs_fill
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
Content-Type: multipart/mixed; boundary="===============1833599910=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1833599910==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB23441EA1A33E38BF93274ED1EE230BMXPR01MB2344INDP_"

--_000_BMXPR01MB23441EA1A33E38BF93274ED1EE230BMXPR01MB2344INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
how i can resolve it? is there any way that i can find what's exactly happe=
ning ??


Thanks!
________________________________
From: Cyril Hrubis <chrubis@suse.cz>
Sent: Monday, September 14, 2020 2:06 PM
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] Error with fs_fill

Hi!
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
> tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s
> fs_fill.c:103: INFO: Running 6 writer threads
>      tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
> safe_macros.c:366: BROK: fs_fill.c:55: unlink(mntpoint/thread4/file0) fai=
led: ENOSPC (28)

This is a bug in Btrfs deallocation metadata reservation.

--
Cyril Hrubis
chrubis@suse.cz
[EXT]

--_000_BMXPR01MB23441EA1A33E38BF93274ED1EE230BMXPR01MB2344INDP_
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
how i can resolve it? is there any way that i can find what's exactly happe=
ning ??</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cyril Hrubis &lt;chru=
bis@suse.cz&gt;<br>
<b>Sent:</b> Monday, September 14, 2020 2:06 PM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] Error with fs_fill</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi!<br>
&gt; tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts=3D'' extra =
opts=3D''<br>
&gt; tst_test.c:1250: INFO: Timeout per run is 0h 05m 00s<br>
&gt; fs_fill.c:103: INFO: Running 6 writer threads<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tst_fill_fs.c:59: INFO: write(): ENOSPC =
(28)<br>
&gt; tst_fill_fs.c:59: INFO: write(): ENOSPC (28)<br>
&gt; fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0<br>
&gt; fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0<br>
&gt; tst_fill_fs.c:39: INFO: open(): ENOSPC (28)<br>
&gt; tst_fill_fs.c:39: INFO: open(): ENOSPC (28)<br>
&gt; tst_fill_fs.c:39: INFO: open(): ENOSPC (28)<br>
&gt; fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0<br>
&gt; fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0<br>
&gt; fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0<br>
&gt; safe_macros.c:366: BROK: fs_fill.c:55: unlink(mntpoint/thread4/file0) =
failed: ENOSPC (28)<br>
<br>
This is a bug in Btrfs deallocation metadata reservation.<br>
<br>
--<br>
Cyril Hrubis<br>
chrubis@suse.cz<br>
[EXT]<br>
</div>
</span></font></div>
</body>
</html>

--_000_BMXPR01MB23441EA1A33E38BF93274ED1EE230BMXPR01MB2344INDP_--

--===============1833599910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1833599910==--
