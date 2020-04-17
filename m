Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F21AD879
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 10:25:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D05D3C640D
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 10:25:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 951CE3C2AC6
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 10:25:25 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380090.outbound.protection.outlook.com [40.107.138.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8E66D1400E4C
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 10:25:23 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUuCSjXfTi1vuinWCXl9BiYfL1nqVpvKXfHWTFrijdvaR+cLtcFyLhM0ZPPX/aEaD0vSSIeF96LHj0vTUx7ky85huU3sFTFVun5tNYZGCD+cdgF3dg+QrC5ASecepA7nkkQcdL90ZCLIVXXL2wLus81ozEHoDBm9Y29lbpfldy0lPmCQd3wSLbhcrL2B2drf6Y5Dg9bJ/o6+fq8EpjIgRufzPKKxfCkIpQZp8+zGZyGQEYWMRHWgmOVBjC8pgbydB0Bq8Jeu9EgpPth+HoUZDDAL3ikW5YSBgivTxg9nvlVTqFBkO4Gn6quJtSdLtGtoX/PzQdkyGga7hbc5WVeSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm3kuQ5p+aQ2XFspJbJu+K0uQrPfmQl9N8UHRwL5IIk=;
 b=cu1GtdBR9CcMYg5Z4a+SlK4OtFwi7svzH+m3TNNxBIinNrSLFEz/lljVAaUY10Lk4FzFCyLOdCksRJZfwOviR69+2C7pWZ5n2afMXD3Z9U6BPlw3yCATK9jkux/FXcB2ES3Ex9WTbflaSkRcdpAq+CTk1N6eK5btTdc6/F5IyMf2XY4ugoy6yHt0e35dawKWHKYjNCNJrEQUyqXxrHu2ylQb0p/soiVNesfB95b/hQArhRG/1rvI1zSfjJLdnY/u15lkw47cH7eTzHn2kF92/EjG6IEhOhp4qoczefmIb4oS4a7YaML13S3rQJ3DkFL9G5jIj8SCbQbIWewYXA6HxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm3kuQ5p+aQ2XFspJbJu+K0uQrPfmQl9N8UHRwL5IIk=;
 b=MAeAD5NP7VgICJ3KAzT3CqpbZyhj5C9gqf5PeGlWn/Yoi8t52Yxxm7VbXC1Ay8fqF8jOrxdR4ZJG8HRPQwCc99KqLFM8nKAFA3W5ruNXXGWR53mkFrPXo6kolcQouxVPX7QtgC4FRkoQqV4LwJQDYmc8iuC9w0Bt1/2o3nUmWK8=
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM (52.134.133.8) by
 MAXPR0101MB1977.INDPRD01.PROD.OUTLOOK.COM (52.134.129.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15; Fri, 17 Apr 2020 08:25:20 +0000
Received: from MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7]) by MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ace1:f4f2:a1c6:20d7%12]) with mapi id 15.20.2921.027; Fri, 17 Apr
 2020 08:25:20 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: CPU scheduler tweaking
