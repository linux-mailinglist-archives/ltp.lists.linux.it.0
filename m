Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE3E1906F3
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 08:59:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEFAE3C4D57
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 08:59:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7C5403C042E
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 08:59:35 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380127.outbound.protection.outlook.com [40.107.138.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B7D4D600E3F
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 08:59:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egRVMZp9vup3eTbpwT/h8tbjniP7Vhg0PtY8Eks3xp5YBxXdCA8myFQNQwu26kt02drilH3XtaX5iiDSOiP6iXhNO+/aozN56756RSt0Hy/VOa0kxhQddcGWV9G0aQ2a5TjsLfoX8RrdvP8BWvcNf+PHF8YmPuBKHYGusXNR/ZN2Of1kG1KupE+o8IO9SYYMtGTCWfEaLCy3fjTXa7Jpnz64EtQNUVScvoL8KZYQp+vsruF7KpYYsa4xZGSLnOzJnbqVKoJcXixPOdUf+yWar9J416+5x3EjZMdSUDWh/sWCnPEbBUTgF27IaCmbMXkS7cQvXox05E4MBXHezntKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOvp60z/6Sm4VcIAOp8+8Z9kef1x0lZHDaQIevk2Lv8=;
 b=ixeO2rCzV31loQX12o3o6R6nc4DeN2DeO0dNQuXFY5Eux70pDYNqZjf+rh9UQEcx3JSje0QX1m7HKvZR0j6ktVY3VSZ4mvmI4plkwZiQbmFCiuOLhaTs98X9Zd6eYBgePV/jravk63Jdm2o398ecVUknnUL3ypOml5tlm4LQ7GdnR3XzY2iOhfsMtnCeGBCZmMspcLwxLkox+N+cumUlJWEfUVmn0BQCUlYrR9AgUl1V6/26M5Gm7bvBAtdlGTboeTTpmTCQ4tQW2Xj9bCX1Q4RIV4+HCJJdMYGHARd7RkHFcI3n0Inuut6pOb+RhgjKKzdObdCT5q9qmNhbX13vRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOvp60z/6Sm4VcIAOp8+8Z9kef1x0lZHDaQIevk2Lv8=;
 b=qLBj4m8SLxQvzsPr8P4nG9FGcRHpbn/2QJL4J1/jCN0mo2jPAYGxwqIv76vY/XkBTFkKZBWyHsnHmsRiURY76MBgEmvOkwDOwjYePpDKtiVQAd6I9nsBqXSE5SmElZkaqxd9eHh+SFme3pBwflzBh24yroCWKAeEtvSDepSwQDg=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1961.INDPRD01.PROD.OUTLOOK.COM (52.134.130.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Tue, 24 Mar 2020 07:59:30 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2835.021; Tue, 24 Mar
 2020 07:59:30 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Thread-Topic: tar01_sh testcase failure
Thread-Index: AQHWAPg3ONQz3X35mU6b1kk/OFsNx6hXYbL8
Date: Tue, 24 Mar 2020 07:59:30 +0000
Message-ID: <MAXPR0101MB146889BD817A82D85D729C27EEF10@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB1468556AA605AAB483768D00EEF00@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR0101MB1468556AA605AAB483768D00EEF00@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e96ba59b-5efd-4dcc-e21d-08d7cfc9484e
x-ms-traffictypediagnostic: MAXPR0101MB1961:
x-microsoft-antispam-prvs: <MAXPR0101MB1961A432B161F8ADB6BEBD53EEF10@MAXPR0101MB1961.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39830400003)(376002)(346002)(396003)(136003)(66556008)(81166006)(9686003)(33656002)(64756008)(2906002)(508600001)(6916009)(7116003)(66476007)(55016002)(81156014)(66446008)(8936002)(8676002)(76116006)(66946007)(316002)(6506007)(7696005)(4326008)(86362001)(71200400001)(5660300002)(55236004)(52536014)(26005)(19627405001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1961;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nF1gIM9TFDELnNIC1xGQAsS/USW4SNijImwOqxKF+86pyFqlVf2toNz8klqAXvMfpIOjqSCZIBb3/6wUYENJq6I+uWB7oaMm7Za2mTd8GtZdfnLZipeWM21NEHHD7gBGVJL8OgUsJOD3ANEAfGMyo73wx3kzChMy8ZOlgRfHyDemYqQsUv7ke7Fswo7l50EImQZAGS0YIQtNC4bXoCfflGh5vPn3GOsc8jtCxWTbefowoql+ez3CB1M2yOWetHdKAR7lOOY1PAqWdcBh0tnFlwkFI7Kex1dT4pqT3UjcfWyBUtdLHNYW3rfHRR77FDDrf5UsCGwvVvCbTb5/8Wo/xK1CHoJSEd2EAFfSm5LAlafXlGsFdabCwpBepjLAKDXn9h5Kd9U1fNmKE8xFfmpoLRm4lj72exgwB6MiEwRgOg297RFbbpjavbGZJZVyZA9l
x-ms-exchange-antispam-messagedata: N/JEa8RcvkCt/lFNeU1piXOg/xYsqX9wBOYY3tMbc3u2kOuCX66vUta8c22eBKqhLvNfQJD77TnqXYWhMRi0HN6/em/2pCZEOaUBI1oiFwF7uOaht4qspx4wUxNZBFdUqw1ZlVt1IzMyfHSYkP3e5g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96ba59b-5efd-4dcc-e21d-08d7cfc9484e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 07:59:30.3080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 97l7W8UNaWRttSB3lgRsV7F3mtf4C2WsI3l1taDe6e4fBvdHy7wiLBDrk7mi1YPnr1pM2YLg2TjiriBXdkZHn0QSzF8b5uq9oD70x5ZevVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1961
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] tar01_sh testcase failure
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
Content-Type: multipart/mixed; boundary="===============0895267960=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0895267960==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB146889BD817A82D85D729C27EEF10MAXPR0101MB1468_"

--_000_MAXPR0101MB146889BD817A82D85D729C27EEF10MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi,
i am trying to run tar01_sh on RISC v with custom yocto distro i am getting=
 following errors can  you help me to reach out to problem.

cmdline=3D"tar_tests.sh"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tar_tests 1 TINFO: timeout per run is 0h 5m 0s
a file1
a file2
a file3
tar_tests 1 TPASS: tar cvf test.tar file1 file2 file3 > tar.out passed as e=
xpected
tar_tests 1 TFAIL: Unexpected number of lines in tar.out
Usage:
  List:    tar -tf <archive-filename>
  Extract: tar -xf <archive-filename>
  Create:  tar -cf <archive-filename> [filenames...]
  Help:    tar --help
tar_tests 1 TFAIL: tar dvf test.tar > tar.out failed unexpectedly
tar_tests 1 TFAIL: Unexpected number of lines in tar.out
tar_tests 1 TPASS: tar tvf test.tar > tar.out passed as expected
tar_tests 1 TPASS: Listing in tar.out is correct
x file1
x file2
x file3
tar_tests 1 TPASS: tar xvf test.tar > tar.out passed as expected
tar_tests 1 TFAIL: Unexpected number of lines in tar.out
tar_tests 1 TPASS: Files were uncompressed correctly
a file4
tar_tests 1 TPASS: tar rvf test.tar file4 > tar.out passed as expected
tar_tests 1 TFAIL: Unexpected number of lines in tar.out
tar_tests 1 TPASS: tar tvf test.tar > tar.out passed as expected
tar_tests 1 TPASS: Listing in tar.out is correct
x file1
x file2
x file3
x file4
tar_tests 1 TPASS: tar xvf test.tar > tar.out passed as expected
tar_tests 1 TFAIL: Unexpected number of lines in tar.out
tar_tests 1 TPASS: Files were uncompressed correctly
a file1
a file2
a file3
tar_tests 2 TPASS: tar cvfz test.tar.gz file1 file2 file3 > tar.out passed =
as expected
tar_tests 2 TFAIL: Unexpected number of lines in tar.out
Usage:
  List:    tar -tf <archive-filename>
  Extract: tar -xf <archive-filename>
  Create:  tar -cf <archive-filename> [filenames...]
  Help:    tar --help
tar_tests 2 TFAIL: tar dvf test.tar.gz > tar.out failed unexpectedly
tar_tests 2 TFAIL: Unexpected number of lines in tar.out
tar_tests 2 TPASS: tar tvf test.tar.gz > tar.out passed as expected
tar_tests 2 TPASS: Listing in tar.out is correct
x file1
x file2
x file3
tar_tests 2 TPASS: tar xvf test.tar.gz > tar.out passed as expected
tar_tests 2 TFAIL: Unexpected number of lines in tar.out
tar_tests 2 TPASS: Files were uncompressed correctly
a file1
a file2
a file3
tar_tests 3 TPASS: tar cvfj test.tar.bz2 file1 file2 file3 > tar.out passed=
 as expected
tar_tests 3 TFAIL: Unexpected number of lines in tar.out
Usage:
  List:    tar -tf <archive-filename>
  Extract: tar -xf <archive-filename>
  Create:  tar -cf <archive-filename> [filenames...]
  Help:    tar --help
tar_tests 3 TFAIL: tar dvf test.tar.bz2 > tar.out failed unexpectedly
tar_tests 3 TFAIL: Unexpected number of lines in tar.out
tar_tests 3 TPASS: tar tvf test.tar.bz2 > tar.out passed as expected
tar_tests 3 TPASS: Listing in tar.out is correct
x file1
x file2
x file3
tar_tests 3 TPASS: tar xvf test.tar.bz2 > tar.out passed as expected
tar_tests 3 TFAIL: Unexpected number of lines in tar.out
tar_tests 3 TPASS: Files were uncompressed correctly
tar_tests 4 TPASS: tar cf test.tar file1 file2 file3 > tar.out passed as ex=
pected
tar_tests 4 TPASS: Tar produced no output
Usage:
  List:    tar -tf <archive-filename>
  Extract: tar -xf <archive-filename>
  Create:  tar -cf <archive-filename> [filenames...]
  Help:    tar --help
tar_tests 4 TFAIL: tar df test.tar > tar.out failed unexpectedly
tar_tests 4 TPASS: Tar produced no output
tar_tests 4 TPASS: tar tf test.tar > tar.out passed as expected
tar_tests 4 TPASS: Listing in tar.out is correct
tar_tests 4 TPASS: tar xf test.tar > tar.out passed as expected
tar_tests 4 TPASS: Tar produced no output
tar_tests 4 TPASS: Files were uncompressed correctly
tar_tests 4 TPASS: tar rf test.tar file4 > tar.out passed as expected
tar_tests 4 TPASS: Tar produced no output
tar_tests 4 TPASS: tar tf test.tar > tar.out passed as expected
tar_tests 4 TPASS: Listing in tar.out is correct
tar_tests 4 TPASS: tar xf test.tar > tar.out passed as expected
tar_tests 4 TPASS: Tar produced no output
tar_tests 4 TPASS: Files were uncompressed correctly
tar_tests 5 TPASS: tar cfz test.tar.gz file1 file2 file3 > tar.out passed a=
s expected
tar_tests 5 TPASS: Tar produced no output
Usage:
  List:    tar -tf <archive-filename>
  Extract: tar -xf <archive-filename>
  Create:  tar -cf <archive-filename> [filenames...]
  Help:    tar --help
tar_tests 5 TFAIL: tar df test.tar.gz > tar.out failed unexpectedly
tar_tests 5 TPASS: Tar produced no output
tar_tests 5 TPASS: tar tf test.tar.gz > tar.out passed as expected
tar_tests 5 TPASS: Listing in tar.out is correct
tar_tests 5 TPASS: tar xf test.tar.gz > tar.out passed as expected
tar_tests 5 TPASS: Tar produced no output
tar_tests 5 TPASS: Files were uncompressed correctly
tar_tests 6 TPASS: tar cfj test.tar.bz2 file1 file2 file3 > tar.out passed =
as expected
tar_tests 6 TPASS: Tar produced no output
Usage:
  List:    tar -tf <archive-filename>
  Extract: tar -xf <archive-filename>
  Create:  tar -cf <archive-filename> [filenames...]
  Help:    tar --help
tar_tests 6 TFAIL: tar df test.tar.bz2 > tar.out failed unexpectedly
tar_tests 6 TPASS: Tar produced no output
tar_tests 6 TPASS: tar tf test.tar.bz2 > tar.out passed as expected
tar_tests 6 TPASS: Listing in tar.out is correct
tar_tests 6 TPASS: tar xf test.tar.bz2 > tar.out passed as expected
tar_tests 6 TPASS: Tar produced no output
tar_tests 6 TPASS: Files were uncompressed correctly

Summary:
passed   51
failed   17
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D45 cstime=3D45
<<<test_end>>>

Thanks!

--_000_MAXPR0101MB146889BD817A82D85D729C27EEF10MAXPR0101MB1468_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>
<div id=3D"appendonsend"></div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div>&nbsp;</div>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
i am trying to run tar01_sh on RISC v with custom yocto distro i am getting=
 following errors can&nbsp; you help me to reach out to problem.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>cmdline=3D&quot;tar_tests.sh&quot;<br>
</span>
<div>contacts=3D&quot;&quot;<br>
</div>
<div>analysis=3Dexit<br>
</div>
<div>&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</div>
<div>tar_tests 1 TINFO: timeout per run is 0h 5m 0s<br>
</div>
<div>a file1<br>
</div>
<div>a file2<br>
</div>
<div>a file3<br>
</div>
<div>tar_tests 1 TPASS: tar cvf test.tar file1 file2 file3 &gt; tar.out pas=
sed as expected<br>
</div>
<div><b>tar_tests 1 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>Usage:<br>
</div>
<div>&nbsp; List: &nbsp; &nbsp;tar -tf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Extract: tar -xf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Create: &nbsp;tar -cf &lt;archive-filename&gt; [filenames...]<b=
r>
</div>
<div>&nbsp; Help: &nbsp; &nbsp;tar --help<br>
</div>
<div><b>tar_tests 1 TFAIL: tar dvf test.tar &gt; tar.out failed unexpectedl=
y<br>
</b></div>
<div><b>tar_tests 1 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>tar_tests 1 TPASS: tar tvf test.tar &gt; tar.out passed as expected<br=
>
</div>
<div>tar_tests 1 TPASS: Listing in tar.out is correct<br>
</div>
<div>x file1<br>
</div>
<div>x file2<br>
</div>
<div>x file3<br>
</div>
<div>tar_tests 1 TPASS: tar xvf test.tar &gt; tar.out passed as expected<br=
>
</div>
<div><b>tar_tests 1 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>tar_tests 1 TPASS: Files were uncompressed correctly<br>
</div>
<div>a file4<br>
</div>
<div>tar_tests 1 TPASS: tar rvf test.tar file4 &gt; tar.out passed as expec=
ted<br>
</div>
<div><b>tar_tests 1 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>tar_tests 1 TPASS: tar tvf test.tar &gt; tar.out passed as expected<br=
>
</div>
<div>tar_tests 1 TPASS: Listing in tar.out is correct<br>
</div>
<div>x file1<br>
</div>
<div>x file2<br>
</div>
<div>x file3<br>
</div>
<div>x file4<br>
</div>
<div>tar_tests 1 TPASS: tar xvf test.tar &gt; tar.out passed as expected<br=
>
</div>
<div><b>tar_tests 1 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>tar_tests 1 TPASS: Files were uncompressed correctly<br>
</div>
<div>a file1<br>
</div>
<div>a file2<br>
</div>
<div>a file3<br>
</div>
<div>tar_tests 2 TPASS: tar cvfz test.tar.gz file1 file2 file3 &gt; tar.out=
 passed as expected<br>
</div>
<div><b>tar_tests 2 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>Usage:<br>
</div>
<div>&nbsp; List: &nbsp; &nbsp;tar -tf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Extract: tar -xf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Create: &nbsp;tar -cf &lt;archive-filename&gt; [filenames...]<b=
r>
</div>
<div>&nbsp; Help: &nbsp; &nbsp;tar --help<br>
</div>
<div><b>tar_tests 2 TFAIL: tar dvf test.tar.gz &gt; tar.out failed unexpect=
edly<br>
</b></div>
<div><b>tar_tests 2 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>tar_tests 2 TPASS: tar tvf test.tar.gz &gt; tar.out passed as expected=
<br>
</div>
<div>tar_tests 2 TPASS: Listing in tar.out is correct<br>
</div>
<div>x file1<br>
</div>
<div>x file2<br>
</div>
<div>x file3<br>
</div>
<div>tar_tests 2 TPASS: tar xvf test.tar.gz &gt; tar.out passed as expected=
<br>
</div>
<div><b>tar_tests 2 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>tar_tests 2 TPASS: Files were uncompressed correctly<br>
</div>
<div>a file1<br>
</div>
<div>a file2<br>
</div>
<div>a file3<br>
</div>
<div>tar_tests 3 TPASS: tar cvfj test.tar.bz2 file1 file2 file3 &gt; tar.ou=
t passed as expected<br>
</div>
<div><b>tar_tests 3 TFAIL: Unexpected number of lines in tar.ou</b>t<br>
</div>
<div>Usage:<br>
</div>
<div>&nbsp; List: &nbsp; &nbsp;tar -tf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Extract: tar -xf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Create: &nbsp;tar -cf &lt;archive-filename&gt; [filenames...]<b=
r>
</div>
<div>&nbsp; Help: &nbsp; &nbsp;tar --help<br>
</div>
<div><b>tar_tests 3 TFAIL: tar dvf test.tar.bz2 &gt; tar.out failed unexpec=
tedly<br>
</b></div>
<div><b>tar_tests 3 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>tar_tests 3 TPASS: tar tvf test.tar.bz2 &gt; tar.out passed as expecte=
d<br>
</div>
<div>tar_tests 3 TPASS: Listing in tar.out is correct<br>
</div>
<div>x file1<br>
</div>
<div>x file2<br>
</div>
<div>x file3<br>
</div>
<div>tar_tests 3 TPASS: tar xvf test.tar.bz2 &gt; tar.out passed as expecte=
d<br>
</div>
<div><b>tar_tests 3 TFAIL: Unexpected number of lines in tar.out</b><br>
</div>
<div>tar_tests 3 TPASS: Files were uncompressed correctly<br>
</div>
<div>tar_tests 4 TPASS: tar cf test.tar file1 file2 file3 &gt; tar.out pass=
ed as expected<br>
</div>
<div>tar_tests 4 TPASS: Tar produced no output<br>
</div>
<div>Usage:<br>
</div>
<div>&nbsp; List: &nbsp; &nbsp;tar -tf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Extract: tar -xf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Create: &nbsp;tar -cf &lt;archive-filename&gt; [filenames...]<b=
r>
</div>
<div>&nbsp; Help: &nbsp; &nbsp;tar --help<br>
</div>
<div><b>tar_tests 4 TFAIL: tar df test.tar &gt; tar.out failed unexpectedly=
</b><br>
</div>
<div>tar_tests 4 TPASS: Tar produced no output<br>
</div>
<div>tar_tests 4 TPASS: tar tf test.tar &gt; tar.out passed as expected<br>
</div>
<div>tar_tests 4 TPASS: Listing in tar.out is correct<br>
</div>
<div>tar_tests 4 TPASS: tar xf test.tar &gt; tar.out passed as expected<br>
</div>
<div>tar_tests 4 TPASS: Tar produced no output<br>
</div>
<div>tar_tests 4 TPASS: Files were uncompressed correctly<br>
</div>
<div>tar_tests 4 TPASS: tar rf test.tar file4 &gt; tar.out passed as expect=
ed<br>
</div>
<div>tar_tests 4 TPASS: Tar produced no output<br>
</div>
<div>tar_tests 4 TPASS: tar tf test.tar &gt; tar.out passed as expected<br>
</div>
<div>tar_tests 4 TPASS: Listing in tar.out is correct<br>
</div>
<div>tar_tests 4 TPASS: tar xf test.tar &gt; tar.out passed as expected<br>
</div>
<div>tar_tests 4 TPASS: Tar produced no output<br>
</div>
<div>tar_tests 4 TPASS: Files were uncompressed correctly<br>
</div>
<div>tar_tests 5 TPASS: tar cfz test.tar.gz file1 file2 file3 &gt; tar.out =
passed as expected<br>
</div>
<div>tar_tests 5 TPASS: Tar produced no output<br>
</div>
<div>Usage:<br>
</div>
<div>&nbsp; List: &nbsp; &nbsp;tar -tf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Extract: tar -xf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Create: &nbsp;tar -cf &lt;archive-filename&gt; [filenames...]<b=
r>
</div>
<div>&nbsp; Help: &nbsp; &nbsp;tar --help<br>
</div>
<div><b>tar_tests 5 TFAIL: tar df test.tar.gz &gt; tar.out failed </b>unexp=
ectedly<br>
</div>
<div>tar_tests 5 TPASS: Tar produced no output<br>
</div>
<div>tar_tests 5 TPASS: tar tf test.tar.gz &gt; tar.out passed as expected<=
br>
</div>
<div>tar_tests 5 TPASS: Listing in tar.out is correct<br>
</div>
<div>tar_tests 5 TPASS: tar xf test.tar.gz &gt; tar.out passed as expected<=
br>
</div>
<div>tar_tests 5 TPASS: Tar produced no output<br>
</div>
<div>tar_tests 5 TPASS: Files were uncompressed correctly<br>
</div>
<div>tar_tests 6 TPASS: tar cfj test.tar.bz2 file1 file2 file3 &gt; tar.out=
 passed as expected<br>
</div>
<div>tar_tests 6 TPASS: Tar produced no output<br>
</div>
<div>Usage:<br>
</div>
<div>&nbsp; List: &nbsp; &nbsp;tar -tf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Extract: tar -xf &lt;archive-filename&gt;<br>
</div>
<div>&nbsp; Create: &nbsp;tar -cf &lt;archive-filename&gt; [filenames...]<b=
r>
</div>
<div>&nbsp; Help: &nbsp; &nbsp;tar --help<br>
</div>
<div><b>tar_tests 6 TFAIL: tar df test.tar.bz2 &gt; tar.out failed unexpect=
edly</b><br>
</div>
<div>tar_tests 6 TPASS: Tar produced no output<br>
</div>
<div>tar_tests 6 TPASS: tar tf test.tar.bz2 &gt; tar.out passed as expected=
<br>
</div>
<div>tar_tests 6 TPASS: Listing in tar.out is correct<br>
</div>
<div>tar_tests 6 TPASS: tar xf test.tar.bz2 &gt; tar.out passed as expected=
<br>
</div>
<div>tar_tests 6 TPASS: Tar produced no output<br>
</div>
<div>tar_tests 6 TPASS: Files were uncompressed correctly<br>
</div>
<div><br>
</div>
<div>Summary:<br>
</div>
<div>passed &nbsp; 51<br>
</div>
<div>failed &nbsp; 17<br>
</div>
<div>skipped &nbsp;0<br>
</div>
<div>warnings 0<br>
</div>
<div>&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</div>
<div>initiation_status=3D&quot;ok&quot;<br>
</div>
<div>duration=3D1 termination_type=3Dexited termination_id=3D1 corefile=3Dn=
o<br>
</div>
<div>cutime=3D45 cstime=3D45<br>
</div>
<div>&lt;&lt;&lt;test_end&gt;&gt;&gt;<br>
</div>
<span></span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks!<br>
</div>
</div>
</div>
</body>
</html>

--_000_MAXPR0101MB146889BD817A82D85D729C27EEF10MAXPR0101MB1468_--

--===============0895267960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0895267960==--
