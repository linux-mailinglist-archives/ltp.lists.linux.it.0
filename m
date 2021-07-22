Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25C3D2339
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 14:17:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D73F3C96E9
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 14:17:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 670B33C59C4
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 14:17:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A85C5600F4A
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 14:17:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E4D9D1FF06;
 Thu, 22 Jul 2021 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626956272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5whID3oBCCjh818T/o+AGtHhXl1dvGEKTFk2GAXcKA=;
 b=AkpY/7TZz7akIAZrQ/gDQemzOrWL2FY+/FczpA5+Ojdz+Z1JxP8XWHZbxHFwl1/Ivf6GYf
 Ly4DegfCA/rzDPw+2AZiIdkpSwaJnC05F5eR14iVs4GYDmakcRH2zxzAIfNlCE9bNFVTZr
 hZMMeNmy7NOb+HOm/9aUtRnEZ0D+wck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626956272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5whID3oBCCjh818T/o+AGtHhXl1dvGEKTFk2GAXcKA=;
 b=usKp7b+7GbT2CVfL7MtR4DMzJyIF5O9B3hvF3mWvgz8FCRZvDGCJaLC5VvfrmGDk+TkQbC
 Y7WGMj/M4fBshTBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDFAD13DA5;
 Thu, 22 Jul 2021 12:17:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YP1SMPBh+WAfMQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 22 Jul 2021 12:17:52 +0000
Date: Thu, 22 Jul 2021 13:52:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YPlb+ogqehyG210l@yuki>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1620809541-6891-3-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620809541-6891-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/4] syscalls/shmget05: Add test for
 /proc/sys/kernel/shm_next_id
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
First of all, sorry for the late response.

> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget05.c b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
> new file mode 100644
> index 000000000..601609648
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
> @@ -0,0 +1,69 @@
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
> + * shm_next_id specifies desired id for next allocated IPC shared memory. By
> + * default they are equal to -1, which means generic allocation logic.
              ^
	      it's instead of 'they are'
> + * Possible values to set are in range {0..INT_MAX}.
> + * Toggle with non-default value will be set back to -1 by kernel after

This would probably be better with just: "The value will be set back ..."

> + * successful IPC object allocation.
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
> +static int shm_id, pid;
> +static key_t shmkey;
> +
> +static void verify_shmget(void)
> +{
> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
> +
> +	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, SHM_RW | IPC_CREAT);
> +	if (shm_id == pid)
> +		tst_res(TPASS, "shm_next_id succeeded, shm id %d", pid);
> +	else
> +		tst_res(TFAIL, "shm_next_id failed, expected id %d, but got %d", pid, shm_id);
> +
> +	TST_ASSERT_INT(NEXT_ID_PATH, -1);
> +	SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
> +	pid++;
> +}
> +
> +static void setup(void)
> +{
> +	shmkey = GETIPCKEY();
> +	pid = getpid();
> +}
> +
> +static void cleanup(void)
> +{
> +	if (shm_id != -1)
> +		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
> +}
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,

I guess that we want this for the GETIPCKEY() right?

> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_shmget,
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_CHECKPOINT_RESTORE=y",
> +		NULL
> +	},
> +	.needs_root = 1,
> +};

Looks good.

With the minor adjustements in the test description:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
