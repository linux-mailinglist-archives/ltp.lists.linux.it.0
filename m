Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B555B34616E
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 15:27:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 849713C71E4
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 15:27:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C50303C25E7
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 15:27:11 +0100 (CET)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380112.outbound.protection.outlook.com [40.107.138.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5C6DD1400E71
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 15:27:10 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bq4wm3R7DgXZWd9yMoH3gpmPs/r2nJA2BhyHhUh7CAEekPq9kgVz31JvU4NBM+x+/md7HDX3aMHMZqPbMOVqfQBeWJNHmpH1fLlli3kjxAbfIjkneiHYkGhCKgjwZKW4XSIDSDl21QXcASwgf4m+4gn9jgMsn9G9tFdLbXuiNsgG9b6hbuj8h5hAfqErDXoYnSCOT8mlwyDu6E8ZLM+AzjyNwWyet0c65I6OTa+lqyPZUqgdYsXpPRlz1wZFGxhbuRTbEgI8aswpMPWPItpjZgHZ4jclQX+dJ2rvDw1Ro2OTy4d1sT/odR9A1Pe0t4GmF/RdYTq57UOFFGOS2htzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwBCPpEAK8CtB2QnyM28tYhIEeOVHuRcKlcTkJPsOak=;
 b=CxsrTFqRB/7cQ3RgKt0y12faVcvNf205Yzlof0tc6o9GP9D2LjDTRlXaP1Gv/lk4/X1WKbl7wfBTrn0J/IHRa2Hq2smsjUYNBiHupcXUsTifHp9bz/Yg7G/n9c6nYK5FLGcq3p7iRMd2NEyKWuTZPu0Z9JeX8/s/PHb7wKx4olbVavfIeMt3MJ5UxARYmz4m3yTI4AJyj6v7eH4fi8LoP/NaaVcqo2Vsgn0axIHJKVTcgV0nm2g4p1LJ0xwJPwk/IyLbS0AT6AbzJ34TkKpOpEy69vc2XKslYQ7yPYeU1RLwXBPwaVjYzI8QvaXK+c+9E0cTgw3eVvL4kddmSMHyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwBCPpEAK8CtB2QnyM28tYhIEeOVHuRcKlcTkJPsOak=;
 b=QSuBl9p6kXGIoVnhGbXsJXGZ2dpdHOD35EVSmjlLHO4OqQV23JT5lK8eM0XcaFyA3WCCoDywDBvdZwQ7xJhBQzCp4wE2Igi6PvqmNp37iumIQ5WN507W6xizBocWeYOZG/Uja0KcNX86dWa9zBcLjCGSpXUtBOkuniDUeCOzkvI=
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2f::22)
 by BM1PR01MB3364.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 14:27:04 +0000
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::10fe:7e69:3f57:8f77]) by BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::10fe:7e69:3f57:8f77%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 14:27:04 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: kdump failure on x86
Thread-Index: AQHXH++0pS2jX1RCe0OAcFN+RYlWWA==
Date: Tue, 23 Mar 2021 14:27:03 +0000
Message-ID: <BMXPR01MB2870D7110A3D2AD3DF1B495AEE649@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [157.45.170.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63993780-c2e7-4bf4-fc70-08d8ee07bae1
x-ms-traffictypediagnostic: BM1PR01MB3364:
x-microsoft-antispam-prvs: <BM1PR01MB33648AB9A3D3020E2577D6A9EE649@BM1PR01MB3364.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ex5Y50EuyNXpIGriJnVJu7L06g6qoQXRbz+HzzPwnWuC/l5hV45o2iC6gDjO2QX79mGeiHX7Lrf+wu1oNJ1MVR9hApTZ9JA4mzPzlQzJhkBnSiTyABiFPzn/PuCCHMK2cduks9cjI+MiIPAoJolf2fm3ZEopoMqKJD8QmZHdE1f7TFBO5VufvxY9GCYkkR1RfmZJwrHGX0IAlpFojizUTEwV22oRYQB3h9dX85Q6cfFCHv501u/sIhKZzeJVwqShK10t3W6u5M3t4JLQTEWcLfd2oKa772oTep8Zfqjb1a//dWmi8q6yVB1IYRmEIVxqlKFHWSqdIJNnDq98/aou3xmctILa06aOzZyUDYEBQNzvUbuoAipS2pBNQhzVv+W+VbtRm0sRk0RcEAYprQsiueosXyQHjOgKimGbz3mvPeIq4KWaHKysjx2tdJNAjspGLR8aAbcif/Vtr+fHP114TY8UOJTcY+w0/xlGgF2h/2xtxnAJgFl5vIlK1FQHbmHmdaAsLhxDjq8jfqoA7x66rndTWgPn/D4VIEtxhAexhJF2K8Lk8JA8ujhOoQazYbhBVOtFYxgRI9GVINhY/1hlcx0wWEozVZeY8ghJVr/StJsU7X5SWqMHvGmUsfW5aE1jrLH2QlYvgxr1jaSqp7M2Io65kTDlEYSNJTfkGRMNWRo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(39830400003)(396003)(136003)(376002)(346002)(6916009)(26005)(5660300002)(66476007)(64756008)(83380400001)(316002)(66556008)(52536014)(38100700001)(8936002)(66446008)(19627405001)(86362001)(66946007)(478600001)(76116006)(2906002)(8676002)(33656002)(6506007)(55016002)(71200400001)(186003)(9686003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?jjsP+aZd9W78UpwJZdHrG10q+qZ8EuZpO4dQ512OhsdvnHyuaVMiXpMW?=
 =?Windows-1252?Q?Z6H6QXQ8UKK9rNE4pk0CRsN+6VvTGrPnhfANPhrzVPDdaesTKa7B84R5?=
 =?Windows-1252?Q?/MMhFCy6RCCy6XPp8bLpb5rCz3W5v8ImBH0zwGPuUPXfJmrASRSaL6AW?=
 =?Windows-1252?Q?DqMHXJl1y+JNCrxJ+QR/a3Cpjv4vAxiSBVR6hzTOISjSg1oAvRbNNCTk?=
 =?Windows-1252?Q?qMV2xqK9QkeK6hdyK+Pv9WxWItCp+gk0Vl4Ism8TCHSpldAN8hmpKKiv?=
 =?Windows-1252?Q?D18Zt14ye7glWXKLISFNt6/YXxlSAGqyYQxzzhFxzkBd9jE5vv8CpHy6?=
 =?Windows-1252?Q?LdB7LYLvEJxv04YqYvj+aUBsdnB/+OS0zlGituIXEVtz/nvseUT4Mq63?=
 =?Windows-1252?Q?CIeQCYHsiy9YtEZmsRf2ANPvKcq04SDDOvp83MINkpRPHi+qkRnzOzuV?=
 =?Windows-1252?Q?axpnH3WD7yn482ZnOKxWyH0rWq70isCGLXYYsNcmHx/N+2od7WX2fRJK?=
 =?Windows-1252?Q?f6omIeOUPfAcBPtSZFvF2E3Su7AakJGZcyIMP/8hwlQfpWy4YR8P0IG0?=
 =?Windows-1252?Q?qlbtJqUbZ6eIyZVJqpLFfxewxWlsGnWum2kldMAlkrWAIRzoI+TwCGu2?=
 =?Windows-1252?Q?v6DQgSuXOdbKugEZnrSgMpHD+7g86YuUARf2hawlO6BsY+mk2nOsyowm?=
 =?Windows-1252?Q?SKav+IH4CWLSy8XOa6+jdh75YsRbBCA1iWjjduPIHw1+irj1llExg9c/?=
 =?Windows-1252?Q?7IEKi3pAPqqIoTN6zP4+DN/gWQlyE48fmoiUsuAe+XslyczBTcewAy3N?=
 =?Windows-1252?Q?B7ToR3/7d7xD/wClLoIA4eL82GlCTCFQvMuBHGaUepZVwsGp1Teim7AX?=
 =?Windows-1252?Q?psM8IbKwkQ3zweYRZo0My30CwNYGUxCndu0iVHDTJA1gcmv5dhO218gD?=
 =?Windows-1252?Q?Be2rwNzDd8CCQbFceCNA+0KbAodruTmI16S5eSgwd6Nr22so1k10jhvk?=
 =?Windows-1252?Q?21Z2pVFgi9O8s6Ip/u37vPc22aON8Qmn5QCXPaGcnyeMK6b+2TS+/Qr4?=
 =?Windows-1252?Q?q7T7uWSyHPk9YIttezpYsrkQbsxn86D2KaJiZHYq5yvNKkaxlMq1h4v2?=
 =?Windows-1252?Q?vGIlWW+XRpYSymSnGhrXv84K9YSRbKDD7iLJmHZeVxXYVGxI/3DRbiqT?=
 =?Windows-1252?Q?eMy2VNGP3Xinjw5dAtGnujCrUvpwqtwkupUubGQS/WC/FsT19WKEVXmp?=
 =?Windows-1252?Q?9MOtO7+2DH/aTCVGCRvYXnKm3JPSOocSKuQy4SU4RjbF08FuhH70iwUQ?=
 =?Windows-1252?Q?MeF84yv/WqFaZHnIFvQgPENjJAUVKoM/V+b6D3To+kQtj/hZ71Ik/9W4?=
 =?Windows-1252?Q?cpgg2yto0vHM+D4JbynMbNajCoGjaKgRKTE=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63993780-c2e7-4bf4-fc70-08d8ee07bae1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 14:27:03.9629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yU7S4BouOwJt/bJGyj9+LiVOGN+qWL7RGsxr7wLiGbfCYkUOvstZE2AU2Jq2DsKXwwnoTqDJruRV9JBLpZ/ylh3Xo39zlBc4fNsDGkiy2tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3364
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] kdump failure on x86
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
Content-Type: multipart/mixed; boundary="===============0011518144=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0011518144==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2870D7110A3D2AD3DF1B495AEE649BMXPR01MB2870INDP_"

