Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C68BA982
	for <lists+linux-ltp@lfdr.de>; Fri,  3 May 2024 11:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1714727496; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=nhGmWCSSpffho3f/dZ/8Sf6p4aKvCTbvndFwvhfhggY=;
 b=L2W8KzwhIS8OZwso3m1QqmF+eOEIl9AoaQQdzCe2o33rY0GXEACfS4OrR7Nw2eq5ZRmMr
 bY0NrG1DrJcA4MPQ9Ukj19G88nytVBPTNvsJMFWXT9XVHj+2S13Weiw7cEfdjZQmYopkMUP
 n+8dvg9TNNmUdWRJERiUjdRnRaMOhbQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C41BB3CC3C5
	for <lists+linux-ltp@lfdr.de>; Fri,  3 May 2024 11:11:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1FC443CAF96
 for <ltp@lists.linux.it>; Fri,  3 May 2024 11:11:32 +0200 (CEST)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B9EF610103BC
 for <ltp@lists.linux.it>; Fri,  3 May 2024 11:11:07 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f5so62452605e9.2
 for <ltp@lists.linux.it>; Fri, 03 May 2024 02:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1714727467; x=1715332267; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ygy/q5VycRP8x/xjjPDA4hbd1/TrfLEGoJgcPgVpDdU=;
 b=AJ3yXSYxSW3tORrBdtfUxqlXuM/B4o60iyFEacJFPo3ocZ8eeTlKCtP890XJz2R5a7
 X3SSlV3t6U4SRGyJcV9yXguqzFpUsy4WcX/VyQP8irFzU10j8s8RZCbTg9JQ7PfdiqZt
 rOOm9eDeSo/HXJW451Pga3LY4Kka5m/zmmImflIOInJdJty8sFlQmCRYwhjG1B1TU+Jv
 y/qW83DXzX75F9YGw6M6cB+lYPgGyhv9BG6D+SBYPuZ+CjHQo2tcpK/4Wkc7lLB0qmSy
 lyxPvX7oln9KdY3xsMjBof81NDvRdBgDUtJCdxd4bL6cKKwWxgylONEmyuK3ozUpOVkA
 kmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714727467; x=1715332267;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ygy/q5VycRP8x/xjjPDA4hbd1/TrfLEGoJgcPgVpDdU=;
 b=t2T7LDqGVBTX7cZhv3isGFsEEdpQZOdOaee5Wx/tHc7I3C27fcx8lq/iI+n+aGdAL6
 kiHbtptwfGJRagTNNqrpd2JbM1kbw8kiUrY1GmoOWE3qGa0LRQGjKquSu+4XnAhk+H++
 nnE7QrkRzvhu7F2PhIUHItq0MZk8xh+5dfIIN6daBB5qfLXYpjmqlAryi2YFRwDAokiL
 bnCk9oH57I3KbIxTh8L4/lL/U8NafBJQ0r6uvmP0cv8jzISUf1hxk18tO8YHMHrZe8X0
 XNib9LPir4XWh3Bf2auN0my5wtnCvCzVBGiw0DxZP+b/ypRyBor/Y9YzsdAX0q8Qmaau
 EVEQ==
X-Gm-Message-State: AOJu0YwSk6KJXXJ2tT0s9/FYM5SJ5LB7r1s4XK7YcglNal6oIQG4zYDJ
 gXHVUW8rDFHK6emQNt8rMsMn899/XZVmh0dGuphTE2gmFJ9/ehUx5mCNGW9AuJa9uUFp3YeRNsi
 9
X-Google-Smtp-Source: AGHT+IHBJ3WV+60s55CT2BWOj2M0UDSl2GbzHwkqsqvcG7uVfJ8Z+htlwFJ5lQ+G4sYsK1tLUpK3og==
X-Received: by 2002:a05:600c:a07:b0:418:d91b:f1a3 with SMTP id
 z7-20020a05600c0a0700b00418d91bf1a3mr1632630wmp.38.1714727466607; 
 Fri, 03 May 2024 02:11:06 -0700 (PDT)
Received: from [192.168.178.40] ([178.20.91.126])
 by smtp.gmail.com with ESMTPSA id
 fl24-20020a05600c0b9800b00418916f5848sm4915270wmb.43.2024.05.03.02.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 02:11:06 -0700 (PDT)
Message-ID: <0483d3ef-345b-4825-926c-56d0bc617d82@suse.com>
Date: Fri, 3 May 2024 11:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240425121012.30094-1-andrea.cervesato@suse.de>
 <ZjOIVFAlpxDh_oku@yuki>
