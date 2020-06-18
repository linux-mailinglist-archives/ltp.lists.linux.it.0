Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0046B1FEA77
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 06:56:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B943F3C2C7B
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 06:56:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 704853C23CD
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 06:56:42 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380128.outbound.protection.outlook.com [40.107.138.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F333D6008FF
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 06:56:40 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiIPLA71i1mmpr9eGVfizexseVS06jv17Dbk3ImYvst7MlVrwxuHxv1T8T1Taw7k7REm4o09cMeoUY0lQOb3LKw8hJtDxwAJbD8Y9vg7sWVJkwYAg8Ort/SY/9gfxp2VsdLn++zLXExMu2g7P/SI3CH9lMvo0kRIv+kNFa5ez0cCfDMqgbXh84qrjnugpnYOBovQ8D2rbpjQztoZBheV29cxok+VYdGwaZqHNUSr+7ZIYBZ9rMbBTXA194yaq86RUkh2RCie6qgQOdw1x9lDKS08mUP0PyuthBnieUnCHUT6A1VvgGJnrD3wQqUwn4CA015vqfyyN1x1ze06iFdP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGHdITyVY/B3kmQKxxIs8zkogAB6sAltCEr14TB54dc=;
 b=HOfcrVA4h1CcneTSSn0XyvAHuXD1kIR2SUXIYe2jcxhn2wQzIdMEwJonXxeh4qT7vJhUqiOf4R+4nJOdOJT8ucQpEwJy86Zgw/ou+ow1czcKE2Ti14v2EOm0TeypLtjDnI0Vo5O88shbL26LZREVoR4kJ/u9YeQQfEwF/igohKn7h340HQXQFK+9Ql7kkAmYo1FigLiz087eGixS8sefF5dPGcrjhA7US5SH1GOKI6RlfGwJdm6DCojveciVACNu7ewRuE6KPvSeqIl+XYQM//hD8h+lGt9NgQ/i2OuyizpSDIMUaoeFAXjDLoWcjpzs2iyYFQJl1wnKrcQRPOCxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGHdITyVY/B3kmQKxxIs8zkogAB6sAltCEr14TB54dc=;
 b=uaPMRzsV5StBAN8ZdsFkWovNhbp98jHL7x/34BpyytFR1ijRGtrX5RCh+Vva2YrKrqPiSaVXEA6NUt8JFp+uy2jsl8qGgDHNhg11Bj6PP+R1/Z96s8T3nSDKwc6JSeYcMaWPasL0iymhHO0u+/DhyStmDNj+SgdyyEMdOlLQSR0=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB2405.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Thu, 18 Jun
 2020 04:56:38 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::adf5:6e2d:b2df:3e72]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::adf5:6e2d:b2df:3e72%2]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 04:56:37 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: Jan Stancek <jstancek@redhat.com>
