Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 870CD34D040
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 14:40:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28B733C7817
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 14:40:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 921CB3C264C
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 14:40:20 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380137.outbound.protection.outlook.com [40.107.138.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CA75A20092C
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 14:40:18 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPdz7iH/QEhHj/gHfgR0nI9ie79s8b8vLJMdplDJe4Pmd/uD2MpmvwF7GVMVmGthVhKTzGrGtp3fZDI9keEqbmaeE9T2hNwsMQqHE/DQvx8/ZDNIvjV0c+ggf+tVEfdlwC/jxBU2Pu7A6EhkYAouUexL2lE9Um1NLP27kCSUMrlvudhVib/wZteVsMKFBvOmryX+ggTL2gdpDKFQHGUWbgoRMOsUNuiqMz8/uDISH03xyMj/1YLt0X3M6RhPrE4nIaH+lVonD7f8WVAav7/1i4a6m9q2V6ucWv6hjPaxnbco5bqrwykVyjOtpWjSRihEhNQZdsB8iPFw802g5JyHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HETrUCuAXl2CWBcuGNPP7wgwjevhwEWMh9o/XFDUiM=;
 b=E5PDR5Ui9mg4wYx437I2r3WRRdMAZZ4fmN9r/AHtNHdQIre2kS6M2DAPdOGKnJJkVKSgI5kujm+XRAOAl1A3D5AxalKpoTFgVunDv1ZNVmb6xlsjlqWM7H7HIiNIWFlYSUNR3iW0JnKQxA4bqh21Ley93wlYvSsHvfcaA0CWU3PFZuNxylx6KX2VMpuu9guyOvBM3SZnGzUleftRzYAyPIf3uYzc4aaiEe6ohiqcFhWT1FXM/NkqBPZ5mnGY8iIOnjAgBvFm2RTfqvxreQv6z9YTWcMxe/hbyYPaA00ogdjrwptdRNla68ebRQ8bfVOyi58MYMJcZSsv2DC0cmPwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HETrUCuAXl2CWBcuGNPP7wgwjevhwEWMh9o/XFDUiM=;
 b=P4bolxusRZe/MuUkfFyJA2/r1R2SYfs+PKB/Xk/crD6CdWuxRn3KzVRuiHRXIwOlD/cuj2LDKVVw9cwGNpoBv9vGOKKllLN+w2+zSx0Lx0VZmUWH4P4nmAO0PPPFF2cB9MTAtpax2Sl4U3J9t3ZMM7yzDe58zVXpKzQEkJjqy5E=
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2f::22)
 by BM1PR01MB2772.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 12:40:12 +0000
Received: from BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::10fe:7e69:3f57:8f77]) by BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::10fe:7e69:3f57:8f77%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:40:12 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Thread-Topic: [LTP] msgstress03, msgstress04 failure on linux 5.10.19 and
 5.10.22
Thread-Index: AQHXJH2nK8g/tzA1l06PwHVUonlGkqqa59Ia
Date: Mon, 29 Mar 2021 12:40:11 +0000
Message-ID: <BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>,
 <60619D5B.6090507@fujitsu.com>