Content-Language: en-US
In-Reply-To: <ZjOIVFAlpxDh_oku@yuki>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] Rewrite msgstress testing suite
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On 5/2/24 14:34, Cyril Hrubis wrote:
> Hi!
>> msgstress testing suite has been rewritten, taking in consideration
>> that old code was not working most of the times. The new algorithm
>> simply generates new SysV IPC messages, spawning a sender and a
>> receiver which will validate data.
>>
>> With the new algorithm we also reduce the amount of children which
>> we spawn, since we only have 2: sender and receiver. This permits to
>> increase the number of messages to send and to do not be depedent from
>> system overload.
>>
>> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
>> ---
>> Add iteration option for messages
>>
>>   runtest/syscalls                              |   6 +-
>>   runtest/syscalls-ipc                          |   6 +-
>>   .../kernel/syscalls/ipc/msgstress/.gitignore  |   3 -
>>   .../kernel/syscalls/ipc/msgstress/Makefile    |   5 -
>>   .../syscalls/ipc/msgstress/msgstress01.c      | 455 ++++++++----------
>>   .../syscalls/ipc/msgstress/msgstress02.c      | 408 ----------------
>>   .../syscalls/ipc/msgstress/msgstress03.c      | 299 ------------
>>   .../syscalls/ipc/msgstress/msgstress04.c      | 444 -----------------
>>   8 files changed, 214 insertions(+), 1412 deletions(-)
>>   delete mode 100644 testcases/kernel/syscalls/ipc/msgstress/msgstress02.c
>>   delete mode 100644 testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
>>   delete mode 100644 testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
>>
>> diff --git a/runtest/syscalls b/runtest/syscalls
>> index b9dd9fec6..fabb196be 100644
>> --- a/runtest/syscalls
>> +++ b/runtest/syscalls
>> @@ -864,12 +864,10 @@ msgctl03 msgctl03
>>   msgctl04 msgctl04
>>   msgctl05 msgctl05
>>   msgctl06 msgctl06
>> -msgstress01 msgstress01
>> -msgstress02 msgstress02
>> -msgstress03 msgstress03
>> -msgstress04 msgstress04
>>   msgctl12 msgctl12
>>   
>> +msgstress01 msgstress01
>> +
>>   msgget01 msgget01
>>   msgget02 msgget02
>>   msgget03 msgget03
>> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
>> index 9860394de..8960c487c 100644
>> --- a/runtest/syscalls-ipc
>> +++ b/runtest/syscalls-ipc
>> @@ -4,12 +4,10 @@ msgctl03 msgctl03
>>   msgctl04 msgctl04
>>   msgctl05 msgctl05
>>   msgctl06 msgctl06
>> -msgstress01 msgstress01
>> -msgstress02 msgstress02
>> -msgstress03 msgstress03
>> -msgstress04 msgstress04
>>   msgctl12 msgctl12
>>   
>> +msgstress01 msgstress01
>> +
>>   msgget01 msgget01
>>   msgget02 msgget02
>>   msgget03 msgget03
>> diff --git a/testcases/kernel/syscalls/ipc/msgstress/.gitignore b/testcases/kernel/syscalls/ipc/msgstress/.gitignore
>> index a8f675399..fe9780693 100644
>> --- a/testcases/kernel/syscalls/ipc/msgstress/.gitignore
>> +++ b/testcases/kernel/syscalls/ipc/msgstress/.gitignore
>> @@ -1,4 +1 @@
>>   /msgstress01
>> -/msgstress02
>> -/msgstress03
>> -/msgstress04
>> diff --git a/testcases/kernel/syscalls/ipc/msgstress/Makefile b/testcases/kernel/syscalls/ipc/msgstress/Makefile
>> index b821bda01..442eb87d5 100644
>> --- a/testcases/kernel/syscalls/ipc/msgstress/Makefile
>> +++ b/testcases/kernel/syscalls/ipc/msgstress/Makefile
>> @@ -3,10 +3,5 @@
>>   
>>   top_srcdir              ?= ../../../../..
>>   
>> -LTPLIBS = ltpipc
>> -
>>   include $(top_srcdir)/include/mk/testcases.mk
>> -
>> -LTPLDLIBS  += -lltpipc
>> -
>>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>> diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
>> index 84e338437..b1bcdf44c 100644
>> --- a/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
>> +++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
>> @@ -1,301 +1,266 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>> - * Copyright (c) International Business Machines  Corp., 2002
>> - *
>> - * This program is free software;  you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation; either version 2 of the License, or
>> - * (at your option) any later version.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - * the GNU General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program;  if not, write to the Free Software
>> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> - *
>> - * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
>> - * 11/06/2002   Port to LTP     dbarrera@us.ibm.com
>> + * Copyright (c) International Business Machines Corp., 2002
>> + *   06/30/2001   Port to Linux   nsharoff@us.ibm.com
>> + *   11/11/2002   Port to LTP     dbarrera@us.ibm.com
>> + * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
>>    */
>>   
>>   /*
>> - * Get and manipulate a message queue.
>> + * [Description]
>> + *
>> + * Stress test for SysV IPC. We send multiple messages at the same time,
>> + * checking that we are not loosing any byte once we receive the messages
>> + * from multiple children.
>> + *
>> + * The number of messages to send is determined by the free slots available
>> + * in SysV IPC and the available number of children which can be spawned by
>> + * the process. Each sender will spawn multiple messages at the same time and
>> + * each receiver will read them one by one.
>>    */
>>   
>> -#define _XOPEN_SOURCE 500
>> -#include <signal.h>
>> -#include <errno.h>
>> -#include <string.h>
>> -#include <fcntl.h>
>>   #include <stdlib.h>
>> -#include <stdio.h>
>> -#include <unistd.h>
>> -#include <values.h>
>> -#include <sys/types.h>
>> -#include <sys/wait.h>
>> -#include <sys/stat.h>
>> -#include <sys/ipc.h>
>> -#include <sys/msg.h>
>> -#include "test.h"
>> -#include "ipcmsg.h"
>> -#include "libmsgctl.h"
>> -
>> -char *TCID = "msgstress01";
>> -int TST_TOTAL = 1;
>> -
>> -#ifndef CONFIG_COLDFIRE
>> -#define MAXNPROCS	1000000	/* This value is set to an arbitrary high limit. */
>> -#else
>> -#define MAXNPROCS	 100000	/* Coldfire can't deal with 1000000 */
>> -#endif
>> -#define MAXNREPS	100000
>> -
>> -static key_t keyarray[MAXNPROCS];
>> -static int pidarray[MAXNPROCS];
>> -static int tid;
>> -static int MSGMNI, nprocs, nreps;
>> -static int procstat;
>> -static int mykid;
>> -
>> -void setup(void);
>> -void cleanup(void);
>> -
>> -static int dotest(key_t key, int child_process);
>> -static void sig_handler();
>> -
>> -static char *opt_nprocs;
>> -static char *opt_nreps;
>> -
>> -static option_t options[] = {
>> -	{"n:", NULL, &opt_nprocs},
>> -	{"l:", NULL, &opt_nreps},
>> -	{NULL, NULL, NULL},
>> +#include "tst_safe_sysv_ipc.h"
>> +#include "tst_safe_stdio.h"
>> +#include "tst_test.h"
>> +
>> +#define SYSVIPC_TOTAL "/proc/sys/kernel/msgmni"
>> +#define SYSVIPC_USED "/proc/sysvipc/msg"
>> +#define KEY_VAL0 154326L
>> +#define MSGTYPE 10
>> +#define MAXNREPS 100000
>> +
>> +struct sysv_msg {
>> +	long type;
>> +	struct {
>> +		char len;
>> +		char pbytes[99];
>> +	} data;
>> +};
>> +
>> +struct sysv_data {
>> +	int id;
>> +	struct sysv_msg msg;
>>   };
>>   
>> -static void usage(void)
>> +static struct sysv_data *ipc_data;
>> +static int ipc_data_len;
>> +
>> +static char *str_num_messages;
>> +static char *str_num_iterations;
>> +static int num_messages = 1000;
>> +static int num_iterations = MAXNREPS;
>> +static int *failure;
>> +
>> +static int get_used_sysvipc(void)
>> +{
>> +	FILE *fp;
>> +	int used = -1;
>> +	char buf[BUFSIZ];
>> +
>> +	fp = SAFE_FOPEN(SYSVIPC_USED, "r");
>> +
>> +	while (fgets(buf, BUFSIZ, fp) != NULL)
>> +		used++;
>> +
>> +	SAFE_FCLOSE(fp);
>> +
>> +	if (used < 0)
>> +		tst_brk(TBROK, "Can't read %s to get used sysvipc resource", SYSVIPC_USED);
>> +
>> +	return used;
>> +}
>> +
>> +static void reset_messages(void)
>>   {
>> -	printf("  -n      Number of processes\n");
>> -	printf("  -l      Number of iterations\n");
>> +	ipc_data_len = 0;
>> +	memset(ipc_data, 0, sizeof(struct sysv_data) * num_messages);
>> +
>> +	for (int i = 0; i < num_messages; i++)
>> +		ipc_data[i].id = -1;
>>   }
>>   
>> -int main(int argc, char **argv)
>> +static int create_message(const int id)
>>   {
>> -	int i, j, ok, pid;
>> -	int count, status;
>> -	struct sigaction act;
>> +	int pos = ipc_data_len;
>> +	struct sysv_data *buff = ipc_data + pos;
>>   
>> -	tst_parse_opts(argc, argv, options, usage);
>> +	buff->id = id;
>> +	buff->msg.type = MSGTYPE;
>> +	buff->msg.data.len = (rand() % 99) + 1;
>>   
>> -	setup();
>> +	for (int i = 0; i < buff->msg.data.len; i++)
>> +		buff->msg.data.pbytes[i] = rand() % 255;
>>   
>> -	nreps = MAXNREPS;
>> -	nprocs = MSGMNI;
>> +	ipc_data_len++;
>>   
>> -	if (opt_nreps) {
>> -		nreps = atoi(opt_nreps);
>> -		if (nreps > MAXNREPS) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of iterations too large, "
>> -				 "setting to Max. of %d", MAXNREPS);
>> -			nreps = MAXNREPS;
>> -		}
>> -	}
>> +	return pos;
>> +}
>>   
>> -	if (opt_nprocs) {
>> -		nprocs = atoi(opt_nprocs);
>> -		if (nprocs > MSGMNI) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of processes too large, "
>> -				 "setting to Max. of %d", MSGMNI);
>> -			nprocs = MSGMNI;
>> +static void writer(const int id, const int pos)
>> +{
>> +	struct sysv_data *buff = &ipc_data[pos];
>> +	int iter = num_iterations;
>> +
>> +	while (--iter >= 0 && !(*failure))
>> +		SAFE_MSGSND(id, &buff->msg, 100, 0);
>> +}
>> +
>> +static void reader(const int id)
>> +{
>> +	int size;
>> +	int iter = num_iterations;
>> +	struct sysv_msg msg_recv;
>> +	struct sysv_data *buff = NULL;
>> +
>> +	for (int i = 0; i < ipc_data_len; i++) {
>> +		if (ipc_data[i].id == id) {
>> +			buff = ipc_data + i;
>> +			break;
>>   		}
>>   	}
>>   
>> -	srand(getpid());
>> -	tid = -1;
>> +	if (!buff)
>> +		tst_brk(TBROK, "Can't find original message. This is a test issue!");
> Why don't we pass the pos to the reader as well. There is no need to
> lookup anything as long as we pass it there too, right?
>
>> -	/* Setup signal handling routine */
>> -	memset(&act, 0, sizeof(act));
>> -	act.sa_handler = sig_handler;
>> -	sigemptyset(&act.sa_mask);
>> -	sigaddset(&act.sa_mask, SIGTERM);
>> -	if (sigaction(SIGTERM, &act, NULL) < 0) {
>> -		tst_brkm(TFAIL, NULL, "Sigset SIGTERM failed");
>> -	}
>> -	/* Set up array of unique keys for use in allocating message
>> -	 * queues
>> -	 */
>> -	for (i = 0; i < nprocs; i++) {
>> -		ok = 1;
>> -		do {
>> -			/* Get random key */
>> -			keyarray[i] = (key_t) rand();
>> -			/* Make sure key is unique and not private */
>> -			if (keyarray[i] == IPC_PRIVATE) {
>> -				ok = 0;
>> -				continue;
>> -			}
>> -			for (j = 0; j < i; j++) {
>> -				if (keyarray[j] == keyarray[i]) {
>> -					ok = 0;
>> -					break;
>> -				}
>> -				ok = 1;
>> -			}
>> -		} while (ok == 0);
>> -	}
>> +	while (--iter >= 0 && !(*failure)) {
>> +		memset(&msg_recv, 0, sizeof(struct sysv_msg));
>>   
>> -	/* Fork a number of processes, each of which will
>> -	 * create a message queue with one reader/writer
>> -	 * pair which will read and write a number (iterations)
>> -	 * of random length messages with specific values.
>> -	 */
>> +		size = SAFE_MSGRCV(id, &msg_recv, 100, MSGTYPE, 0);
>> +
>> +		if (msg_recv.type != buff->msg.type) {
>> +			tst_res(TFAIL, "Received the wrong message type");
>>   
>> -	for (i = 0; i < nprocs; i++) {
>> -		fflush(stdout);
>> -		if ((pid = FORK_OR_VFORK()) < 0) {
>> -			tst_brkm(TFAIL,
>> -				 NULL,
>> -				 "\tFork failed (may be OK if under stress)");
>> +			*failure = 1;
>> +			return;
>>   		}
>> -		/* Child does this */
>> -		if (pid == 0) {
>> -			procstat = 1;
>> -			exit(dotest(keyarray[i], i));
>> +
>> +		if (msg_recv.data.len != buff->msg.data.len) {
>> +			tst_res(TFAIL, "Received the wrong message data length");
>> +
>> +			*failure = 1;
>> +			return;
>>   		}
>> -		pidarray[i] = pid;
>> -	}
>>   
>> -	count = 0;
>> -	while (1) {
>> -		if ((wait(&status)) > 0) {
>> -			if (status >> 8 != 0) {
>> -				tst_brkm(TFAIL, NULL,
>> -					 "Child exit status = %d",
>> -					 status >> 8);
>> -			}
>> -			count++;
>> -		} else {
>> -			if (errno != EINTR) {
>> -				break;
>> +		for (int i = 0; i < size; i++) {
>> +			if (msg_recv.data.pbytes[i] != buff->msg.data.pbytes[i]) {
>> +				tst_res(TFAIL, "Received wrong data at index %d: %x != %x", i,
>> +					msg_recv.data.pbytes[i],
>> +					buff->msg.data.pbytes[i]);
>> +
>> +				*failure = 1;
>> +				return;
>>   			}
>> -#ifdef DEBUG
>> -			tst_resm(TINFO, "Signal detected during wait");
>> -#endif
>>   		}
>> -	}
>> -	/* Make sure proper number of children exited */
>> -	if (count != nprocs) {
>> -		tst_brkm(TFAIL,
>> -			 NULL,
>> -			 "Wrong number of children exited, Saw %d, Expected %d",
>> -			 count, nprocs);
>> -	}
>>   
>> -	tst_resm(TPASS, "Test ran successfully!");
>> +		tst_res(TDEBUG, "Received correct data");
>> +		tst_res(TDEBUG, "msg_recv.type = %ld", msg_recv.type);
>> +		tst_res(TDEBUG, "msg_recv.data.len = %d", msg_recv.data.len);
>> +	}
>>   
>> -	cleanup();
>> -	tst_exit();
>> +	buff->id = -1;
>>   }
>>   
>> -static int dotest(key_t key, int child_process)
>> +static void run(void)
>>   {
>> -	int id, pid;
>> -	int ret, status;
>> +	int id, pos;
>>   
>> -	sighold(SIGTERM);
>> -	TEST(msgget(key, IPC_CREAT | S_IRUSR | S_IWUSR));
>> -	if (TEST_RETURN < 0) {
>> -		printf("msgget() error in child %d: %s\n",
>> -			child_process, strerror(TEST_ERRNO));
>> +	reset_messages();
>>   
>> -		return FAIL;
>> -	}
>> -	tid = id = TEST_RETURN;
>> -	sigrelse(SIGTERM);
>> -
>> -	fflush(stdout);
>> -	if ((pid = FORK_OR_VFORK()) < 0) {
>> -		printf("\tFork failed (may be OK if under stress)\n");
>> -		TEST(msgctl(tid, IPC_RMID, 0));
>> -		if (TEST_RETURN < 0) {
>> -			printf("mscgtl() error in cleanup: %s\n",
>> -				strerror(TEST_ERRNO));
>> +	for (int i = 0; i < num_messages; i++) {
>> +		id = SAFE_MSGGET(KEY_VAL0 + i, IPC_CREAT | 0600);
>                                     ^
> 				   It may be better to pass IPC_PRIVATE
> 				   to let the kernel pick an unique key
>
>> +		pos = create_message(id);
>> +
>> +		if (!SAFE_FORK()) {
>> +			writer(id, pos);
>> +			return;
>>   		}
>> -		return FAIL;
>> -	}
>> -	/* Child does this */
>> -	if (pid == 0)
>> -		exit(doreader(key, id, 1, child_process, nreps));
>> -	/* Parent does this */
>> -	mykid = pid;
>> -	procstat = 2;
>> -	ret = dowriter(key, id, 1, child_process, nreps);
>> -	wait(&status);
>> -
>> -	if (ret != PASS)
>> -		exit(FAIL);
>> -
>> -	if ((!WIFEXITED(status) || (WEXITSTATUS(status) != PASS)))
>> -		exit(FAIL);
>> -
>> -	TEST(msgctl(id, IPC_RMID, 0));
>> -	if (TEST_RETURN < 0) {
>> -		printf("msgctl() errno %d: %s\n",
>> -			TEST_ERRNO, strerror(TEST_ERRNO));
>> -
>> -		return FAIL;
>> +
>> +		if (!SAFE_FORK()) {
>> +			reader(id);
>> +			return;
>> +		}
>> +
>> +		if (*failure)
>> +			break;
>>   	}
>> -	return PASS;
>> -}
>>   
>> -static void sig_handler(void)
>> -{
>> +	if (!(*failure))
>> +		tst_res(TPASS, "Test passed. All messages have been received");
> This does not work at all. We have to wait for all the children to
> finish before we look at the failure flag.
>
>>   }
>>   
>> -void setup(void)
>> +static void setup(void)
>>   {
>> -	int nr_msgqs;
>> +	int total_msg;
>> +	int avail_msg;
>> +	int free_msgs;
>> +	int free_pids;
>>   
>> -	tst_tmpdir();
>> +	srand(time(0));
>>   
>> -	tst_sig(FORK, DEF_HANDLER, cleanup);
>> +	SAFE_FILE_SCANF(SYSVIPC_TOTAL, "%i", &total_msg);
>>   
>> -	TEST_PAUSE;
>> +	free_msgs = total_msg - get_used_sysvipc();
>>   
>> -	nr_msgqs = get_max_msgqueues();
>> -	if (nr_msgqs < 0)
>> -		cleanup();
>> +	/* We remove 10% of free pids, just to be sure
>> +	 * we won't saturate the sysyem with processes.
>                                      ^
> 				    t
>> +	 */
>> +	free_pids = tst_get_free_pids() / 2.1;
>>   
>> -	nr_msgqs -= get_used_msgqueues();
>> -	if (nr_msgqs <= 0) {
>> -		tst_resm(TBROK,
>> -			 "Max number of message queues already used, cannot create more.");
>> -		cleanup();
>> -	}
>> +	avail_msg = MIN(free_msgs, free_pids);
>> +	if (!avail_msg)
>> +		tst_brk(TCONF, "Unavailable messages slots");
>>   
>> -	/*
>> -	 * Since msgmni scales to the memory size, it may reach huge values
>> -	 * that are not necessary for this test.
>> -	 * That's why we define NR_MSGQUEUES as a high boundary for it.
>> -	 */
>> -	MSGMNI = MIN(nr_msgqs, NR_MSGQUEUES);
>> +	tst_res(TINFO, "Available messages slots: %d", avail_msg);
>> +
>> +	if (tst_parse_int(str_num_messages, &num_messages, 1, avail_msg))
>> +		tst_brk(TBROK, "Invalid number of messages '%s'", str_num_messages);
>> +
>> +	if (tst_parse_int(str_num_iterations, &num_iterations, 1, MAXNREPS))
>> +		tst_brk(TBROK, "Invalid number of messages iterations '%s'", str_num_iterations);
>> +
>> +	ipc_data = SAFE_MMAP(
>> +		NULL,
>> +		sizeof(struct sysv_data) * num_messages,
>> +		PROT_READ | PROT_WRITE,
>> +		MAP_SHARED | MAP_ANONYMOUS,
>> +		-1, 0);
>> +
>> +	failure = SAFE_MMAP(
>> +		NULL,
>> +		sizeof(int),
>> +		PROT_READ | PROT_WRITE,
>> +		MAP_SHARED | MAP_ANONYMOUS,
>> +		-1, 0);
> Maybe it would be better named stop or something that defines better the
> purpose of the flag.
>
> Also the variable should be declared volatile to make sure that the
> compiler will not mis-compile the access, since it's modified from a
> different thread than read.
The variable is inside a shared memory and mmap() doesn't allow to 
create "volatile void*".
>> +	reset_messages();
>>   }
>>   
>> -void cleanup(void)
>> +static void cleanup(void)
>>   {
>> -	int status;
>> +	if (!ipc_data)
>> +		return;
>>   
>> -#ifdef DEBUG
>> -	tst_resm(TINFO, "Removing the message queue");
>> -#endif
>> -	(void)msgctl(tid, IPC_RMID, NULL);
>> -	if ((status = msgctl(tid, IPC_STAT, NULL)) != -1) {
>> -		(void)msgctl(tid, IPC_RMID, NULL);
>> -		tst_resm(TFAIL, "msgctl(tid, IPC_RMID) failed");
>> +	for (int pos = 0; pos < num_messages; pos++) {
>> +		struct sysv_data *buff = &ipc_data[pos];
>>   
>> +		if (buff->id != -1)
>> +			SAFE_MSGCTL(buff->id, IPC_RMID, NULL);
>>   	}
>>   
>> -	tst_rmdir();
>> +	SAFE_MUNMAP(ipc_data, sizeof(struct sysv_data) * num_messages);
>> +	SAFE_MUNMAP(failure, sizeof(int));
>>   }
>> +
>> +static struct tst_test test = {
>> +	.test_all = run,
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.forks_child = 1,
>> +	.max_runtime = 180,
>> +	.options = (struct tst_option[]) {
>> +		{"n:", &str_num_messages, "Number of messages to send (default: 1000)"},
>> +		{"l:", &str_num_iterations, "Number iterations per message (default: 10000)"},
>> +		{},
>> +	},
>> +};
>> diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c
>> deleted file mode 100644
>> index a0f894b05..000000000
>> --- a/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c
>> +++ /dev/null
>> @@ -1,408 +0,0 @@
>> -/*
>> - * Copyright (c) International Business Machines  Corp., 2002
>> - *
>> - * This program is free software;  you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation; either version 2 of the License, or
>> - * (at your option) any later version.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - * the GNU General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program;  if not, write to the Free Software
>> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> - *
>> - * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
>> - * 11/11/2002   Port to LTP     dbarrera@us.ibm.com
>> - */
>> -
>> -/*
>> - * Get and manipulate a message queue.
>> - */
>> -
>> -#define _XOPEN_SOURCE 500
>> -#include <sys/stat.h>
>> -#include <sys/types.h>
>> -#include <sys/ipc.h>
>> -#include <sys/msg.h>
>> -#include <sys/wait.h>
>> -#include <signal.h>
>> -#include <errno.h>
>> -#include <stdio.h>
>> -#include <string.h>
>> -#include <stdlib.h>
>> -#include <unistd.h>
>> -#include "test.h"
>> -#include "ipcmsg.h"
>> -#include "libmsgctl.h"
>> -
>> -char *TCID = "msgstress02";
>> -int TST_TOTAL = 1;
>> -
>> -#define MAXNREPS	1000
>> -#ifndef CONFIG_COLDFIRE
>> -#define MAXNPROCS	 1000000	/* This value is set to an arbitrary high limit. */
>> -#else
>> -#define MAXNPROCS	 100000	/* Coldfire can't deal with 1000000 */
>> -#endif
>> -#define MAXNKIDS	10
>> -
>> -static key_t keyarray[MAXNPROCS];
>> -static int pidarray[MAXNPROCS];
>> -static int rkidarray[MAXNKIDS];
>> -static int wkidarray[MAXNKIDS];
>> -static int tid;
>> -static int nprocs, nreps, nkids, MSGMNI;
>> -static int procstat;
>> -
>> -void setup(void);
>> -void cleanup(void);
>> -
>> -static void term(int);
>> -static int dotest(key_t, int);
>> -static void cleanup_msgqueue(int i, int tid);
>> -
>> -static char *opt_nprocs;
>> -static char *opt_nkids;
>> -static char *opt_nreps;
>> -
>> -static option_t options[] = {
>> -	{"n:", NULL, &opt_nprocs},
>> -	{"c:", NULL, &opt_nkids},
>> -	{"l:", NULL, &opt_nreps},
>> -	{NULL, NULL, NULL},
>> -};
>> -
>> -static void usage(void)
>> -{
>> -	printf("  -n      Number of processes\n");
>> -	printf("  -c      Number of read/write child pairs\n");
>> -	printf("  -l      Number of iterations\n");
>> -}
>> -
>> -int main(int argc, char **argv)
>> -{
>> -	int i, j, ok, pid;
>> -	int count, status;
>> -
>> -	tst_parse_opts(argc, argv, options, usage);
>> -
>> -	setup();
>> -
>> -	nreps = MAXNREPS;
>> -	nprocs = MSGMNI;
>> -	nkids = MAXNKIDS;
>> -
>> -	if (opt_nreps) {
>> -		nreps = atoi(opt_nreps);
>> -		if (nreps > MAXNREPS) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of iterations too large, "
>> -				 "setting to Max. of %d", MAXNREPS);
>> -			nreps = MAXNREPS;
>> -		}
>> -	}
>> -
>> -	if (opt_nprocs) {
>> -		nprocs = atoi(opt_nprocs);
>> -		if (nprocs > MSGMNI) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of processes too large, "
>> -				 "setting to Max. of %d", MSGMNI);
>> -			nprocs = MSGMNI;
>> -		}
>> -	}
>> -
>> -	if (opt_nkids) {
>> -		nkids = atoi(opt_nkids);
>> -		if (nkids > MAXNKIDS) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of read/write pairs too "
>> -				 "large, setting to Max. of %d", MAXNKIDS);
>> -			nkids = MAXNKIDS;
>> -		}
>> -	}
>> -
>> -	procstat = 0;
>> -	srand48((unsigned)getpid() + (unsigned)(getppid() << 16));
>> -	tid = -1;
>> -
>> -	/* Setup signal handleing routine */
>> -	if (sigset(SIGTERM, term) == SIG_ERR) {
>> -		tst_brkm(TFAIL, NULL, "Sigset SIGTERM failed");
>> -	}
>> -	/* Set up array of unique keys for use in allocating message
>> -	 * queues
>> -	 */
>> -	for (i = 0; i < nprocs; i++) {
>> -		ok = 1;
>> -		do {
>> -			/* Get random key */
>> -			keyarray[i] = (key_t) lrand48();
>> -			/* Make sure key is unique and not private */
>> -			if (keyarray[i] == IPC_PRIVATE) {
>> -				ok = 0;
>> -				continue;
>> -			}
>> -			for (j = 0; j < i; j++) {
>> -				if (keyarray[j] == keyarray[i]) {
>> -					ok = 0;
>> -					break;
>> -				}
>> -				ok = 1;
>> -			}
>> -		} while (ok == 0);
>> -	}
>> -	/* Fork a number of processes (nprocs), each of which will
>> -	 * create a message queue with several (nkids) reader/writer
>> -	 * pairs which will read and write a number (iterations)
>> -	 * of random length messages with specific values (keys).
>> -	 */
>> -
>> -	for (i = 0; i < nprocs; i++) {
>> -		fflush(stdout);
>> -		if ((pid = FORK_OR_VFORK()) < 0) {
>> -			tst_brkm(TFAIL,
>> -				 NULL,
>> -				 "\tFork failed (may be OK if under stress)");
>> -		}
>> -		/* Child does this */
>> -		if (pid == 0) {
>> -			procstat = 1;
>> -			exit(dotest(keyarray[i], i));
>> -		}
>> -		pidarray[i] = pid;
>> -	}
>> -
>> -	count = 0;
>> -	while (1) {
>> -		if ((wait(&status)) > 0) {
>> -			if (status >> 8 != PASS) {
>> -				tst_brkm(TFAIL, NULL,
>> -					 "Child exit status = %d",
>> -					 status >> 8);
>> -			}
>> -			count++;
>> -		} else {
>> -			if (errno != EINTR) {
>> -				break;
>> -			}
>> -#ifdef DEBUG
>> -			tst_resm(TINFO, "Signal detected during wait");
>> -#endif
>> -		}
>> -	}
>> -	/* Make sure proper number of children exited */
>> -	if (count != nprocs) {
>> -		tst_brkm(TFAIL,
>> -			 NULL,
>> -			 "Wrong number of children exited, Saw %d, Expected %d",
>> -			 count, nprocs);
>> -	}
>> -
>> -	tst_resm(TPASS, "Test ran successfully!");
>> -
>> -	cleanup();
>> -	tst_exit();
>> -}
>> -
>> -static void cleanup_msgqueue(int i, int tid)
>> -{
>> -	/*
>> -	 * Decrease the value of i by 1 because it
>> -	 * is getting incremented even if the fork
>> -	 * is failing.
>> -	 */
>> -
>> -	i--;
>> -	/*
>> -	 * Kill all children & free message queue.
>> -	 */
>> -	for (; i >= 0; i--) {
>> -		(void)kill(rkidarray[i], SIGKILL);
>> -		(void)kill(wkidarray[i], SIGKILL);
>> -	}
>> -
>> -	if (msgctl(tid, IPC_RMID, 0) < 0) {
>> -		tst_brkm(TFAIL | TERRNO, NULL, "Msgctl error in cleanup");
>> -	}
>> -}
>> -
>> -static int dotest(key_t key, int child_process)
>> -{
>> -	int id, pid;
>> -	int i, count, status, exit_status;
>> -
>> -	sighold(SIGTERM);
>> -	if ((id = msgget(key, IPC_CREAT | S_IRUSR | S_IWUSR)) < 0) {
>> -		printf("msgget() error in child %d: %s\n",
>> -			child_process, strerror(errno));
>> -		return FAIL;
>> -	}
>> -	tid = id;
>> -	sigrelse(SIGTERM);
>> -
>> -	exit_status = PASS;
>> -
>> -	for (i = 0; i < nkids; i++) {
>> -		fflush(stdout);
>> -		if ((pid = FORK_OR_VFORK()) < 0) {
>> -			printf("Fork failure in the first child of child group %d\n",
>> -				child_process);
>> -			cleanup_msgqueue(i, tid);
>> -			return FAIL;
>> -		}
>> -		/* First child does this */
>> -		if (pid == 0) {
>> -			procstat = 2;
>> -			exit(doreader(key, tid, getpid(),
>> -					child_process, nreps));
>> -		}
>> -		rkidarray[i] = pid;
>> -		fflush(stdout);
>> -		if ((pid = FORK_OR_VFORK()) < 0) {
>> -			printf("Fork failure in the second child of child group %d\n",
>> -				child_process);
>> -			/*
>> -			 * Kill the reader child process
>> -			 */
>> -			(void)kill(rkidarray[i], SIGKILL);
>> -
>> -			cleanup_msgqueue(i, tid);
>> -			return FAIL;
>> -		}
>> -		/* Second child does this */
>> -		if (pid == 0) {
>> -			procstat = 2;
>> -			exit(dowriter(key, tid, rkidarray[i],
>> -					child_process, nreps));
>> -		}
>> -		wkidarray[i] = pid;
>> -	}
>> -	/* Parent does this */
>> -	count = 0;
>> -	while (1) {
>> -		if ((wait(&status)) > 0) {
>> -			if (status >> 8 != PASS) {
>> -				printf("Child exit status = %d from child group %d\n",
>> -					status >> 8, child_process);
>> -				for (i = 0; i < nkids; i++) {
>> -					kill(rkidarray[i], SIGTERM);
>> -					kill(wkidarray[i], SIGTERM);
>> -				}
>> -				if (msgctl(tid, IPC_RMID, 0) < 0) {
>> -					printf("msgctl() error: %s\n",
>> -						strerror(errno));
>> -				}
>> -				return FAIL;
>> -			}
>> -			count++;
>> -		} else {
>> -			if (errno != EINTR) {
>> -				break;
>> -			}
>> -		}
>> -	}
>> -	/* Make sure proper number of children exited */
>> -	if (count != (nkids * 2)) {
>> -		printf("Wrong number of children exited in child group %d, saw %d, expected %d\n",
>> -			child_process, count, (nkids * 2));
>> -		if (msgctl(tid, IPC_RMID, 0) < 0) {
>> -			printf("msgctl() error: %s\n", strerror(errno));
>> -		}
>> -		return FAIL;
>> -	}
>> -	if (msgctl(id, IPC_RMID, 0) < 0) {
>> -		printf("msgctl() failure in child group %d: %s\n",
>> -			child_process, strerror(errno));
>> -		return FAIL;
>> -	}
>> -	return exit_status;
>> -}
>> -
>> -static void term(int sig LTP_ATTRIBUTE_UNUSED)
>> -{
>> -	int i;
>> -
>> -	if (procstat == 0) {
>> -#ifdef DEBUG
>> -		tst_resm(TINFO, "SIGTERM signal received, test killing kids");
>> -#endif
>> -		for (i = 0; i < nprocs; i++) {
>> -			if (pidarray[i] > 0) {
>> -				if (kill(pidarray[i], SIGTERM) < 0) {
>> -					printf("Kill failed to kill child %d",
>> -						i);
>> -					exit(FAIL);
>> -				}
>> -			}
>> -		}
>> -		return;
>> -	}
>> -
>> -	if (procstat == 2) {
>> -		fflush(stdout);
>> -		exit(PASS);
>> -	}
>> -
>> -	if (tid == -1) {
>> -		exit(FAIL);
>> -	}
>> -	for (i = 0; i < nkids; i++) {
>> -		if (rkidarray[i] > 0)
>> -			kill(rkidarray[i], SIGTERM);
>> -		if (wkidarray[i] > 0)
>> -			kill(wkidarray[i], SIGTERM);
>> -	}
>> -}
>> -
>> -void setup(void)
>> -{
>> -	int nr_msgqs;
>> -
>> -	tst_tmpdir();
>> -
>> -	tst_sig(FORK, DEF_HANDLER, cleanup);
>> -
>> -	TEST_PAUSE;
>> -
>> -	nr_msgqs = get_max_msgqueues();
>> -	if (nr_msgqs < 0)
>> -		cleanup();
>> -
>> -	nr_msgqs -= get_used_msgqueues();
>> -	if (nr_msgqs <= 0) {
>> -		tst_resm(TBROK,
>> -			 "Max number of message queues already used, cannot create more.");
>> -		cleanup();
>> -	}
>> -
>> -	/*
>> -	 * Since msgmni scales to the memory size, it may reach huge values
>> -	 * that are not necessary for this test.
>> -	 * That's why we define NR_MSGQUEUES as a high boundary for it.
>> -	 */
>> -	MSGMNI = MIN(nr_msgqs, NR_MSGQUEUES);
>> -}
>> -
>> -void cleanup(void)
>> -{
>> -	int status;
>> -
>> -#ifdef DEBUG
>> -	tst_resm(TINFO, "Removing the message queue");
>> -#endif
>> -	fflush(stdout);
>> -	(void)msgctl(tid, IPC_RMID, NULL);
>> -	if ((status = msgctl(tid, IPC_STAT, NULL)) != -1) {
>> -		(void)msgctl(tid, IPC_RMID, NULL);
>> -		tst_resm(TFAIL, "msgctl(tid, IPC_RMID) failed");
>> -
>> -	}
>> -
>> -	fflush(stdout);
>> -	tst_rmdir();
>> -}
>> diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
>> deleted file mode 100644
>> index aa37d9058..000000000
>> --- a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
>> +++ /dev/null
>> @@ -1,299 +0,0 @@
>> -/*
>> - * Copyright (c) International Business Machines  Corp., 2002
>> - *
>> - * This program is free software;  you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation; either version 2 of the License, or
>> - * (at your option) any later version.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - * the GNU General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program;  if not, write to the Free Software
>> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> - *
>> - * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
>> - * 11/06/2002   Port to LTP     dbarrera@us.ibm.com
>> - */
>> -
>> -/*
>> - * Get and manipulate a message queue.
>> - * Same as msgstress01 but gets the actual msgmni value under procfs.
>> - */
>> -
>> -#define _XOPEN_SOURCE 500
>> -#include <signal.h>
>> -#include <errno.h>
>> -#include <string.h>
>> -#include <fcntl.h>
>> -#include <stdlib.h>
>> -#include <stdio.h>
>> -#include <unistd.h>
>> -#include <values.h>
>> -#include <sys/types.h>
>> -#include <sys/wait.h>
>> -#include <sys/stat.h>
>> -#include <sys/ipc.h>
>> -#include <sys/msg.h>
>> -#include "test.h"
>> -#include "ipcmsg.h"
>> -#include "libmsgctl.h"
>> -
>> -char *TCID = "msgstress03";
>> -int TST_TOTAL = 1;
>> -
>> -#define MAXNPROCS	10000	/*These should be sufficient */
>> -#define MAXNREPS	10000	/*Else they srewup the system un-necessarily */
>> -
>> -static key_t keyarray[MAXNPROCS];
>> -static int pidarray[MAXNPROCS];
>> -static int tid;
>> -static int MSGMNI, nprocs, nreps;
>> -static int procstat;
>> -static int mykid;
>> -
>> -void setup(void);
>> -void cleanup(void);
>> -
>> -static int dotest(key_t key, int child_process);
>> -static void sig_handler(int signo);
>> -
>> -static char *opt_nprocs;
>> -static char *opt_nreps;
>> -
>> -static option_t options[] = {
>> -	{"n:", NULL, &opt_nprocs},
>> -	{"l:", NULL, &opt_nreps},
>> -	{NULL, NULL, NULL},
>> -};
>> -
>> -static void usage(void)
>> -{
>> -	printf("  -n      Number of processes\n");
>> -	printf("  -l      Number of iterations\n");
>> -}
>> -
>> -int main(int argc, char **argv)
>> -{
>> -	int i, j, ok, pid, free_pids;
>> -	int count, status;
>> -	struct sigaction act;
>> -
>> -	tst_parse_opts(argc, argv, options, usage);
>> -
>> -	setup();
>> -
>> -	nreps = MAXNREPS;
>> -	nprocs = MSGMNI;
>> -
>> -	if (opt_nreps) {
>> -		nreps = atoi(opt_nreps);
>> -		if (nreps > MAXNREPS) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of iterations too large, "
>> -				 "setting to Max. of %d", MAXNREPS);
>> -			nreps = MAXNREPS;
>> -		}
>> -	}
>> -
>> -	if (opt_nprocs) {
>> -		nprocs = atoi(opt_nprocs);
>> -		if (nprocs > MSGMNI) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of processes too large, "
>> -				 "setting to Max. of %d", MSGMNI);
>> -			nprocs = MSGMNI;
>> -		}
>> -	}
>> -
>> -	free_pids = tst_get_free_pids(cleanup);
>> -	/* Each forked child forks once, take it into account here. */
>> -	if (nprocs * 2 >= free_pids) {
>> -		tst_resm(TINFO,
>> -			 "Requested number of processes higher than limit (%d > %d), "
>> -			 "setting to %d", nprocs * 2, free_pids, free_pids);
>> -		nprocs = free_pids / 2;
>> -	}
>> -
>> -	srand(getpid());
>> -	tid = -1;
>> -
>> -	/* Setup signal handling routine */
>> -	memset(&act, 0, sizeof(act));
>> -	act.sa_handler = sig_handler;
>> -	sigemptyset(&act.sa_mask);
>> -	sigaddset(&act.sa_mask, SIGTERM);
>> -	if (sigaction(SIGTERM, &act, NULL) < 0) {
>> -		tst_brkm(TFAIL, NULL, "Sigset SIGTERM failed");
>> -	}
>> -	/* Set up array of unique keys for use in allocating message
>> -	 * queues
>> -	 */
>> -	for (i = 0; i < nprocs; i++) {
>> -		ok = 1;
>> -		do {
>> -			/* Get random key */
>> -			keyarray[i] = (key_t) rand();
>> -			/* Make sure key is unique and not private */
>> -			if (keyarray[i] == IPC_PRIVATE) {
>> -				ok = 0;
>> -				continue;
>> -			}
>> -			for (j = 0; j < i; j++) {
>> -				if (keyarray[j] == keyarray[i]) {
>> -					ok = 0;
>> -					break;
>> -				}
>> -				ok = 1;
>> -			}
>> -		} while (ok == 0);
>> -	}
>> -
>> -	/* Fork a number of processes, each of which will
>> -	 * create a message queue with one reader/writer
>> -	 * pair which will read and write a number (iterations)
>> -	 * of random length messages with specific values.
>> -	 */
>> -
>> -	for (i = 0; i < nprocs; i++) {
>> -		fflush(stdout);
>> -		if ((pid = FORK_OR_VFORK()) < 0) {
>> -			tst_brkm(TFAIL,
>> -				 NULL,
>> -				 "\tFork failed (may be OK if under stress)");
>> -		}
>> -		/* Child does this */
>> -		if (pid == 0) {
>> -			procstat = 1;
>> -			exit(dotest(keyarray[i], i));
>> -		}
>> -		pidarray[i] = pid;
>> -	}
>> -
>> -	count = 0;
>> -	while (1) {
>> -		if ((wait(&status)) > 0) {
>> -			if (status >> 8 != 0) {
>> -				tst_brkm(TFAIL, NULL,
>> -					 "Child exit status = %d",
>> -					 status >> 8);
>> -			}
>> -			count++;
>> -		} else {
>> -			if (errno != EINTR) {
>> -				break;
>> -			}
>> -#ifdef DEBUG
>> -			tst_resm(TINFO, "Signal detected during wait");
>> -#endif
>> -		}
>> -	}
>> -	/* Make sure proper number of children exited */
>> -	if (count != nprocs) {
>> -		tst_brkm(TFAIL,
>> -			 NULL,
>> -			 "Wrong number of children exited, Saw %d, Expected %d",
>> -			 count, nprocs);
>> -	}
>> -
>> -	tst_resm(TPASS, "Test ran successfully!");
>> -
>> -	cleanup();
>> -	tst_exit();
>> -}
>> -
>> -static int dotest(key_t key, int child_process)
>> -{
>> -	int id, pid;
>> -	int ret, status;
>> -
>> -	sighold(SIGTERM);
>> -	TEST(msgget(key, IPC_CREAT | S_IRUSR | S_IWUSR));
>> -	if (TEST_RETURN < 0) {
>> -		printf("msgget() error in child %d: %s\n",
>> -			child_process, strerror(TEST_ERRNO));
>> -		return FAIL;
>> -	}
>> -	tid = id = TEST_RETURN;
>> -	sigrelse(SIGTERM);
>> -
>> -	fflush(stdout);
>> -	if ((pid = FORK_OR_VFORK()) < 0) {
>> -		printf("Fork failed (may be OK if under stress)\n");
>> -		TEST(msgctl(tid, IPC_RMID, 0));
>> -		if (TEST_RETURN < 0) {
>> -			printf("msgctl() error in cleanup: %s\n",
>> -				strerror(TEST_ERRNO));
>> -		}
>> -		return FAIL;
>> -	}
>> -	if (pid == 0)
>> -		exit(doreader(key, id, 1, child_process, nreps));
>> -
>> -	mykid = pid;
>> -	procstat = 2;
>> -	ret = dowriter(key, id, 1, child_process, nreps);
>> -	wait(&status);
>> -
>> -	if (ret != PASS)
>> -		exit(FAIL);
>> -
>> -	if ((!WIFEXITED(status) || (WEXITSTATUS(status) != PASS)))
>> -		exit(FAIL);
>> -
>> -	TEST(msgctl(id, IPC_RMID, 0));
>> -	if (TEST_RETURN < 0) {
>> -		printf("msgctl() failed: %s\n",
>> -			strerror(TEST_ERRNO));
>> -		return FAIL;
>> -	}
>> -	return PASS;
>> -}
>> -
>> -static void sig_handler(int signo LTP_ATTRIBUTE_UNUSED)
>> -{
>> -}
>> -
>> -void setup(void)
>> -{
>> -	int nr_msgqs;
>> -
>> -	tst_tmpdir();
>> -
>> -	tst_sig(FORK, DEF_HANDLER, cleanup);
>> -
>> -	TEST_PAUSE;
>> -
>> -	nr_msgqs = get_max_msgqueues();
>> -	if (nr_msgqs < 0)
>> -		cleanup();
>> -
>> -	MSGMNI = nr_msgqs - get_used_msgqueues();
>> -	if (MSGMNI > MAXNPROCS)
>> -		MSGMNI = MAXNPROCS;
>> -	if (MSGMNI <= 0) {
>> -		tst_resm(TBROK,
>> -			 "Max number of message queues already used, cannot create more.");
>> -		cleanup();
>> -	}
>> -}
>> -
>> -void cleanup(void)
>> -{
>> -	int status;
>> -
>> -#ifdef DEBUG
>> -	tst_resm(TINFO, "Removing the message queue");
>> -#endif
>> -	(void)msgctl(tid, IPC_RMID, NULL);
>> -	if ((status = msgctl(tid, IPC_STAT, NULL)) != -1) {
>> -		(void)msgctl(tid, IPC_RMID, NULL);
>> -		tst_resm(TFAIL, "msgctl(tid, IPC_RMID) failed");
>> -
>> -	}
>> -
>> -	tst_rmdir();
>> -}
>> diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
>> deleted file mode 100644
>> index b9ebf9035..000000000
>> --- a/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
>> +++ /dev/null
>> @@ -1,444 +0,0 @@
>> -/*
>> - * Copyright (c) International Business Machines  Corp., 2002
>> - *
>> - * This program is free software;  you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation; either version 2 of the License, or
>> - * (at your option) any later version.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - * the GNU General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program;  if not, write to the Free Software
>> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> - *
>> - * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
>> - * 11/11/2002   Port to LTP     dbarrera@us.ibm.com
>> - */
>> -
>> -/*
>> - * Get and manipulate a message queue.
>> - * Same as msgstress02 but gets the actual msgmni value under procfs.
>> - */
>> -
>> -#define _XOPEN_SOURCE 500
>> -#include <sys/stat.h>
>> -#include <sys/types.h>
>> -#include <sys/ipc.h>
>> -#include <sys/msg.h>
>> -#include <sys/wait.h>
>> -#include <signal.h>
>> -#include <errno.h>
>> -#include <stdio.h>
>> -#include <string.h>
>> -#include <stdlib.h>
>> -#include <unistd.h>
>> -#include "test.h"
>> -#include "ipcmsg.h"
>> -#include "libmsgctl.h"
>> -
>> -char *TCID = "msgstress04";
>> -int TST_TOTAL = 1;
>> -
>> -#define MAXNREPS	1000
>> -#ifndef CONFIG_COLDFIRE
>> -#define MAXNPROCS	 1000000	/* This value is set to an arbitrary high limit. */
>> -#else
>> -#define MAXNPROCS	 100000	/* Coldfire can't deal with 1000000 */
>> -#endif
>> -#define MAXNKIDS	10
>> -#define DEFNKIDS	2
>> -
>> -static int maxnkids = MAXNKIDS;	/* Used if pid_max is exceeded */
>> -static key_t keyarray[MAXNPROCS];
>> -static int pidarray[MAXNPROCS];
>> -static int rkidarray[MAXNKIDS];
>> -static int wkidarray[MAXNKIDS];
>> -static int tid;
>> -static int nprocs, nreps, nkids, MSGMNI;
>> -static int maxnprocs;
>> -static int procstat;
>> -
>> -void setup(void);
>> -void cleanup(void);
>> -
>> -static void term(int);
>> -static int dotest(key_t, int);
>> -static void dotest_iteration(int off);
>> -static void cleanup_msgqueue(int i, int tid);
>> -
>> -static char *opt_maxnprocs;
>> -static char *opt_nkids;
>> -static char *opt_nreps;
>> -
>> -static option_t options[] = {
>> -	{"n:", NULL, &opt_maxnprocs},
>> -	{"c:", NULL, &opt_nkids},
>> -	{"l:", NULL, &opt_nreps},
>> -	{NULL, NULL, NULL},
>> -};
>> -
>> -static void usage(void)
>> -{
>> -	printf("  -n      Number of processes\n");
>> -	printf("  -c      Number of read/write child pairs\n");
>> -	printf("  -l      Number of iterations\n");
>> -}
>> -
>> -
>> -int main(int argc, char **argv)
>> -{
>> -	int i, j, ok;
>> -
>> -	tst_parse_opts(argc, argv, options, usage);
>> -
>> -	setup();
>> -
>> -	nreps = MAXNREPS;
>> -	nkids = MAXNKIDS;
>> -
>> -	if (opt_nreps) {
>> -		nreps = atoi(opt_nreps);
>> -		if (nreps > MAXNREPS) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of iterations too large, "
>> -				 "setting to Max. of %d", MAXNREPS);
>> -			nreps = MAXNREPS;
>> -		}
>> -	}
>> -
>> -	if (opt_nkids) {
>> -		nkids = atoi(opt_nkids);
>> -		if (nkids > MAXNKIDS) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of read/write pairs too "
>> -				 "large, setting to Max. of %d", MAXNKIDS);
>> -			nkids = MAXNKIDS;
>> -		}
>> -	}
>> -
>> -
>> -	if (opt_maxnprocs) {
>> -		if (atoi(opt_maxnprocs) > maxnprocs) {
>> -			tst_resm(TINFO,
>> -				 "Requested number of processes too large, "
>> -				 "setting to Max. of %d", MSGMNI);
>> -		} else {
>> -			maxnprocs = atoi(opt_maxnprocs);
>> -		}
>> -	}
>> -
>> -	procstat = 0;
>> -	srand48((unsigned)getpid() + (unsigned)(getppid() << 16));
>> -	tid = -1;
>> -
>> -	/* Setup signal handling routine */
>> -	if (sigset(SIGTERM, term) == SIG_ERR)
>> -		tst_brkm(TFAIL, cleanup, "Sigset SIGTERM failed");
>> -
>> -	/* Set up array of unique keys for use in allocating message
>> -	 * queues
>> -	 */
>> -	for (i = 0; i < MSGMNI; i++) {
>> -		ok = 1;
>> -		do {
>> -			/* Get random key */
>> -			keyarray[i] = (key_t) lrand48();
>> -			/* Make sure key is unique and not private */
>> -			if (keyarray[i] == IPC_PRIVATE) {
>> -				ok = 0;
>> -				continue;
>> -			}
>> -			for (j = 0; j < i; j++) {
>> -				if (keyarray[j] == keyarray[i]) {
>> -					ok = 0;
>> -					break;
>> -				}
>> -				ok = 1;
>> -			}
>> -		} while (ok == 0);
>> -	}
>> -	/* Fork a number of processes, each of which will
>> -	 * create a message queue with several (nkids) reader/writer
>> -	 * pairs which will read and write a number (iterations)
>> -	 * of random length messages with specific values (keys).
>> -	 *
>> -	 * We do not fork more than maxnprocs at a time and
>> -	 * we fork until all the message queues get used.
>> -	 */
>> -
>> -	if (MSGMNI <= maxnprocs) {
>> -		nprocs = MSGMNI;
>> -		dotest_iteration(0);
>> -	} else {
>> -		for (i = 0; i < (MSGMNI / maxnprocs); i++) {
>> -			nprocs = maxnprocs;
>> -			dotest_iteration(i * maxnprocs);
>> -		}
>> -
>> -		nprocs = MSGMNI % maxnprocs;
>> -		dotest_iteration(i * maxnprocs);
>> -	}
>> -
>> -	tst_resm(TPASS, "Test ran successfully!");
>> -
>> -	cleanup();
>> -	tst_exit();
>> -}
>> -
>> -static void dotest_iteration(int off)
>> -{
>> -	key_t key;
>> -	int i, count, status;
>> -	pid_t pid;
>> -
>> -	memset(pidarray, 0, sizeof(pidarray));
>> -
>> -	for (i = 0; i < nprocs; i++) {
>> -		key = keyarray[off + i];
>> -
>> -		if ((pid = FORK_OR_VFORK()) < 0)
>> -			tst_brkm(TFAIL, cleanup,
>> -				 "Fork failed (may be OK if under stress)");
>> -
>> -		/* Child does this */
>> -		if (pid == 0) {
>> -			procstat = 1;
>> -			exit(dotest(key, i));
>> -		}
>> -		pidarray[i] = pid;
>> -	}
>> -
>> -	count = 0;
>> -	while (1) {
>> -		if ((wait(&status)) > 0) {
>> -			if (status >> 8 != PASS)
>> -				tst_brkm(TFAIL, cleanup,
>> -					"Child exit status = %d", status >> 8);
>> -			count++;
>> -		} else {
>> -			if (errno != EINTR) {
>> -				break;
>> -			}
>> -#ifdef DEBUG
>> -			tst_resm(TINFO, "Signal detected during wait");
>> -#endif
>> -		}
>> -	}
>> -	/* Make sure proper number of children exited */
>> -	if (count != nprocs)
>> -		tst_brkm(TFAIL, cleanup,
>> -			 "Wrong number of children exited, Saw %d, Expected %d",
>> -			 count, nprocs);
>> -}
>> -
>> -static void cleanup_msgqueue(int i, int tid)
>> -{
>> -	/*
>> -	 * Decrease the value of i by 1 because it
>> -	 * is getting incremented even if the fork
>> -	 * is failing.
>> -	 */
>> -
>> -	i--;
>> -	/*
>> -	 * Kill all children & free message queue.
>> -	 */
>> -	for (; i >= 0; i--) {
>> -		(void)kill(rkidarray[i], SIGKILL);
>> -		(void)kill(wkidarray[i], SIGKILL);
>> -	}
>> -
>> -	if (msgctl(tid, IPC_RMID, 0) < 0) {
>> -		printf("Msgctl error in cleanup_msgqueue %d\n", errno);
>> -		exit(FAIL);
>> -	}
>> -}
>> -
>> -static int dotest(key_t key, int child_process)
>> -{
>> -	int id, pid;
>> -	int i, count, status, exit_status;
>> -
>> -	sighold(SIGTERM);
>> -	if ((id = msgget(key, IPC_CREAT | S_IRUSR | S_IWUSR)) < 0) {
>> -		printf("msgget() error in child %d: %s\n",
>> -			child_process, strerror(errno));
>> -		return FAIL;
>> -	}
>> -	tid = id;
>> -	sigrelse(SIGTERM);
>> -
>> -	exit_status = PASS;
>> -
>> -	for (i = 0; i < nkids; i++) {
>> -		if ((pid = FORK_OR_VFORK()) < 0) {
>> -			printf("Fork failure in the first child of child group %d\n",
>> -				child_process);
>> -			cleanup_msgqueue(i, tid);
>> -			return FAIL;
>> -		}
>> -		/* First child does this */
>> -		if (pid == 0) {
>> -			procstat = 2;
>> -			exit(doreader(key, tid, getpid(),
>> -					child_process, nreps));
>> -		}
>> -		rkidarray[i] = pid;
>> -		if ((pid = FORK_OR_VFORK()) < 0) {
>> -			printf("Fork failure in the second child of child group %d\n",
>> -				child_process);
>> -			/*
>> -			 * Kill the reader child process
>> -			 */
>> -			(void)kill(rkidarray[i], SIGKILL);
>> -
>> -			cleanup_msgqueue(i, tid);
>> -			return FAIL;
>> -		}
>> -		/* Second child does this */
>> -		if (pid == 0) {
>> -			procstat = 2;
>> -			exit(dowriter(key, tid, rkidarray[i],
>> -					child_process, nreps));
>> -		}
>> -		wkidarray[i] = pid;
>> -	}
>> -	/* Parent does this */
>> -	count = 0;
>> -	while (1) {
>> -		if ((wait(&status)) > 0) {
>> -			if (status >> 8 != PASS) {
>> -				printf("Child exit status = %d from child group %d\n",
>> -					status >> 8, child_process);
>> -				for (i = 0; i < nkids; i++) {
>> -					kill(rkidarray[i], SIGTERM);
>> -					kill(wkidarray[i], SIGTERM);
>> -				}
>> -				if (msgctl(tid, IPC_RMID, 0) < 0) {
>> -					printf("msgctl() error: %s\n",
>> -						strerror(errno));
>> -				}
>> -				return FAIL;
>> -			}
>> -			count++;
>> -		} else {
>> -			if (errno != EINTR) {
>> -				break;
>> -			}
>> -		}
>> -	}
>> -	/* Make sure proper number of children exited */
>> -	if (count != (nkids * 2)) {
>> -		printf("Wrong number of children exited in child group %d, saw %d, expected %d\n",
>> -			child_process, count, (nkids * 2));
>> -		if (msgctl(tid, IPC_RMID, 0) < 0) {
>> -			printf("msgctl() error: %s\n", strerror(errno));
>> -		}
>> -		return FAIL;
>> -	}
>> -	if (msgctl(id, IPC_RMID, 0) < 0) {
>> -		printf("msgctl() failure in child group %d: %s\n",
>> -			child_process, strerror(errno));
>> -		return FAIL;
>> -	}
>> -	return exit_status;
>> -}
>> -
>> -/* ARGSUSED */
>> -static void term(int sig LTP_ATTRIBUTE_UNUSED)
>> -{
>> -	int i;
>> -
>> -	if (procstat == 0) {
>> -#ifdef DEBUG
>> -		tst_resm(TINFO, "SIGTERM signal received, test killing kids");
>> -#endif
>> -		for (i = 0; i < nprocs; i++) {
>> -			if (pidarray[i] > 0) {
>> -				if (kill(pidarray[i], SIGTERM) < 0) {
>> -					tst_resm(TBROK,
>> -						 "Kill failed to kill child %d",
>> -						 i);
>> -					exit(FAIL);
>> -				}
>> -			}
>> -		}
>> -		return;
>> -	}
>> -
>> -	if (procstat == 2) {
>> -		exit(PASS);
>> -	}
>> -
>> -	if (tid == -1) {
>> -		exit(FAIL);
>> -	}
>> -	for (i = 0; i < nkids; i++) {
>> -		if (rkidarray[i] > 0)
>> -			kill(rkidarray[i], SIGTERM);
>> -		if (wkidarray[i] > 0)
>> -			kill(wkidarray[i], SIGTERM);
>> -	}
>> -}
>> -
>> -void setup(void)
>> -{
>> -	int nr_msgqs, free_pids;
>> -
>> -	tst_tmpdir();
>> -	/* You will want to enable some signal handling so you can capture
>> -	 * unexpected signals like SIGSEGV.
>> -	 */
>> -	tst_sig(FORK, DEF_HANDLER, cleanup);
>> -
>> -	/* One cavet that hasn't been fixed yet.  TEST_PAUSE contains the code to
>> -	 * fork the test with the -c option.  You want to make sure you do this
>> -	 * before you create your temporary directory.
>> -	 */
>> -	TEST_PAUSE;
>> -
>> -	nr_msgqs = get_max_msgqueues();
>> -	if (nr_msgqs < 0)
>> -		tst_brkm(TBROK, cleanup, "get_max_msgqueues() failed");
>> -
>> -	MSGMNI = nr_msgqs - get_used_msgqueues();
>> -	if (MSGMNI <= 0)
>> -		tst_brkm(TBROK, cleanup,
>> -			 "Max number of message queues already used, cannot create more.");
>> -
>> -	tst_resm(TINFO, "Found %d available message queues", MSGMNI);
>> -
>> -	free_pids = tst_get_free_pids(cleanup);
>> -	/* We don't use more than a half of available pids.
>> -	 * For each child we fork up to 2*maxnkids grandchildren. */
>> -	maxnprocs = (free_pids / 2) / (1 + 2 * maxnkids);
>> -
>> -	if (!maxnprocs)
>> -		tst_brkm(TBROK, cleanup, "Not enough free pids");
>> -
>> -	tst_resm(TINFO, "Using upto %d pids", free_pids / 2);
>> -}
>> -
>> -void cleanup(void)
>> -{
>> -	int status;
>> -
>> -	/*
>> -	 * Remove the message queue from the system
>> -	 */
>> -#ifdef DEBUG
>> -	tst_resm(TINFO, "Removing the message queue");
>> -#endif
>> -	(void)msgctl(tid, IPC_RMID, NULL);
>> -	if ((status = msgctl(tid, IPC_STAT, NULL)) != -1) {
>> -		(void)msgctl(tid, IPC_RMID, NULL);
>> -		tst_resm(TFAIL, "msgctl(tid, IPC_RMID) failed");
>> -
>> -	}
>> -
>> -	tst_rmdir();
>> -}
>> -- 
>> 2.35.3
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp

Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
