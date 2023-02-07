Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B384B68D531
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 12:10:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14F513CC20E
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 12:10:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A4343CB14D
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 12:10:39 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BE6F56008DD
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 12:10:38 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C0F7D38D65;
 Tue,  7 Feb 2023 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675768237;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iuI4BA8MmXeEY5x88unIXPZjt4el2UlGtRdCD5OuUDA=;
 b=Qz4Koy7LR1ujMUkyaZHOrjQuC3wqz9CJ+Qv83pu8yCKNckntWzr8lknL3ygoLrcqXE3UvD
 8JNNUjHm4IiqA0EgL/ZLI2zxBVSivAXmnCch/Bnc3pCr6I8URGsHhtnASNxYjqj3FkKjgj
 ZYElQHmeycAwdd5fT0u2K9C5uOa9xMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675768237;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iuI4BA8MmXeEY5x88unIXPZjt4el2UlGtRdCD5OuUDA=;
 b=MeoAhZl1QB+doBJAGm8Y1f0ZBaBS5zTde7shHwrsH7/u2S4eoM3cdgZb+Rmg5m7TIhXl3R
 LVQjc5Z9eIWDYeAw==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7F8A12C141;
 Tue,  7 Feb 2023 11:10:37 +0000 (UTC)
References: <20220805091315.26835-1-andrea.cervesato@suse.com>
 <874jwa8ywj.fsf@suse.de> <f0c71f61-a0e2-ac62-b338-2a06c4d951be@suse.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Date: Tue, 07 Feb 2023 10:51:10 +0000
Organization: Linux Private Site
In-reply-to: <f0c71f61-a0e2-ac62-b338-2a06c4d951be@suse.com>
Message-ID: <87ilgdivdf.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Refactor pidns05 test using new LTP API
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

Andrea Cervesato <andrea.cervesato@suse.com> writes:

> Hi!
>
> Can we merge this patch anyway? ltp_clone should be added after with a
> single patch.

I started work on an update to tst_clone so that it can replace most
intances of ltp_clone. However it appears that it can already replace
most instances of ltp_clone_quick.

AFAICT all you need to do is get rid of child_func and use tst_clone
like fork.

I don't remember if there is anything else in this patch that needs
reviewing, so there is no guarantee that when I look at this again it
will get merged.

So I don't see any advantage to deferring the change to tst_clone.