In-Reply-To: <60619D5B.6090507@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [122.166.120.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36a8af02-9ba6-4d1d-61d1-08d8f2afcb7f
x-ms-traffictypediagnostic: BM1PR01MB2772:
x-microsoft-antispam-prvs: <BM1PR01MB27721AB2F5B89361C9A31639EE7E9@BM1PR01MB2772.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VofrY3m4BNSxe4LPBixscp5RTFFLHWSuofESodSRlEtGRNKT/PskIsgNazSBYHQDiaR+j/P8kOyu127SUcZUH2NPEd0oKlnGNOsctMJ8+yPFrly6mcUvydA3A/FzomboJLvzWZxbc61E1Dj6ieRbwdKEpqmtoWa1O78CqXO7dzwnjSRgrBJs/S2KPemUR9PPfJM8Ltx8D5lA1ro24oAT0x3K3tiTqf0Cj5Dr+4hDoHa4Zm5RPHKmRoq08y4J2JFLCK8sSujQUOkuyzf3ongrUZjiSqgSXDKLAOHFgZ+BcWUuOzte5kgyowarPe7wRLPo32h3ajmf+q1D6IoSDORromLLBZoYHOzCxzpmxrzVOV56i7zcmM/srVTWqXkVFhkLD/AQw6KvoAnuZ1H2zHFRMP7YpfapmGr/P4nHk8imELlNlDueWbX0n7ImzGcOGaA0Q08hEJbE9I+bU7evB/kjeZoysCImJYdYNP1XKtQU/Buo5L3pFGHh6ke9IZJxZyhqqaVI9eVxW35U5fcrMlQ24xIq/zx7uXOFF/cZBnIKNeONYrKVSxejxLDrl26J0evI5gZc82bxavRtvPTVtGhFuJjH7NzJ6F6VaICJpWVG9TQbmHVo/uK/sHAUqTYta1y63c6rGz3zun6Rg2f6QQ0jfIiB2xsCViahzks3e+yqlqOdQKh4DWHTVsNbH7Ui9tCBhTbKrcC+HxWoQmnpx3uF0bht4FQ5QrDCuJyD6pl4hREngWVKDiga0PC6TWvpj/ft
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39830400003)(376002)(346002)(136003)(26005)(5660300002)(83380400001)(8676002)(52536014)(19627405001)(86362001)(33656002)(478600001)(71200400001)(8936002)(64756008)(9686003)(55016002)(66446008)(21615005)(2906002)(166002)(4326008)(316002)(76116006)(66556008)(91956017)(6506007)(7696005)(66476007)(38100700001)(186003)(6916009)(66946007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BmFHxaR7hKdXERrF+BLfdcIS6VryS0hIImsjNTqRc3fI5DaUNn5UMtboKZzI?=
 =?us-ascii?Q?pj58H7kYzt5yAlIjeJHRBZhj4ZcKBo7cR079DR1JocqP1Za/Q8nYstKgIKii?=
 =?us-ascii?Q?0FtHALUvRfCrsQDMI1TWeuFuUTCc45Tcx8ybLfYUelsFisRZKGO4QjtabK/E?=
 =?us-ascii?Q?WIf/cgsMcSPD7JMQq/AYymPHnu+WD8ZwwyvPNxmHqWlDXPjHLeYjTegSb6MS?=
 =?us-ascii?Q?Koi/vw2hXWtCS3FDxHCIr8T8ZAG2LxuSpkfUj3rQHqA/yoz+Hr6Dwm7Q6+QB?=
 =?us-ascii?Q?gfAIvenH5YXWCY2whGhzt/+Ue29VwMomeWqN1FUj/iqtpCO7H3LP+LQXRw+g?=
 =?us-ascii?Q?TTD0UtFSOmid0hfPcaauCgQa4reYWMO1OtpBE450slZN4nDHzs3aFuE541LK?=
 =?us-ascii?Q?HVOKS3vROLNbZLx/AvkRMktneV98SASnbGHtBci6dkl5bGkaiYT/4P3if3Fo?=
 =?us-ascii?Q?7dXzU8X5IrDq8Cw/p1UwgsHbEItGAAeenwU5soHPUBZI6tY+s+h93h+S9t8U?=
 =?us-ascii?Q?hLhVX42PdxvfzuXNmZ5hfb1e1OSSvxsQMz7+mObmzkGTzSVEjBRqNDVzvwfh?=
 =?us-ascii?Q?ByTxuphV8YUHO+ZSa7YoO+t/dFuH2zI0Bg8JChYcaJpA9DrhQoVS8mZW5bZ2?=
 =?us-ascii?Q?P0lQSKpN9j2mlC9UDJ5rE1hy7ihclgUpXx2pvxuLu8dZ4VA80rYMxRrwpirE?=
 =?us-ascii?Q?GiRz5oQ5IGtSDT+JPElYTqV8oS9K6XQFPUz6IMXhqUTkp/utT3AEdD+p1EKr?=
 =?us-ascii?Q?FN28oo6ZMMnLOXV7Twd+MVA4Yo6unSofuLbVwPQuW5MU3r5klibYc6kUk6WM?=
 =?us-ascii?Q?N7R7aM744NzEPc2eres3EFOnjdcl69huaXmgfdCDHpXm3ueQ3EPkFLTP4rJr?=
 =?us-ascii?Q?/Ghtp2i2hPOR5nMrDeGofTgPz0/8PIhdYSfcUHdjUKje89v31h/eUhRMHQS3?=
 =?us-ascii?Q?RHlGwtFFsPb6ATDURivMnoRf5XRT27wc2kdp7coyD9dTvFmdeF5uaRxWn3Fg?=
 =?us-ascii?Q?XPff55/Mw4T0Gt3kPxL/aviVyXFCs98Lmx1155Y+bOzlFnv4zhNK9yHSOFcq?=
 =?us-ascii?Q?8WLgD0hus88jzK0YGtNTorNFDyjk9BuWJnLUzKmovY8SEjTDWgxRh871jNzI?=
 =?us-ascii?Q?jHD2+2y9PKTQwYX3LWOvD+u/PIWxf/uJNf6u9cIXDX8GgKrY5LtfCIY22Bbu?=
 =?us-ascii?Q?BE0+yitm+KYJ8dY6cZI5RffW30+mRiUsJbMMzAiVg8R6mNQ/1VkJCkIjp6yj?=
 =?us-ascii?Q?Rheml1ZzT0qx+hD5Gp+VSnDfZqMe3bYmVrGlhvP6d+yWG6VAQWQTEusBKiHZ?=
 =?us-ascii?Q?HBfX+t7RonGTsAQWKDyqDzpT?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a8af02-9ba6-4d1d-61d1-08d8f2afcb7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 12:40:11.9007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OpVbeTPpQ4u26sy7MMcqfjBmNz0UBunqNn049Tz0kzzuBgCbg/zVBJ3p15mqjUUHUQ7xyP9IY+/RkE2C9fvKZ6H5Tr/VvcficJ9gw9BJPLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2772
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] msgstress03,
 msgstress04 failure on linux 5.10.19 and 5.10.22
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
Content-Type: multipart/mixed; boundary="===============1961001238=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1961001238==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9BMXPR01MB2870INDP_"

