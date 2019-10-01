Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C51C419F
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Oct 2019 22:14:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEDEF3C228C
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Oct 2019 22:14:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 31E023C227E
 for <ltp@lists.linux.it>; Tue,  1 Oct 2019 22:14:31 +0200 (CEST)
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730093.outbound.protection.outlook.com [40.107.73.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B2735600D74
 for <ltp@lists.linux.it>; Tue,  1 Oct 2019 22:14:20 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5mwa+iLT0twZ3FaAvMsf08cqEWjsvDzPou8xGfpy14NKIFXI27EjohQbtzRO6O4mm4hwfCpE1XRrsYeTE/ognpaPXJdKUGgLq4hF2BR5BocyKZSEEteoN1ijaEMeBiwP2w+B+6SxuofUemPCeDIDlqk9uywkiuQwVXbd7qxg7N9lT8ZRS4Nkbix6HFUQrkj3/e8OEobU43VS8e/Mey0tVEyv5Q3KMXbsDyfzLefBDzB3oBlF+5sqD0rOObBxWYD0Zc2tkOwImJIS6oOGGAkmi8kBtmJ0v6rUypw4DfVPVfBwAvHE5ibe4fYOuMC8Znx+t6r91yMLIZEgEt+4/8iKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=364Wri7ph9APK27QcFJwLcgZO8GYDbAR8K4WFL6iwPk=;
 b=UIq/TldJ+jVdjGUkmIS/0SUGVH1a9CoCfzzM5PYYV6ikiEejyxV2SS61zQQWuWdX1+2SzWIz7K+x/xckdIoqeJiSYIYbhe4hmYjm7z14SEsqV8awOL2zfAA1ACqcOdpllHQYauOy17zLjdAQZOeiTr5tYi+sFnEWh6YnFdg0VmzBtK2Om4PKtAn1CsHmQMLzbUoTspvay4qNyg9RhqyrV/lHZAABwwSTizp1X3qNoGYO6yYXIxS/n3UDuCkjNYu/sfHOJak9TRParhbV7cHftlCpFBSMUl9UI94iAnRdyAjORi+aooy8lLqWrVyRvH1bu59aHrnhdSHtuJ2QZhZzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 160.33.194.229) smtp.rcpttodomain=suse.de smtp.mailfrom=sony.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=sony.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Sony.onmicrosoft.com; 
 s=selector2-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=364Wri7ph9APK27QcFJwLcgZO8GYDbAR8K4WFL6iwPk=;
 b=HgCkTq5r3NhQ+CYvHtHX1hXMBm+CdfC3f5Lae948wPsgWrHtZoUQE23SfZ/vK4DhNLDbBxPskvbPwO7JC1vFjLewn68G9QBhabNmRDMX27L9pdhQCEf6gdt02cQqeYg7J/kSNFZp5XlFrR8jenpsOrhJOGxJHyLPL+zllkrUuHQ=