>
> Andrea
>
> On 10/11/22 11:56, Richard Palethorpe wrote:
>> Hello,
>>
>> Andrea Cervesato via ltp <ltp@lists.linux.it> writes:
>>
>>> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
>>> ---
>>>   testcases/kernel/containers/pidns/pidns05.c | 288 ++++++--------------
>>>   1 file changed, 78 insertions(+), 210 deletions(-)
>>>
>>> diff --git a/testcases/kernel/containers/pidns/pidns05.c b/testcases/kernel/containers/pidns/pidns05.c
>>> index 79e146e36..1c588991b 100644
>>> --- a/testcases/kernel/containers/pidns/pidns05.c
>>> +++ b/testcases/kernel/containers/pidns/pidns05.c
>>> @@ -1,256 +1,124 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>>   /*
>>> -* Copyright (c) International Business Machines Corp., 2007
>>> -* This program is free software; you can redistribute it and/or modify
>>> -* it under the terms of the GNU General Public License as published by
>>> -* the Free Software Foundation; either version 2 of the License, or
>>> -* (at your option) any later version.
>>> -* This program is distributed in the hope that it will be useful
>>> -* but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
>>> -* the GNU General Public License for more details.
>>> -* You should have received a copy of the GNU General Public License
>>> -* along with this program; if not, write to the Free Software
>>> -* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>>> -*
>>> -***************************************************************************
>>> -*
>>> -* Assertion:
>>> -*   a) Create a  container.
>>> -*   b) Create many levels of child containers inside this container.
>>> -*   c) Now do kill -9 init , outside of the container.
>>> -*   d) This should kill all the child containers.
>>> -*      (containers created at the level below)
>>> -*
>>> -* Description:
>>> -* 1. Parent process clone a process with flag CLONE_NEWPID
>>> -* 2. The container will recursively loop and creates 4 more containers.
>>> -* 3. All the container init's  goes into sleep(), waiting to be terminated.
>>> -* 4. The parent process will kill child[3] by passing SIGKILL
>>> -* 5. Now parent process, verifies the child containers 4 & 5 are destroyed.
>>> -* 6. If they are killed then
>>> -*	Test passed
>>> -*  else Test failed.
>>> -*
>>> -* Test Name: pidns05
>>> -*
>>> -* History:
>>> -*
>>> -* FLAG DATE		NAME				DESCRIPTION
>>> -* 31/10/08  Veerendra C <vechandr@in.ibm.com>	Verifies killing of NestedCont's
>>> -*
>>> -*******************************************************************************/
>>> -#define _GNU_SOURCE 1
>>> + * Copyright (c) International Business Machines Corp., 2007
>>> + *		08/10/08 Veerendra C <vechandr@in.ibm.com>
>>> + * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
>>> + */
>>> +
>>> +/*\
>>> + * [Description]
>>> + *
>>> + * Clone a process with CLONE_NEWPID flag and create many levels of child
>>> + * containers. Then kill container init process from parent and check if all
>>> + * containers have been killed.
>>> + */
>>> +
>>>   #include <sys/wait.h>
>>> -#include <assert.h>
>>> -#include <stdio.h>
>>> -#include <stdlib.h>
>>> -#include <unistd.h>
>>> -#include <string.h>
>>> -#include <errno.h>
>>> -#include "pidns_helper.h"
>>> -#include "test.h"
>>> -#include "safe_macros.h"
>>> +#include "tst_test.h"
>>> +#include "lapi/namespaces_constants.h"
>>>   -#define INIT_PID	1
>>> -#define CINIT_PID	1
>>> -#define PARENT_PID	0
>>>   #define MAX_DEPTH	5
>>>   -char *TCID = "pidns05";
>>> -int TST_TOTAL = 1;
>>> -int fd[2];
>>> +static pid_t pid_max;
>>>   -int max_pid(void)
>>> +static int child_func(void *arg)
>>>   {
>>> -	FILE *fp;
>>>   	int ret;
>>> +	int *level;
>>> +	pid_t cpid, ppid;
>>> +
>>> +	cpid = getpid();
>>> +	ppid = getppid();
>>>   -	fp = fopen("/proc/sys/kernel/pid_max", "r");
>>> -	if (fp != NULL) {
>>> -		fscanf(fp, "%d", &ret);
>>> -		fclose(fp);
>>> -	} else {
>>> -		tst_resm(TBROK, "Cannot open /proc/sys/kernel/pid_max");
>>> -		ret = -1;
>>> +	if (cpid != 1 || ppid != 0) {
>>> +		tst_res(TFAIL, "Got unexpected result of cpid=%d ppid=%d", cpid, ppid);
>>> +		return 1;
>>>   	}
>>> -	return ret;
>>> +
>>> +	level = (int *)arg;
>>> +
>>> +	if (*level >= MAX_DEPTH) {
>>> +		TST_CHECKPOINT_WAKE(0);
>>> +		return 0;
>>> +	}
>>> +
>>> +	(*level)++;
>>> +
>>> +	ret = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_func,
>>> level);
>> Again, ltp_clone should be converted to tst_clone.
>>
>>> +	if (ret < 0)
>>> +		tst_brk(TBROK | TERRNO, "clone failed");
>>> +
>>> +	pause();
>>> +
>>> +	return 0;
>>>   }
>>>   -/* find_cinit_pids() iteratively finds the pid's having same
>>> PGID as its parent.
>>> - * Input parameter - Accepts pointer to pid_t : To copy the pid's matching.
>>> - * Returns - the number of pids matched.
>>> -*/
>>> -int find_cinit_pids(pid_t * pids)
>>> +static int find_cinit_pids(pid_t *pids)
>>>   {
>>> -	int next = 0, pid_max, i;
>>> +	int i;
>>> +	int next = 0;
>>>   	pid_t parentpid, pgid, pgid2;
>>>   -	pid_max = max_pid();
>>>   	parentpid = getpid();
>>>   	pgid = getpgid(parentpid);
>>>   -	/* The loop breaks, when the loop counter reaches the
>>> parentpid value */
>>> -	for (i = parentpid + 1; i != parentpid; i++) {
>>> -		if (i > pid_max)
>>> -			i = 2;
>>> -
>>> +	for (i = parentpid + 1; i < pid_max; i++) {
>>>   		pgid2 = getpgid(i);
>>> +
>>>   		if (pgid2 == pgid) {
>>>   			pids[next] = i;
>>>   			next++;
>>>   		}
>>>   	}
>>> +
>>>   	return next;
>>>   }
>>>   -/*
>>> -* create_nested_container() Recursively create MAX_DEPTH nested containers
>>> -*/
>>> -int create_nested_container(void *vtest)
>>> +static void setup(void)
>>>   {
>>> -	int exit_val;
>>> -	int ret, count, *level;
>>> -	pid_t cpid, ppid;
>>> -	cpid = getpid();
>>> -	ppid = getppid();
>>> -	char mesg[] = "Nested Containers are created";
>>> -
>>> -	level = (int *)vtest;
>>> -	count = *level;
>>> -
>>> -	/* Child process closes up read side of pipe */
>>> -	close(fd[0]);
>>> -
>>> -	/* Comparing the values to make sure pidns is created correctly */
>>> -	if (cpid != CINIT_PID || ppid != PARENT_PID) {
>>> -		printf("Got unexpected cpid and/or ppid (cpid=%d ppid=%d)\n",
>>> -		       cpid, ppid);
>>> -		exit_val = 1;
>>> -	}
>>> -	if (count > 1) {
>>> -		count--;
>>> -		ret = do_clone_unshare_test(T_CLONE, CLONE_NEWPID,
>>> -					    create_nested_container,
>>> -					    (void *)&count);
>>> -		if (ret == -1) {
>>> -			printf("clone failed; errno = %d : %s\n",
>>> -			       ret, strerror(ret));
>>> -			exit_val = 1;
>>> -		} else
>>> -			exit_val = 0;
>>> -	} else {
>>> -		/* Sending mesg, 'Nested containers created' through the pipe */
>>> -		write(fd[1], mesg, (strlen(mesg) + 1));
>>> -		exit_val = 0;
>>> -	}
>>> -
>>> -	close(fd[1]);
>>> -	pause();
>>> -
>>> -	return exit_val;
>>> +	SAFE_FILE_SCANF("/proc/sys/kernel/pid_max", "%d\n", &pid_max);
>>>   }
>>>   -void kill_nested_containers()
>>> +static void run(void)
>>>   {
>>> -	int orig_count, new_count, status = 0, i;
>>> +	int ret, i;
>>> +	int status;
>>> +	int children;
>>> +	int level = 0;
>>>   	pid_t pids[MAX_DEPTH];
>>>   	pid_t pids_new[MAX_DEPTH];
>>>   -	orig_count = find_cinit_pids(pids);
>>> -	kill(pids[MAX_DEPTH - 3], SIGKILL);
>>> -	sleep(1);
>>> -
>>> -	/* After killing child container, getting the New PID list */
>>> -	new_count = find_cinit_pids(pids_new);
>>> +	ret = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_func, &level);
>>> +	if (ret < 0)
>>> +		tst_brk(TBROK | TERRNO, "clone failed");
>>>   -	/* Verifying that the child containers were destroyed when
>>> parent is killed */
>>> -	if (orig_count - 2 != new_count)
>>> -		status = -1;
>>> +	TST_CHECKPOINT_WAIT(0);
>>>   -	for (i = 0; i < new_count; i++) {
>>> -		if (pids[i] != pids_new[i])
>>> -			status = -1;
>>> -	}
>>> +	find_cinit_pids(pids);
>>>   -	if (status == 0)
>>> -		tst_resm(TPASS, "The number of containers killed are %d",
>>> -			 orig_count - new_count);
>>> -	else
>>> -		tst_resm(TFAIL, "Failed to kill the sub-containers of "
>>> -			 "the container %d", pids[MAX_DEPTH - 3]);
>>> -
>>> -	/* Loops through the containers created to exit from sleep() */
>>> -	for (i = 0; i < MAX_DEPTH; i++) {
>>> -		kill(pids[i], SIGKILL);
>>> -		waitpid(pids[i], &status, 0);
>>> -	}
>>> -}
>>> +	SAFE_KILL(pids[0], SIGKILL);
>>>   -static void setup(void)
>>> -{
>>> -	tst_require_root();
>>> -	check_newpid();
>>> -}
>>> +	TST_RETRY_FUNC(waitpid(0, &status, WNOHANG), TST_RETVAL_NOTNULL);
>>>   -int main(void)
>>> -{
>>> -	int ret, nbytes, status;
>>> -	char readbuffer[80];
>>> -	pid_t pid, pgid;
>>> -	int count = MAX_DEPTH;
>>> +	children = find_cinit_pids(pids_new);
>>>   -	setup();
>>> +	if (children > 0) {
>>> +		tst_res(TFAIL, "%d children left after sending SIGKILL", children);
>>>   -	/*
>>> -	 * XXX (garrcoop): why in the hell is this fork-wait written this way?
>>> -	 * This doesn't add up with the pattern used for the rest of the tests,
>>> -	 * so I'm pretty damn sure this test is written incorrectly.
>>> -	 */
>>> -	pid = fork();
>>> -	if (pid == -1) {
>>> -		tst_brkm(TBROK | TERRNO, NULL, "fork failed");
>>> -	} else if (pid != 0) {
>>> -		/*
>>> -		 * NOTE: use waitpid so that we know we're waiting for the
>>> -		 * _top-level_ child instead of a spawned subcontainer.
>>> -		 *
>>> -		 * XXX (garrcoop): Might want to mask SIGCHLD in the top-level
>>> -		 * child too, or not *shrugs*.
>>> -		 */
>>> -		if (waitpid(pid, &status, 0) == -1) {
>>> -			perror("wait failed");
>>> +		for (i = 0; i < MAX_DEPTH; i++) {
>>> +			kill(pids[i], SIGKILL);
>>> +			waitpid(pids[i], &status, 0);
>>>   		}
>>> -		if (WIFEXITED(status))
>>> -			exit(WEXITSTATUS(status));
>>> -		else
>>> -			exit(status);
>>> -	}
>>>   -	/* To make all the containers share the same PGID as its
>>> parent */
>>> -	setpgid(0, 0);
>>> -
>>> -	pid = getpid();
>>> -	pgid = getpgid(pid);
>>> -	SAFE_PIPE(NULL, fd);
>>> -
>>> -	TEST(do_clone_unshare_test(T_CLONE, CLONE_NEWPID,
>>> -				   create_nested_container, (void *)&count));
>>> -	if (TEST_RETURN == -1) {
>>> -		tst_brkm(TFAIL | TTERRNO, NULL, "clone failed");
>>> +		return;
>>>   	}
>>>   -	close(fd[1]);
>>> -	/* Waiting for the MAX_DEPTH number of containers to be created */
>>> -	nbytes = read(fd[0], readbuffer, sizeof(readbuffer));
>>> -	close(fd[0]);
>>> -	if (nbytes > 0)
>>> -		tst_resm(TINFO, " %d %s", MAX_DEPTH, readbuffer);
>>> -	else
>>> -		tst_brkm(TFAIL, NULL, "unable to create %d containers",
>>> -			 MAX_DEPTH);
>>> -
>>> -	/* Kill the container created */
>>> -	kill_nested_containers();
>>> -
>>> -	tst_exit();
>>> +	tst_res(TPASS, "No children left after sending SIGKILL to the first child");
>>>   }
>>> +
>>> +static struct tst_test test = {
>>> +	.test_all = run,
>>> +	.setup = setup,
>>> +	.needs_root = 1,
>>> +	.needs_checkpoints = 1,
>>> +};
>>> -- 2.35.3
>>


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
