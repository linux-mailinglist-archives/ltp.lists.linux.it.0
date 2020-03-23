Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB88D18F2ED
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 11:37:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73DBE3C4E57
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 11:37:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 63BEB3C4E37
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 11:37:23 +0100 (CET)
Received: from IND01-BO1-obe.outbound.protection.outlook.com
 (mail-eopbgr1390123.outbound.protection.outlook.com [40.107.139.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C9CBF600C67
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 11:37:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jvs1g7ew7ShoCCA/4s8gkzfViq+aOuUsFziS/0kGbhn6VrCxcT0oNj9velY3eBLQ8AlcewxoKsPmYFMz0PIG4KQKNL0HtbiOnuXJuxD1Sf1eWuXOFD3EiVcdVfa8XhUyq69GQklGbUsadWN8W5N8vIE+PciJpICiwltyx3RPj5ds7SswNxIgCv79rw6ZOwEVEx5c89v3oDRLnxyckgdTQ/Sg3rXWRklBQswx1++fPrpety8x7LcgeJ8/IFvXCESW610MQdxRy7KaKngOhBgIHpKHK1SXO7QiYCfr5nLBG3qGsjk+mpDE8Dd2S4FqQGyOK8V+p2wc+YxtMMaJ6vlC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/kHhrp984wkMo+0EpQsngwzD8Jfk+gRtJn5d14vTgA=;
 b=dxhHE8UnAs0zpuEtLnL1Tr9yWpb4sHXYZsjM+q3SZPOZjD3+7k4DN1xau4npQ8Cko5jOeGsP2krCNBNnTvX/D1YePC6nngRwXyndyCpF6DjFlXdclYUkapz/d2ARuCISEuQdg0319V0ZbxbGM64BTEAwW71fbWuNfzIROuNyNVI1vFKjiHofYnEd8qi21nZGhhCTkP5mfaJhwO7vnTZFS4KDYwyMjNIY2igDCXyJphNNLWej3WaqPIURekVmRRqHgWKa+SKaYwRA//kSoZiEQAQC9EBxP6fdK6YagE+fJ8egCzToA2U7fJI3mYEMfgKUN5g6I9XONsPIuexWxUhwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/kHhrp984wkMo+0EpQsngwzD8Jfk+gRtJn5d14vTgA=;
 b=J4Y4O+1H1DyH1lPZJEg9e12c4gRirOVXFyulhE3tuN+ZnaRQ9mecXQ5pJPZuA56QMnpIJx0fZ/eM6caGrHlKOdiBrd4vIj7j5WXAzwvnJFVy0JKzIwhHJpsFjPJadhkObnw82YBdwMAAQfsxYFNXF3CedeOtBRbEU/9I/lnP9v8=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Mon, 23 Mar 2020 10:37:18 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2835.021; Mon, 23 Mar
 2020 10:37:17 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: tar01_sh testcase failure
Thread-Index: AQHWAPg3ONQz3X35mU6b1kk/OFsNxw==
Date: Mon, 23 Mar 2020 10:37:17 +0000
Message-ID: <MAXPR0101MB1468556AA605AAB483768D00EEF00@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [49.35.101.176]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e15688cb-30be-4243-428c-08d7cf1628e5
x-ms-traffictypediagnostic: MAXPR0101MB1468:
x-microsoft-antispam-prvs: <MAXPR0101MB1468DBFC9E5E110FFF3A2FF4EEF00@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(376002)(366004)(136003)(39830400003)(199004)(76116006)(508600001)(91956017)(6916009)(52536014)(5660300002)(66476007)(186003)(66556008)(64756008)(19627405001)(26005)(66946007)(66446008)(33656002)(6506007)(2906002)(71200400001)(316002)(7696005)(8936002)(81156014)(81166006)(7116003)(8676002)(55016002)(86362001)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR0101MB1468;
 H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rpu88iHLizSqWcldGwTui6jC249OB+FI+0gjI5WDZK2Uqc2dQEKx1NeZGk8AuJZLZIBIPzeq3RW+lgo8lW9xG6ex5U/3Aj4+ALvF/LAxzdQ//KEoW4caW867HA93kR5CLcq6XqNrkyF31XWQueP/JtPVvTon4HuN7eLZA9y6DNv/mU78X3WbIZ0WzvTs957iHxeowIPnKA8CRJUa0aCdrtc3qphM5zhnD6WSdhJl+9lkVRhiWNCmoClg4Yk4qCcSvXY4HfsjjZjFALqq3KSKXRRDjUKEvvUnCnymzQ3mjoI2zQX/QceeRcQFTiPXTUHBJngD6v4UH11/R8rwQad8qRyklHkWWU3NCzrshIUfKMtMb37OhHG9xtWyJci+SVS/LAPf/I1SP2qeP1Th6gXJI+jk4QWhrEf+oMWDfDo8kfFa5gGllN97jFlj7znL1UQ3
x-ms-exchange-antispam-messagedata: Xn9tBtDF/zIvdTdD5/mS2dyXwJGBr+pYv+0rpptYXpGDuQw0lNc+gT73jvFkLQtypMrT1C0/NlSeCWqxXDyTMW0aEmbPsKqfzbhelix4QWWjOJt5/smWinPE9roMa1eYk2KvUXaP9PQaoCpEemoBtw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15688cb-30be-4243-428c-08d7cf1628e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 10:37:17.7488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PzyUxwH8oRvI6KxdT6gdff1OQ0plvOtEWvuwPe2KZhFt/LoxmxpzL5MvqyoOc7AfOMJuxo7Ro2YPK4s0+qK7xu8v8x2nr4xHlmSeNablxDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1468
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0208089682=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0208089682==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1468556AA605AAB483768D00EEF00MAXPR0101MB1468_"

--_000_MAXPR0101MB1468556AA605AAB483768D00EEF00MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
i am trying to run tar01_sh on RISC v with custom yocto distro i am getting=
 following errors

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

--_000_MAXPR0101MB1468556AA605AAB483768D00EEF00MAXPR0101MB1468_
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
i am trying to run tar01_sh on RISC v with custom yocto distro i am getting=
 following errors</div>
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
</body>
</html>

--_000_MAXPR0101MB1468556AA605AAB483768D00EEF00MAXPR0101MB1468_--

--===============0208089682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0208089682==--