Thread-Index: AQHWFIuylgS7qt90KUqfrhgv2gKd06h8+eAP
Date: Fri, 17 Apr 2020 08:25:19 +0000
Message-ID: <MAXPR0101MB14682145A869C861F69F90B3EED90@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB146818D05980CCA8D2162996EED90@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR0101MB146818D05980CCA8D2162996EED90@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Pankaj.VJ@exaleapsemi.com; 
x-originating-ip: [2405:204:9390:b338:dc1:878b:88:62ed]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9459e49b-ba6c-4be4-302a-08d7e2a8ddda
x-ms-traffictypediagnostic: MAXPR0101MB1977:
x-microsoft-antispam-prvs: <MAXPR0101MB1977C7EBFE8FFC8BD2E0519AEED90@MAXPR0101MB1977.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(136003)(346002)(39830400003)(376002)(366004)(9686003)(7116003)(19627405001)(66946007)(2906002)(71200400001)(76116006)(66556008)(64756008)(66476007)(66446008)(5660300002)(7696005)(6916009)(6506007)(316002)(52536014)(2940100002)(508600001)(3480700007)(8676002)(81156014)(55016002)(86362001)(33656002)(186003)(8936002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: exaleapsemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kwYsTngRjO1wSlHFYtEFe2HqBBtRBWHGS1lGg6oH2elWw7fGTOizRsgsUr3y19Nvfzz/Qsbv6gkZLNap/EmZa5lslE1ZEdpoIcCBMVrR9q7xqeiXO1UAgxWoBUqGF5VDMNcffLJNj86yCMY9TxIIB5fMnWPVjBStcJHOPJ4SFAFOlWmXgIZIka6uhzaqKbVzuOBmvJof8FC/WHJrwWLeHFXXiGVRC4jcc3NXAeEQaPmZ1E7eduTmKabs1SlDLhUVDkHDk7ZRAG60y9pY11vfbfb3CmicYP8TLoHVsGY4IrQ9PPM5nRuWcLSuXDJaB9P3hZZypCOtHhzMZZC6qPTIP4N6ylS0VBtrFl7ys5YOB79uGOtAdcenzUabWcnZxDO9Aa2rDdIdyv3XiVN4Eqq6r6+yv7TtXfxS5UG3IIScIbNmkQjcZ1HHw0P4GcFigfgf
x-ms-exchange-antispam-messagedata: h7f6GZeBj/CKcHnCp9EJ/gbyN8cVGyL4rUqBzcVrGjeLozEsoWqI+6yFwBA1rzYCYCXQPHZXDThOGp8205vdPxUBMSq8yUOizY8uo5tL9F2Av9zurXhgy0NzdRzxikjL8If/h1EWtV0n9B+QlUr1+/7v3cq9/3G84YF+aEFnkkAEfi2j+eWrEqj5t21qmcN6oCE8C291qt/dLhcSl/44Dg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9459e49b-ba6c-4be4-302a-08d7e2a8ddda
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 08:25:19.9272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVN2N/YkLiRChf/SsGw+J1br/OZDjIqNfjIclNyBU6noZsYHeS3jJIH19lC2xaYz5dxCu8BhYEIEVTWfQQYV4LiOhHxlaO0R6fsmI06EAeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1977
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] CPU scheduler tweaking
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
Content-Type: multipart/mixed; boundary="===============0240314884=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0240314884==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB14682145A869C861F69F90B3EED90MAXPR0101MB1468_"

--_000_MAXPR0101MB14682145A869C861F69F90B3EED90MAXPR0101MB1468_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I have tried to tweak the kernel scheduler by changing the runtime kernel s=
cheduling sysctl parameter like granularity,latency and i am setting cpu af=
finity to  CPU 1.
I am using perf tool for monitoring the scheduler the different scheduler p=
arameters like runtime,avg-delay.

i have set,

kernel.sched_autogroup_enabled =3D 1
kernel.sched_cfs_bandwidth_slice_us =3D 5000
kernel.sched_child_runs_first =3D 0
kernel.sched_latency_ns =3D 2000000
kernel.sched_migration_cost_ns =3D 500000
kernel.sched_min_granularity_ns =3D 4000000
kernel.sched_nr_migrate =3D 32
kernel.sched_rr_timeslice_ms =3D 100
kernel.sched_rt_period_us =3D 1000000
kernel.sched_rt_runtime_us =3D 950000
kernel.sched_schedstats =3D 0
kernel.sched_tunable_scaling =3D 1
kernel.sched_util_clamp_max =3D 1024
kernel.sched_util_clamp_min =3D 1024
kernel.sched_wakeup_granularity_ns =3D 10000000


I have few concerns about scheduler tweaking

1) After tweaking kernel scheduler at which parameter where i should look f=
or so that i can decide my CPU scheduler is performing good or bad???

2) i am setting cpu affinty to cpu 1 but i am able to see some migration wh=
en my application is running, i am giving following commands

$sudo perf sched record ./thread-workload-benchmark accum 1 unrollaccum8 1
here,thread-work-benchmark is my app and accum 1 is the cpu 1 on which i am=
 spawning workload

$ sudo perf sched latency -s max

