Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D0F4AD5E6
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Feb 2022 12:07:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E60E3C9B42
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Feb 2022 12:07:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C88C03C927F
 for <ltp@lists.linux.it>; Tue,  8 Feb 2022 12:07:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EAFD514002AB
 for <ltp@lists.linux.it>; Tue,  8 Feb 2022 12:07:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E5D01F387;
 Tue,  8 Feb 2022 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644318461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5s4mtikWr6RCX7zdjTH6wuGh0xCvbO4WN9BqqCEpXPQ=;
 b=ow30F0DSTZmuUWEyLdZ4RvttHLiNFfbmdtpCHilrocC7sjLkY+R0bQOfhuWFWrN97T92Cp
 CatA2nnro1Aaek5VRmiyKsklaBvzwoolLrez9kqL3+6auT1MIP5Xakci1o4mRUMhFY9OVf
 fiBEHq1sh9pI7O4MLBo/zvXE1UwedMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644318461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5s4mtikWr6RCX7zdjTH6wuGh0xCvbO4WN9BqqCEpXPQ=;
 b=ge729/iuHCmvy1ZIwVR/rm/qxnyZEGVZwas1bXT7C770XoCatrXn5y4RpU//YBICYG4r+I
 Q8jt/jsqCXpmgZDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0910F13C7E;
 Tue,  8 Feb 2022 11:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /Q5XAP1OAmJMEQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 08 Feb 2022 11:07:41 +0000
Date: Tue, 8 Feb 2022 12:09:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <YgJPeBY+B1H9aq80@yuki>
References: <20220207144148.27033-1-andrea.cervesato@suse.de>
 <20220207144148.27033-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207144148.27033-2-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] Add TST_THREAD_STATE_WAIT macro
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
> The TST_THREAD_STATE_WAIT macro can be used to wait and check for
> pthread state changes.
> 
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
> ---
>  include/tst_test.h         |  1 +
>  include/tst_thread_state.h | 33 +++++++++++++++++++++++++++++++++
>  lib/tst_thread_state.c     | 37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+)
>  create mode 100644 include/tst_thread_state.h
>  create mode 100644 lib/tst_thread_state.c
> 
> diff --git a/include/tst_test.h b/include/tst_test.h
> index 450ddf086..79067f3bf 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -27,6 +27,7 @@
>  #include "tst_cmd.h"
>  #include "tst_cpu.h"
>  #include "tst_process_state.h"
> +#include "tst_thread_state.h"
>  #include "tst_atomic.h"
>  #include "tst_kvercmp.h"
>  #include "tst_kernel.h"
> diff --git a/include/tst_thread_state.h b/include/tst_thread_state.h
> new file mode 100644
> index 000000000..4d6a345b8
> --- /dev/null
> +++ b/include/tst_thread_state.h
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +/*
> + * These functions helps you wait till a thread with given tpid changes state.
> + */
> +
> +#ifndef TST_THREAD_STATE__
> +#define TST_THREAD_STATE__
> +
> +#include <unistd.h>
> +
> +/*
> + * Waits for thread state change.
> + *
> + * The state is one of the following:
> + *
> + * R - running
> + * S - sleeping
> + * D - disk sleep
> + * T - stopped
> + * t - tracing stopped
> + * Z - zombie
> + * X - dead
> + */
> +#define TST_THREAD_STATE_WAIT(tid, state, msec_timeout) \
> +	tst_thread_state_wait((tid), (state), (msec_timeout))
> +
> +int tst_thread_state_wait(pid_t tid, const char state, unsigned int msec_timeout);
> +
> +#endif /* TST_THREAD_STATE__ */
> diff --git a/lib/tst_thread_state.c b/lib/tst_thread_state.c
> new file mode 100644
> index 000000000..f5580c39e
> --- /dev/null
> +++ b/lib/tst_thread_state.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#include "tst_safe_file_ops.h"
> +#include "tst_thread_state.h"
> +
> +int tst_thread_state_wait(pid_t tid, const char state, unsigned int msec_timeout)
> +{
> +	char proc_path[128], cur_state;
> +	unsigned int msecs = 0;
> +
> +	snprintf(proc_path, sizeof(proc_path), "/proc/self/task/%i/stat", tid);
> +
> +	for (;;) {
> +		SAFE_FILE_SCANF(proc_path, "%*i %*s %c", &cur_state);
> +
> +		if (state == cur_state)
> +			break;
> +
> +		usleep(1000);
> +		msecs += 1;
> +
> +		if (msec_timeout && msecs >= msec_timeout) {
> +			errno = ETIMEDOUT;
> +			return -1;
> +		}
> +	}
> +
> +	return 0;
> +}

Maybe we can just put this code into the existing tst_process_state.h
header and C source.

And we should add some documentaion about the function into the
doc/c-test-api.txt as well.

Other than that it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
