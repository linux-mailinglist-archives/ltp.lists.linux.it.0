Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 420C6257E0C
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 17:53:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E60A63C5551
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 17:53:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5C1423C2DD1
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 17:53:28 +0200 (CEST)
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3DAFF602274
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 17:53:25 +0200 (CEST)
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VFrOCQ005744; Mon, 31 Aug 2020 15:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=sDXzYzOrleTlS4eWoYRcKH59QEuqHkcLziGRwWMu4W8=;
 b=bH4psvAxSydPT787goOlrAT2NBV/3JfZhvJnklHoSwk4SKDWpLP/or3EAQsB7/k78NbB
 Cvm429L67WsrnZMnspJnCaG1mjIbfYlKBGaKS4DhxCwQZlfj3+GixIJV0ldVhDF4Ozqk
 sYJp7qys7sIxZLT3EQ8QiuJL1U2fGxrOKfwa7xLMdD9ZKiCoVEUqz25OLyiIWNOFgCGl
 hvKEjvQTp78G+UtGWkKW/WHNbDVNBLsfiEVvSjS26PdOwW40Gsgbq19u1IruZAPC0vxU
 oTGpZA+GJUw+XOZMW1/I9zmNG8SFhwbbJxyaJhUp7AObnn/Vo5PRNdGf2x5nmW/d08g+ sg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx08-001d1705.pphosted.com with ESMTP id 337g6ks2sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 15:53:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKuF186qVT68bRIYRRFZTFHaVV6j4rF4CnwhliVaK2u3wNGrooTJyxGyt+aCrhdLysPvcnjuoWTPuGZ2O+p0JE/iXo+LYWFIqjan3+9m+fE8Sj9LsTyuu/v8NPRoGh1soj7ehMuQhxbHhLuXgkAZGUTx5GpIdE2LXhgN+jlaVKcjTfgQVjhzj1Q0Voi6VK6uEys1KgM6bANCDlcawJScY7Unf3kMIMi+tzKpWEtRyRpDh7OKssM+rrTyxuEGWEi+/dtj6umi0dl2iPPjsnMXDvnlyPtibr4JYjHPoO2G6U22zvtisakchiGha5f253FUG7mZ+h0DxD+Ress3r94vCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDXzYzOrleTlS4eWoYRcKH59QEuqHkcLziGRwWMu4W8=;
 b=XV4SUz4OOUBHN7cyk0eP3odBqMFUY8ccqRu0xcsI+C48lgIrFZMt6aMb0AGm3MkDLOrJu8MvYfdJ2pjn4YqmsnOMIYEhMdAoRUkNl04NlbOqCgWfhnEbXUxwfawuu9C7Io03GJpKZT+ox1KkWzceHscx3zgCQWdUI11LpcOhzTCnym0nWuhQ3KEQLhlYTpRczDQ+y9pLkPqsZj/q5pfkg0p6tabQd0ONLi/ut3i/wwmD+9blzAYwHmUsWYIX+AgJL/C1XDJl7fDLInVoXdh4bbvGbVfNf17aw27qm33qLkPxWfALgidDoIaWF45gdUwvL2MXo+//C961OiPi5clFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB1029.namprd13.prod.outlook.com (2603:10b6:903:40::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.5; Mon, 31 Aug
 2020 15:53:18 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::5c0c:3d3a:c493:efa]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::5c0c:3d3a:c493:efa%11]) with mapi id 15.20.3348.013; Mon, 31 Aug 2020
 15:53:18 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cyril Hrubis <chrubis@suse.cz>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH] [RFC] runtest/quickhit: Remove.