Received: from CY4PR13CA0094.namprd13.prod.outlook.com (2603:10b6:903:152::32)
 by MN2PR13MB3791.namprd13.prod.outlook.com (2603:10b6:208:1e9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.11; Tue, 1 Oct
 2019 20:14:27 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::201) by CY4PR13CA0094.outlook.office365.com
 (2603:10b6:903:152::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.11 via Frontend
 Transport; Tue, 1 Oct 2019 20:14:26 +0000
Authentication-Results: spf=pass (sender IP is 160.33.194.229)
 smtp.mailfrom=sony.com; suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=pass action=none header.from=sony.com;
Received-SPF: Pass (protection.outlook.com: domain of sony.com designates
 160.33.194.229 as permitted sender) receiver=protection.outlook.com;
 client-ip=160.33.194.229; helo=usculsndmail02v.am.sony.com;
Received: from usculsndmail02v.am.sony.com (160.33.194.229) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.20 via Frontend Transport; Tue, 1 Oct 2019 20:14:26 +0000
Received: from usculsndmail14v.am.sony.com (usculsndmail14v.am.sony.com
 [146.215.230.105])
 by usculsndmail02v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
 ESMTP id x91KEPrr029073; Tue, 1 Oct 2019 20:14:25 GMT
Received: from USCULXHUB01V.am.sony.com (usculxhub01v.am.sony.com
 [146.215.231.15])
 by usculsndmail14v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
 ESMTP id x91KEPZ5032532; Tue, 1 Oct 2019 20:14:25 GMT
Received: from USCULXMSG01.am.sony.com ([fe80::b09d:6cb6:665e:d1b5]) by
 USCULXHUB01V.am.sony.com ([146.215.231.15]) with mapi id 14.03.0439.000; Tue,
 1 Oct 2019 16:14:25 -0400
From: <Tim.Bird@sony.com>
To: <jcronenberg@suse.de>, <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH] Convert ptrace01.c to new library
Thread-Index: AQHVeCYlsfYQdTflcEyW4HIKALnYdKdGN4jw
Date: Tue, 1 Oct 2019 20:14:13 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF977BF7B1@USCULXMSG01.am.sony.com>
References: <20191001070111.31369-1-jcronenberg@suse.de>
In-Reply-To: <20191001070111.31369-1-jcronenberg@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.215.231.6]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:160.33.194.229; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(136003)(39860400002)(13464003)(199004)(189003)(46406003)(110136005)(356004)(336012)(86362001)(476003)(106002)(102836004)(2876002)(26005)(6666004)(50466002)(7696005)(76176011)(2906002)(486006)(47776003)(66066001)(55016002)(3846002)(446003)(23726003)(426003)(11346002)(8676002)(186003)(6306002)(126002)(6116002)(70586007)(6246003)(33656002)(55846006)(37786003)(966005)(8936002)(5660300002)(316002)(97756001)(14444005)(305945005)(478600001)(70206006)(229853002)(7736002)(8746002)(246002)(2004002)(5001870100001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR13MB3791; H:usculsndmail02v.am.sony.com;
 FPR:; SPF:Pass; LANG:en; PTR:mail.sonyusa.com,mail02.sonyusa.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20abad90-8c74-4e5f-49e4-08d746abf567
X-MS-TrafficTypeDiagnostic: MN2PR13MB3791:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <MN2PR13MB3791CCE11B141D16E19D3A48FD9D0@MN2PR13MB3791.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0177904E6B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExRfE9byFKgZJFgq5qmJ5/9Bx2nQdiqUdQNJvOhZ6C+Cq/DlmiOTxSZD5xyIP8sibjGB1n3/l9qiqPO1qmRqGhGbem0351VEj7z/Zolfl3m8anp1yWzaMMEwSQoHukAWIl5+Dn+XZDNIC9kd6bCfCt1kNIsb6jhCnuRoVhPlXJJAxRV56dMleLQG1TiPHjiDTO6d8vR1Oq9zYJp9PN5tlo5tV7Xxd0NiOFbuA01UhnrMQ0e0u4WftceBtIX0+4m7Zyndr6ZqT0Bw6pEjh65cLyutCXMTLSwd/10FicW3Bzbzqg9QTZmUJfBUVwvWLg1hRHLvTg2eZpn37OqAqGuwoXKtQ+Q1lcucSb/x6kF4PpCgIiLbgAwpUPaTpLJ70glVkA35T92ikR9FeOUmAU5S3DKDmq2SWPmexwla9b+6NPtSCMGu+LuQflReu3NTRFYV2P9m5mzgAolNLaf/bVLBcg==
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 20:14:26.4942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20abad90-8c74-4e5f-49e4-08d746abf567
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=66c65d8a-9158-4521-a2d8-664963db48e4; Ip=[160.33.194.229];
 Helo=[usculsndmail02v.am.sony.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3791
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Convert ptrace01.c to new library
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
> From: Jorik Cronenberg on Monday, September 30, 2019 9:01 PM
> To: ltp@lists.linux.it
> Subject: [LTP] [PATCH] Convert ptrace01.c to new library
> 
> Hi,
> 
> This is just a port of ptrace01.c. I wanted to make sure what I'm doing is right
> before porting the rest. I tried to make as little changes as possible so the
> test should be pretty much the same.
> ---
>  testcases/kernel/syscalls/ptrace/ptrace01.c | 296 +++++++---------------------
>  1 file changed, 72 insertions(+), 224 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/ptrace/ptrace01.c
> b/testcases/kernel/syscalls/ptrace/ptrace01.c
> index 5a7ed5ffd..ab9ef35ee 100644
> --- a/testcases/kernel/syscalls/ptrace/ptrace01.c
> +++ b/testcases/kernel/syscalls/ptrace/ptrace01.c
> @@ -1,36 +1,13 @@
> -/*
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
>   * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
>   *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.
> + * Author:	Saji Kumar.V.R <saji.kumar@wipro.com>
>   *
> - * This program is distributed in the hope that it would be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> + * Ported to new library:
> + * 10/2019	Jorik Cronenberg <jcronenberg@suse.de>
>   *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> - *
> - */
> -
> /**********************************************************
> - *
> - *    TEST IDENTIFIER	: ptrace01
> - *
> - *    EXECUTED BY	: anyone
> - *
> - *    TEST TITLE	: functionality test for ptrace(2)
> - *
> - *    TEST CASE TOTAL	: 2
> - *
> - *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
> - *
> - *    SIGNALS
> - * 	Uses SIGUSR1 to pause before test if option set.
> - * 	(See the parse_opts(3) man page).
> - *
> - *    DESCRIPTION
> + * DESCRIPTION
>   *	This test case tests the functionality of ptrace() for
>   *	PTRACE_TRACEME & PTRACE_KILL requests.
>   *	Here, we fork a child & the child does ptrace(PTRACE_TRACEME, ...).
> @@ -44,243 +21,114 @@
>   * 		In both cases, child should stop & notify parent on reception
>   * 		of SIGUSR2
>   *
> - * 	Setup:
> - * 	  Setup signal handling.
> - *	  Pause for SIGUSR1 if option specified.
> - *
> - * 	Test:
> - *	 Loop if the proper options are given.
> - *	 setup signal handler for SIGUSR2 signal
> - *	 fork a child
> - *
> - *	 CHILD:
> - *		setup signal handler for SIGUSR2 signal
> - *		call ptrace() with PTRACE_TRACEME request
> - *		send SIGUSR2 signal to self
> - *	 PARENT:
> - *		wait() for child.
> - *		if parent is notified when child gets a signal through wait(),
> - *		then
> - *			do  ptrace(PTRACE_KILL, ..) on child
> - * 			wait() for child to finish,
> - * 			if child exited abnormaly,
> - *				TEST passed
> - * 			else
> - * 				TEST failed
> - *		else
> - *			TEST failed
> - *
> - * 	Cleanup:
> - * 	  Print errno log and/or timing stats if options given
> - *
> - * USAGE:  <for command-line>
> - *  ptrace01 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
> - *			where,  -c n : Run n copies concurrently.
> - *				-e   : Turn on errno logging.
> - *				-h   : Show help screen
> - *				-f   : Turn off functional testing
> - *				-i n : Execute test n times.
> - *				-I x : Execute test for x seconds.
> - *				-p   : Pause for SIGUSR1 before starting
> - *				-P x : Pause for x seconds between iterations.
> - *				-t   : Turn on syscall timing.
> - *
> -
> **********************************************************
> ******/
> + */

It looks like the old comment had some nicely structured meta-data.  I'm not
familiar with the process for converting to the new library.  Is it intentional to
eliminate this meta-data?  (This is more of a question for the LTP leaders
than for Jorik).

I know that Cyril is working on a new meta-data system.  If this meta-data is eliminated
now, does it make adding it back into the new system harder?

Personally, I find it useful to see the pseudo-code outline when I'm debugging a
test.  So I hate to see those be eliminated.  But maybe those are hard to trust
as they tend to not be maintained along with the code?
 -- Tim


> 
> +#include <stdlib.h>
>  #include <errno.h>
>  #include <signal.h>
>  #include <sys/wait.h>
> -
>  #include <config.h>
>  #include "ptrace.h"
> +#include "tst_test.h"
> 
> -#include "test.h"
> -
> -static void do_child(void);
> -static void setup(void);
> -static void cleanup(void);
> -static void child_handler();
> -static void parent_handler();
> +static int got_signal;
> 
> -static int got_signal = 0;
> -
> -char *TCID = "ptrace01";
> -static int i;			/* loop test case counter, shared with
> do_child */
> -
> -int TST_TOTAL = 2;
> -
> -int main(int ac, char **av)
> +void child_handler(void)
>  {
> -
> -	int lc;
> -	pid_t child_pid;
> -	int status;
> -	struct sigaction parent_act;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -#ifdef UCLINUX
> -	maybe_run_child(&do_child, "d", &i);
> -#endif
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		for (i = 0; i < TST_TOTAL; ++i) {
> -			got_signal = 0;
> -
> -			/* Setup signal handler for parent */
> -			if (i == 1) {
> -				parent_act.sa_handler = parent_handler;
> -				parent_act.sa_flags = SA_RESTART;
> -				sigemptyset(&parent_act.sa_mask);
> -
> -				if ((sigaction(SIGUSR2, &parent_act, NULL))
> -				    == -1) {
> -					tst_resm(TWARN, "sigaction() failed"
> -						 " in parent");
> -					continue;
> -				}
> -			}
> -
> -			switch (child_pid = FORK_OR_VFORK()) {
> -
> -			case -1:
> -				/* fork() failed */
> -				tst_resm(TFAIL, "fork() failed");
> -				continue;
> -
> -			case 0:
> -				/* Child */
> -#ifdef UCLINUX
> -				if (self_exec(av[0], "d", i) < 0) {
> -					tst_resm(TFAIL, "self_exec failed");
> -					continue;
> -				}
> -#else
> -				do_child();
> -#endif
> -
> -			default:
> -				/* Parent */
> -				if ((waitpid(child_pid, &status, 0)) < 0) {
> -					tst_resm(TFAIL, "waitpid() failed");
> -					continue;
> -				}
> -
> -				/*
> -				 * Check the exit status of child. If (it exits
> -				 * normally with exit value 1) OR (child came
> -				 * through signal handler), Test Failed
> -				 */
> -
> -				if (((WIFEXITED(status)) &&
> -				     (WEXITSTATUS(status))) ||
> -				    (got_signal == 1)) {
> -					tst_resm(TFAIL, "Test Failed");
> -					continue;
> -				} else {
> -					/* Kill child */
> -					if ((ptrace(PTRACE_KILL, child_pid,
> -						    0, 0)) == -1) {
> -						tst_resm(TFAIL, "Test Failed:"
> -							 " Parent was not able
> to kill"
> -							 " child");
> -						continue;
> -					}
> -				}
> -
> -				if ((waitpid(child_pid, &status, 0)) < 0) {
> -					tst_resm(TFAIL, "waitpid() failed");
> -					continue;
> -				}
> -
> -				if (WIFEXITED(status)) {
> -					/* Child exits normally */
> -					tst_resm(TFAIL, "Test failed");
> -				} else {
> -					tst_resm(TPASS, "Test Passed");
> -				}
> -
> -			}
> -		}
> +	if ((kill(getppid(), SIGUSR2)) == -1) {
> +		tst_res(TWARN, "kill() failed in child_handler()");
> +		exit(1);
>  	}
> +}
> 
> -	/* cleanup and exit */
> -	cleanup();
> -	tst_exit();
> -
> +void parent_handler(void)
> +{
> +	got_signal = 1;
>  }
> 
> -/* do_child() */
> -void do_child(void)
> +void do_child(unsigned int i)
>  {
>  	struct sigaction child_act;
> 
> -	/* Setup signal handler for child */
> -	if (i == 0) {
> +	if (i == 0)
>  		child_act.sa_handler = SIG_IGN;
> -	} else {
> +	else
>  		child_act.sa_handler = child_handler;
> -	}
> +
>  	child_act.sa_flags = SA_RESTART;
>  	sigemptyset(&child_act.sa_mask);
> 
>  	if ((sigaction(SIGUSR2, &child_act, NULL)) == -1) {
> -		tst_resm(TWARN, "sigaction() failed in child");
> +		tst_res(TWARN, "sigaction() failed in child");
>  		exit(1);
>  	}
> 
>  	if ((ptrace(PTRACE_TRACEME, 0, 0, 0)) == -1) {
> -		tst_resm(TWARN, "ptrace() failed in child");
> +		tst_res(TWARN, "ptrace() failed in child");
>  		exit(1);
>  	}
> -	/* ensure that child bypasses signal handler */
>  	if ((kill(getpid(), SIGUSR2)) == -1) {
> -		tst_resm(TWARN, "kill() failed in child");
> +		tst_res(TWARN, "kill() failed in child");
>  		exit(1);
>  	}
>  	exit(1);
>  }
> 
> -/* setup() - performs all ONE TIME setup for this test */
> -void setup(void)
> +static void run(unsigned int i)
>  {
> 
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> +	pid_t child_pid;
> +	int status;
> +	struct sigaction parent_act;
> 
> -	TEST_PAUSE;
> +#ifdef UCLINUX
> +	maybe_run_child(&do_child, "d", &i);
> +#endif
> 
> -}
> +	got_signal = 0;
> 
> -/*
> - *cleanup() -  performs all ONE TIME cleanup for this test at
> - *		completion or premature exit.
> - */
> -void cleanup(void)
> -{
> +	if (i == 1) {
> +		parent_act.sa_handler = parent_handler;
> +		parent_act.sa_flags = SA_RESTART;
> +		sigemptyset(&parent_act.sa_mask);
> 
> -}
> +		if ((sigaction(SIGUSR2, &parent_act, NULL))
> +		    == -1) {
> +			tst_res(TWARN, "sigaction() failed in parent");
> +		}
> +	}
> 
> -/*
> - * child_handler() - Signal handler for child
> - */
> -void child_handler(void)
> -{
> +	child_pid = SAFE_FORK();
> 
> -	if ((kill(getppid(), SIGUSR2)) == -1) {
> -		tst_resm(TWARN, "kill() failed in child_handler()");
> -		exit(1);
> -	}
> -}
> +	if (child_pid != 0) {
> 
> -/*
> - * parent_handler() - Signal handler for parent
> - */
> -void parent_handler(void)
> -{
> +		SAFE_WAITPID(child_pid, &status, 0);
> 
> -	got_signal = 1;
> +		if (((WIFEXITED(status)) &&
> +		     (WEXITSTATUS(status))) ||
> +		    (got_signal == 1)) {
> +			tst_res(TFAIL, "Test Failed");
> +		} else {
> +			if ((ptrace(PTRACE_KILL, child_pid,
> +				    0, 0)) == -1) {
> +				tst_res(TFAIL,
> +						"Test Failed: Parent was not
> able to kill child");
> +			}
> +		}
> +
> +		SAFE_WAITPID(child_pid, &status, 0);
> +
> +		if (WIFEXITED(status))
> +			tst_res(TFAIL, "Test failed");
> +		else
> +			tst_res(TPASS, "Test Passed");
> +
> +	} else
> +		do_child(i);
>  }
> +
> +static struct tst_test test = {
> +	.test = run,
> +	.tcnt = 2,
> +	.forks_child = 1,
> +};
> --
> 2.16.4
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
