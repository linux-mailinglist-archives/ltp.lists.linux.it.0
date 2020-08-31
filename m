Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F16BE257EC1
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 18:28:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B39EC3C2DDD
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 18:28:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BDEE73C0886
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 18:27:57 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C52BB1401188
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 18:27:54 +0200 (CEST)
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VGRsJv031298; Mon, 31 Aug 2020 16:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=ZhxmCg2U6Qo2R8eQ976+awUCZ4HenLgpVkPHhE94HQY=;
 b=FxgkFI621f5Y0b4Lpgk+RnKCc5mYa4G+sbsNRMYQJT4X0tXHxSEd77aIXbXjWpGFKpf/
 014S9y2ru1yXpVmDQNFCpINujzYtfME6IdESAk1XEGWuVmP4P9YIP+taNnnXuOn50Ggp
 7WjUzSwMFSNj7V1wucKbbniStoMsD+Zb8jJjxgia9bNMxwHyBLFBL5tRkrQ7o88RqNVR
 6Kw0Onq3RuKhYm8d3KxVZNxwfXHZF71D4wF/+QOZGMZoSiWXz4PkGrPZwnDv2BIyWiai
 bAj/9cDJptDFTM4z6Arf7sfBvkChguOb4G/pQfaK1brhRBUhVu+ogpUWygNczXPAh3hR 9Q== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58])
 by mx08-001d1705.pphosted.com with ESMTP id 337dw094n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 16:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/JLfIWBnlrNt+Qo+r3aBWtlQ0ULlAVSztDhqcc1mvB3j72TXs4nS7hTaVjK2TcNUMc0uKg4ahOgwiT140et7It2wM5SYsAsvqxKfZW8QcIEspy8iy6H1NS+b9VPt16PI3QlN8sPa0moNhVu5UhxKvKQLKtCxDONshZhzCLnL1zrcVD/bNlh/4zzxkxPac/bALcOVLTJc1hj0NcaKmxHCCoT4TpymjFAOxb222ye5/QQgFCTEmFDQVX2R4l+iCogEpI8LUJjrQrEfB3ovEUjLxg8A64zkbvnBoXq3VwiN616QHbI0B1ylfrCuKRfUbTwtuBpCPmOJTox1gFaD8pscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhxmCg2U6Qo2R8eQ976+awUCZ4HenLgpVkPHhE94HQY=;
 b=jo0XqOmPeevbdGe7Qxtn2Wnwm2DXKLvYxV3Y5lPutsgfJ/kQSpNGhhFxylBdYJ/3eiohM9frscQi8E64b3HlGtXO8Nk34D+K03Pjg7LGB+W0zwmNdYlnhhmZvHTvL1ntMCVI/MK/FUFWKmnOaUhrWE8BeCfBTsZkMTz1yTz8NP0DD5maCgW0Dpu4nhIE2z/heZLbL+p0rJeb6bAVRKevlzmYxb7/rWByh4TGGCgefGsORuL1XhpZTwC8Uy95HQjF7U5bg6ewtzM8fqSlb2KX60lRSn/0r5cfdg5My0qZGlYq4CyNjuvXHJu4uo9KGLaiHkebGK1Io9AXgkryD/+plA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1496.namprd13.prod.outlook.com (2603:10b6:903:12e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.5; Mon, 31 Aug
 2020 16:27:51 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::5c0c:3d3a:c493:efa]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::5c0c:3d3a:c493:efa%11]) with mapi id 15.20.3348.013; Mon, 31 Aug 2020
 16:27:51 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "Bird, Tim" <Tim.Bird@sony.com>, Cyril Hrubis <chrubis@suse.cz>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH] [RFC] runtest/quickhit: Remove.
Thread-Index: AQHWf34I+TaOImm+qEuQojZnwLJ9zKlSXfSQgAAG+6A=
Date: Mon, 31 Aug 2020 16:27:50 +0000
Message-ID: <CY4PR13MB1175D7238F6A05AA0A668B9AFD510@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <20200831094617.7764-1-chrubis@suse.cz>
 <CY4PR13MB11758CF355D958B797D2EA9FFD510@CY4PR13MB1175.namprd13.prod.outlook.com>
