Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140087A760
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Mar 2024 13:04:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3F993CFD18
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Mar 2024 13:04:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 38EEB3C02E6
 for <ltp@lists.linux.it>; Wed, 13 Mar 2024 13:04:37 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 07DAF14088D9
 for <ltp@lists.linux.it>; Wed, 13 Mar 2024 13:04:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5214B21C30;
 Wed, 13 Mar 2024 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1710331474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I3qylr81JMXN7Xr7Y1daBeKqZD15GEgBsclEOn1RPO4=;
 b=DElgWXNbu6r7lnH21Vb8XziHVG96Cq4PlQQ6OGgATyI6kAFdDYiCpdfeakFz/deuZsezdU
 IWzinB1uOqkS06k2gTyZY6Ze6BFvEdKySnxvzZzJ4dHZDUQg5RPiNvq1B65jo7A0J1eUX2
 184I568l9EQcAFF1GXqH3ZJVmLXiIco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1710331474;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I3qylr81JMXN7Xr7Y1daBeKqZD15GEgBsclEOn1RPO4=;
 b=IzMhnEplpXuMZvQ4kKZ4fmdqH3Vjcs4zhVSE9KgHJ0Or/iwlC3u9nbX7oEcyZj4NIQquy2
 j59R8lHkzXcgHSDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1710331474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I3qylr81JMXN7Xr7Y1daBeKqZD15GEgBsclEOn1RPO4=;
 b=DElgWXNbu6r7lnH21Vb8XziHVG96Cq4PlQQ6OGgATyI6kAFdDYiCpdfeakFz/deuZsezdU
 IWzinB1uOqkS06k2gTyZY6Ze6BFvEdKySnxvzZzJ4dHZDUQg5RPiNvq1B65jo7A0J1eUX2
 184I568l9EQcAFF1GXqH3ZJVmLXiIco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1710331474;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I3qylr81JMXN7Xr7Y1daBeKqZD15GEgBsclEOn1RPO4=;
 b=IzMhnEplpXuMZvQ4kKZ4fmdqH3Vjcs4zhVSE9KgHJ0Or/iwlC3u9nbX7oEcyZj4NIQquy2
 j59R8lHkzXcgHSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3687C1397F;
 Wed, 13 Mar 2024 12:04:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iAxSDFKW8WUFLAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 13 Mar 2024 12:04:34 +0000
