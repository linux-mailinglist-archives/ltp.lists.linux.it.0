Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56520F568
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 15:06:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4DF43C56E6
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 15:06:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D21983C2AE5
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 15:06:42 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380119.outbound.protection.outlook.com [40.107.138.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4468F600351
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 15:06:41 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLiJKufAYMvW0r9fJcCKrzGU+sV9k0zJJ8xNrfNR/2Yc7oOwKr6bRTNILUBzj1X25kq9D1rbE2vCdMdDmXTfs48IgM0Ah5Bzy5FyrWwEp8ToHJrbHM9UtfDb6UrWvc5SErn2Jo8nuGuCCF0bq8TfFhgwbXcr5RnmcpkHXWwRWruUniTulS+S9XlzpkLizLMgwB4A7a5g3EZUSgkG0dzfcJz4CGhtZUa6o8wa94nAYUO3DvRk6MfecJqTi04NOmYGLjRN3cqZB6IYcGpHTFZvu7OdQizrTULd5GoleVkqMq/S0xkj/Lfb4YsAokOb/MCR/zI+rZqCU6oZhfAaVaEpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIJcf9kZq1VRnnUITIbpq4tcA63+AXEvsjVjb3NsE24=;
 b=lae7r28furLZcyY0+7meaV4QJV589pxkOQpCFsLqZRa4PLdX/WTFkrHhltbFnoBOklJABI1SL3kDIpGibcRCgZAclsOttEOd0UUsU6SsX5qF2KkukGiN/7p/lAwnOIETFfvFWg1/vW0qI81EdikLGCim0KT13dq1Tx1MqtlkJFVALjdS1ARXI1b366WOg4q+Xaq5Rpb1j8dL7PV27I4T2v5UXxBZXv+DSU+VLFp8RHPtHG204sASeGW7JgfUisrNjsr8ego9u+0BcBJa75RoQHMHGBnBCExccJltlmlC3oRgKE3BMLHco40NcDMUvehZYQGqCWY4AxySBsfszyn9kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIJcf9kZq1VRnnUITIbpq4tcA63+AXEvsjVjb3NsE24=;
 b=RM3iNUpGjrwqEvfviC8aYXzgRpfKQxf6TsZTxkinnZiD8ezP3B8Uw2guHnBVm6M2P4lCoZC0W8tjlV/5HnZZriY3O0/loJuRy3ItWiyeuFfYaq1DaP4F4iwJwP4mZ3jPNq1P+OxvSfyo04/YWlbgSUe/GzKvjr/zFXfHKt4qaPY=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB0951.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:12::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Tue, 30 Jun
 2020 13:06:38 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::adf5:6e2d:b2df:3e72]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::adf5:6e2d:b2df:3e72%2]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 13:06:37 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: Memcg testcase failure