In-Reply-To: <CY4PR13MB11758CF355D958B797D2EA9FFD510@CY4PR13MB1175.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sony.com; dkim=none (message not signed)
 header.d=none;sony.com; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ce4355d7-bb6d-43d0-8fec-08d84dcace2c
x-ms-traffictypediagnostic: CY4PR13MB1496:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR13MB1496486218EAFED7B6F00F15FD510@CY4PR13MB1496.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:153;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4PzaKBu6OOIf30dT4i6kCRjsPhusIsY31Fu7f8xuXsBnbB3jsUDOkwOIR++lPIh0fe0jxqNQko4f8Uzm19O430L1xRlIHwIIbPr+Zs3uA9e9eHvgjLPpcdA12FBpmlt6OpIZbaNGyhKWhGKcvM6s30I82AG7XqJraCU13BTz/IINn5kNVqfEbC3JJL8hBGMzy/EuoRBv3k1jj5C/TFQZMCldhkWmHSzUBI0uQ9/iTGlBtwYNmIkO6FdmI2YadUT0nR2CiH2/Ia3LebqWbNOfP3ETqgoHnGww6WW3CQSc3gyfJKxxUXWM+toVdyi2F5KyNQmWAoc4IFT7HtdDVM9DOk9ScIIMzwoZkXi6pqGsZahcn2qhCO7hffzxf+3ChoRh+jLMdiOQhQKVJr0cG5SQLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(66476007)(71200400001)(966005)(478600001)(316002)(52536014)(86362001)(5660300002)(2906002)(30864003)(8936002)(2940100002)(8676002)(6506007)(7696005)(83380400001)(66446008)(64756008)(110136005)(55016002)(83080400001)(66946007)(26005)(9686003)(66556008)(186003)(76116006)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: AZD/2pVPl5mSYcQ3UewEVgGfWzrGfR+K28qDxUKjtxZCaFyDpqpT1nw1OXiE6ye3U6P9U40QOiiSpbTzhk5nV0C7lyvF7wirQnVM7PkSlFeXO0V0+kelpIrU+5tgE8hmWrD7+MBIGI4DEUJrct+hG2qQB3EgzV6+dEQwesOReIDOZ2YB/IfKAJa+HXCeFIp61H9I05UpqkviRq+xw8TAKETUMM2kSvWvprWrp0cxqazDY224h5YiGkqX9POBB4UjW4rJdNZqBmasz9iqsYDYUyshMymNJmtFlmYJH2iiaShuBt5uqYzoPw5NAiDcp3RHhLLblwpoDS0ch1vqgZPvAFCdflzOwG+KEc/Eu8nJXjCLcrKLFN31SBaxxpK04KVtsEIR0ZVG0wm8tjqIKkZzkiq8/Q7IoAO4DI3keCVRJ2dMEHbixlxNJ5LEvQjUbaYZ2jPaXdrcO6Y4PJD5y2S0qW01Uzu7TK7o6Qztt6hCLoKTI1YyNg9i7t8rKb3JrvJ5pqXfboNsj1TiNW7DGc/V2+bRXExqNau2Tf6RGTzmMEMcbueBbG0PVrAjj/K7d0mcnI5K8+2FgZbOCiONHyX+EJo9sIq7X5BRTZD0tawo9Bwp1PZevUwDNXMclnqKYjXvDWiqf24aGHWmM+v+ZkjIMQ==
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4355d7-bb6d-43d0-8fec-08d84dcace2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 16:27:50.8815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLG7TFdlwRPYtweIjqfm8veTkfrJjDQx6ghk+j2znWxJZx4P+Day6yC0Z+Qv7l/c31IEld+qRWA7VDDIsg/L0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1496
X-Sony-Outbound-GUID: IGZv1MFkLtftNiWe0KEMhsmASNFyfGSY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_08:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310098
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [RFC] runtest/quickhit: Remove.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