940828.125071 [0001]   s     thread-workload[7386]               0.011     =
 0.000    587.990      R  next: kworker/1:1[25382]
  940828.125076 [0001]   s     kworker/1:1-eve[25382]            587.990   =
   1.489      0.005      K  next: thread-workload[7386]
  940828.135578 [0001]    m      thread-workload[7386]                     =
                       migrated: kworker/u8:1-ev[6803] cpu 2 =3D> 3
  940828.135584 [0001]         thread-workload[7386]                       =
                     awakened: kworker/u8:1-ev[6803]
  940828.135609 [0001]         thread-workload[7386]                       =
                     awakened: systemd[1]
  940828.135626 [0001]         thread-workload[7386]                       =
                     awakened: Xorg[32003]
  940828.205068 [0001]         thread-workload[7386]                       =
                     awakened: kworker/1:1-eve[25382]
  940828.209065 [0001]         thread-workload[7386]                       =
                     awakened: rcu_sched[11]
  940828.209069 [0001]   s     thread-workload[7386]               0.005   =
   0.000     83.992      R  next: kworker/1:1[25382]
  940828.209076 [0001]   s     kworker/1:1-eve[25382]             83.992   =
   4.001      0.007      K  next: thread-workload[7386]
  940828.343223 [0001]    m      thread-workload[7386]                     =
                       migrated: TeamViewer_Desk[6579/6576] cpu 1 =3D> 2
  940828.343227 [0001]         thread-workload[7386]                       =
                     awakened: TeamViewer_Desk[6579/6576]
  940828.365067 [0001]         thread-workload[7386]                       =
                     awakened: kworker/1:1-eve[25382]
  940828.369067 [0001]   s     thread-workload[7386]               0.007   =
   0.000    159.990      R  next: kworker/1:1[25382]
  940828.369074 [0003]      m    swapper                                   =
                       migrated: thread-workload[7386] cpu 1 =3D> 3
  940828.369079 [0003]     i   <idle>                              0.021   =
   0.000      3.983      I  next: thread-workload[7386]
  940828.370626 [0003]         thread-workload[7386]                       =
                     awakened: teamviewerd[1895/1891]
  940828.371479 [0003]      m    thread-workload[7386]                     =
                       migrated: TeamViewer_Desk[6585/6576] cpu 3 =3D> 0
  940828.371482 [0003]         thread-workload[7386]                       =
                     awakened: TeamViewer_Desk[6585/6576]
  940828.373500 [0003]      m    thread-workload[7386]                     =
                       migrated: TeamViewer_Desk[6576] cpu 3 =3D> 1
  940828.373503 [0003]         thread-workload[7386]                       =
                     awakened: TeamViewer_Desk[6576]
  940828.398184 [0003]      m    thread-workload[7386]                     =
                       migrated: Timer[5210/5197] cpu 3 =3D> 0
  940828.398188 [0003]         thread-workload[7386]                       =
                     awakened: Timer[5210/5197]
  940828.416132 [0003]      m    thread-workload[7386]                     =
                       migrated: TeamViewer_Desk[6582/6576] cpu 3 =3D> 0
  940828.416136 [0003]         thread-workload[7386]                       =
                     awakened: TeamViewer_Desk[6582/6576]
  940828.417802 [0003]         thread-workload[7386]                       =
                     awakened: teamviewerd[1897/1891]
  940828.493068 [0003]         thread-workload[7386]                       =
                     awakened: kworker/3:2-eve[5907]
  940828.497068 [0003]     s   thread-workload[7386]               0.012   =
   0.000    127.988      R  next: kworker/3:2[5907]
  940828.497074 [0001]    m      swapper                                   =
                       migrated: thread-workload[7386] cpu 3 =3D> 1
  940828.497080 [0001]   i     <idle>                              0.017   =
   0.000      2.696      I  next: thread-workload[7386]
  940828.504429 [0001]    m      thread-workload[7386]                     =
                       migrated: TeamViewer_Desk[6576] cpu 1 =3D> 2
  940828.504437 [0001]         thread-workload[7386]                       =
                     awakened: TeamViewer_Desk[6576]
  940828.509070 [0001]         thread-workload[7386]                       =
                     awakened: rcu_sched[11]
  940828.529068 [0001]         thread-workload[7386]                       =
                     awakened: kworker/u8:1-ev[6803]
  940828.529072 [0001]         thread-workload[7386]                       =
                     awakened: kworker/1:1-eve[25382]
  940828.533067 [0001]   s     thread-workload[7386]               0.011   =
   0.000     35.987      R  next: kworker/1:1[25382]
  940828.533074 [0001]   s     kworker/1:1-eve[25382]            163.985   =
   3.995      0.006      K  next: thread-workload[7386]
  940828.537067 [0001]         thread-workload[7386]                       =
                     awakened: rcu_sched[11]
  940828.561067 [0001]         thread-workload[7386]                       =
                     awakened: kworker/1:1-eve[25382]
  940828.565071 [0001]   s     thread-workload[7386]               0.006   =
   0.000     31.997      R  next: kworker/1:1[25382]
  940828.565079 [0001]   s     kworker/1:1-eve[25382]             31.997   =
   4.004      0.007      K  next: thread-workload[7386]
  940828.581067 [0001]         thread-workload[7386]                       =
                     awakened: rcu_sched[11]
  940828.605069 [0001]         thread-workload[7386]                       =
                     awakened: rcu_sched[11]
  940828.625069 [0001]         thread-workload[7386]                       =
                     awakened: kworker/1:1-eve[25382]
  940828.629069 [0001]   s     thread-workload[7386]               0.007   =
   0.000     63.990      R  next: kworker/1:1[25382]
  940828.629075 [0003]      m    rcu_sched[11]                             =
                       migrated: thread-workload[7386] cpu 1 =3D> 3
  940828.629080 [0003]     s   rcu_sched[11]                       7.989   =
   0.001      0.014      K  next: thread-workload[7386]
  940828.641063 [0003]      m    thread-workload[7386]                     =
                       migrated: rcu_sched[11] cpu 3 =3D> 1
  940828.641065 [0003]         thread-workload[7386]                       =
                     awakened: rcu_sched[11]
  940828.644047 [0003]      m    thread-workload[7386]                     =
                       migrated: TeamViewer_Desk[6595/6576] cpu 3 =3D> 0
  940828.644050 [0003]         thread-workload[7386]                       =
                     awakened: TeamViewer_Desk[6595/6576]
  940828.657066 [0003]         thread-workload[7386]                       =
                     awakened: rcu_sched[11]
  940828.665068 [0003]         thread-workload[7386]                       =
                     awakened: rcu_sched[11]
  940828.685069 [0003]         thread-workload[7386]                       =
                     awakened: kworker/3:2-eve[5907]
  940828.689072 [0003]     s   thread-workload[7386]               0.011   =
   0.000     59.992      R  next: kworker/3:2[5907]
  940828.689078 [0001]    m      swapper                                   =
                       migrated: thread-workload[7386] cpu 3 =3D> 1



