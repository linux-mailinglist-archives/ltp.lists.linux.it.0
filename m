Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B74116A5B9E
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Feb 2023 16:22:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B39213CD2FF
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Feb 2023 16:22:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0BAF83C30A8
 for <ltp@lists.linux.it>; Tue, 28 Feb 2023 16:22:42 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 16E051A006B6
 for <ltp@lists.linux.it>; Tue, 28 Feb 2023 16:22:41 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4BB5021A51;
 Tue, 28 Feb 2023 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677597761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsManp0wiUQ6TVExZG7AZG+EUhqjnHTKOyzErhl225A=;
 b=bm1aUz7/9GIDs7DiKtGZQwacZdi++l4HusYtKHI/LA4WghtCS+2Qi+zd7HQoVHAXm0vmY8
 ibWxnIXy5HLfc0L8N//waaLppEj6TxeLGZQB8AMMWD1Km2MxcxYOVgaiThbsmjEjhcFkUO
 RPtF7JDvpha+iiKrBVGq6c1WVYvAHhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677597761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsManp0wiUQ6TVExZG7AZG+EUhqjnHTKOyzErhl225A=;
 b=q3gOWE8TnffVyFXiDR2U6kJikz74OI3Jn1hViavEPBdZPWwzXXv8Ez8CNLT3So5BmZdWKY
 OvGnEkgsnWp9CcDQ==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1AD552C141;
 Tue, 28 Feb 2023 15:22:41 +0000 (UTC)
References: <20230216085107.7068-1-andrea.cervesato@suse.com>
 <20230216085107.7068-5-andrea.cervesato@suse.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Date: Tue, 28 Feb 2023 15:11:22 +0000
Organization: Linux Private Site
In-reply-to: <20230216085107.7068-5-andrea.cervesato@suse.com>
Message-ID: <87356pu85b.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/6] Refactor mqns_04 using new LTP API
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Andrea Cervesato via ltp <ltp@lists.linux.it> writes:

> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  runtest/containers                         |   4 +-
>  testcases/kernel/containers/mqns/mqns_04.c | 273 +++++++++------------
>  2 files changed, 122 insertions(+), 155 deletions(-)
>
> diff --git a/runtest/containers b/runtest/containers
> index 1cc6c838d..318113e19 100644
> --- a/runtest/containers
> +++ b/runtest/containers
> @@ -24,8 +24,8 @@ mqns_02_unshare mqns_02 -m unshare
>  mqns_03 mqns_03
>  mqns_03_clone mqns_03 -m clone
>  mqns_03_unshare mqns_03 -m unshare
> -mqns_04 mqns_04
> -mqns_04_clone mqns_04 -clone
> +mqns_04_clone mqns_04 -m clone
> +mqns_04_unshare mqns_04 -m unshare
>  
>  netns_netlink netns_netlink
>  netns_breakns_ip_ipv4_netlink netns_breakns.sh
> diff --git a/testcases/kernel/containers/mqns/mqns_04.c b/testcases/kernel/containers/mqns/mqns_04.c
> index d07a85c04..93df61ec4 100644
> --- a/testcases/kernel/containers/mqns/mqns_04.c
> +++ b/testcases/kernel/containers/mqns/mqns_04.c
> @@ -1,187 +1,154 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
> -* Copyright (c) International Business Machines Corp., 2009
> -* This program is free software; you can redistribute it and/or modify
> -* it under the terms of the GNU General Public License as published by
> -* the Free Software Foundation; either version 2 of the License, or
> -* (at your option) any later version.
> -*
> -* This program is distributed in the hope that it will be useful,
> -* but WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> -* the GNU General Public License for more details.
> -* You should have received a copy of the GNU General Public License
> -* along with this program; if not, write to the Free Software
> -* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> -*
> -* Author: Serge Hallyn <serue@us.ibm.com>
> -*
> -* Check mqueuefs lifetime
> -* . parent creates /dev/mqueue2
> -* . child mounts mqueue there
> -* . child does mq_open("/ab")
> -* . parent checks for /dev/mqueue2
> -* . child exits
> -* . parent checks for /dev/mqueue2
> -* . parent tries 'touch /dev/mqueue2/dd' -> should fail
> -* . parent umounts /dev/mqueue2
> -
> -***************************************************************************/
> -
> -#ifndef _GNU_SOURCE
> + * Copyright (c) International Business Machines Corp., 2009
> + * Copyright (c) Serge Hallyn <serue@us.ibm.com>
> + * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Test mqueuefs manipulation from child/parent namespaces.
> + *
> + * [Algorithm]
> + *
> + * - parent creates mqueue folder in <tmpdir>
> + * - child mounts mqueue there
> + * - child creates /MQ1 mqueue
> + * - parent checks for <tmpdir>/mqueue/MQ1 existence
> + * - child exits
> + * - parent checks for <tmpdir>/mqueue/MQ1 existence
> + * - parent tries 'touch <tmpdir>/mqueue/MQ2' -> should fail
> + * - parent umount mqueuefs
> + */
>  #define _GNU_SOURCE
> -#endif
> -#include <sys/types.h>
> -#include <sys/stat.h>
> +
>  #include <sys/wait.h>
> -#include <assert.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <unistd.h>
> -#include <string.h>
> -#include <errno.h>
> -#include "mqns.h"
> -#include "mqns_helper.h"
> +#include "tst_test.h"
> +#include "lapi/sched.h"
> +#include "tst_safe_posix_ipc.h"
> +#include "tst_safe_stdio.h"
>  
> -char *TCID = "posixmq_namespace_04";
> -int TST_TOTAL = 1;
> +#define CHECK_MQ_OPEN_RET(x) ((x) >= 0 || ((x) == -1 && errno != EMFILE))
>  
> -int p1[2];
> -int p2[2];
> +#define MQNAME1 "/MQ1"
> +#define MQNAME2 "/MQ2"

