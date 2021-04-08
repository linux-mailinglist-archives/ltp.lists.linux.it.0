Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C27E357EA6
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 11:02:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B3523C1DC3
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 11:02:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C0FE3C19E4
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 11:02:36 +0200 (CEST)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (mail-eopbgr1380137.outbound.protection.outlook.com [40.107.138.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D4849600072
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 11:02:35 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShLsgWOYf78RnBQZcLlREnFcsMcZxkCWj3zWh2dGuR8YgsnkklqtvLIKzgT51JxaLJPD3Mrtw7MIlZnTFkF+k38gjog3t6Pyx/zIgM+46WFh33wZQb005r/8uqYWp/Bl4DqW/ceSzCLjAW8L0jRMuhYhiGScMkb7HTy7R7LL3elrUqnqqrdhmMJcIuTI/Qqz+2+s820sBbsTe1TLJxaXk3ODZzYmf5cnlJEEKq9McFkYL1j1So9Nw0pMH2DTY3PSiILOED6JVfWqwHQa1hpQNOS3llWWW0OiuPqmMYpis5GDkmdXlQvo/u5AcPcjeWjOth541G1DtHjSbfl8Qtlkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6ZxzqveKHF7NXAKq80CgfdfHeeOLKxMgX7dyuT+5lA=;
 b=OSZvTPFIcJjNxY1PKUvAgdHtFTMBi8vmOwgYN9SfgywsrTqhHi/OBuKbsGPAE+tURx4fGHfv59zoyuq8ZA/5Dq1nVw945D0NKjRarbcGlswb9admq5a2PzKUCtU47B06e7XpD6UtH/YlTuzFJF0dY2rUkAYNEeYDy0rXJafYFS6P07zCt3qLet6HAx7P5gRTIENuSXBwc8PqGqxYaNhrKiawydZuO3PXCG1zTfZQzhqbOR11CW3+zcvzSCn5wpeRIygK78bZGNMsZCzP/w6mSczhFs/x8npwgm/8UW68PW4QtMWz+4q3M68rfD9WnClHuH75HoqkejjF8cOXg7OEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6ZxzqveKHF7NXAKq80CgfdfHeeOLKxMgX7dyuT+5lA=;
 b=pebQZqNBNcNnTW2iAKDWT6ll4e9+RHS0JRqyQWXXj4qcgHLlZoe3Y7uXarPVik/VLCK+k7Tn1MNi0ZW5XXWtTy+EEyIMuJdZ99Ln+rL/Yla9ffZerNk7JML8++XHIFYBIA8PoVeIp57tHdTG9ezkXVSqOMIU92XOzZrEq0zTWc0=
Received: from BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4a::10)
 by BM1PR01MB2228.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:43::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 09:02:30 +0000
Received: from BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::54ab:8a3a:1c8c:9618]) by BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::54ab:8a3a:1c8c:9618%7]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 09:02:30 +0000
From: "Pankaj  Vinodrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: LTP msgstress03, msgstress04 failure on linux 5.10.19 and 5.10.22
Thread-Index: AQHXLFXnprJft4mvqE6Igyuj8pAZiQ==
Date: Thu, 8 Apr 2021 09:02:30 +0000
Message-ID: <BM1PR01MB2868C0458678E57C87BBC708EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>,
 <60619D5B.6090507@fujitsu.com>,
 <BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none
 header.from=exaleapsemi.com;
