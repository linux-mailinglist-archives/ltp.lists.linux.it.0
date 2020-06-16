Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE01FB5A6
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 17:07:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 981D13C2D04
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 17:07:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9907C3C2CE8
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 17:07:47 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380131.outbound.protection.outlook.com [40.107.138.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 35B8463BE52
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 17:07:46 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpN1KSJIOVq7jyHjnu1odU/5pLBZMuYYF81HfbW6QODwjVG0cSAGjm8sX4n3ponbgYdI5wOktEO7CLvmpVfAaugvuqdAKXBjbQpt+i1PjKWUroU9sC5vsoy8urxVBwppy35bZE4kNi3OKFs1XbenQORiphIVMeFsQFVLuwe+p5IB91DI47m/8uiC3+xfLUMti+Za5428FUOsZavPnyP8ovU0vsm9M2r/0jGvwrGMCYDESwK40w//W1XVOC4a4xEefVmjIfXIj6EXakHYrhnudpSKxo9V8fH88NCCnslB4bq29nwzvgnHVymzJycXbroX94ufzvVcUYGkXZDnhGcVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKspyqqeorfiVrZsC2kngs8wu2GwUSjdtPEQMkO7SP8=;
 b=l2PxWU/jpDQPGILtrdTotuIGbYirpbwZqs6x1gqqEDlEiC/LxJog/cwhXgUTD2w5sk6tbtEP40K14wDAtM24rnlP3tt2em00+usboYCey/tmrJCp6zN3Jx5yiLeXlBE2GfPCfmcTLXQsG6RWqSlqom2+w/rD8fq1qv82CDIPHmPTbQY0BMMj2s7gwgqIOs9EvHkNwXgXa7k5RLQGjM5PXecqivNHgLIyc9KNxT7X+uzihxu4UHfHNfFhBe3AAuLHOann7mF2+trBSvTs/WgrhQXrEB+H8ZAWAHR2aFQjHUTQb3zEV19cQp2hhFEJcXVabNqmj6JraYXTfq3T3CuSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKspyqqeorfiVrZsC2kngs8wu2GwUSjdtPEQMkO7SP8=;
 b=0QCTyZbf4Ul25co5Qd1q4g8MdrskB9wPy0f6Q2stMG5KAFGUGcuDKY2V9jMNYGQQxSEP51kyI+lokAbJXEgs2CV9uWy4yHS46wqKuO2/5V2+CTaYshxCwRMrGN6Kg5rhV/0TDwPUB8gGj4ioTIdrgEfDoxNYBc71utWa1urWYs0=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BMXPR01MB2760.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 16 Jun
 2020 15:07:43 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::adf5:6e2d:b2df:3e72]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::adf5:6e2d:b2df:3e72%2]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 15:07:43 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: LTP memcg testcase failure
Thread-Index: AQHWQ7dFDRNCRCmbh0CEoq8ppziBKg==
Date: Tue, 16 Jun 2020 15:07:43 +0000
Message-ID: <BMXPR01MB23442A6584269E9AFC24D7E9EE9D0@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [2409:4042:2e0a:949a:99e7:40d2:f7dc:23f1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccc33614-43c0-4c40-bb8d-08d812070510
x-ms-traffictypediagnostic: BMXPR01MB2760:
x-microsoft-antispam-prvs: <BMXPR01MB2760BFF1E7B0931BB3F30E13EE9D0@BMXPR01MB2760.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A4xiQmIsIGJs/yLox0JHN4TGqQU4yligJAadPFp2WUcks4+JRjR7CzYx0gTv8R8TbY69/Ke0I8gG863vBmX1Q/hzeUenEnfam/iQw92RidDMjW4bpdBYEqtwXMmrKTT1rE5VGnVQLoK389fDjKV3BmueAHnNcZDvmwqUvnuGQtjjV+mL3Gx3iPJZb8uMPXOjCHTT3zakE6DI7e4TWwK/gM2OzGXnX36nVwvin4hWaUNU+4HA2dz0RimnaZhe04yWAhJIhlOG0WOMDT9rec0zKGk0pTXRy2mb5ieI18GwVP6BtMYftrOwIREc/ITZ4L7XGvpbB2Uls8YQlkrQU8xH2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(136003)(39830400003)(366004)(376002)(396003)(508600001)(6506007)(186003)(33656002)(8676002)(86362001)(55016002)(8936002)(9686003)(19627405001)(6916009)(316002)(7696005)(2906002)(52536014)(5660300002)(3480700007)(66946007)(76116006)(66476007)(66556008)(64756008)(66446008)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mi/cTfJ5uNKDVsCN9Jt5evlrTUA0bgqRQl4LHC0n3z74DiAhtwz07SEH80UQYmTCsiGp2AmsowR5yPietI+JBFra5eY9LNQfqg4I1KROMJ8HcTf3ZVvnkCEmGNF2xDCndtXDaXhnDslBDWwyfpMSUw4S04T8fwah29ljM/Id0h7JGXHrI4SYgE8CB38ikFEQ3zx3GDPQIOnG5MMJ1k8kfSJ8x4kNogG7kYGOBR4xDc2sh46pgESWYme5chsIdH6OByxNEnDky/CV5lsEMq3cfP+HIKmjHs4BVKQrIkHBGnVYxUkLZ7c7TJxNU+N3Xr/pJVSx1eKKGaFChSsXrBj/zk0aPQwWRcIdVaYAIY/HfMVLwyOaYR4RtHmybvLpznjKaH+gWuyOIRxZ0IcNjGBaVh4fYZmxikBBIbC2TEYu+uUnQ8kuGi0OqkZlk7/MYwvKj/iHWDxfXe37sC2vQ8DKLS41nFnwi2Y0aPKioJ7DanKTleDmG5RdMigc7L968y0nEkf77JIMqKZhFrwcrrp7ggmG+tnB1Iq+/LmSKclgwRcSvtJAGTi5YxWqPZzvuQ2P
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc33614-43c0-4c40-bb8d-08d812070510
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 15:07:43.0509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1Q/YPtd4aoK6L0i6eCR9Da8dtU/sf6EQs1kxZB6Uyz28k/R6NV1HlO0iQouos8sgTh0R4lZuxxaYsdROAuMkNfGHClPj3JkrTm/LwnA7Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2760
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] LTP memcg testcase failure
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
Content-Type: multipart/mixed; boundary="===============1427747611=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1427747611==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB23442A6584269E9AFC24D7E9EE9D0BMXPR01MB2344INDP_"

