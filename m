Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D71393D235F
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 14:33:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C78D3C69B5
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 14:33:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B06C3C60F5
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 14:33:47 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 32A851000F57
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 14:33:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 935C72263F;
 Thu, 22 Jul 2021 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626957226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cZulhvyNf9q2qbtQlXAifWb3cyYF7ZcbI1r/fasW1Ss=;
 b=U+b0txdoX4tBGqvxenOStJ/8N2NO8ymvdhJ6/GhiHR8Vm0mswu/8ZaVv22Pu0xY7m2LvP2
 QqUkYFgXu+CQ3WSoEJW2EMZJF6y2c8O2z7pUj3Y/DJ/jkGbam1eO4AWTUS3TAJp8RovtFD
 E/qxhoMo/7sZF/+5pPijFZwkIesZqFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626957226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cZulhvyNf9q2qbtQlXAifWb3cyYF7ZcbI1r/fasW1Ss=;
 b=UPZMB/97zWyOOVNQrxjwdNYFdaEQS3+wdS8kr32IJ0YA8xCMwLa9p1ikGfLZ0pHo0HoBt+
 AyhsPPhH3KOqv5Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DEA513DA5;
 Thu, 22 Jul 2021 12:33:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V8q4Hapl+WDlNQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 22 Jul 2021 12:33:46 +0000
Date: Thu, 22 Jul 2021 14:08:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YPlftOtF7QxjjDnX@yuki>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1620809541-6891-4-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620809541-6891-4-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 4/4] syscalls/shmget06: Add test when the id of
 shm_next_id has existed
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
> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget06.c b/testcases/kernel/syscalls/ipc/shmget/shmget06.c
> new file mode 100644
> index 000000000..3138d4482
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget06.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * It is a basic test about shm_next_id.
                          ^
			  for
> + *
> + * When the shared memory segment identifier that shm_next_id stored has
> + * existed, call shmget with different key just use another unused value in range
      ^                                      ^
      'does exist' instead of 'has existed'  |
      or even better 'is allready in use'    |
                                            will
> + * [0,INT_MAX]. kernel doesn't guarantee the desired id.
                   ^
		   Capital letter at the start of the sentence.
> + */
> +
> +#include <errno.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <sys/ipc.h>
> +#include <sys/shm.h>
> +#include "tst_test.h"
> +#include "tst_safe_sysv_ipc.h"
> +#include "libnewipc.h"
> +
> +#define NEXT_ID_PATH "/proc/sys/kernel/shm_next_id"
> +
> +static int shm_id[2], pid;
> +static key_t shmkey[2];
> +
> +static void verify_shmget(void)
> +{
> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", shm_id[0]);
> +
> +	shm_id[1] = SAFE_SHMGET(shmkey[1], SHM_SIZE, IPC_CREAT | SHM_RW);
> +	if (shm_id[1] == shm_id[0])
> +		tst_res(TFAIL, "shm id %d has existed, shmget() returns the"
> +			" same shm id unexpectedly", shm_id[0]);
> +	else
> +		tst_res(TPASS, "shm id %d has existed, shmget() returns the"
> +			" new shm id %d", shm_id[0], shm_id[1]);
> +
> +	SAFE_SHMCTL(shm_id[1], IPC_RMID, NULL);
> +}
> +
> +static void setup(void)
> +{
> +	shmkey[0] = GETIPCKEY();
> +	shmkey[1] = GETIPCKEY();
> +	pid = getpid();
> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);

So we are using this to "randomize" the id here right?

> +	shm_id[0] = SAFE_SHMGET(shmkey[0], SHM_SIZE, IPC_CREAT | SHM_RW);
> +	tst_res(TINFO, "Test shm_next_id effects on shmget(different key) "
> +		"when this identifier of shared memory segment has existed");

I do not think that printing test description is useful, especially
since we have nicely formatted test description in the test source which
gets exported into the metadata.

> +}
> +
> +static void cleanup(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < 2; i++) {
> +		if (shm_id[i] != -1)
> +			SAFE_SHMCTL(shm_id[i], IPC_RMID, NULL);
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_shmget,
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_CHECKPOINT_RESTORE=y",
> +		NULL
> +	},
> +	.needs_root = 1,
> +};

With the minor adjustements in description:

Reivewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