x-originating-ip: [14.98.179.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94716704-d3e2-4ddf-b139-08d8fa6d0a85
x-ms-traffictypediagnostic: BM1PR01MB2228:
x-microsoft-antispam-prvs: <BM1PR01MB222815EF4B2C294730A4FC67EE749@BM1PR01MB2228.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 85dHCr3yZlqnxqt2gaCtU/1BebFuZfsW+v5QAlKXJTb3KAchECTMjK+q6qvFc4ryJu/1PzIRlEjihURD73Znw2ovx/qNOin3yI/Poi34E6iS0pX6n/viffaxnh/5hSA6yP7p6OjViVymZnpr9iH5YsEsk7aLhxqi09EkhD7x4GI3pp4OIms0DdHFKB3HngU5vRCWf3LBB7rMUCnxxGmQ/x5FGxqkYUWpa4cgtJoDaqdtQHggKizhWPFZLhCHApFjoEghQbRwPI/vXyq5C7IF8ZR1IGHmiQY7PqE2CPoqcevxHfZuCIAsejdC5jxGUNL8BNNKIx6yB74EQ+SllziTMS2qYEZoZ7fINhJiagUYJ0lrzFeGipTCRqquEDZ0q74gHv00uJeFViHFqK7BnXOGFA0ksSL48jlYBdU+GpllkUvMlT/h9gDXL3JCHkhzG6GRoLfxL3blDcAMEurt4ZJEy8umLWI7FkhddOL0i7YACjZ30bB9+uYvA6+38FWSWrxaaszTFOk8/NkeuNGFQRJR557dVjSkmz6ZADNzyzU6aMoHJz2+sj4JIliviWe0Y+7NSozeygu8P8V+3WJ73+1RYQrjIUMJHFJUEQrtp2ujdV2I/zv8Hrtq5OjSrf4p7L9HZ2RMpp5HH34Lkmwk3Kne2hm3EVh4Wz+Juf9XKKu2W30=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39830400003)(346002)(376002)(366004)(86362001)(6916009)(52536014)(316002)(55016002)(26005)(5660300002)(55236004)(6506007)(186003)(7696005)(8936002)(71200400001)(66946007)(66556008)(64756008)(66476007)(66446008)(76116006)(8676002)(478600001)(83380400001)(38100700001)(2906002)(19627405001)(91956017)(33656002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?v6D4RW1/Lyq1N7H2ZUzK5wkl22sTYM9D9e24z6v4WFU3xvrZS7GjDUJ1wC?=
 =?iso-8859-1?Q?70J2g3p0z2mjwisoTX2lMxolCTYrdGnrzgdQ+G8Og8t6FK4Mwm/z4fY/fm?=
 =?iso-8859-1?Q?LHU3JXDu+xi2oE5gZtze7AwlLpOJ4PHvAhzXpJhNITJoWf18zC+Rm7jjFX?=
 =?iso-8859-1?Q?4LNL2MLjvcRx7x3hr4rMPkwv55teA4KtMM+eSPbKc3GyAKZNVrg/qWONRb?=
 =?iso-8859-1?Q?4SsG+3FFIikBD6Np3AnPo2HF2hLg6rThPdxExmH88YxiYfugv0yGhkFqA4?=
 =?iso-8859-1?Q?Btr4fdt/6p2pxdJooA92i13L6XMP7oRdIsYRGy/FLUwpQBXOmNS7vjCebq?=
 =?iso-8859-1?Q?sWYE5TPZazHxbzhG22lW1x4AH89PIyE3rW5TQiVIxwbchzgkxtjdMxDcSl?=
 =?iso-8859-1?Q?4ZzF11azokh47sWyGJJBiCtfWKDaCJnRsEBIJylDrlCqbvFMNeQEotBHoo?=
 =?iso-8859-1?Q?0ChwSiA+UnqEFNWHKj93vl8buPQDlmVe1JoO+Ge8xLGL75JG1P9iIDGw/P?=
 =?iso-8859-1?Q?KHNQKcdvP23miU6eD5Fbz0zazfilBvtaucd979URyZierr+ME+WF4Y3r7G?=
 =?iso-8859-1?Q?uVbkD53EJ6QDbEp+UKCAbgy5ffeSzMDEH4fB5gakAtBYdmcpoejyMIyO16?=
 =?iso-8859-1?Q?uFt26Ghr7kz7rBaHZ/ER4ucULExIgq3TSGdWiBcsjVWJOs5glaJZ4rTsLc?=
 =?iso-8859-1?Q?/tBIwBMSVwoJwXmYe9a59qqGCO1PtPyi0otCNvfUMts13sJTq9QKGu+HWM?=
 =?iso-8859-1?Q?+VYXo38FYFhe+DGsAEF9A5OpPUWh8mTRAjkJGg1gUtdZIzaKUapaAZZLXJ?=
 =?iso-8859-1?Q?AwhkthihoN4pAzhxU1XiZ4ZLpDIkOWMbOA01VFjPxnbrjnh94jrZA7WWac?=
 =?iso-8859-1?Q?ooJgxfknBplqTNp0y4OpBAz6dV9NsOExKuNx3Rei+tIUrpZmuT/VHDEm1H?=
 =?iso-8859-1?Q?A1XXMmKDZL122H40SuPtuiN+NLlYPdrswYnnZTfNgX0mf8VFrxT857ge1S?=
 =?iso-8859-1?Q?2tB1dSOOGx9+U1AIZPINkt5bflo7NnPAa3+aX1RuA0MIl8kdCq6WNb5Zu9?=
 =?iso-8859-1?Q?0JWepS/QVC1FFDudI61MNGRWCK5WcCwKp305IVAlxIjYNAbIuWwRHVX4fO?=
 =?iso-8859-1?Q?/AtBz8lo4XYak1qVnbCsek4pUTAuOMMHAAiIU+V57kc+PMqnlhm6vqemiy?=
 =?iso-8859-1?Q?7wQM4jh9ivsez53Njyql43xmAjvse7J+MaABhIzLQViwoBY8prN18yM9vw?=
 =?iso-8859-1?Q?mWOEkjWOBpRx6zaIvPSJiUKZUq9KrssYVe0wY2nlpgxpxMG1JZWVI4UsG3?=
 =?iso-8859-1?Q?Mb8DW9/wTn+0WFD4ra6OBqWyL0uuoqrjzq2JITm5Fd9S1W8=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 94716704-d3e2-4ddf-b139-08d8fa6d0a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 09:02:30.6718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: llIBgaI0+dYhAlWAW8boG9MZpC1KQkE5ZjZyt1Yl9zWY5mho02MMlJrD0pfVd6OPBx1nSGcBjwsgiU+RI+Vx2Z5Gl5Cju8zIv2PMPgUCwo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2228
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] LTP msgstress03,
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
Content-Type: multipart/mixed; boundary="===============0531934309=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0531934309==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB2868C0458678E57C87BBC708EE749BM1PR01MB2868INDP_"