Though i have set affinity to cpu1 why it is getting migrated to another cp=
u like as shown in the report,sometimes it getting migrated to cpu3 or cpu0=
 ,i am not able to get that..can someone help me to figure it out??


Thanks!




--_000_MAXPR0101MB14682145A869C861F69F90B3EED90MAXPR0101MB1468_
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
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;">Hi,</span><br>
</div>
<div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
I have tried to tweak the kernel scheduler by changing the runtime kernel s=
cheduling sysctl parameter like granularity,latency and i am setting cpu af=
finity to&nbsp; CPU 1.</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
I am using perf tool for monitoring the scheduler the different scheduler p=
arameters like runtime,avg-delay.</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
i have set,</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<span style=3D"margin:0px">kernel.sched_autogroup_enabled =3D 1<br>
</span>
<div style=3D"margin:0px">kernel.sched_cfs_bandwidth_slice_us =3D 5000<br>
</div>
<div style=3D"margin:0px">kernel.sched_child_runs_first =3D 0<br>
</div>
<div style=3D"margin:0px"><b>kernel.sched_latency_ns =3D 2000000</b><br>
</div>
<div style=3D"margin:0px">kernel.sched_migration_cost_ns =3D 500000<br>
</div>
<div style=3D"margin:0px"><b>kernel.sched_min_granularity_ns =3D 4000000</b=
><br>
</div>
<div style=3D"margin:0px">kernel.sched_nr_migrate =3D 32<br>
</div>
<div style=3D"margin:0px">kernel.sched_rr_timeslice_ms =3D 100<br>
</div>
<div style=3D"margin:0px">kernel.sched_rt_period_us =3D 1000000<br>
</div>
<div style=3D"margin:0px">kernel.sched_rt_runtime_us =3D 950000<br>
</div>
<div style=3D"margin:0px">kernel.sched_schedstats =3D 0<br>
</div>
<div style=3D"margin:0px">kernel.sched_tunable_scaling =3D 1<br>
</div>
<div style=3D"margin:0px">kernel.sched_util_clamp_max =3D 1024<br>
</div>
<div style=3D"margin:0px">kernel.sched_util_clamp_min =3D 1024<br>
</div>
<div style=3D"margin:0px"><b>kernel.sched_wakeup_granularity_ns =3D 1000000=
0</b><br>
</div>
<span style=3D"margin:0px"></span><br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
I have few concerns about scheduler tweaking</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
1) After tweaking kernel scheduler at which parameter where i should look f=
or so that i can decide my CPU scheduler is performing good or bad???</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
2) i am setting cpu affinty to cpu 1 but i am able to see some migration wh=
en my application is running, i am giving following commands</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
$<span style=3D"margin:0px">sudo perf sched record ./thread-workload-benchm=
ark accum 1 unrollaccum8 1<br>
</span><span style=3D"margin:0px"></span></div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
here,thread-work-benchmark is my app and accum 1 is the cpu 1 on which i am=
 spawning workload</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
