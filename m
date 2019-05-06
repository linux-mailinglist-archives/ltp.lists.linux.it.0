Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE46914455
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 07:56:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CEDC3EAEB6
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 07:56:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 70BAB3EA65D
 for <ltp@lists.linux.it>; Mon,  6 May 2019 07:56:54 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4FC3B1A01214
 for <ltp@lists.linux.it>; Mon,  6 May 2019 07:56:52 +0200 (CEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x465ulHb044503
 for <ltp@lists.linux.it>; Mon, 6 May 2019 01:56:50 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sacfa5jrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Mon, 06 May 2019 01:56:50 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <ltp@lists.linux.it> from <kribalac@in.ibm.com>;
 Mon, 6 May 2019 05:56:50 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 6 May 2019 05:56:46 -0000
Received: from us1a3-mail124.a3.dal06.isc4sb.com ([10.146.45.139])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2019050605564583-71141 ;
 Mon, 6 May 2019 05:56:45 +0000 
In-Reply-To: 
From: "Krishnaja Balachandran1" <kribalac@in.ibm.com>
To: ltp@lists.linux.it
Date: Mon, 6 May 2019 05:56:46 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17394-1588 | IBM Domino Build
 SCN1812108_20180501T0841_FP38 April 10, 2019 at 11:56
X-KeepSent: 435A6BA2:86450EF6-002583F2:002085EF;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 35519
X-TNEFEvaluated: 1
x-cbid: 19050605-3107-0000-0000-00000B01C38F
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.405782; ST=0; TS=0; UL=0; ISC=; MB=0.000005
X-IBM-SpamModules-Versions: BY=3.00011057; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01199262; UDB=6.00629153; IPR=6.00980138; 
 BA=6.00006298; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00026749; XFM=3.00000015;
 UTC=2019-05-06 05:56:48
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-05-06 00:25:09 - 6.00009890
x-cbparentid: 19050605-3108-0000-0000-00006671D156
Message-Id: <OF435A6BA2.86450EF6-ON002583F2.002085EF-002583F2.0020A9EA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.7 required=7.0 tests=HTML_MESSAGE,
 HTML_MIME_NO_HTML_TAG, MIME_HTML_ONLY,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] Need help with executing aiocp and aiodio testcases using
	runltp
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1937291572=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1937291572==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Hi,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >How can I use test script using the command in "ltp-aiodi=
o.part1" so that it does not show 'No such file or directory' messages like=
 mentioned is below:
<pre><code>&lt;&lt;&lt;test=5Foutput&gt;&gt;&gt;
/mnt/btrfs/ltp-YDf6hqyDqk/aiodio.6470/ff1: No such file or directory
...
&lt;&lt;&lt;test=5Foutput&gt;&gt;&gt;
/mnt/btrfs/ltp-YDf6hqyDqk/aiodio.6471/ff2: No such file or directory
...
</code></pre>
<div>&nbsp;</div>
<div><br>Currently I run as:<br>/opt/ltp/runltp -f ltp-aiodio.part1<br>and<=
br>/opt/ltp/runltp -f ltp-aiodio.part1 -s aiocp</div>
<div>&nbsp;</div></div>
<div dir=3D"ltr" ><a href=3D"https://github.com/linux-test-project/ltp/issu=
es/261" >https://github.com/linux-test-project/ltp/issues/261</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" =
><div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif;=
 color: #7C7C5F;" ><span style=3D"color:#b22222;" ><span style=3D"font-fami=
ly: times new roman,times,serif;" ><span style=3D"font-size: 1em;" >Thanks =
&amp; Regards,</span></span></span></div>
<div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif; =
color: #7C7C5F;" >&nbsp;</div>
<div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif; =
color: #7C7C5F;" ><span style=3D"color:#808080;" >Krishnaja Balachandran</s=
pan></div>
<div style=3D"font-size: 10pt; font-weight: bold; font-family: sans-serif;"=
 >Software Developer - ISST Linux</div>
<div style=3D"font-size: 8pt; font-family: sans-serif; margin-top: 10px;" >=
<div><span style=3D"font-weight: bold; color: #336699;" >Phone: </span>80-4=
17-77021</div>
<div><span style=3D"font-weight: bold; color: #336699;" >E-mail: </span><a =
href=3D"mailto:kribalac@in.ibm.com" style=3D"color: #555" >kribalac@in.ibm.=
com</a></div></div></div></div></div></div><BR>


--===============1937291572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1937291572==--