--_000_BM1PR01MB2868C0458678E57C87BBC708EE749BM1PR01MB2868INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi,
I am running msgstress03,msgstress04 with 5.10.19 and 5.10.22 custom kernel=
 built using Yocto but both test are getting failed repeatedly. i am not ab=
le to understand what making both test to fail since these tests are stress=
 tests for message queue want to figure if anything going wrong with messag=
e queue.
Pasting few error messages and attaching detailed logs of failures

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

Kindly help to get the failure resolved.

Thanks

--_000_BM1PR01MB2868C0458678E57C87BBC708EE749BM1PR01MB2868INDP_
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
<br>
</div>
<div>Hi,</div>
<div>I am running msgstress03,msgstress04 with 5.10.19 and 5.10.22 custom k=
ernel built using Yocto but both test are getting failed repeatedly. i am n=
ot able to understand what making both test to fail since these tests are s=
tress tests for message queue want
 to figure if anything going wrong with message queue.</div>
<div>Pasting few error messages and attaching detailed logs of failures<b><=
br>
</b></div>
<div><b><br>
</b></div>
<div><b>msgstress03:-</b><br>
</div>
<div>msgsnd() error in child 9458, write # =3D 10000, key =3D 65e2d9c4: Int=
errupted system call</div>
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
<div>msgsnd() error in child 9454, write # =3D 10000, key =3D 37efb13a: Int=
errupted system call
<div dir=3D"ltr">
<div style=3D"background-color:#ffffff"><br>
Kindly help to get the failure resolved.
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks<br>
</div>
<pre></pre>
</div>
</div>
</div>
</body>
</html>

--_000_BM1PR01MB2868C0458678E57C87BBC708EE749BM1PR01MB2868INDP_--

--===============0531934309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0531934309==--