--_000_BMXPR01MB2870D7110A3D2AD3DF1B495AEE649BMXPR01MB2870INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,
i am trying to run kdump on x86 with 5.5.6 kernel but i am getting followin=
g errors, can someone please tell whats going wrong here. I have lkdtm conf=
ig in the kernel and installed kexec-tools as well what could be the cause =
of issue ???


ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91jp_do_irq=92:
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:139:2: err=
or: implicit declaration of function =91jprobe_return=92; did you mean =91p=
robe_irq_on=92? [-Werror=3Dimplicit-function-declaration]
  jprobe_return();
  ^~~~~~~~~~~~~
  probe_irq_on
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In functi=
on =91lkdtm_lookup_name=92:
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:295:10: er=
ror: invalid use of undefined type =91struct jprobe=92
   *(lkdtm.kp.addr) =3D addr;
          ^
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:296:8: err=
or: invalid use of undefined type =91struct jprobe=92
   lkdtm.entry =3D JPROBE_ENTRY(entry);
        ^
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:296:17: er=
ror: implicit declaration of function =91JPROBE_ENTRY=92; did you mean =91K=
PROBE_REENTER=92? [-Werror=3Dimplicit-function-declaration]
   lkdtm.entry =3D JPROBE_ENTRY(entry);
                 ^~~~~~~~~~~~
                 KPROBE_REENTER
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In functi=
on =91lkdtm_module_init=92:
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:468:13: er=
ror: implicit declaration of function =91register_jprobe=92; did you mean =
=91register_kprobe=92? [-Werror=3Dimplicit-function-declaration]
  if ((ret =3D register_jprobe(&lkdtm)) < 0) {
             ^~~~~~~~~~~~~~~
             register_kprobe
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In functi=
on =91lkdtm_module_exit=92:
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:480:2: err=
or: implicit declaration of function =91unregister_jprobe=92; did you mean =
=91unregister_kprobe=92? [-Werror=3Dimplicit-function-declaration]
  unregister_jprobe(&lkdtm);
  ^~~~~~~~~~~~~~~~~
  unregister_kprobe
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: At top le=
vel:
/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:110:22: er=
ror: storage size of =91lkdtm=92 isn=92t known
 static struct jprobe lkdtm;
                      ^~~~~
cc1: some warnings being treated as errors
scripts/Makefile.build:265: recipe for target '/home/pankaj-hmem/ltp-r2.4/l=
tp/testcases/kdump/lib/lkdtm/lkdtm.o' failed
make[3]: *** [/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdt=
m.o] Error 1
Makefile:1693: recipe for target '/home/pankaj-hmem/ltp-r2.4/ltp/testcases/=
kdump/lib/lkdtm' failed
make[2]: *** [/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm] Err=
or 2
make[2]: Leaving directory '/usr/ksrc/linux-5.5.6'
Makefile:11: recipe for target 'default' failed
make[1]: *** [default] Error 2
make[1]: Leaving directory '/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/=
lib/lkdtm'
Makefile:2: recipe for target 'default' failed
make: *** [default] Error 2



Thanks

--_000_BMXPR01MB2870D7110A3D2AD3DF1B495AEE649BMXPR01MB2870INDP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
i am trying to run kdump on x86 with 5.5.6 kernel but i am getting followin=
g errors, can someone please tell whats going wrong here. I have lkdtm conf=
ig in the kernel and installed kexec-tools as well what could be the cause =
of issue ???<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In function =91jp_do_irq=92: </div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:139:2=
: error: implicit declaration of function =91jprobe_return=92; did you mean=
 =91probe_irq_on=92? [-Werror=3Dimplicit-function-declaration]</div>
<div>&nbsp; jprobe_return();</div>
<div>&nbsp; ^~~~~~~~~~~~~</div>
<div>&nbsp; probe_irq_on</div>
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In f=
unction =91lkdtm_lookup_name=92:</div>
<div>/<b>home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:29=
5:10: error: invalid use of undefined type =91struct jprobe=92</b></div>
<div><b>&nbsp; &nbsp;*(lkdtm.kp.addr) =3D addr;</b></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^</div>
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:296:8=
: <b>error: invalid use of undefined type =91struct jprobe=92</b></div>
<div><b>&nbsp; &nbsp;lkdtm.entry =3D JPROBE_ENTRY(entry);</b></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; ^</div>
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:296:1=
7: <b>
error: implicit declaration of function =91JPROBE_ENTRY=92; did you mean =
=91KPROBE_REENTER=92? [-Werror=3Dimplicit-function-declaration]</b></div>
<div><b>&nbsp; &nbsp;lkdtm.entry =3D JPROBE_ENTRY(entry);</b></div>
<div><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~=
~~~~~~~</b></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;KPROBE_R=
EENTER</div>
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In f=
unction =91lkdtm_module_init=92:</div>
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:468:1=
3:<b> error: implicit declaration of function =91register_jprobe=92; did yo=
u mean =91register_kprobe=92? [-Werror=3Dimplicit-function-declaration]</b>=
</div>
<div><b>&nbsp; if ((ret =3D register_jprobe(&amp;lkdtm)) &lt; 0) {</b></div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~~~~~~~</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;register_kprobe</div>
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: In f=
unction =91lkdtm_module_exit=92:</div>
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:480:2=
: <b>error: implicit declaration of function =91unregister_jprobe=92; did y=
ou mean =91unregister_kprobe=92? [-Werror=3Dimplicit-function-declaration]<=
/b></div>
<div><b>&nbsp; unregister_jprobe(&amp;lkdtm);</b></div>
<div><b>&nbsp; ^~~~~~~~~~~~~~~~~</b></div>
<div>&nbsp; unregister_kprobe</div>
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c: At t=
op level:</div>
<div>/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.c:110:2=
2: <b>
error: storage size of =91lkdtm=92 isn=92t known</b></div>
<div><b>&nbsp;static struct jprobe lkdtm;</b></div>
<div><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; ^~~~~</b></div>
<div>cc1: some warnings being treated as errors</div>
<div>scripts/Makefile.build:265: recipe for target '/home/pankaj-hmem/ltp-r=
2.4/ltp/testcases/kdump/lib/lkdtm/lkdtm.o' failed</div>
<div>make[3]: *** [/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm=
/lkdtm.o] Error 1</div>
<div>Makefile:1693: recipe for target '/home/pankaj-hmem/ltp-r2.4/ltp/testc=
ases/kdump/lib/lkdtm' failed</div>
<div>make[2]: *** [/home/pankaj-hmem/ltp-r2.4/ltp/testcases/kdump/lib/lkdtm=
] Error 2</div>
<div>make[2]: Leaving directory '/usr/ksrc/linux-5.5.6'</div>
<div>Makefile:11: recipe for target 'default' failed</div>
<div>make[1]: *** [default] Error 2</div>
<div>make[1]: Leaving directory '/home/pankaj-hmem/ltp-r2.4/ltp/testcases/k=
dump/lib/lkdtm'</div>
<div>Makefile:2: recipe for target 'default' failed</div>
<div>make: *** [default] Error 2</div>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks<br>
</div>
</body>
</html>

--_000_BMXPR01MB2870D7110A3D2AD3DF1B495AEE649BMXPR01MB2870INDP_--

--===============0011518144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0011518144==--
