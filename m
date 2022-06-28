Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A417565D32
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jul 2022 19:49:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0ED3F3CA0AB
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jul 2022 19:49:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D88DB3C3030
 for <ltp@lists.linux.it>; Tue, 28 Jun 2022 07:15:13 +0200 (CEST)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01olkn2041.outbound.protection.outlook.com [40.92.53.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9A8832009E9
 for <ltp@lists.linux.it>; Tue, 28 Jun 2022 07:15:12 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFRBMFgLw/dqwEf/6wxBne7g/oAvTZ8nN5Rck4jkkUUH+B11y/wzxLxzNgAipZ5fTR2FNuiYmLM0J2lNpaCbucx7LGkviarOkskNrL375Wv/UzXl6FVbbp9/4fvazMHM6Fh3RJg96wUev50t7EdkktzqRvfpCLDE8hwTgm2XXtwb9aZpvxrfLB3ZL5xSTmULnvhwxclZTUrrFec32kASDWTg9AnwmFqJBknVhYTqwWBj+dwJrIEk4rrkvE59tbLnNb4HIK74a7GhKLi0Y5U7AXCdPJJVAbgnIh12gSpxFZtwFuTHWWfbhpWgwqV7UOjgNJGtsR2WjjKqO5+5IrBotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQSsjCbBHIkga4e/OfPPjn2tNLYGA9aGHMuohSNeGw0=;
 b=Z66CyhhjRRTYMbeNnOFiQDCgpfG9iInBVmKCct9FxS/HwKF2sQ+elUhB1AQubLULM6oRjv50wwHTgwzTWwcG+d0pk0N70Lx/835zNBjePBrRKiIXnP/WKt/mvTHQjVhSwTKhJeVmXhd+vb9wK11kgojVgZ651nuI/0jKEp2kOvswuJI1DJX5ONhiQkU9CsD4kODtN9WRjVrb3kBkem14ZAQnjam4+PAFPdVYKivR/CWB++KEtYO+XwP7nL9G99xqjpTfLT+y9LBZwcQW6VS4GD87KSnzGd7wwbJtbwvwRJOHrKKql7++zZ8kT3PgLiupQUgiTg9sZ/pUzevH5IddGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQSsjCbBHIkga4e/OfPPjn2tNLYGA9aGHMuohSNeGw0=;
 b=S+u8dSV9lDjLV7aG74EXkBOJrFRkiSnBhutG7NEH0GfLmuCC3QT9fdkeYH8PDoyDpBiFNFEDNFaHzgrFK7Rov7e1pWlebWd7XIaY/fl50nQE0IXrqNKq7/D9ntug+yXGhFf2m97RKlEF0kD0c0PAm0mntRhM58nN77qjgAa8ceCHK3mNPAAfyUV2iKFee7+l+LfoL8yJQdaT5RB/75qIhcWcqtjs6y+3p6yQ+hqk4jqhFEkEGLcO+9MUf88iKa46g4RjAbBaGo6TLxlj9bdgiVKS7iLz84GBNJfCjdRW+0vDMPA1w5rGs0c0ucs+KTJLpcqG63PswWmTKjglLT+ZKA==
Received: from SG2PR02MB5531.apcprd02.prod.outlook.com (2603:1096:4:1c6::12)
 by TYZPR02MB5152.apcprd02.prod.outlook.com (2603:1096:400:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 05:15:09 +0000
Received: from SG2PR02MB5531.apcprd02.prod.outlook.com
 ([fe80::18e4:26cb:7496:4b72]) by SG2PR02MB5531.apcprd02.prod.outlook.com
 ([fe80::18e4:26cb:7496:4b72%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 05:15:09 +0000
From: Tan Chun Hau <tanchunhau@hotmail.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: Inquiry about LTP-DDT
Thread-Index: AQHYiq4BR1773hn84EyBTlfMXNPI8g==
Date: Tue, 28 Jun 2022 05:15:09 +0000
Message-ID: <SG2PR02MB5531A7D1E054AF95B1B74452D8B89@SG2PR02MB5531.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [+BOqUVMsofbtfcMAlteqRxv2s7okbN3R]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4dc02efe-1c08-44c8-a770-08da58c52ba9
x-ms-traffictypediagnostic: TYZPR02MB5152:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jsiuMhC7OzZUEGjaSbfmuhTNQp4gAtHBtGfbVUgF2WnGjgq5+xhz3kjZ6kOghJj/HDVCcOxND+ulBAgc7TE+G8XcOqiKyx8EZaBSP3xLtY49c/UuByKvKNgIlmnK01bnyoqAGrgAvM3tzT8e+naHHDsBG5zh1Nxft6ML2NxfLVtnifnTqlPm/lB7hgnxz+kl9Jn8C4UymveRpwEZ/8gik1Uieo6WMxJJOFF5D6LZvo/OYXyRShkJG2ERgxdxN146i5igrutGQTOT0XdqtTlK/hkuySwHQdoXeGZ2BRA/aO4zryUs4thDn8e5bND9V062QLs0dgE77Iu7mAiD24B/2GDkkvZ5748e8zVFsd8HHFZklS4zOUfdWOeBRghyL7S+q/7Rpf7wJLGyXu0qG1L1a8ZPh43EgZWqjmCZcgzpDJVL0aUbFJxX7u3guzqaHUulxB4tM5sFj8s9AvJzqAotMLiBNWV+tkq1bXKZ2zpizNfa9lVqdwGW5Sr4Qa/seSjViyGqKaS1/cFEbeLlH5Hufa34en/+FpO05FXYDOCt82T8vHYgW1GsWtR1lyxjr0pfhRXN1P0SQFci93thHW3/O8iZ5JViNNqo6mBzicKQCKtj7jUz7LeGzXdAjUQRCHBT
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?k0rw4WvP7k5UQ9/1V+tY/2cLjWpLhllYCH1XpfUZ0sFyzY8h94Ggmx2U9U?=
 =?iso-8859-1?Q?HNc0Iuv0VJKc/OXTR65WeH7gpgSItnYYnypZD6OcPTnKSH8KtCahKxs0qd?=
 =?iso-8859-1?Q?0oG8ih8FJjBX844DSr33ABZ6ZO2EPN0o83TGgp6Kd9lBCRZbMJZuSRHIhk?=
 =?iso-8859-1?Q?xKOoUpMAJhCRMuE1Pi06z826sNpphIu01P5bqS2EMUtZUkxCp+Sr4Iy5Ln?=
 =?iso-8859-1?Q?5hbt2LvYZtmwA8Cobsed902V8uhFYpbpb2co7AYQnB7tKQVudTJFaMyQ3X?=
 =?iso-8859-1?Q?C/CjTMsG3IiU/CImQoKT8FU/lZCrGRNBgEoQOhETYdnhsNT95I6yRoeWxP?=
 =?iso-8859-1?Q?prhMBBkuzGhawjUK04Zwi4V6SZDLegrQulvZcc9XoWSdwMQgtZO0xpJhLB?=
 =?iso-8859-1?Q?AvRFGf/+6x5koH7Cco8WXq8g1PNxJuwPK2hGShSVjHGK9fu/1y0EbzTUas?=
 =?iso-8859-1?Q?sjfau2mYN+1zG8sxjH0cTJtHx6qQ4MJxb2Cd45aNyx++yxtQ9NOzeAnKi4?=
 =?iso-8859-1?Q?7pHWx+jqNQ2Qv+JR3US0lwT3bWZ5O4jDr+j3Ag0/GcymDvBOkVCdXb64TZ?=
 =?iso-8859-1?Q?n1DAicqyF/xf32PsOzrkZfh5im1wzkeiHgvPycjBlfymZIFhiDPlotxQOD?=
 =?iso-8859-1?Q?q9F6ompk8XgOxfkFCNMl02X7QxT6Sasg8bb77iC0mARH/qBSk1TLPt4ig2?=
 =?iso-8859-1?Q?it2lHl/NjUHVlvsFdC6AA+YtUMcAv2QUVpA8BYigsZUWYj/oZcS7NLo9eX?=
 =?iso-8859-1?Q?yv3TJwyBEdbAfH3Klc8v6oVcxxE2L7CTwobsbYzqlTd4gm1KW9XPUOkAVL?=
 =?iso-8859-1?Q?6Xtf2Cc8/NXgYEq5uBWBENc+QZOnHOQ6gg8/g6QZdjhduiNGnd4FB0UzVx?=
 =?iso-8859-1?Q?IE1UiRJc0Y7W3s06f1cjylZ8h8GPU84tkQqNllB5lvGOL/oAMelZ7/Iq/f?=
 =?iso-8859-1?Q?B2otaNBbaQLpJg5uFYZn8/xdq0iu9sw5GMZHV2QOnCGWCTeCjK0pBFiMXf?=
 =?iso-8859-1?Q?yVRa0ZF6f5nwIF99/+7Nj1VzMorHvXG7bc5tvnu9YHoR8yQ4W76d+RudIQ?=
 =?iso-8859-1?Q?T4xSxY3X7WxMiWf/WuJcV73aCQSeRmcw1O/m6ay50Os48be/eiEtNAWeDD?=
 =?iso-8859-1?Q?Ly87MtY1gR2EGigMa2BqTQ+qqvwmMfECBKmSiaWL7QejKG6dJIlrAT8uB3?=
 =?iso-8859-1?Q?ddkpLzGKI3UiGKzRAmlk7yD1EiHWeNthn4F2e8nac9cqntxUeADZEWMyJd?=
 =?iso-8859-1?Q?T+VHqiBEVdNkcWQs4EpfdO9mRx3UBIBJ8s51Bn/XuVT5g3fq3hkS+F7Xtd?=
 =?iso-8859-1?Q?Jiubr+uLZoXFxVSHqku2sMwRmQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-20e34.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB5531.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc02efe-1c08-44c8-a770-08da58c52ba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 05:15:09.0530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB5152
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 Jul 2022 19:48:50 +0200
Subject: [LTP] Inquiry about LTP-DDT
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
Content-Type: multipart/mixed; boundary="===============1357549100=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1357549100==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SG2PR02MB5531A7D1E054AF95B1B74452D8B89SG2PR02MB5531apcp_"

--_000_SG2PR02MB5531A7D1E054AF95B1B74452D8B89SG2PR02MB5531apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,



I am a software engineer from Malaysia,

I learn LTP-DDT through this article<https://software-dl.ti.com/processor-s=
dk-linux/esd/docs/latest/linux/Foundational_Components_Kernel_LTP-DDT_Valid=
ation.html>



I am interested in be user or probably contributor(in future) for LTP-DDT

I notice that the latest commit to LTP-DDT was 2021-04-19

http://arago-project.org/git/projects/test-automation/ltp-ddt.git?p=3Dproje=
cts/test-automation/ltp-ddt.git;a=3Dsummary



I have some questions :

1.) Is LTP-DDT project still carry on ?

2.) What is the frequency or prerequisite of merging latest release of LTP =
into LTP-DDT ?

      - From my observation,  ... --> 20180515 --> 20180926 --> 20190115 --=
> 20190517 --> 20200930 --> 20210121

will be appreciate if someone can answer it.



Thank you very much !



Note:

I tried send email to opentest@arago-project.org but it doesn't work.



Best regards,

Tan Chun Hau


--_000_SG2PR02MB5531A7D1E054AF95B1B74452D8B89SG2PR02MB5531apcp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
<span style=3D"background:white">Hi,</span></p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E" =
lang=3D"zh-CN">
&nbsp;</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
I am a software engineer from Malaysia,</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt"><span style=3D=
"color:#201F1E">I learn LTP-DDT through this&nbsp;</span><a href=3D"https:/=
/software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Foundational_=
Components_Kernel_LTP-DDT_Validation.html">article</a><span style=3D"color:=
#201F1E">&nbsp;</span></p>
<p style=3D"margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
I am interested in be user or probably contributor(in future) for LTP-DDT</=
p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
I notice that the latest commit to LTP-DDT was&nbsp;<span style=3D"font-wei=
ght:bold">2021-04-19</span></p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt"><a href=3D"htt=
p://arago-project.org/git/projects/test-automation/ltp-ddt.git?p=3Dprojects=
/test-automation/ltp-ddt.git;a=3Dsummary">http://arago-project.org/git/proj=
ects/test-automation/ltp-ddt.git?p=3Dprojects/test-automation/ltp-ddt.git;a=
=3Dsummary</a></p>
<p style=3D"margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
I have some questions :</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
1.) Is LTP-DDT project still&nbsp;carry on ?</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
2.) What is the frequency or&nbsp;prerequisite&nbsp;of merging latest relea=
se of LTP into LTP-DDT ?</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
&nbsp; &nbsp; &nbsp; - From my observation,&nbsp; ... --&gt; 20180515 --&gt=
;&nbsp;20180926 --&gt;&nbsp;20190115 --&gt;&nbsp;20190517 --&gt;&nbsp;20200=
930 --&gt;&nbsp;20210121</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
will be appreciate if someone can answer it.</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
Thank you very much !</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
Note:&nbsp;</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
I tried send email to&nbsp;opentest@arago-project.org but it doesn't work.<=
/p>
<p style=3D"margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
Best regards,</p>
<p style=3D"margin:0in;font-family:Calibri;font-size:12.0pt;color:#201F1E">=
<span style=3D"background:white">Tan Chun Hau</span></p>
<br>
</div>
</body>
</html>

--_000_SG2PR02MB5531A7D1E054AF95B1B74452D8B89SG2PR02MB5531apcp_--

--===============1357549100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1357549100==--