$&nbsp;sudo perf sched latency -s max</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<span style=3D"margin:0px">940828.125071 [0001] &nbsp; s &nbsp; &nbsp; thre=
ad-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.011 &n=
bsp; &nbsp; &nbsp;0.000 &nbsp; &nbsp;587.990 &nbsp; &nbsp; &nbsp;R &nbsp;ne=
xt: kworker/1:1[25382] &nbsp; &nbsp; &nbsp;<br>
</span>
<div style=3D"margin:0px">&nbsp; 940828.125076 [0001] &nbsp; s &nbsp; &nbsp=
; kworker/1:1-eve[25382] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;587.990 &=
nbsp; &nbsp; &nbsp;1.489 &nbsp; &nbsp; &nbsp;0.005 &nbsp; &nbsp; &nbsp;K &n=
bsp;next: thread-workload[7386] &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.135578 [0001] &nbsp; &nbsp;m &nbsp;=
 &nbsp; &nbsp;thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: kworker/u8:1-ev[6803] cpu =
2 =3D&gt; 3<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.135584 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: kworker/u8:1-ev[6803]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.135609 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: systemd[1]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.135626 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: Xorg[32003]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.205068 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: kworker/1:1-eve[25382]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.209065 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: rcu_sched[11]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.209069 [0001] &nbsp; s &nbsp; &nbsp=
; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.=
005 &nbsp; &nbsp; &nbsp;0.000 &nbsp; &nbsp; 83.992 &nbsp; &nbsp; &nbsp;R &n=
bsp;next: kworker/1:1[25382] &nbsp; &nbsp; &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.209076 [0001] &nbsp; s &nbsp; &nbsp=
; kworker/1:1-eve[25382] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 83.992 &=
nbsp; &nbsp; &nbsp;4.001 &nbsp; &nbsp; &nbsp;0.007 &nbsp; &nbsp; &nbsp;K &n=
bsp;next: thread-workload[7386] &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.343223 [0001] &nbsp; &nbsp;m &nbsp;=
 &nbsp; &nbsp;thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: TeamViewer_Desk[6579/6576]=
 cpu 1 =3D&gt; 2<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.343227 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: TeamViewer_Desk[6579/6576]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.365067 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: kworker/1:1-eve[25382]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.369067 [0001] &nbsp; s &nbsp; &nbsp=
; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.=
007 &nbsp; &nbsp; &nbsp;0.000 &nbsp; &nbsp;159.990 &nbsp; &nbsp; &nbsp;R &n=
bsp;next: kworker/1:1[25382] &nbsp; &nbsp; &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.369074 [0003] &nbsp; &nbsp; &nbsp;m=
 &nbsp; &nbsp;swapper &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;m=
