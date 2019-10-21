Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB6DE6A9
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 10:36:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09B0C3C250D
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 10:36:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EDB9B3C250D
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 10:14:47 +0200 (CEST)
Received: from alexa-out-tai-02.qualcomm.com (alexa-out-tai-02.qualcomm.com
 [103.229.16.227])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 294B01400DDC
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 10:14:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qcdkim; t=1571645686; x=1603181686;
 h=from:to:subject:date:message-id:mime-version;
 bh=hTcleDrMUjU16IuIHi+0/0/+kluNcOvbR18gGglmc3E=;
 b=IzChR6IsWC7DQT38887tgWmhZRT8nYC+LPtm1zEEqOKX1HDKXFPRlfd2
 wl3+VsLM7Q++R1q1Y8vI7atfFSS3029MR0hgmWBGffeQXz+i/xhdcDW7D
 3ftOe8roonCQ/ABBsdEQdjej4BuX7LazPMr2cJTq7y7RkoopKIXbK38rQ E=;
Received: from ironmsg03-tai.qualcomm.com ([10.249.140.8])
 by alexa-out-tai-02.qualcomm.com with ESMTP; 21 Oct 2019 16:14:42 +0800
IronPort-SDR: yl9nxltyX4QC0k3N3g4evwJ2zwVwIB1M+EpfVG8gcZGtvR+dWAMCqHg2mZWLuCDNO0WdTxyt//
 ztUy8V8s7iJzr1ftef9aLKKove+UiGbuM=
Received: from aptaiexm02b.ap.qualcomm.com ([10.249.150.12])
 by ironmsg03-tai.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Oct 2019 16:14:39 +0800
Received: from aptaiexm02f.ap.qualcomm.com (10.249.150.16) by
 aptaiexm02b.ap.qualcomm.com (10.249.150.12) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3; Mon, 21 Oct 2019 16:14:37 +0800
Received: from aptaiexm02f.ap.qualcomm.com ([fe80::4152:1436:e436:faa1]) by
 aptaiexm02f.ap.qualcomm.com ([fe80::4152:1436:e436:faa1%19]) with mapi id
 15.00.1473.005; Mon, 21 Oct 2019 16:14:37 +0800
From: Xiang Li <lixian@qti.qualcomm.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Bug report in read_all.c
Thread-Index: AdWH2/TI3veigLkQQXO52r6YDaCyhQ==
Date: Mon, 21 Oct 2019 08:14:37 +0000
Message-ID: <0641c15377874db893088e4f65102ec6@aptaiexm02f.ap.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.249.136.10]
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 21 Oct 2019 10:36:53 +0200
Subject: [LTP] Bug report in read_all.c
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
Content-Type: multipart/mixed; boundary="===============1548208118=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1548208118==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_0641c15377874db893088e4f65102ec6aptaiexm02fapqualcommco_"

--_000_0641c15377874db893088e4f65102ec6aptaiexm02fapqualcommco_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to report a bug I found lately in LTP testcase source code.
The bug is located at: https://github.com/linux-test-project/ltp/blob/maste=
r/testcases/kernel/fs/read_all/read_all.c#L123
This bug may cause the read_all testcase terminated unexpectedly before the=
 reading thread complete its job.

In the source code, at the end of the function queue_pop(), it stores i + 1=
 into the q->front to update the front indicator.
But under some circumstances it will store 16384 which is the default lengt=
h of the queue size.
When this happens, the next time queue_pop() is called, it will perform a r=
ead action that overstep the array boundary which is q->data[16384].
If the value stored there is 0, the queue_pop() will immediately return 0 a=
nd the whole testcase is broken.
This happens when there is a whole file path stores exactly at the end of t=
he data array. In this situation, i equals 16383 when while() ends.

Modifying i + 1 to (i + 1) % QUEUE_SIZE at the source code Line#123 can eas=
ily fix it.
This bug is not triggered on every machine because the files are different =
between target machine.
Adjust the length of the QUEUE_SIZE will help you reproduce this bug.


Regards,
Xiang


--_000_0641c15377874db893088e4f65102ec6aptaiexm02fapqualcommco_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I would like to report a bug I found lately in LTP t=
estcase source code.<o:p></o:p></p>
<p class=3D"MsoNormal">The bug is located at: <a href=3D"https://github.com=
/linux-test-project/ltp/blob/master/testcases/kernel/fs/read_all/read_all.c=
#L123">
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs/r=
ead_all/read_all.c#L123</a>
<o:p></o:p></p>
<p class=3D"MsoNormal">This bug may cause the read_all testcase terminated =
unexpectedly before the reading thread complete its job.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the source code, at the end of the function <b>qu=
eue_pop()</b>, it stores i &#43; 1 into the q-&gt;front to update the front=
 indicator.
<o:p></o:p></p>
<p class=3D"MsoNormal">But under some circumstances it will store 16384 whi=
ch is the default length of the queue size.<o:p></o:p></p>
<p class=3D"MsoNormal">When this happens, the next time <b>queue_pop()</b> =
is called, it will perform a read action that overstep the array boundary w=
hich is q-&gt;data[16384].<o:p></o:p></p>
<p class=3D"MsoNormal">If the value stored there is 0, the <b>queue_pop()</=
b> will immediately return 0 and the whole testcase is broken.<o:p></o:p></=
p>
<p class=3D"MsoNormal">This happens when there is a whole file path stores =
exactly at the end of the
<b>data</b> array. In this situation, i equals 16383 when while() ends.<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Modifying i &#43; 1 to (i &#43; 1) % QUEUE_SIZE at t=
he source code Line#123 can easily fix it.<o:p></o:p></p>
<p class=3D"MsoNormal">This bug is not triggered on every machine because t=
he files are different between target machine.
<o:p></o:p></p>
<p class=3D"MsoNormal">Adjust the length of the QUEUE_SIZE will help you re=
produce this bug.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Xiang<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_0641c15377874db893088e4f65102ec6aptaiexm02fapqualcommco_--

--===============1548208118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1548208118==--
