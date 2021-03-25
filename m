Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A476A3492EB
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 14:16:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 737E83C5F4D
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 14:16:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A160A3C27FB
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 14:16:02 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E363E600CC7
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 14:16:01 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12PDEisn107818;
 Thu, 25 Mar 2021 13:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=SMRiikZx3+M0brvpMKZAVGlVFqzKXNJqE4rWNLgTbBc=;
 b=J9kO9jbHQ2J5eyUrdRmO2rTcA7PHqcrpSZQUDGVl959RI6VPG1w3AOKol27HM3qpKoV1
 fiY8itZy3TqtGWu2putqjfFLipeAoAtoTDVqCQSmC6eqA4TlyZLr/WRoWn6wpPvmKCLB
 tyeOrtGDELIxXg3SYBR0PefG+efyM/PlQHZqQxI4hDR+lgmfX0S1DHricCm5OSgBCpmq
 /aOw5LW/CE+9oLAifFpOtM3wlhJ2OvkEz5NEU1yJPaCf4e0cUNYxl2SiPJtGrb2Iz9e7
 KnY/yL/MtYPRDNvoD8sPBVw6NKAftiQEet048YptL0THeXMEpI8TwW500+I5Ba4SlNXX xw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37gs1r8dbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 13:15:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12PDFJae023781;
 Thu, 25 Mar 2021 13:15:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by aserp3030.oracle.com with ESMTP id 37dtms469p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 13:15:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKscvuulx15Qlcy7+ljThDLZP624/3k0TjgEwj1J0M7cIwSrEh5iwu8VoUuWN/KLAZcP+sNcvLOeuzzuNr3q1weHABB0DmTccLQtbwwSPUKyW1YA9+6K5H4qaSOG4KCfxM+xUKKJnq1w+IJ28qN66HiWTzNs2uYG01pkawYpkSSgi83ePT1FO7V3xQCRXEZq/Gx2u1IsqeXBbYO1rmZE1X+rFxzWcxnP/ehqT5GdeRi2iUdvsGUviPIB5fR5b3nmU0HvXEtaa0HJeuIt6SbWSNLOk2mkzpJvDjRP3dF2KE4cM3CIRDLcSFsXnQ2Jb2hZuL5/NpQONHhV2Gtvw2w9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMRiikZx3+M0brvpMKZAVGlVFqzKXNJqE4rWNLgTbBc=;
 b=Lq1M8bC2Gt/9ad1NfzEg6tVeT5C5WDm3jApOjPLBU/edbJ6VYBjOUS8CJZcDDzecOgbiu7ko0H8aYLoy6a+GQdtq/xUBsdZcfnVw2NQFJJ5MjEvL70mqlXuuQOIWToa+6Q6cMAOoi3GN8ux2+JLVT/5p40Jj3OUuFlzCCmQHECVPjsVfrobFCjVrHBnAQ1a5t+Axf+h1uQy4XbSs2uZVjzAtZh6CJtGJrukb5M0LaMZ/me6SM4pQCgtwPIW1S2QZC/RJ4nGj3EgTwMB8lFGC7TPSNHoNHLyJM9jUcyqumMoNujksgLi8HSWU5xs0HeiozpdIRH0Fjmfh/kzVkA4HYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMRiikZx3+M0brvpMKZAVGlVFqzKXNJqE4rWNLgTbBc=;
 b=FkuPcfSqXvXigK6CYaqfWbl+hEepRwG9l6A/xyhv9557Ll82ghGcFyuUk9ZDsUelrWqBcXH1NYO0dyv/eGUp5ZK+4eZW6tjYVsxaVgV+/G45/D9smqTR8EwKVevyOquPWylmbY/51+L16n96riJQxfWItjoA/jbErXK7g9AG8go=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR10MB1791.namprd10.prod.outlook.com (2603:10b6:301:9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 25 Mar
 2021 13:15:53 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::1ce7:260b:b004:c82c]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::1ce7:260b:b004:c82c%11]) with mapi id 15.20.3977.025; Thu, 25 Mar
 2021 13:15:52 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