igrated: thread-workload[7386] cpu 1 =3D&gt; 3<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.369079 [0003] &nbsp; &nbsp; i &nbsp=
; &lt;idle&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0.021 &nbsp; &nbsp; &nbsp;0.000=
 &nbsp; &nbsp; &nbsp;3.983 &nbsp; &nbsp; &nbsp;I &nbsp;next: thread-workloa=
d[7386] &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.370626 [0003] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: teamviewerd[1895/1891]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.371479 [0003] &nbsp; &nbsp; &nbsp;m=
 &nbsp; &nbsp;thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: TeamViewer_Desk[6585/6576]=
 cpu 3 =3D&gt; 0<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.371482 [0003] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: TeamViewer_Desk[6585/6576]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.373500 [0003] &nbsp; &nbsp; &nbsp;m=
 &nbsp; &nbsp;thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: TeamViewer_Desk[6576] cpu =
3 =3D&gt; 1<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.373503 [0003] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: TeamViewer_Desk[6576]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.398184 [0003] &nbsp; &nbsp; &nbsp;m=
 &nbsp; &nbsp;thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: Timer[5210/5197] cpu 3 =3D=
&gt; 0<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.398188 [0003] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: Timer[5210/5197]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.416132 [0003] &nbsp; &nbsp; &nbsp;m=
 &nbsp; &nbsp;thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: TeamViewer_Desk[6582/6576]=
 cpu 3 =3D&gt; 0<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.416136 [0003] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: TeamViewer_Desk[6582/6576]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.417802 [0003] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: teamviewerd[1897/1891]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.493068 [0003] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: kworker/3:2-eve[5907]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.497068 [0003] &nbsp; &nbsp; s &nbsp=
; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.=
012 &nbsp; &nbsp; &nbsp;0.000 &nbsp; &nbsp;127.988 &nbsp; &nbsp; &nbsp;R &n=
bsp;next: kworker/3:2[5907] &nbsp; &nbsp; &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.497074 [0001] &nbsp; &nbsp;m &nbsp;=
 &nbsp; &nbsp;swapper &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;m=
igrated: thread-workload[7386] cpu 3 =3D&gt; 1<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.497080 [0001] &nbsp; i &nbsp; &nbsp=
; &lt;idle&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0.017 &nbsp; &nbsp; &nbsp;0.000=
 &nbsp; &nbsp; &nbsp;2.696 &nbsp; &nbsp; &nbsp;I &nbsp;next: thread-workloa=
d[7386] &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.504429 [0001] &nbsp; &nbsp;m &nbsp;=
 &nbsp; &nbsp;thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: TeamViewer_Desk[6576] cpu =
1 =3D&gt; 2<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.504437 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: TeamViewer_Desk[6576]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.509070 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: rcu_sched[11]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.529068 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: kworker/u8:1-ev[6803]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.529072 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: kworker/1:1-eve[25382]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.533067 [0001] &nbsp; s &nbsp; &nbsp=
; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.=
011 &nbsp; &nbsp; &nbsp;0.000 &nbsp; &nbsp; 35.987 &nbsp; &nbsp; &nbsp;R &n=
bsp;next: kworker/1:1[25382] &nbsp; &nbsp; &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.533074 [0001] &nbsp; s &nbsp; &nbsp=
; kworker/1:1-eve[25382] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;163.985 &=
nbsp; &nbsp; &nbsp;3.995 &nbsp; &nbsp; &nbsp;0.006 &nbsp; &nbsp; &nbsp;K &n=
bsp;next: thread-workload[7386] &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.537067 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: rcu_sched[11]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.561067 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: kworker/1:1-eve[25382]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.565071 [0001] &nbsp; s &nbsp; &nbsp=
; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.=
006 &nbsp; &nbsp; &nbsp;0.000 &nbsp; &nbsp; 31.997 &nbsp; &nbsp; &nbsp;R &n=
bsp;next: kworker/1:1[25382] &nbsp; &nbsp; &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.565079 [0001] &nbsp; s &nbsp; &nbsp=
; kworker/1:1-eve[25382] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 31.997 &=
nbsp; &nbsp; &nbsp;4.004 &nbsp; &nbsp; &nbsp;0.007 &nbsp; &nbsp; &nbsp;K &n=
bsp;next: thread-workload[7386] &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.581067 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: rcu_sched[11]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.605069 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: rcu_sched[11]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.625069 [0001] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: kworker/1:1-eve[25382]<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.629069 [0001] &nbsp; s &nbsp; &nbsp=
; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.=
007 &nbsp; &nbsp; &nbsp;0.000 &nbsp; &nbsp; 63.990 &nbsp; &nbsp; &nbsp;R &n=
bsp;next: kworker/1:1[25382] &nbsp; &nbsp; &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.629075 [0003] &nbsp; &nbsp; &nbsp;m=
 &nbsp; &nbsp;rcu_sched[11] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: thread=