Date: Wed, 13 Mar 2024 13:03:32 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZfGWFAYkcnxpNdww@yuki>
References: <20240312154847.16379-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312154847.16379-1-andrea.cervesato@suse.de>
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-6.60 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 URIBL_BLOCKED(0.00)[lkml.org:url,linux.it:url,suse.cz:email,suse.com:email];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,linux.it:url,suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -6.60
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,TRACKER_ID,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] Refactor fork14 using new LTP API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
> SAFE_MMAP() usage
> Check if memvec is NULL before munmap() and free()
> 
>  testcases/kernel/syscalls/fork/fork14.c | 197 ++++++++++--------------
>  1 file changed, 81 insertions(+), 116 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fork/fork14.c b/testcases/kernel/syscalls/fork/fork14.c
> index 93af2ebac..a1cf13c3e 100644
> --- a/testcases/kernel/syscalls/fork/fork14.c
> +++ b/testcases/kernel/syscalls/fork/fork14.c
> @@ -1,143 +1,108 @@
> -/*********************************************************************
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
>   * Copyright (C) 2014  Red Hat, Inc.
> + * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +/*\
> + * [Description]
>   *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of version 2 of the GNU General Public
> - * License as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it would be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> - *
> - * Further, this software is distributed without any warranty that it
> - * is free of the rightful claim of any third person regarding
> - * infringement or the like.  Any license provided herein, whether
> - * implied or otherwise, applies only to this software file.  Patent
> - * licenses, if any, provided herein do not apply to combinations of
> - * this program with other software, or any other product whatsoever.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write the Free Software
> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> - * 02110-1301, USA.
> - *
> - * This test is a reporducer for this patch:
> - *              https://lkml.org/lkml/2012/4/24/328
> + * This test is a reporducer for this patch: https://lkml.org/lkml/2012/4/24/328
>   * Since vma length in dup_mmap is calculated and stored in a unsigned
>   * int, it will overflow when length of mmaped memory > 16 TB. When
> - * overflow occur, fork will  incorrectly succeed. The patch above
> - * fixed it.
> - ********************************************************************/
> + * overflow occur, fork will incorrectly succeed. The patch above fixed it.
> + */
>  
> -#include <sys/mman.h>
> -#include <sys/wait.h>
> -#include <stdio.h>
> -#include <unistd.h>
> -#include "test.h"
> -#include "safe_macros.h"
> -#include "lapi/abisize.h"
> +#include "tst_test.h"
>  
> -char *TCID = "fork14";
> -int TST_TOTAL = 1;
> +#ifndef TST_ABI32
>  
> -#define GB		(1024 * 1024 * 1024L)
> +#include <stdlib.h>
> +#include <sys/wait.h>
>  
> -/* set mmap threshold to 16TB */
>  #define LARGE		(16 * 1024)
>  #define EXTENT		(16 * 1024 + 10)
>  
> -static char **pointer_vec;
> -
> -static void setup(void);
> -static void cleanup(void);
> -static int  fork_test(void);
> +static char **memvec;
>  
> -int main(int ac, char **av)
> +static void run(void)
>  {
> -	int lc, reproduced;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -/*
> - * Tested on ppc64/x86_64/i386/s390x. And only 64bit has this issue.
> - * Since a 32bit program can't mmap so many memory.
> - */
> -#ifdef TST_ABI32
> -	tst_brkm(TCONF, NULL, "This test is only for 64bit.");
> -#endif
> -	setup();
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> +	int i, j, ret;
> +	pid_t pid;
> +	void *mem;
> +	int prev_failed = 0;
> +	int passed = 1;
>  
> -		reproduced = fork_test();
> -		if (reproduced == 0)
> -			tst_resm(TPASS, "fork failed as expected.");
> -	}
> -	cleanup();
> -	tst_exit();
> -}
> +	for (i = 0; i < EXTENT; i++) {
> +		mem = SAFE_MMAP(NULL, 1 * TST_GB,
> +			PROT_READ | PROT_WRITE,
> +			MAP_PRIVATE | MAP_ANONYMOUS,
> +			0, 0);

I do not think that it's good to change the mmap() with explicit
handling to SAFE_MMAP() here. We allocate absurdly large amount of
memory and the previous code just produced TCONF if we failed too many
times.

> -static void setup(void)
> -{
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -	TEST_PAUSE;
> +		memvec[i] = mem;
>  
> -	pointer_vec = SAFE_MALLOC(cleanup, EXTENT * sizeof(char *));
> -}
> +		pid = fork();
>  
> -static void cleanup(void)
> -{
> -	free(pointer_vec);
> -}
> -
> -static int fork_test(void)
> -{
> -	int i, j, prev_failed = 0, fails = 0, cnt = 0;
> -	int reproduced = 0;
> -	void *addr;
> -
> -	for (i = 0; i < EXTENT; i++) {
> -		addr = mmap(NULL, 1 * GB, PROT_READ | PROT_WRITE,
> -			    MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
> -		if (addr == MAP_FAILED) {
> -			pointer_vec[i] = NULL;
> -			fails++;
> -			/*
> -			 * EXTENT is "16*1024+10", if fails count exceeds 10,
> -			 * we are almost impossible to get an vm_area_struct
> -			 * sized 16TB
> +		if (pid == -1) {
> +			/* keep track of the failed fork() and verify that next one
> +			 * is failing as well.
>  			 */
> -			if (fails == 11) {
> -				tst_brkm(TCONF, cleanup, "mmap() fails too many"
> -					 "times, so we are almost impossible to"
> -					 " get an vm_area_struct sized 16TB.");
> -			}
> -		} else {
> -			pointer_vec[i] = addr;
> +			prev_failed = 1;
> +			continue;
>  		}
> -		cnt++;
>  
> -		switch (tst_fork()) {
> -		case -1:
> -			prev_failed = 1;
> -		break;
> -		case 0:
> +		if (!pid)
>  			exit(0);
> -		default:
> -			SAFE_WAITPID(cleanup, -1, NULL, 0);
> -
> -			if (prev_failed > 0 && i >= LARGE) {
> -				tst_resm(TFAIL, "Fork succeeds incorrectly");
> -				reproduced = 1;
> -				goto clear_memory_map;
> -			}
> +
> +		ret = waitpid(pid, NULL, 0);
> +		if (ret == -1 && errno != ECHILD)
> +			tst_brk(TBROK | TERRNO, "waitpid() error");
> +
> +		if (prev_failed && i >= LARGE) {
> +			passed = 0;
> +			break;
>  		}
> +
> +		prev_failed = 0;
> +
> +		tst_res(TINFO, "fork() passed at %d attempt", i);
>  	}
>  
> -clear_memory_map:
> -	for (j = 0; j < cnt; j++) {
> -		if (pointer_vec[j])
> -			SAFE_MUNMAP(cleanup, pointer_vec[j], 1 * GB);
> +	for (j = 0; j < i; j++) {
> +		if (memvec[j])
> +			SAFE_MUNMAP(memvec[j], 1 * TST_GB);
>  	}
>  
> -	return reproduced;
> +	if (passed)
> +		tst_res(TPASS, "fork() failed as expected");
> +	else
> +		tst_res(TFAIL, "fork() succeeded incorrectly");
>  }
> +
> +static void setup(void)
> +{
> +	memvec = SAFE_MALLOC(EXTENT * sizeof(char *));
> +	memset(memvec, 0, EXTENT);
> +}
> +
> +static void cleanup(void)
> +{
> +	for (long i = 0; i < EXTENT; i++) {
> +		if (memvec && memvec[i])
> +			SAFE_MUNMAP(memvec[i], 1 * TST_GB);
> +	}
> +
> +	if (memvec)
> +		free(memvec);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.forks_child = 1,

This is apparently a regression test for:

7edc8b0ac16cbaed7cb4ea4c6b95ce98d2997e84

let's add it to the metadata here.

> +};
> +
> +#else /* TST_ABI32 */
> +	TST_TEST_TCONF("Test doesn't supports 32bits architecture");
> +#endif
> -- 
> 2.35.3
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