Thread-Index: AQHWf34I+TaOImm+qEuQojZnwLJ9zKlSXfSQ
Date: Mon, 31 Aug 2020 15:53:18 +0000
Message-ID: <CY4PR13MB11758CF355D958B797D2EA9FFD510@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <20200831094617.7764-1-chrubis@suse.cz>
In-Reply-To: <20200831094617.7764-1-chrubis@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b56beee3-f5b5-40ae-2ff2-08d84dc5faed
x-ms-traffictypediagnostic: CY4PR13MB1029:
x-microsoft-antispam-prvs: <CY4PR13MB1029FCBA1C3C87E4C93965DBFD510@CY4PR13MB1029.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I19doTt+tehTEllwrNO/pPp2zStGRRwRNlSpRuhkV24XpjY04GJjiC6aYkEgSBD2AzdlBp8Eza/M4/rLql21oQidA0hFIDJrxA2Yc5fEf2Vfk89S+LUZHMOVokyIfcqTGucoHLa5PgBMjR/d/bznua/DuW9cLlZWHGNtcC4EsTiMZ9P3NWdHYC7QmczrfyIaE5bcS92SdLT2bL13mFZJtuFwoWVx/3NfQsbEkZIFQs5KL15kJJiDcewBslG66+LDnJ2WAHb0KZkfNhYmiL882wGEfK057pUNRKCc4AWr21EX+RRjkzZ831paPS9HSGqsnpQ5nItwhliG5EKQ0VVATcD0RLsEuoP0/MpbrVyBPkAu0ZKC6n9G2/IyLLN7KKT/j9TRsSBY6W6wHqTBMyS/lQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(26005)(110136005)(86362001)(30864003)(966005)(6506007)(478600001)(55016002)(83080400001)(33656002)(66946007)(76116006)(83380400001)(52536014)(316002)(8676002)(66476007)(9686003)(8936002)(186003)(66446008)(66556008)(64756008)(71200400001)(7696005)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Iqumr3iWecFvmbRggqjnCtIxAX+iNqZtQyHK1fYDuLSzAcuncZzHdMQmSvl/s0KX5TDXYidzmHUKkwtNF6uVjjSc1xBoNUTkbl7DZp9pWXTmFa6o5peG5otIP6lLISnSee9iJ59OgcwAgJxCkJ5PccVeRDx9XxzHfgGV0wXAn1yqgtUzXtdg1X96aCocidm4YNZP3wWXhPgPgKsjvOnIpirUkgrJSzb706gCIFK01/Cy7mi8lKbuqp37DKERqCxgvgpR6n//Lg25jEk7wrEtM88QV/5EG3ijjeL8zf1E6GjZJoGoSFXC5KYGGp2edbqMmgbMwWShCOYwzkIG9q8qsnpn8aMZJ5R5swOevejVIk0Zz4KQvITXn7ECo+91T19Kl8EZOPuGLq9jKGjE2KilNyoLpfFIm/2EvNjuSSUaQL2xKAA1fjhiMn+cjtwzwPUltX0BTgr6XRrXcvjY+MJvQGFCYZU8ri31Nf9AwA0Z9QDyJ4SpZySLhah4sPkc7XzyIbG0gDp5yC2sggJA7n7AwKCuyUoQPKHsP9q6HlD+UKttvnalD7yX5+xkeOeOkWaiJC3dwtEeD0BgRgPYxlTk+SRhms8JWaDT7YrjXMsMu659FCMiBvqAy4SS+U1NAYpxBNAsimw/sCXxDF19J6CY6A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56beee3-f5b5-40ae-2ff2-08d84dc5faed
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 15:53:18.5470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dXApBR1UwKtuwwfsCEn7Rgr9WElE2qIZvA/6t/gMSkh7akObfX90NF289TuW1rUQdiNCy3rDx8Ovo1MBwo3ZQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB1029
X-Sony-Outbound-GUID: aE1dyNb8EuO8j3U1ZDjU6i3aojhiVCZI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_07:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008310093
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
> From:  Cyril Hrubis
> 
> The file wasn't properly maintained for last ten years, 99% of the
> patches touching it were only removing removed tests. We should stop
> pretending that it's useful anyhow it clearly does not contain well
> selected set of tests for quick testrun anymore.

Umm.  I use this one all the time, as a quick LTP sanity check.
I will admit this is really used for a quick test of Fuego/LTP integration
rather than as a test of hardware/software status on a device
under test.