--_000_BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9BMXPR01MB2870INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ok..thanks..

What do you think about msgstress03, what could have went wrong ??
________________________________
From: xuyang2018.jy@fujitsu.com <xuyang2018.jy@fujitsu.com>
Sent: Monday, March 29, 2021 2:56 PM
To: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>
Cc: ltp@lists.linux.it <ltp@lists.linux.it>
Subject: Re: [LTP] msgstress03, msgstress04 failure on linux 5.10.19 and 5.=
10.22

Hi
Hi,
I am running msgstress03,msgstress04 with 5.10.19 and 5.10.22 custom kernel=
 built using Yocto but both test are getting failed repeatedly. i am not ab=
le to understand what making both test to fail since these tests are stress=
 tests for message queue want to figure if anything going wrong with messag=
e queue.

Pasting few error message and attaching detailed logs of failures

msgstress03:-
msgsnd() error in child 9458, write # =3D 10000, key =3D 65e2d9c4: Interrup=
ted system call
msgstress03    1  TBROK  :  tst_sig.c:232: unexpected signal SIGINT(2) rece=
ived (pid =3D 43902).
msgstress03    2  TBROK  :  tst_sig.c:232: Remaining cases broken
msgstress03    1  TBROK  :  tst_sig.c:232: unexpected signal SIGINT(2) rece=
ived (pid =3D 43925).
msgstress03    2  TBROK  :  tst_sig.c:232: Remaining cases broken
msgstress03    0  TWARN  :  tst_tmpdir.c:336: tst_rmdir: rmobj(/tmp/ltp-9Ra=
z9tykpq/msgQaAD8i) failed: Cannot open directory /tmp/ltp-9Raz9tykpq/msgQaA=
D8i; errno=3D2: ENOENT
msgstress03    1  TBROK  :  tst_sig.c:232: unexpected signal SIGINT(2) rece=
ived (pid =3D 43927).
msgstress03    2  TBROK  :  tst_sig.c:232: Remaining cases broken
msgstress03    0  TWARN  :  tst_tmpdir.c:336: tst_rmdir: rmobj(/tmp/ltp-9Ra=
z9tykpq/msgQaAD8i) failed: Cannot open directory /tmp/ltp-9Raz9tykpq/msgQaA=
D8i; errno=3D2: ENOENT
msgsnd() error in child 9468, write # =3D 10000, key =3D 5364a4ac: Interrup=
ted system call
msgstress03    1  TBROK  :  tst_sig.c:232: unexpected signal SIGINT(2) rece=
ived (pid =3D 43918).
msgstress03    2  TBROK  :  tst_sig.c:232: Remaining cases broken
msgstress03    0  TWARN  :  tst_tmpdir.c:336: tst_rmdir: rmobj(/tmp/ltp-9Ra=
z9tykpq/msgQaAD8i) failed: unlink(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed; er=
rno=3D2: ENOENT
msgsnd() error in child 9450, write # =3D 10000, key =3D 6015ef48: Interrup=
ted system call
msgstress03    1  TBROK  :  tst_sig.c:232: unexpected signal SIGINT(2) rece=
ived (pid =3D 43883).
msgstress03    2  TBROK  :  tst_sig.c:232: Remaining cases broken
msgstress03    0  TWARN  :  tst_tmpdir.c:336: tst_rmdir: rmobj(/tmp/ltp-9Ra=
z9tykpq/msgQaAD8i) failed: unlink(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed; er=
rno=3D2: ENOENT
msgstress03    1  TBROK  :  tst_sig.c:232: unexpected signal SIGINT(2) rece=
ived (pid =3D 43924).
msgstress03    2  TBROK  :  tst_sig.c:232: Remaining cases broken
msgstress03    0  TWARN  :  tst_tmpdir.c:336: tst_rmdir: rmobj(/tmp/ltp-9Ra=
z9tykpq/msgQaAD8i) failed: unlink(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed; er=
rno=3D2: ENOENT
msgsnd() error in child 9454, write # =3D 10000, key =3D 37efb13a: Interrup=
ted system call

msgstress04:-
msgstress04    0  TINFO  :  Found 31994 available message queues
msgstress04    0  TINFO  :  Using upto 2097104 pids
Fork failure in the second child of child group 9218
For msgstress04, It is a known issue[1]. the fork fail reason see[2].
I have sent a patchset[3] to cleanup these msgstress case recently and then=
 I will add a process num limit according to avaiable memory.

[1]https://github.com/linux-test-project/ltp/issues/509
[2]http://lists.linux.it/pipermail/ltp/2020-June/017619.html
[3]https://patchwork.ozlabs.org/project/ltp/patch/1615550541-21714-1-git-se=
nd-email-xuyang2018.jy@cn.fujitsu.com/
Fork failure in the first child of child group 9198
Fork failure in the first child of child group 9216
Fork failure in the first child of child group 9208
Fork failure in the first child of child group 9250
Fork failure in the second child of child group 9249
Fork failure in the first child of child group 9230
Fork failure in the first child of child group 9233
Fork failure in the first child of child group 9247
Fork failure in the first child of child group 9254
Fork failure in the second child of child group 9228
Fork failure in the second child of child group 9253
Fork failure in the first child of child group 9242
Fork failure in the second child of child group 9246
Fork failure in the first child of child group 9243
Fork failure in the second child of child group 9240
Fork failure in the second child of child group 9238
Fork failure in the first child of child group 9252
msgstress04    1  TFAIL  :  msgstress04.c:204: Fork failed (may be OK if un=
der stress)
Fork failure in the second child of child group 9234

Kindly help to get the failure resolved.

Thanks










[EXT]

--_000_BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9BMXPR01MB2870INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
ok..thanks..</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
What do you think about msgstress03, what could have went wrong ?? <br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> xuyang2018.jy@fujitsu=
.com &lt;xuyang2018.jy@fujitsu.com&gt;<br>
<b>Sent:</b> Monday, March 29, 2021 2:56 PM<br>
<b>To:</b> Pankaj Vinodrao Joshi &lt;Pankaj.VJ@exaleapsemi.com&gt;<br>
<b>Cc:</b> ltp@lists.linux.it &lt;ltp@lists.linux.it&gt;<br>
<b>Subject:</b> Re: [LTP] msgstress03, msgstress04 failure on linux 5.10.19=
 and 5.10.22</font>
<div>&nbsp;</div>
</div>
<div style=3D"background-color:#ffffff">Hi<br>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I am running msgstress03,msgstress04 with 5.10.19 and 5.10.22 custom kernel=
 built using Yocto but both test are getting failed repeatedly. i am not ab=
le to understand what making both test to fail since these tests are stress=
 tests for message queue want to
 figure if anything going wrong with message queue.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Pasting few error message and attaching detailed logs of failures<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b>msgstress03:-</b><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
msgsnd() error in child 9458, write # =3D 10000, key =3D 65e2d9c4: Interrup=
ted system call
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43902).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43925).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: Cannot open direct=
ory /tmp/ltp-9Raz9tykpq/msgQaAD8i; errno=3D2: ENOENT</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43927).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: Cannot open direct=
ory /tmp/ltp-9Raz9tykpq/msgQaAD8i; errno=3D2: ENOENT</div>
<div>msgsnd() error in child 9468, write # =3D 10000, key =3D 5364a4ac: Int=
errupted system call</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43918).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: unlink(/tmp/ltp-9R=
az9tykpq/msgQaAD8i) failed; errno=3D2: ENOENT</div>
<div>msgsnd() error in child 9450, write # =3D 10000, key =3D 6015ef48: Int=
errupted system call</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43883).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: unlink(/tmp/ltp-9R=
az9tykpq/msgQaAD8i) failed; errno=3D2: ENOENT</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43924).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: unlink(/tmp/ltp-9R=
az9tykpq/msgQaAD8i) failed; errno=3D2: ENOENT</div>
msgsnd() error in child 9454, write # =3D 10000, key =3D 37efb13a: Interrup=
ted system call</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b>msgstress04:-</b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
msgstress04 &nbsp; &nbsp;0 &nbsp;TINFO &nbsp;: &nbsp;Found 31994 available =
message queues
<div>msgstress04 &nbsp; &nbsp;0 &nbsp;TINFO &nbsp;: &nbsp;Using upto 209710=
4 pids</div>
<div>Fork failure in the second child of child group 9218</div>
</div>
</blockquote>
For msgstress04, It is a known issue[1]. the fork fail reason see[2].<br>
I have sent a patchset[3] to cleanup these msgstress case recently and then=
 I will add a process num limit according to avaiable memory.<br>