> -----Original Message-----
> From:  Bird, Tim
> 
> > -----Original Message-----
> > From:  Cyril Hrubis
> >
> > The file wasn't properly maintained for last ten years, 99% of the
> > patches touching it were only removing removed tests. We should stop
> > pretending that it's useful anyhow it clearly does not contain well
> > selected set of tests for quick testrun anymore.
> 
> Umm.  I use this one all the time, as a quick LTP sanity check.
> I will admit this is really used for a quick test of Fuego/LTP integration
> rather than as a test of hardware/software status on a device
> under test.
> 
> Is there a replacement for this?  Just deleting it leaves a big hole
> in my standard CI loop.

Thinking about this a bit more....

Since this test is used (at least by me), more as a test of the testing
infrastructure rather than the hardware/software under test,
maybe it make sense to repurpose the test and adjust its contents
based on this new purpose.  What would be nice is a test that
exercises a bunch of different possible LTP behaviors or outputs,
to test whether CI systems calling LTP can handle them all correctly.

So, there are 2 attributes of the test that are important to me:
 - it runs quickly (more quickly than a "full" ltp)
 - it runs a variety of individual LTP test programs

So it might be good to have this be a test that includes items that
behave strangely (but quickly).  That would make this test more
useful for the purpose I'm actually using it for.

It might even make sense to rename it to reflect this change of purpose
(if it *is* a change of purpose).  For example, maybe name it
'smoketest' or 'weirdstuff' or 'selftest'.  But 'quickhit' at least captures
one attribute that is important - that this test is used as a quick
check that basic LTP functionality is working.

Just some more ideas....
 -- Tim


> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > ---
> >  runtest/quickhit | 316 -----------------------------------------------
> >  1 file changed, 316 deletions(-)
> >  delete mode 100644 runtest/quickhit
> >
> > diff --git a/runtest/quickhit b/runtest/quickhit
> > deleted file mode 100644
> > index b17318b65..000000000
> > --- a/runtest/quickhit
> > +++ /dev/null
> > @@ -1,316 +0,0 @@
> > -#DESCRIPTION:A small subset of the syscalls
> > -access01 access01
> > -# Basic test for access(2) using F_OK, R_OK, W_OK and X_OK arguments.
> > -access03 access03
> > -# EFAULT error testing for access(2)
> > -alarm02 alarm02
> > -# Boundary Value Test for alarm(2)
> > -#    TEST CASES
> > -#      Test Case One - A call to alarm() shall not return an error if
> > -#       seconds is a -1.
> > -#       Test FAILS if a non-zero value is returned.
> > -#      Test Case Two - A call to alarm() shall not return an error if
> > -#       seconds is the maximum unsigned integer (2**63).
> > -#       Test FAILS if a non-zero value is returned.
> > -#      Test Case Three - A call to alarm() shall not return an error if
> > -#       seconds is the maximum unsigned integer plus 1 ((2**63)+1).
> > -#       Test FAILS if a non-zero value is returned.
> > -alarm03 alarm03
> > -# alarm(2) cleared by a fork
> > -#    TEST CASES
> > -# 	1.) alarm(100), fork, child's alarm(0) shall return 0;
> > -#	2.) alarm(100), fork, parent's alarm(0) shall return non-zero.
> > -brk01 brk01
> > -# Basic test for brk()
> > -#    TEST CASES
> > -# 	1.) brk(2) returns...
> > -chdir01 chdir01
> > -# Basic test for chdir(2)
> > -#    TEST CASES
> > -# 	1.) chdir(2) returns...
> > -chmod02 chmod02
> > -# Basic test for chmod(2)
> > -#    TEST CASES
> > -# 	1.) chmod(2) returns...
> > -chown01 chown01
> > -# Basic test for chown(2)
> > -#    TEST CASES
> > -# 	1.) chown(2) returns...
> > -close08 close08
> > -# Basic test for close(2)
> > -#    TEST CASES
> > -# 	1.) close(2) returns...
> > -dup01 dup01
> > -# Basic test for dup(2)
> > -#    TEST CASES
> > -# 	1.) dup(2) returns...(See Description)
> > -dup02 dup02
> > -#  Negative test for dup(2) with bad fd
> > -#    TEST CASES
> > -# 	1-?.) dup(2) returns -1 with errno set to EBADF...(See Description)
> > -dup03 dup03
> > -# Negative test for dup(2) (too many fds)
> > -dup04 dup04
> > -# Basic test for dup(2) of a system pipe descriptor
> > -dup05 dup05
> > -# Basic test for dup(2) of a named pipe descriptor
> > -execl01 execl01
> > -# Basic test for execl(2)
> > -execle01 execle01
> > -# Basic test for execle(2)
> > -execlp01 execlp01
> > -# Basic test for execlp(2
> > -execv01 execv01
> > -# Basic test for execv(2)
> > -execve01 execve01
> > -# Basic test for execve(2)
> > -execvp01 execvp01
> > -# Basic test for execvp(2)
> > -f00f f00f
> > -# This is a simple test for handling of the pentium f00f bug.
> > -# It is an example of a catistrophic test case.  If the system
> > -# doesn't correctly handle this test, it will likely lockup.
> > -fchmod01 fchmod01
> > -# Basic test for fchmod(2) using 0700 argument.
> > -fchown01 fchown01
> > -# Basic test for fchown(2)
> > -fcntl02 fcntl02
> > -# Basic test for fcntl(2) using F_DUPFD argument
> > -fcntl03 fcntl03
> > -# Basic test for fcntl(2) using F_GETFD argument
> > -fcntl04 fcntl04
> > -# Basic test for fcntl(2) using F_GETFL argument
> > -fcntl05 fcntl05
> > -# Basic test for fcntl(2) using F_GETLK argument
> > -fcntl07 fcntl07
> > -# Close-On-Exec of named pipe functional test
> > -fcntl08 fcntl08
> > -# Basic test for fcntl(2) using F_SETFL argument
> > -fcntl09 fcntl09
> > -# Basic test for fcntl(2) using F_SETLK argument
> > -fcntl10 fcntl10
> > -# Basic test for fcntl(2) using F_SETLKW argument
> > -fork01 fork01
> > -# Basic test for fork(2)
> > -#    TEST CASES
> > -# 	1.) fork returns without error
> > -# 	2.) fork returns the pid of the child
> > -fork04 fork04
> > -# Child inheritance of Environment Variables after fork()
> > -#    TEST CASES
> > -#       Test these environment variables correctly inherited by child:
> > -#       1. TERM
> > -#       2. NoTSetzWq
> > -#       3. TESTPROG
> > -fork05 fork05
> > -# This is a test sent in my Ulrich Drepper to test for a bug in fork() where
> > -# %gs is not handled correctly.  See fork05.c for a copy of Ulrich's email
> > -fpathconf01 fpathconf01
> > -# Basic test for fpathconf(2)
> > -fstatfs01 fstatfs01
> > -# Basic test for fstatfs(2)
> > -fsync01 fsync01
> > -# Basic test for fsync(2)
> > -getegid01 getegid01
> > -# Basic test for getegid(2)
> > -geteuid01 geteuid01
> > -# Basic test for geteuid(2)
> > -getgid01 getgid01
> > -# Basic test for getgid(2)
> > -getgroups01 getgroups01
> > -# Getgroups system call critical test
> > -#    TEST CASES
> > -# 	1. Check to see if getgroups(-1, gidset) fails and sets errno to EINVAL
> > -# 	2. Check to see if getgroups(0, gidset) does not return -1 and gidset is
> > -# 	not modified.
> > -# 	3. Check to see if getgroups(x, gigset) fails and sets errno to EINVAL,
> > -# 	where x is one less then what is returned by getgroups(0, gidset).
> > -# 	4. Check to see if getgroups() succeeds and gidset contains
> > -# 	group id returned from getgid().
> > -gethostid01 gethostid01
> > -# Basic test for gethostid(2)
> > -gethostname01 gethostname01
> > -# Basic test for gethostname(2)
> > -getpgrp01 getpgrp01
> > -# Basic test for getpgrp(2)
> > -getpid01 getpid01
> > -# Basic test for getpid(2)
> > -getppid01 getppid01
> > -# Basic test for getppid(2)
> > -getuid01 getuid01
> > -# Basic test for getuid(2)
> > -kill02 kill02
> > -# Sending a signal to processes with the same process group ID.
> > -kill09 kill09
> > -# Basic test for kill(2)
> > -link02 link02
> > -# Basic test for link(2)
> > -link03 link03
> > -# multi links tests
> > -link04 link04
> > -# Negative test cases for link(2)
> > -link05 link05
> > -# multi links (EMLINK) negative test
> > -lseek01 lseek01
> > -lseek02 lseek02
> > -lseek07 lseek07
> > -lseek11 lseek11
> > -# Negative test for lseek(2) of a pipe
> > -lstat02 lstat02
> > -# Basic test for lstat(2)
> > -qmm01 mmap001 -m 1
> > -# Basic mmap() test.
> > -open03 open03
> > -# Basic test for open(2)
> > -pathconf01 pathconf01
> > -# Basic test for pathconf(2)
> > -pause01 pause01
> > -# Basic test for pause(2)
> > -read01 read01
> > -# Basic test for read(2)
> > -readdir01 readdir01
> > -# write multiple files and try to find them with readdir
> > -#    TEST CASES
> > -# 	1.) Create n files and check that readdir() finds n files
> > -readlink01 readlink01
> > -# Basic test for readlink(2)
> > -rename02 rename02
> > -# Basic test for rename(2)
> > -sbrk01 sbrk01
> > -# Basic test for sbrk(2)
> > -select01 select01
> > -# select to a file
> > -#    TEST CASES
> > -#      1.) select(2) to a fd of regular file with no I/O and small timeout
> > -select02 select02
> > -# select of system pipe fds
> > -select03 select03
> > -select04 select04
> > -# select of fd of a named-pipe (FIFO)
> > -setgid01 setgid01
> > -# Basic test for setgid(2)
> > -setpgid01 setpgid01
> > -# Basic test for setpgid(2)
> > -setpgrp01 setpgrp01
> > -# Basic test for setpgrp(2)
> > -setregid01 setregid01
> > -# Basic test for setregid(2)
> > -setreuid01 setreuid01
> > -# Basic test for setreuid(2)
> > -setuid01 setuid01
> > -# Basic test for setuid(2)
> > -sighold02 sighold02
> > -# Holding all signals
> > -signal03 signal03
> > -# Boundary value and other invalid value checking of signal setup
> > -# and signal sending.
> > -sigrelse01 sigrelse01
> > -# Releasing held signals
> > -statfs01 statfs01
> > -# Basic test for statfs(2) mounted filesys
> > -statvfs01 statvfs01
> > -# Basic test for statvfs(2) mounted filesys
> > -sync01 sync01
> > -# Basic test for sync(2)
> > -time01 time01
> > -# Basic test for time(2)
> > -times01 times01
> > -# Basic test for times(2)
> > -ulimit01 ulimit01
> > -# Basic test for ulimit(2)
> > -umask01 umask01
> > -# Basic test for umask(2)
> > -uname01 uname01
> > -# Basic test for uname(2)
> > -unlink05 unlink05
> > -# Basic test for unlink(2)
> > -unlink07 unlink07
> > -# unlink(2) negative testcases
> > -unlink08 unlink08
> > -# unlink(2) negative testcases
> > -wait02 wait02
> > -# Basic test for wait(2)
> > -write01 write01
> > -# Basic test for write(2)
> > -symlink01 symlink01
> > -# Make a Symbolic Link to a File
> > -#    TEST CASES
> > -# 	1. Create symbolic link with abnormal object name path
> > -# 	2. Create symbolic link with normal object name path
> > -# 	3. Create symbolic link with path to an existing object file
> > -# 	4. Receive EEXIST error when creating an already existing symbolic link file.
> > -# 	5. Receive ENAMETOOLONG error when creating symbolic link which exceeds PATH_MAX in length
> > -symlink02 symlink02
> > -# Basic test for symlink(2)
> > -readlink01A symlink01 -T readlink01
> > -# Reads Value of a Symbolic Link
> > -#    TEST CASES
> > -# 	1. Read a symbolic link file which points at no object file
> > -# 	2. Read a symbolic link file which points at an object file
> > -# 	3. Receive ENAMETOOLONG error when reading symbolic link which exceeds PATH_MAX in length
> > -# 	4. Receive an EINVAL error when reading a file which is not a symbolic
> > -# link file.
> > -stat04 symlink01 -T stat04
> > -# Gets File Status Indirectly From a Symbolic Link File
> > -#    TEST CASES
> > -# 	1. Get object file status through symbolic link file
> > -# 	2. Receive ENOENT error when accessing non-existent object file through symbolic link file
> > -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> > -lstat01A symlink01 -T lstat01
> > -# Get file Status About a Symbolic Link File
> > -#    TEST CASES
> > -# 	1. Get symbolic link file status when pointing at no object file
> > -# 	2. Get symbolic link file status when pointing at an object file
> > -# 	3. Get object file status when argument is not a symbolic link
> > -# file.
> > -mkdir05A symlink01 -T mkdir05
> > -# Fail When Making a Directory File Indirectly From a Symbolic Link File
> > -#    TEST CASES
> > -# 	1. Receive EEXIST error when creating a directory through a symbolic link file
> > -rmdir03A symlink01 -T rmdir03
> > -# Fail When Removing a Directory File Indirectly From a Symbolic Link File
> > -#    TEST CASES
> > -# 	1. Receive ENOTDIR error when removing an existing directory through a symbolic link file
> > -chdir01A symlink01 -T chdir01
> > -# Changes Current Working DIrectory Location Indirectly From a Symbolic Link File
> > -#    TEST CASES
> > -# 	1. Change current working directory through a symbolic link file
> > -# 	2. Receive ENOENT error when accessing non-existent directory through symbolic link file
> > -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> > -link01 symlink01 -T link01
> > -# Creates a Link To a File Indirectly From a Symbolic Link File
> > -#    TEST CASES
> > -# 	1. Link an object file to a new file through symbolic link file
> > -# 	2. Receive ENOENT error when accessing non-existent object file through symbolic link file
> > -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> > -unlink01 symlink01 -T unlink01
> > -# Removes a Link To a File And Not Any Object File Which Maybe Pointed At
> > -#    TEST CASES
> > -# 	1. Delete a symbolic link file and not the object file which it points at
> > -chmod01A symlink01 -T chmod01
> > -# Change Object File Permissions Indirectly From a Symbolic Link File
> > -#    TEST CASES
> > -# 	1. Change file permissions of object file through a symbolic link file
> > -# 	2. Receive ENOENT error when accessing non-existent directory through symbolic link file
> > -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> > -utime01A symlink01 -T utime01
> > -# Set File Access And Modify Object File Times Indirectly From a Symbolic Link File
> > -#    TEST CASES
> > -# 	1. Change inode times of object file through a symbolic link file
> > -# 	2. Receive ENOENT error when accessing non-existent directory through symbolic link file
> > -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> > -rename01A symlink01 -T rename01
> > -# Rename a Symbolic Link File And Not Any Object File
> > -#    TEST CASES
> > -# 	1. Rename a symbolic link file which points at no object file
> > -# 	2. Rename a symbolic link file which points at an object file without any object file alterations.
> > -# 	3. Receive EXDEV when trying to rename a symbolic link file to an address outside of current file system
> > -open01A symlink01 -T open01
> > -# Create/Open a File For Reading Or Writing Indirectly From a Symbolic Link File
> > -#    TEST CASES
> > -#  	1. Create an object file through a symbolic link file
> > -#  	2. Open an object file through a symbolic link file
> > -#  	3. Receive EEXIST error when exclusively creating an object file through a symbolic link file
> > -#  	4. Receive ENOENT error when accessing non-existent object file through symbolic link file
> > -#  	5. Receive ELOOP error when nesting of symbolic links exceed maximum
> > -
> > --
> > 2.26.2
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