--_000_BMXPR01MB23442A6584269E9AFC24D7E9EE9D0BMXPR01MB2344INDP_
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
n my arch because of is these test are failing??Can anyone help me on this?=
?

Thanks!



--_000_BMXPR01MB23442A6584269E9AFC24D7E9EE9D0BMXPR01MB2344INDP_
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
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am trying to run ltp with kernel 5.5.6 ut i found that the few tests from=
 the memcg groups are failing i didnt understood the exact reason of failur=
e am listing the test cases along with error log of few test</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>1) memcg_max_usage_in_bytes<br>
</span>
<div>2) memcg_stat<br>
</div>
<div>3) memcg_use_hierarchy<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
when i am trying to run&nbsp;<span style=3D"font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255); display: inline =
!important">memcg_max_usage_in_bytes</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important"><b>$#</b><span><b=
>cmdline=3D&quot;memcg_usage_in_bytes_test.sh&quot;</b><br>
</span>
<div>contacts=3D&quot;&quot;<br>
</div>
<div>analysis=3Dexit<br>
</div>
<div>&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
</div>
<div>memcg_usage_in_bytes_test 1 TINFO: Starting test 1<br>
</div>
<div><b>/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: D=
evice or resource busy<br>
</b></div>
<div><b>memcg_usage_in_bytes_test 1 TINFO: set /dev/memcg/memory.use_hierar=
chy to 0 failed</b><br>
</div>
<div>memcg_usage_in_bytes_test 1 TINFO: Running memcg_process --mmap-anon -=
s 4194304<br>
</div>
<div>memcg_usage_in_bytes_test 1 TINFO: Warming up pid: 98968<br>
</div>
<div>memcg_usage_in_bytes_test 1 TINFO: Process is still here after warm up=
: 98968<br>
</div>
<div>memcg_usage_in_bytes_test 1 TFAIL: memory.usage_in_bytes is 4202496, 4=
194304 expected<br>
</div>
<div>memcg_usage_in_bytes_test 2 TINFO: Starting test 2<br>
</div>
<div><b>/opt/ltp/testcases/bin/memcg_lib.sh: line 522: echo: write error: D=
evice or resource busy<br>
</b></div>
<div><b>memcg_usage_in_bytes_test 2 TINFO: set /dev/memcg/memory.use_hierar=
chy to 0 failed</b><br>
</div>
<div>memcg_usage_in_bytes_test 2 TINFO: Running memcg_process --mmap-anon -=
s 4194304<br>
</div>
<div>memcg_usage_in_bytes_test 2 TINFO: Warming up pid: 98988<br>
</div>
<div>memcg_usage_in_bytes_test 2 TINFO: Process is still here after warm up=
: 98988<br>
</div>
<div>memcg_usage_in_bytes_test 2 TFAIL: memory.memsw.usage_in_bytes is 4325=
376, 4194304 expected<br>
</div>
<div>&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
</div>
<span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;i would like to mention that memory resource controller is not availa=
ble on my arch because of is these test are failing??Can anyone help me on =
this??</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_BMXPR01MB23442A6584269E9AFC24D7E9EE9D0BMXPR01MB2344INDP_--

--===============1427747611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1427747611==--