Thread-Index: AQHWTt8KnS8ycf5pIUS8F0JmiLlOAg==
Date: Tue, 30 Jun 2020 13:06:37 +0000
Message-ID: <BMXPR01MB2344F43177589233AA67FF27EE6F0@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none; redhat.com; dmarc=none action=none header.from=exaleapsemi.com; 
x-originating-ip: [2409:4042:e0f:aecf:980b:247c:8eba:dc69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 680f2841-364e-4e9b-7971-08d81cf66c69
x-ms-traffictypediagnostic: BMXPR01MB0951:
x-microsoft-antispam-prvs: <BMXPR01MB0951E0F696435B86A7AB86EAEE6F0@BMXPR01MB0951.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iScU6+nSBfe6gd+2YUqTd81BGHpIvMBq2F1KYTYJQSVrOWbI3oiGjZUA2wz5u07CjN6+3Qty+dzBGSglzHY7CSpwXukYY2Hxi334LG3ipeavjA6wq7OMwX8hTwlb2fUrx/P6ze4pll5NerHgayE4qkzwC4fofhS1S1bpai89q1IUY4xX2hOgFiy5hq4tnAgp7a0qQnRSgI3Gb4xr2CBSoGlGYRTbeHy4tsGAo1zYv5rtZ5+ht5VVrWdxJiDiFaNy9oQhpLLmZTZNaVT718CoH+CNjsQPRwbAbYJcR0i1+oY6rP5Wa3jNoAHlh33UCw5tsd6rU0kkxw/w+F9pq0NOeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(39830400003)(366004)(396003)(136003)(8676002)(86362001)(186003)(316002)(19627405001)(8936002)(5660300002)(33656002)(7116003)(83380400001)(66476007)(3480700007)(9686003)(66556008)(55016002)(66946007)(7696005)(64756008)(66446008)(6506007)(6916009)(508600001)(52536014)(4326008)(2906002)(71200400001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Q/R74NWCyxk6jPNRH9zsOzjr/fVVChT4dvByryW6ELDoVka0DeVOH8+BufzJWTxZ8Ll+9L8r+k0z0d8e3+C5rgdHrLH1T4QfAkSWNxpVb1eLx7G2cHPQWHK2oJ5fuygJA6+Qz1Zi54Swhv6rmNlTBTeN2CX+8cv83QfrVGtUAnnP9YlLvoEz25MYkpRewCSaKXADhw1Rjjv7SvO4QG48wT+DDty/AZMVljhNTKLgU6UcQaPNyylxI4vL2i4Agjg1oDmCaoHlwtctBkei7RkKNWuexHVql+jUugs8Fjyjfc5rMnzQLqQ2LCDqQ9lFhM4Pr6CwFwHzKnbOmz7HCurE1uQMgyRmPjUibgEncGJlPBDT705K19iOrIgqVJ8vd4LrKGETIaf4HWl8fqZoJyBExeiJhClZ8aRuosYoiVRDErtMmzcfktb627RvkCPG+lXg5+vzoZJ7GxHx4whiwOK/u+CDUzKc1/Ai9rqO9jBcftpv0GSGW4rIC1kITEWe3KbMzD7OX8bwmnFfswhjIeEG6K6qt55JoJ+t7VsISEpUzNPPcLYI4s1d96fr6mu3U28F
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 680f2841-364e-4e9b-7971-08d81cf66c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 13:06:37.6960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7mMIdw9j6dygtKB41Z9PL0aHVYcY09jDFmURY5l95lvYROMbvxEy+yM3yI1ko2VmFCVXOerto5d9HsPtT7eYOqqMXN47JkBayuqUvadYurQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0951
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] Memcg testcase failure
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
Content-Type: multipart/mixed; boundary="===============0743354875=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0743354875==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2344F43177589233AA67FF27EE6F0BMXPR01MB2344INDP_"

--_000_BMXPR01MB2344F43177589233AA67FF27EE6F0BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to run ltp with kernel 5.5.6 and i found that the few tests fro=
m the memcg groups are failing i didnt understood the exact reason of failu=
re am listing the test cases along with error log of few test can you help =
me on this??

1) memcg_max_usage_in_bytes
2) memcg_stat
3) memcg_use_hierarchy

when i am trying to run memcg_max_usage_in_bytes

$#cmdline=3D"memcg_usage_in_bytes_test.sh"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
memcg_usage_in_bytes_test 1 TINFO: Starting test 1
/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Device or=
 resource busy
memcg_usage_in_bytes_test 1 TINFO: set /dev/memcg/memory.use_hierarchy to 0=
 failed
memcg_usage_in_bytes_test 1 TINFO: Running memcg_process --mmap-anon -s 419=
4304
memcg_usage_in_bytes_test 1 TINFO: Warming up pid: 98968
memcg_usage_in_bytes_test 1 TINFO: Process is still here after warm up: 989=
68
memcg_usage_in_bytes_test 1 TFAIL: memory.usage_in_bytes is 4202496, 419430=
4 expected
memcg_usage_in_bytes_test 2 TINFO: Starting test 2
/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: Device or=
 resource busy
memcg_usage_in_bytes_test 2 TINFO: set /dev/memcg/memory.use_hierarchy to 0=
 failed
memcg_usage_in_bytes_test 2 TINFO: Running memcg_process --mmap-anon -s 419=
4304
memcg_usage_in_bytes_test 2 TINFO: Warming up pid: 98988
memcg_usage_in_bytes_test 2 TINFO: Process is still here after warm up: 989=
88
memcg_usage_in_bytes_test 2 TFAIL: memory.memsw.usage_in_bytes is 4325376, =
4194304 expected
<<<execution_status>>>

 i would like to mention that memory resource controller is not available o=