<br>
[1]<a class=3D"x_moz-txt-link-freetext" href=3D"https://github.com/linux-te=
st-project/ltp/issues/509">https://github.com/linux-test-project/ltp/issues=
/509</a><br>
[2]<a class=3D"x_moz-txt-link-freetext" href=3D"http://lists.linux.it/piper=
mail/ltp/2020-June/017619.html">http://lists.linux.it/pipermail/ltp/2020-Ju=
ne/017619.html</a><br>
[3]<a class=3D"x_moz-txt-link-freetext" href=3D"https://patchwork.ozlabs.or=
g/project/ltp/patch/1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fuji=
tsu.com/">https://patchwork.ozlabs.org/project/ltp/patch/1615550541-21714-1=
-git-send-email-xuyang2018.jy@cn.fujitsu.com/</a><br>
<blockquote type=3D"cite">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div>Fork failure in the first child of child group 9198</div>
<div>Fork failure in the first child of child group 9216</div>
<div>Fork failure in the first child of child group 9208</div>
<div>Fork failure in the first child of child group 9250</div>
<div>Fork failure in the second child of child group 9249</div>
<div>Fork failure in the first child of child group 9230</div>
<div>Fork failure in the first child of child group 9233</div>
<div>Fork failure in the first child of child group 9247</div>
<div>Fork failure in the first child of child group 9254</div>
<div>Fork failure in the second child of child group 9228</div>
<div>Fork failure in the second child of child group 9253</div>
<div>Fork failure in the first child of child group 9242</div>
<div>Fork failure in the second child of child group 9246</div>
<div>Fork failure in the first child of child group 9243</div>
<div>Fork failure in the second child of child group 9240</div>
<div>Fork failure in the second child of child group 9238</div>
<div>Fork failure in the first child of child group 9252</div>
<div>msgstress04 &nbsp; &nbsp;1 &nbsp;TFAIL &nbsp;: &nbsp;msgstress04.c:204=
: Fork failed (may be OK if under stress)</div>
Fork failure in the second child of child group 9234</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Kindly help to get the failure resolved.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks<br>
</div>
<pre>
<fieldset class=3D"x_mimeAttachmentHeader"></fieldset>

</pre>
</blockquote>
<pre>
</pre>
[EXT] </div>
</body>
</html>

--_000_BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9BMXPR01MB2870INDP_--

--===============1961001238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1961001238==--