-workload[7386] cpu 1 =3D&gt; 3<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.629080 [0003] &nbsp; &nbsp; s &nbsp=
; rcu_sched[11] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; 7.989 &nbsp; &nbsp; &nbsp;0.001 &nbsp; &nbsp; &nbsp;0.014=
 &nbsp; &nbsp; &nbsp;K &nbsp;next: thread-workload[7386] &nbsp;<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.641063 [0003] &nbsp; &nbsp; &nbsp;m=
 &nbsp; &nbsp;thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: rcu_sched[11] cpu 3 =3D&gt=
; 1<br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.641065 [0003] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: rcu_sched[11]<br>
</div>
<div style=3D"margin:0px">&nbsp;<span>&nbsp;</span><b>940828.644047 [0003] =
&nbsp; &nbsp; &nbsp;m &nbsp; &nbsp;thread-workload[7386] &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;migrated: TeamV=
iewer_Desk[6595/6576] cpu 3 =3D&gt; 0</b><br>
</div>
<div style=3D"margin:0px">&nbsp; 940828.644050 [0003] &nbsp; &nbsp; &nbsp; =
&nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: TeamViewer_Desk[6595/6576]<br>
</div>
<div style=3D"margin:0px">&nbsp;<span>&nbsp;</span><b>940828.657066 [0003] =
&nbsp; &nbsp; &nbsp; &nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: rcu_sched[11=
]<br>
</b></div>
<div style=3D"margin:0px"><b>&nbsp; 940828.665068 [0003] &nbsp; &nbsp; &nbs=
p; &nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: rcu_sched[11]<br>
</b></div>
<div style=3D"margin:0px"><b>&nbsp; 940828.685069 [0003] &nbsp; &nbsp; &nbs=
p; &nbsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;awakened: kworker/3:2-eve[5907]<br>
</b></div>
<div style=3D"margin:0px"><b>&nbsp; 940828.689072 [0003] &nbsp; &nbsp; s &n=
bsp; thread-workload[7386] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 0.011 &nbsp; &nbsp; &nbsp;0.000 &nbsp; &nbsp; 59.992 &nbsp; &nbsp; &nbsp;R=
 &nbsp;next: kworker/3:2[5907] &nbsp; &nbsp; &nbsp;<br>
</b></div>
<span style=3D"margin:0px"><b>&nbsp; 940828.689078 [0001] &nbsp; &nbsp;m &n=
bsp; &nbsp; &nbsp;swapper &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;migrated: thread-workload[7386] cpu 3 =3D&gt; 1</b></span><br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<div style=3D"margin:0px">&nbsp;&nbsp;</div>
<div style=3D"margin:0px">&nbsp;&nbsp;</div>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<span style=3D"margin:0px"><br>
</span></div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
Though i have set affinity to cpu1 why it is getting migrated to another cp=
u like as shown in the report,sometimes it getting migrated to cpu3 or cpu0=
 ,i am not able to get that..can someone help me to figure it out??</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
Thanks!</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif; text-align:left; background-color:rgb(255,255,255)">
<br>
</div>
<br>
<br>
</div>
</div>
</div>
</body>
</html>

--_000_MAXPR0101MB14682145A869C861F69F90B3EED90MAXPR0101MB1468_--

--===============0240314884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0240314884==--