Is there a replacement for this?  Just deleting it leaves a big hole
in my standard CI loop.
 -- Tim

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  runtest/quickhit | 316 -----------------------------------------------
>  1 file changed, 316 deletions(-)
>  delete mode 100644 runtest/quickhit
> 
> diff --git a/runtest/quickhit b/runtest/quickhit
> deleted file mode 100644
> index b17318b65..000000000
> --- a/runtest/quickhit
> +++ /dev/null
> @@ -1,316 +0,0 @@
> -#DESCRIPTION:A small subset of the syscalls
> -access01 access01
> -# Basic test for access(2) using F_OK, R_OK, W_OK and X_OK arguments.
> -access03 access03
> -# EFAULT error testing for access(2)
> -alarm02 alarm02
> -# Boundary Value Test for alarm(2)
> -#    TEST CASES
> -#      Test Case One - A call to alarm() shall not return an error if
> -#       seconds is a -1.
> -#       Test FAILS if a non-zero value is returned.
> -#      Test Case Two - A call to alarm() shall not return an error if
> -#       seconds is the maximum unsigned integer (2**63).
> -#       Test FAILS if a non-zero value is returned.
> -#      Test Case Three - A call to alarm() shall not return an error if
> -#       seconds is the maximum unsigned integer plus 1 ((2**63)+1).
> -#       Test FAILS if a non-zero value is returned.
> -alarm03 alarm03
> -# alarm(2) cleared by a fork
> -#    TEST CASES
> -# 	1.) alarm(100), fork, child's alarm(0) shall return 0;
> -#	2.) alarm(100), fork, parent's alarm(0) shall return non-zero.
> -brk01 brk01
> -# Basic test for brk()
> -#    TEST CASES
> -# 	1.) brk(2) returns...
> -chdir01 chdir01
> -# Basic test for chdir(2)
> -#    TEST CASES
> -# 	1.) chdir(2) returns...
> -chmod02 chmod02
> -# Basic test for chmod(2)
> -#    TEST CASES
> -# 	1.) chmod(2) returns...
> -chown01 chown01
> -# Basic test for chown(2)
> -#    TEST CASES
> -# 	1.) chown(2) returns...
> -close08 close08
> -# Basic test for close(2)
> -#    TEST CASES
> -# 	1.) close(2) returns...
> -dup01 dup01
> -# Basic test for dup(2)
> -#    TEST CASES
> -# 	1.) dup(2) returns...(See Description)
> -dup02 dup02
> -#  Negative test for dup(2) with bad fd
> -#    TEST CASES
> -# 	1-?.) dup(2) returns -1 with errno set to EBADF...(See Description)
> -dup03 dup03
> -# Negative test for dup(2) (too many fds)
> -dup04 dup04
> -# Basic test for dup(2) of a system pipe descriptor
> -dup05 dup05
> -# Basic test for dup(2) of a named pipe descriptor
> -execl01 execl01
> -# Basic test for execl(2)
> -execle01 execle01
> -# Basic test for execle(2)
> -execlp01 execlp01
> -# Basic test for execlp(2
> -execv01 execv01
> -# Basic test for execv(2)
> -execve01 execve01
> -# Basic test for execve(2)
> -execvp01 execvp01
> -# Basic test for execvp(2)
> -f00f f00f
> -# This is a simple test for handling of the pentium f00f bug.
> -# It is an example of a catistrophic test case.  If the system
> -# doesn't correctly handle this test, it will likely lockup.
> -fchmod01 fchmod01
> -# Basic test for fchmod(2) using 0700 argument.
> -fchown01 fchown01
> -# Basic test for fchown(2)
> -fcntl02 fcntl02
> -# Basic test for fcntl(2) using F_DUPFD argument
> -fcntl03 fcntl03
> -# Basic test for fcntl(2) using F_GETFD argument
> -fcntl04 fcntl04
> -# Basic test for fcntl(2) using F_GETFL argument
> -fcntl05 fcntl05
> -# Basic test for fcntl(2) using F_GETLK argument
> -fcntl07 fcntl07
> -# Close-On-Exec of named pipe functional test
> -fcntl08 fcntl08
> -# Basic test for fcntl(2) using F_SETFL argument
> -fcntl09 fcntl09
> -# Basic test for fcntl(2) using F_SETLK argument
> -fcntl10 fcntl10
> -# Basic test for fcntl(2) using F_SETLKW argument
> -fork01 fork01
> -# Basic test for fork(2)
> -#    TEST CASES
> -# 	1.) fork returns without error
> -# 	2.) fork returns the pid of the child
> -fork04 fork04
> -# Child inheritance of Environment Variables after fork()
> -#    TEST CASES
> -#       Test these environment variables correctly inherited by child:
> -#       1. TERM
> -#       2. NoTSetzWq
> -#       3. TESTPROG
> -fork05 fork05
> -# This is a test sent in my Ulrich Drepper to test for a bug in fork() where
> -# %gs is not handled correctly.  See fork05.c for a copy of Ulrich's email
> -fpathconf01 fpathconf01
> -# Basic test for fpathconf(2)
> -fstatfs01 fstatfs01
> -# Basic test for fstatfs(2)
> -fsync01 fsync01
> -# Basic test for fsync(2)
> -getegid01 getegid01
> -# Basic test for getegid(2)
> -geteuid01 geteuid01
> -# Basic test for geteuid(2)
> -getgid01 getgid01
> -# Basic test for getgid(2)
> -getgroups01 getgroups01
> -# Getgroups system call critical test
> -#    TEST CASES
> -# 	1. Check to see if getgroups(-1, gidset) fails and sets errno to EINVAL
> -# 	2. Check to see if getgroups(0, gidset) does not return -1 and gidset is
> -# 	not modified.
> -# 	3. Check to see if getgroups(x, gigset) fails and sets errno to EINVAL,
> -# 	where x is one less then what is returned by getgroups(0, gidset).
> -# 	4. Check to see if getgroups() succeeds and gidset contains
> -# 	group id returned from getgid().
> -gethostid01 gethostid01
> -# Basic test for gethostid(2)
> -gethostname01 gethostname01
> -# Basic test for gethostname(2)
> -getpgrp01 getpgrp01
> -# Basic test for getpgrp(2)
> -getpid01 getpid01
> -# Basic test for getpid(2)
> -getppid01 getppid01
> -# Basic test for getppid(2)
> -getuid01 getuid01
> -# Basic test for getuid(2)
> -kill02 kill02
> -# Sending a signal to processes with the same process group ID.
> -kill09 kill09
> -# Basic test for kill(2)
> -link02 link02
> -# Basic test for link(2)
> -link03 link03
> -# multi links tests
> -link04 link04
> -# Negative test cases for link(2)
> -link05 link05
> -# multi links (EMLINK) negative test
> -lseek01 lseek01
> -lseek02 lseek02
> -lseek07 lseek07
> -lseek11 lseek11
> -# Negative test for lseek(2) of a pipe
> -lstat02 lstat02
> -# Basic test for lstat(2)
> -qmm01 mmap001 -m 1
> -# Basic mmap() test.
> -open03 open03
> -# Basic test for open(2)
> -pathconf01 pathconf01
> -# Basic test for pathconf(2)
> -pause01 pause01
> -# Basic test for pause(2)
> -read01 read01
> -# Basic test for read(2)
> -readdir01 readdir01
> -# write multiple files and try to find them with readdir
> -#    TEST CASES
> -# 	1.) Create n files and check that readdir() finds n files
> -readlink01 readlink01
> -# Basic test for readlink(2)
> -rename02 rename02
> -# Basic test for rename(2)
> -sbrk01 sbrk01
> -# Basic test for sbrk(2)
> -select01 select01
> -# select to a file
> -#    TEST CASES
> -#      1.) select(2) to a fd of regular file with no I/O and small timeout
> -select02 select02
> -# select of system pipe fds
> -select03 select03
> -select04 select04
> -# select of fd of a named-pipe (FIFO)
> -setgid01 setgid01
> -# Basic test for setgid(2)
> -setpgid01 setpgid01
> -# Basic test for setpgid(2)
> -setpgrp01 setpgrp01
> -# Basic test for setpgrp(2)
> -setregid01 setregid01
> -# Basic test for setregid(2)
> -setreuid01 setreuid01
> -# Basic test for setreuid(2)
> -setuid01 setuid01
> -# Basic test for setuid(2)
> -sighold02 sighold02
> -# Holding all signals
> -signal03 signal03
> -# Boundary value and other invalid value checking of signal setup
> -# and signal sending.
> -sigrelse01 sigrelse01
> -# Releasing held signals
> -statfs01 statfs01
> -# Basic test for statfs(2) mounted filesys
> -statvfs01 statvfs01
> -# Basic test for statvfs(2) mounted filesys
> -sync01 sync01
> -# Basic test for sync(2)
> -time01 time01
> -# Basic test for time(2)
> -times01 times01
> -# Basic test for times(2)
> -ulimit01 ulimit01
> -# Basic test for ulimit(2)
> -umask01 umask01
> -# Basic test for umask(2)
> -uname01 uname01
> -# Basic test for uname(2)
> -unlink05 unlink05
> -# Basic test for unlink(2)
> -unlink07 unlink07
> -# unlink(2) negative testcases
> -unlink08 unlink08
> -# unlink(2) negative testcases
> -wait02 wait02
> -# Basic test for wait(2)
> -write01 write01
> -# Basic test for write(2)
> -symlink01 symlink01
> -# Make a Symbolic Link to a File
> -#    TEST CASES
> -# 	1. Create symbolic link with abnormal object name path
> -# 	2. Create symbolic link with normal object name path
> -# 	3. Create symbolic link with path to an existing object file
> -# 	4. Receive EEXIST error when creating an already existing symbolic link file.
> -# 	5. Receive ENAMETOOLONG error when creating symbolic link which exceeds PATH_MAX in length
> -symlink02 symlink02
> -# Basic test for symlink(2)
> -readlink01A symlink01 -T readlink01
> -# Reads Value of a Symbolic Link
> -#    TEST CASES
> -# 	1. Read a symbolic link file which points at no object file
> -# 	2. Read a symbolic link file which points at an object file
> -# 	3. Receive ENAMETOOLONG error when reading symbolic link which exceeds PATH_MAX in length
> -# 	4. Receive an EINVAL error when reading a file which is not a symbolic
> -# link file.
> -stat04 symlink01 -T stat04
> -# Gets File Status Indirectly From a Symbolic Link File
> -#    TEST CASES
> -# 	1. Get object file status through symbolic link file
> -# 	2. Receive ENOENT error when accessing non-existent object file through symbolic link file
> -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> -lstat01A symlink01 -T lstat01
> -# Get file Status About a Symbolic Link File
> -#    TEST CASES
> -# 	1. Get symbolic link file status when pointing at no object file
> -# 	2. Get symbolic link file status when pointing at an object file
> -# 	3. Get object file status when argument is not a symbolic link
> -# file.
> -mkdir05A symlink01 -T mkdir05
> -# Fail When Making a Directory File Indirectly From a Symbolic Link File
> -#    TEST CASES
> -# 	1. Receive EEXIST error when creating a directory through a symbolic link file
> -rmdir03A symlink01 -T rmdir03
> -# Fail When Removing a Directory File Indirectly From a Symbolic Link File
> -#    TEST CASES
> -# 	1. Receive ENOTDIR error when removing an existing directory through a symbolic link file
> -chdir01A symlink01 -T chdir01
> -# Changes Current Working DIrectory Location Indirectly From a Symbolic Link File
> -#    TEST CASES
> -# 	1. Change current working directory through a symbolic link file
> -# 	2. Receive ENOENT error when accessing non-existent directory through symbolic link file
> -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> -link01 symlink01 -T link01
> -# Creates a Link To a File Indirectly From a Symbolic Link File
> -#    TEST CASES
> -# 	1. Link an object file to a new file through symbolic link file
> -# 	2. Receive ENOENT error when accessing non-existent object file through symbolic link file
> -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> -unlink01 symlink01 -T unlink01
> -# Removes a Link To a File And Not Any Object File Which Maybe Pointed At
> -#    TEST CASES
> -# 	1. Delete a symbolic link file and not the object file which it points at
> -chmod01A symlink01 -T chmod01
> -# Change Object File Permissions Indirectly From a Symbolic Link File
> -#    TEST CASES
> -# 	1. Change file permissions of object file through a symbolic link file
> -# 	2. Receive ENOENT error when accessing non-existent directory through symbolic link file
> -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> -utime01A symlink01 -T utime01
> -# Set File Access And Modify Object File Times Indirectly From a Symbolic Link File
> -#    TEST CASES
> -# 	1. Change inode times of object file through a symbolic link file
> -# 	2. Receive ENOENT error when accessing non-existent directory through symbolic link file
> -# 	3. Receive ELOOP error when nesting of symbolic links exceed maximum
> -rename01A symlink01 -T rename01
> -# Rename a Symbolic Link File And Not Any Object File
> -#    TEST CASES
> -# 	1. Rename a symbolic link file which points at no object file
> -# 	2. Rename a symbolic link file which points at an object file without any object file alterations.
> -# 	3. Receive EXDEV when trying to rename a symbolic link file to an address outside of current file system
> -open01A symlink01 -T open01
> -# Create/Open a File For Reading Or Writing Indirectly From a Symbolic Link File
> -#    TEST CASES
> -#  	1. Create an object file through a symbolic link file
> -#  	2. Open an object file through a symbolic link file
> -#  	3. Receive EEXIST error when exclusively creating an object file through a symbolic link file
> -#  	4. Receive ENOENT error when accessing non-existent object file through symbolic link file
> -#  	5. Receive ELOOP error when nesting of symbolic links exceed maximum
> -
> --
> 2.26.2
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