Thread-Topic: memcg group test failures
Thread-Index: AQHWRSyg7gYiru8s8kuOSFKUfNwfMg==
Date: Thu, 18 Jun 2020 04:56:37 +0000
Message-ID: <BMXPR01MB2344701A885DDCF9CDECE48CEE9B0@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none; redhat.com; dmarc=none action=none header.from=exaleapsemi.com; 
x-originating-ip: [2409:4042:2e0a:949a:8da8:e45d:72cc:7478]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88a9190c-6d7d-44de-3926-08d81343fbb8
x-ms-traffictypediagnostic: BMXPR01MB2405:
x-microsoft-antispam-prvs: <BMXPR01MB240569194A63415B74FBEC24EE9B0@BMXPR01MB2405.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6mKary+01kd48nuM9gqVAH2G2R2XI4fOnIYVkCYhemH+rYHLgvwlwCtOHjrzTVxGdBghSM9tmsforjdJKSdO+cEoCF1yRTTC5UgjpdTEDlOGJrpcz4H23IDpAql2RrRLs6ZCPCzFt01tdkT+ZGfBFiKpKvC9OyDqoHIvWHp+C06eYDis9A2ftd5E4XuW1je6SPdZD8T2GmfmZtpeaa1zgAffU07nXLjieAb9av7/l+etpejWg0A3SmggBCYGIhpdP8Ypf9ZePyUWRUp2LPHZjHfKo6wd1aY1VTsoZxDiNEBkWqZkRoD8cevtSJjdnvgQgbpobEn0EDqjxc9y1fbOlw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(396003)(39830400003)(376002)(346002)(33656002)(83380400001)(55016002)(5660300002)(71200400001)(8676002)(76116006)(66446008)(64756008)(6506007)(66556008)(7696005)(9686003)(66946007)(66476007)(52536014)(6916009)(4326008)(86362001)(2906002)(3480700007)(316002)(186003)(19627405001)(508600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 3QLpxvUYuSgmX4ywmFu62t2b6BtpI5XGEEmAqBMAIm8j7FJOHKnLqGQv4ajrY2Ka3yoiht7Ic1q3DG9r+gIKHXgFHGPOket9KcEKPKhl5DCsiQRE5y2GU7EINdgi8TzmStBF9Y0AbHE9gGcea58wY/M0dh2mBA88vvBXg+cIerH5Rav0/aIK9Rp3oMe+7BasMCONfVKQKQ316MS2whhg/r6MLOZde9FCeYTWk5QSR6ONpLdLpKE33XJRdu3JenhJu6rquXRFVR9Tb+cDa3Qya7+6TliXaVz4d/7uyjEV5xhUAMSqyj+3hqliwUErzdO5YJJb2ZzVi9P8GbTGcl4bFJlvpfmeKzurkpicEgWtEGlv/j4cZ1RH5B52jvuOBx5s987dJY4jEN4erd2/HDOdEoj6z7nAR8vD1yvbCwkg680JMNZmnFeZy66CrQi6ZK3HG9kxGhBe00HM9fFMMlqcvGjoGdr03inuBlwRmTgdTqgW24eNp75pC6I1u2evu306dDVecpoVi0tm+ywyLE4YPH6c5Kx7IVp5KlYYCqMszir+0E/YTDy1N3j94lN/ntcT
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a9190c-6d7d-44de-3926-08d81343fbb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 04:56:37.9416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Srl3klGTFZXIhqQrGy6vPAmo9Z9ZBOTX5+xEYGlHn39t6MUmffD0DZ8eDmvSETohDIRPaerKHSesVkAcA2jMzP3Pt+RtKHzMOpkPAphz6Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2405
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] memcg group test failures
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
Content-Type: multipart/mixed; boundary="===============1863489195=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1863489195==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2344701A885DDCF9CDECE48CEE9B0BMXPR01MB2344INDP_"

--_000_BMXPR01MB2344701A885DDCF9CDECE48CEE9B0BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to run ltp with kernel 5.5.6 ut i found that the few tests from=
 the memcg groups are failing i didnt understood the exact reason of failur=
e am listing the test cases along with error log of few test

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
n my arch because of this can they fail ??Can you help me on this??

Thanks!



--_000_BMXPR01MB2344701A885DDCF9CDECE48CEE9B0BMXPR01MB2344INDP_
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
lvetica, sans-serif">
Hi,</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
I am trying to run ltp with kernel 5.5.6 ut i found that the few tests from=
 the memcg groups are failing i didnt understood the exact reason of failur=
e am listing the test cases along with error log of few test</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<span style=3D"margin: 0px">1) memcg_max_usage_in_bytes<br>
</span>
<div style=3D"margin: 0px">2) memcg_stat<br>
</div>
<div style=3D"margin: 0px">3) memcg_use_hierarchy<br>
</div>
<span style=3D"margin: 0px"></span><br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
when i am trying to run&nbsp;<span style=3D"margin: 0px; background-color: =
rgb(255, 255, 255); display: inline !important">memcg_max_usage_in_bytes</s=
pan></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<span style=3D"margin: 0px; background-color: rgb(255, 255, 255); display: =
inline !important"><br>
</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<span style=3D"margin: 0px; background-color: rgb(255, 255, 255); display: =
inline !important"><b>$#</b><span style=3D"margin: 0px"><b>cmdline=3D&quot;=
memcg_usage_in_bytes_test.sh&quot;</b><br>
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
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<span style=3D"margin: 0px; background-color: rgb(255, 255, 255); display: =
inline !important"><br>
</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
&nbsp;i would like to mention that <b>memory resource controller is not ava=
ilable</b> on my arch because of this can they fail ??Can you help me on th=
is??</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Thanks!</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<br style=3D"font-size: 16px; background-color: rgb(255, 255, 255)">
</div>
<br>
</div>
</body>
</html>

--_000_BMXPR01MB2344701A885DDCF9CDECE48CEE9B0BMXPR01MB2344INDP_--

--===============1863489195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1863489195==--