Thread-Index: AQHXCvRm2LPXqQYmf0Wq1gEM3bkluaqIJcyAgAnHDgCAAqFKgIAATeCA
Date: Thu, 25 Mar 2021 13:15:51 +0000
Message-ID: <20210325131545.jwrzhdy474utqjpa@revolver>
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
 <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
 <CAEemH2cKR98HvHZ6OYJpLpaX9-5hfhTak650=DtU-q2Yoo6kbA@mail.gmail.com>
 <20210323162714.t5dm5vbo35vl4t2l@revolver>
 <CAEemH2fnyB_dGzQWUb7SBi9S01vYGXaZBczj2ZwaYF-Rqv9UsA@mail.gmail.com>
In-Reply-To: <CAEemH2fnyB_dGzQWUb7SBi9S01vYGXaZBczj2ZwaYF-Rqv9UsA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ecc3121-09f7-49e6-f59e-08d8ef901d9b
x-ms-traffictypediagnostic: MWHPR10MB1791:
x-microsoft-antispam-prvs: <MWHPR10MB1791E1ED35CACBBCDCD64A73FD629@MWHPR10MB1791.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RwG5kwXJ4wpKgUuyThPVEQwT110VLUC/ZyuUi3mBkEO/i1K9rXUNcQU8Qya9ryTYbpWcDb7r+YM3zkNtLRZFFtppklOMO53Ilhx+y+zkjB+eW4kcg04TTFbpIuFEW6dhdvz49xHHh9EjNwL89niRjuohcTJzF+uFQQx1pF/g+O2VDQmM0+MDDla5HRvCvdetO/n2dQ/FR4Y4mxrgUguy5pImd4Y9KG+nj8WSzfqVeXy823PKg2L3gvwJVFquBpdqJ8uTJNqlMXhCl3qsZvWHvDVTKLUYI+ycycQNdexw6Pa8yMHcUoh14kik1VGseWKUsz+pWKIArgGNJrjf7z9WeCIpIyvvLppzKLDE67Lo80P3WjSP22hH7M5xkQwvvJU9SrCL1JD/t314Lg2Eqg14gV4QsSTABUC6myy5co5qI8tbYVksoHfYdbvt8thrwjJv8Jw6zCglvtmLcpebZnjX7vuXSry2irhZ50NMfPaSBy4KDp3QlXQRyRdmQ2lgAvAmIADP5Psm0DQui6eRaXnepXTVGlBUF9VvZxCTKmWJd/fIZ/4NptyNg4xnJ8aWRMGlxnKNvuWVI1LjiCr33t02MF4DvNygLP0sBb6lo0cNleUowgnM2rcpl8ajmEUKyUBonSA735yIapaaSQiIiTt4GMIcitRRoFD5J4i8QE9H1LU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(346002)(136003)(396003)(376002)(366004)(39860400002)(76116006)(91956017)(66476007)(86362001)(66446008)(66946007)(64756008)(66556008)(9686003)(6512007)(6486002)(8676002)(8936002)(6916009)(71200400001)(38100700001)(26005)(186003)(53546011)(6506007)(44832011)(5660300002)(1076003)(4326008)(2906002)(478600001)(316002)(33716001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YSf5A2Gyi7c3VH3Q9OgpiSUxOwZ+SoJaGAPkpfW+49QkOzCMJjKt9oGjH55L?=
 =?us-ascii?Q?/JeFwZaC+ErIBg32OfPUpGxrSosM599c1n7Ucb8pBun7XsY8/rEQUaJaQPwc?=
 =?us-ascii?Q?G19hMvULIfIglFcRyjouxPlkC1P8zwPIvxZa2MfwWAQ5Xbe5LyAVC6je1ban?=
 =?us-ascii?Q?Zeh7FwdYrIe8OBPWPel9wh9hWBj1ZcR2j3nbjtiDikhfRxG2T3+ohgJ0YWii?=
 =?us-ascii?Q?6QoWxOpZu2gM/8r7Mf+Fytl8jZtzeFip78ff6kzhplAxGMGqZphbUAxJ6wd7?=
 =?us-ascii?Q?wecKMLzmpcbsKbGbIrOOqdGrSNnz3kYCWgF6kaqJvUWU6M22+iisB0dMT+jY?=
 =?us-ascii?Q?mp+Jl47bLlrs1mgOzIYRewRTwoDxQWUACzOhhf0HGx6nlMIgeifoBMAjY1R8?=
 =?us-ascii?Q?SloIviP9NRjU42hreDXw89o0q5l/YmRCLoWLekG4thzEcoJ9qnRFXJ4HUJ6v?=
 =?us-ascii?Q?C35o5EKvW70/UDk79McK1QLJ1mRarhmajSyjgRGQTwa23l0clxX5xqsaC9Kk?=
 =?us-ascii?Q?68o7cx/fT0cXMjJRvAddgD1ED8ZOVRpNW7fO0G4WqP8LPomXNA2macvnM0Ui?=
 =?us-ascii?Q?WIPvKnX3eGpcL9VakOq6Yf+zlO6vvFdVVHNs6hm6dkiYaj1of7gz3jm1r9HB?=
 =?us-ascii?Q?F7kcgkNa35KrtlcZS61HhCPZ3PX1xnu/IgsyRwc1B+K8kLxmBZae8PjU4VTO?=
 =?us-ascii?Q?aaIZNU0JUNa0fNb/G2A5IZoZSBH1Phu2qokyfbii5jpDBpzEwZyEYfkCzhZo?=
 =?us-ascii?Q?f/13+Eknp2ToUlifuPPA1RfujOnPMw/Z/zfiNk/4LD+VcD88HvC3VRukpH9u?=
 =?us-ascii?Q?qjtCaSOBOcwgbMOMXeqJSL9MBd5ebWgV8jbnq3ODtOW9gal/K9HS1ijExlnr?=
 =?us-ascii?Q?GZG9lo2q1qaYyNMp7vmoZoVlt+ESrQ7/IjegbSE1FFGcD1GVGUDQEcGoTXtc?=
 =?us-ascii?Q?RjqlVkS+QZJDueM7/NV2UmgWYnLs4xv0JxhWhgZOjsmGRhWyXOGQ8d3kx5tL?=
 =?us-ascii?Q?ZOZRc12oSVHEqyAnRdNtDXBBbrNn/ernY9dp1/6hOsGcSF9iQk87afI6Nevy?=
 =?us-ascii?Q?CPkZhDZaRctCoHGEgulp9SWeOUzYMX2F84haaF4srjFxQjWDpYikAAF+w8xb?=
 =?us-ascii?Q?5Xe8ef94oVMMJK5eA2sKZ5ed0iLN3vKqlpVGOGp4u4QGSlixX4Wz2rKUT5Sl?=
 =?us-ascii?Q?AFuWiI9rYCH3ARjLfsPH+7+6neusCEu2daIHRpJnQWcLOoPzT3AQoKZFFtPM?=
 =?us-ascii?Q?fESayCvUEUmo/dHkvzcUQoV1QLqIkmBDYnDGhYjm2q2PD8IE8Ss2BREvbtDW?=
 =?us-ascii?Q?coEVbYpM6BLmjMHRVjBJoQBe?=
x-ms-exchange-transport-forked: True
Content-ID: <CEA70E9F9D32F2498F586F6B5C7F4C9F@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecc3121-09f7-49e6-f59e-08d8ef901d9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 13:15:52.2475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kv6U+/uwgChIa25Vp4I+UcqDlF+dpGuHUk93qn4aMYcjk0p2auPUs+azUdfPI/iPqdEWcYhQ8zpOuQoEEO0zOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1791
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250098
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250098
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* Li Wang <liwang@redhat.com> [210325 04:37]:
> Hi Liam,
> 
> On Wed, Mar 24, 2021 at 12:27 AM Liam Howlett <liam.howlett@oracle.com>
> wrote:
> 
> > Hello Li,
> >
> > Thank you for looking at this testcase.
> >
> > * Li Wang <liwang@redhat.com> [210317 07:08]:
> > > Hi Liam, Petr,
> > >
> > > Liam Howlett <liam.howlett@oracle.com> wrote:
> > >
> > >
> > > > ...
> > > > +       if (mprotect(addr - page_size, page_size,
> > > > +                    PROT_READ|PROT_WRITE|PROT_EXEC)) {
> > > > +               tst_res(TFAIL, "Cannot mprotect new VMA.");
> > > > +               return;
> > > > +       }
> > > >
> > >
> > > We got permission denied here while performing the brk02 on
> > > x86_64/s390x(kernel-4.18~). After looking at the manual page of
> > > mprotect(), seems the access issue caused by PROT_EXEC.
> > >
> > > "
> > > POSIX says that the behavior of mprotect() is unspecified if it is
> > applied
> > > to a region of memory that was not obtained via mmap(2).
> > > ...
> > > Whether  PROT_EXEC has any effect different from PROT_READ
> > > depends on processor architecture, kernel version, and process state.
> > > If READ_IMPLIES_EXEC is set in the process's personality flags
> > > (see personality(2)), specifying PROT_READ will implicitly add PROT_EXEC.
> > > "
> >
> >
> > Unforntunately, dropping the PROT_EXEC causes the VMA behaviour to
> > change and does not test what this testcase is intended to test.
> >
> 
> Yes, I agree with this. But am not sure if Linux take some action on
> security
> side to prevent setting PROT_EXEC permission arbitrary.
> 
> 
> >
> > Removing the PROT_EXEC and the PROT_WRITE does test what is supposed to
> > be tested.  Can you verify that this works on the s390x?
> >
> 
> Actually just removing the PROT_EXEC then the brk02 can be passed on all my
> platforms.

Just removing the PROT_EXEC invalidates the test.  However, if both
PROT_EXEC and PROT_WRITE are removed, then the test still does what is
intended.

> 
> 
> >
> > Are you using real hardware to test this or can I use some sort of
> > emulation to test on my side?
> >
> 
> It looks like easily to reproduce.
> 
> I get failed with both virtual system and bare metal, e.g. the first one
> is on my Fedora33-workstation. But the worth to say, brk02 passed
> with raspberry pi3 and pi4.
> 
> x86_64
> -------------
> # virt-what
> # echo $?
> 0
> # uname -r
> 5.10.22-200.fc33.x86_64
> # ./brk02
> tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
> brk02.c:41: TFAIL: Cannot mprotect new VMA


This was my test platform.  I also sent it to the Travis CI which passed
for x86_64.  I will re-examine the accepted code to ensure the cosmetic
changes didn't invalidate my testing.


> 
> x86_64
> -------------
> # virt-what
> kvm
> # ./brk02
> tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
> brk02.c:41: TFAIL: Cannot mprotect new VMA
> 
> s390x
> -------------
> # uname -r
> 5.12.0-rc4.vdso+
> # virt-what
> ibm_systemz
> ibm_systemz-zvm
> # ./brk02
> tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
> brk02.c:41: TFAIL: Cannot mprotect new VMA
> 
> 
> armv7l -- raspberry-pi3
> -----------------------------
> # uname  -r
> 5.4.96-v7.1.el7
> # ./brk02
> tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
> brk02.c:56: TPASS: munmap at least two VMAs of brk() passed
> armv7l -- raspberry-pi4
> -----------------------------
> # uname  -rm
> 5.10.17-v7l+ armv7l
> # ./brk02
> tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
> brk02.c:56: TPASS: munmap at least two VMAs of brk() passed
> 

Would you be willing to re-run the tests without both PROT_EXEC and
PROT_WRITE?


Thank you,
Liam

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