/MQ2 is never created

>  
> -#define FNAM1 DEV_MQUEUE2 SLASH_MQ1
> -#define FNAM2 DEV_MQUEUE2 SLASH_MQ2
> +static char *str_op;
> +static char *devdir;
> +static char *mqueue1;
> +static char *mqueue2;
> +static int *mq_freed;
>  
> -int check_mqueue(void *vtest)
> +static void check_mqueue(void)
>  {
> -	char buf[30];
>  	mqd_t mqd;
> -	int rc;
>  
> -	(void) vtest;
> +	mqd = TST_RETRY_FUNC(
> +		mq_open(MQNAME1, O_RDWR | O_CREAT | O_EXCL, 0755, NULL),
> +		CHECK_MQ_OPEN_RET);
> +	if (mqd == -1)
> +		tst_brk(TBROK | TERRNO, "mq_open failed");
>  
> -	close(p1[1]);
> -	close(p2[0]);
> +	SAFE_MQ_CLOSE(mqd);
>  
> -	read(p1[0], buf, 3);	/* go */
> +	SAFE_MOUNT("mqueue", devdir, "mqueue", 0, NULL);
>  
> -	mqd = tst_syscall(__NR_mq_open, NOSLASH_MQ1, O_RDWR | O_CREAT | O_EXCL,
> -		0755, NULL);
> -	if (mqd == -1) {
> -		write(p2[1], "mqfail", 7);
> -		tst_exit();
> -	}
> +	TST_CHECKPOINT_WAKE_AND_WAIT(0);
> +}
> +
> +static void run(void)
> +{
> +	const struct tst_clone_args clone_args = { CLONE_NEWIPC, SIGCHLD };
> +	int status;
> +	struct stat statbuf;
> +
> +	tst_res(TINFO, "Checking mqueue filesystem lifetime");
> +
> +	if (str_op && !strcmp(str_op, "clone")) {
> +		tst_res(TINFO, "Spawning isolated process");
>  
> -	mq_close(mqd);
> +		if (!SAFE_CLONE(&clone_args)) {
> +			check_mqueue();
> +			return;
> +		}
> +	} else if (str_op && !strcmp(str_op, "unshare")) {
> +		tst_res(TINFO, "Spawning unshared process");
>  
> -	rc = mount("mqueue", DEV_MQUEUE2, "mqueue", 0, NULL);

Possibly this is a mistake in the original test. Do we really need to
remount mqueuefs? Isn't it just the same FS in a different location?

This thing that really makes a difference is that the child is in a new
namespace, so the parent and child should not see each others queues?

> -	if (rc == -1) {
> -		perror("mount");
> -		write(p2[1], "mount", 6);
> -		tst_exit();
> +		if (!SAFE_FORK()) {
> +			SAFE_UNSHARE(CLONE_NEWIPC);
> +			check_mqueue();
> +			return;
> +		}
>  	}
>  
> -	write(p2[1], "go", 3);
> -	read(p1[0], buf, 3);
> +	TST_CHECKPOINT_WAIT(0);
>  
> -	tst_exit();
> -}
> +	SAFE_STAT(mqueue1, &statbuf);
> +	tst_res(TPASS, "%s child's mqueue can be accessed from parent", mqueue1);
>  
> -static void setup(void)
> -{
> -	tst_require_root();
> -	check_mqns();
> -}
> +	TST_CHECKPOINT_WAKE(0);
>  
> -int main(int argc, char *argv[])
> -{
> -	int rc;
> -	int status;
> -	char buf[30];
> -	struct stat statbuf;
> -	int use_clone = T_UNSHARE;
> +	tst_res(TINFO, "Waiting child to exit");
>  
> -	setup();
> +	SAFE_WAIT(&status);

Again we can just use tst_reap_children() which does a thorough check of
the child status.

>  
> -	if (argc == 2 && strcmp(argv[1], "-clone") == 0) {
> -		tst_resm(TINFO,
> -			 "Testing posix mq namespaces through clone(2).");
> -		use_clone = T_CLONE;
> -	} else
> -		tst_resm(TINFO,
> -			 "Testing posix mq namespaces through unshare(2).");
> +	if (!WIFEXITED(status))
> +		tst_brk(TBROK, "Child did not exit normally: %s", tst_strstatus(status));
>  
> -	if (pipe(p1) == -1) {
> -		perror("pipe");
> -		exit(EXIT_FAILURE);
> -	}
> -	if (pipe(p2) == -1) {
> -		perror("pipe");
> -		exit(EXIT_FAILURE);
> -	}
> +	SAFE_STAT(mqueue1, &statbuf);
> +	tst_res(TPASS, "%s child's mqueue can be accessed from parent after child's dead", mqueue1);
>  
> -	mkdir(DEV_MQUEUE2, 0755);
> +	TST_EXP_FAIL(creat(mqueue2, 0755), EACCES);
>  
> -	tst_resm(TINFO, "Checking mqueue filesystem lifetime");
> +	SAFE_UMOUNT(devdir);
>  
> -	/* fire off the test */
> -	rc = do_clone_unshare_test(use_clone, CLONE_NEWIPC, check_mqueue, NULL);
> -	if (rc < 0) {
> -		tst_resm(TFAIL, "failed clone/unshare");
> -		goto fail;
> -	}
> +	*mq_freed = 1;

This doesn't appear to be near the point that the MQ is unlinked.

> +}
>  
> -	close(p1[0]);
> -	close(p2[1]);
> -	write(p1[1], "go", 3);
> -
> -	read(p2[0], buf, 7);
> -	if (!strcmp(buf, "mqfail")) {
> -		tst_resm(TFAIL, "child process could not create mqueue");
> -		goto fail;
> -	} else if (!strcmp(buf, "mount")) {
> -		tst_resm(TFAIL, "child process could not mount mqueue");
> -		goto fail;
> -	}
> +static void setup(void)
> +{
> +	char *tmpdir;
>  
> -	rc = stat(FNAM1, &statbuf);
> -	if (rc == -1) {
> -		perror("stat");
> -		write(p1[1], "go", 3);
> -		tst_resm(TFAIL, "parent could not see child's created mq");
> -		goto fail;
> -	}
> -	write(p1[1], "go", 3);
> +	if (!str_op)
> +		tst_brk(TCONF, "Please use clone|unshare execution
> mode");

When this happens the test segfaults because devdir and mq_freed have
not been allocated.

This is also a problem in previous tests as well.

>  
> -	rc = wait(&status);
> -	if (rc == -1) {
> -		perror("wait");
> -		tst_resm(TFAIL, "error while parent waited on child to exit");
> -		goto fail;
> -	}
> -	if (!WIFEXITED(status)) {
> -		tst_resm(TFAIL, "Child did not exit normally (status %d)",
> -			 status);
> -		goto fail;
> -	}
> -	rc = stat(FNAM1, &statbuf);
> -	if (rc == -1) {
> -		tst_resm(TFAIL,
> -			 "parent's view of child's mq died with child");
> -		goto fail;
> -	}
> +	tmpdir = tst_get_tmpdir();
>  
> -	rc = creat(FNAM2, 0755);
> -	if (rc != -1) {
> -		tst_resm(TFAIL,
> -			 "parent was able to create a file in dead child's mqfs");
> -		goto fail;
> -	}
> +	SAFE_ASPRINTF(&devdir, "%s/mqueue", tmpdir);
> +	SAFE_MKDIR(devdir, 0755);
> +
> +	SAFE_ASPRINTF(&mqueue1, "%s" MQNAME1, devdir);
> +	SAFE_ASPRINTF(&mqueue2, "%s" MQNAME2, devdir);
>  
> -	tst_resm(TPASS, "Child mqueue fs still visible for parent");
> +	mq_freed = SAFE_MMAP(NULL,
> +		sizeof(int),
> +		PROT_READ | PROT_WRITE,
> +		MAP_SHARED | MAP_ANONYMOUS,
> +		-1, 0);

This starts as 0, but we have not created any MQs yet so we could not
free them in cleanup (also in mqns03).

Try running with -i0

> +}
>  
> -fail:
> -	umount(DEV_MQUEUE2);
> -	rmdir(DEV_MQUEUE2);
> +static void cleanup(void)
> +{
> +	if (tst_is_mounted(devdir))
> +		SAFE_UMOUNT(devdir);
>  
> -	tst_exit();
> +	if (!*mq_freed) {
> +		SAFE_MQ_UNLINK(MQNAME1);
> +		SAFE_MQ_UNLINK(MQNAME2);
> +	}
>  }
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +	.forks_child = 1,
> +	.needs_tmpdir = 1,
> +	.needs_checkpoints = 1,
> +	.options = (struct tst_option[]) {
> +		{ "m:", &str_op, "Test execution mode <clone|unshare>" },
> +		{},
> +	},
> +};
> -- 
> 2.35.3


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