n my arch because of this can they fail ??Can you help me on this?? I am st=
uck with this from long back

Thanks!


--_000_BMXPR01MB2344F43177589233AA67FF27EE6F0BMXPR01MB2344INDP_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: black; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px">Hi,</span><br>
</div>
<div style=3D"margin: 0px; font-size: 15px; font-family: &quot;Segoe UI&quo=
t;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-=
system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;=
 color: rgb(32, 31, 30); background-color: rgb(255, 255, 255)">
<div dir=3D"ltr" style=3D"margin: 0px">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: black">
<div style=3D"margin: 0px">I am trying to run ltp with kernel 5.5.6 and i f=
ound that the few tests from the memcg groups are failing i didnt understoo=
d the exact reason of failure am listing the test cases along with error lo=
g of few test can you help me on this??</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px"><span style=3D"margin: 0px">1) memcg_max_usage_i=
n_bytes<br>
</span>
<div style=3D"margin: 0px">2) memcg_stat<br>
</div>
<div style=3D"margin: 0px">3) memcg_use_hierarchy<br>
</div>
<span style=3D"margin: 0px"></span><br>
</div>
<div style=3D"margin: 0px">when i am trying to run&nbsp;<span style=3D"marg=
in: 0px; background-color: white">memcg_max_usage_in_bytes</span></div>
<div style=3D"margin: 0px"><span style=3D"margin: 0px; background-color: wh=
ite"><br>
</span></div>
<div style=3D"margin: 0px"><span style=3D"margin: 0px; background-color: wh=
ite"><b>$#</b><span style=3D"margin: 0px"><b>cmdline=3D&quot;memcg_usage_in=
_bytes_test.sh&quot;</b><br>
</span>
<div style=3D"margin: 0px">contacts=3D&quot;&quot;<br>
</div>
<div style=3D"margin: 0px">analysis=3Dexit<br>
</div>
<div style=3D"margin: 0px">&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 1 TINFO: Starting test=
 1<br>
</div>
<div style=3D"margin: 0px"><b>/opt/ltp/testcases/bin/memcg_lib.sh: line 522=
: echo: write error: Device or resource busy<br>
</b></div>
<div style=3D"margin: 0px"><b>memcg_usage_in_bytes_test 1 TINFO: set /dev/m=
emcg/memory.use_hierarchy to 0 failed</b><br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 1 TINFO: Running memcg=
_process --mmap-anon -s 4194304<br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 1 TINFO: Warming up pi=
d: 98968<br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 1 TINFO: Process is st=
ill here after warm up: 98968<br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 1 TFAIL: memory.usage_=
in_bytes is 4202496, 4194304 expected<br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 2 TINFO: Starting test=
 2<br>
</div>
<div style=3D"margin: 0px"><b>/opt/ltp/testcases/bin/memcg_lib.sh: line 522=
: echo: write error: Device or resource busy<br>
</b></div>
<div style=3D"margin: 0px"><b>memcg_usage_in_bytes_test 2 TINFO: set /dev/m=
emcg/memory.use_hierarchy to 0 failed</b><br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 2 TINFO: Running memcg=
_process --mmap-anon -s 4194304<br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 2 TINFO: Warming up pi=
d: 98988<br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 2 TINFO: Process is st=
ill here after warm up: 98988<br>
</div>
<div style=3D"margin: 0px">memcg_usage_in_bytes_test 2 TFAIL: memory.memsw.=
usage_in_bytes is 4325376, 4194304 expected<br>
</div>
<div style=3D"margin: 0px">&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</div>
<span style=3D"margin: 0px"></span></span></div>
<div style=3D"margin: 0px"><span style=3D"margin: 0px; background-color: wh=
ite"><br>
</span></div>
<div style=3D"margin: 0px">&nbsp;i would like to mention that<span style=3D=
"margin: 0px">&nbsp;</span><b>memory resource controller is not available</=
b><span style=3D"margin: 0px">&nbsp;</span>on my arch because of this can t=
hey fail ??Can you help me on this?? I am stuck with
 this from long back</div>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">Thanks!</div>
</div>
</div>
</div>
<br>
</div>
</body>
</html>

--_000_BMXPR01MB2344F43177589233AA67FF27EE6F0BMXPR01MB2344INDP_--

--===============0743354875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0743354875==--
