Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7A3B62B4
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 16:47:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E5633C6E40
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 16:47:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1D183C03AB
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 16:47:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7B8C01000402
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 16:47:37 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91E9921BD2;
 Mon, 28 Jun 2021 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624891656;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i46dtNzNWFUJjSlTfo0e0UpAvcGvKfEZ7MGZJDiH+yM=;
 b=Z/85zMMoiPBuFTLYCXqCaUIxx1xQSTsE0wAcRqquqO7ROKa2/NEnHxtbk9HKKRMD9Rrrel
 kRobSr62fvP/POvSHecTaNhUFXKtmRk/7oBsAJFpJOnxp+ri67ioaTPKVfIkfE4+FdmCYZ
 I2UyjnK4d9APwAoiIRK8CZSbfcA0MGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624891656;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i46dtNzNWFUJjSlTfo0e0UpAvcGvKfEZ7MGZJDiH+yM=;
 b=3wtT87RZPfjnpvjHAgxYJGEANZwJPzDXxFVffaafnzPOIVH5jFWi0OvVHf6Mj+2MfD4cgG
 MFCnhueyH9ZAd1Cw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6669A11906;
 Mon, 28 Jun 2021 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624891656;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i46dtNzNWFUJjSlTfo0e0UpAvcGvKfEZ7MGZJDiH+yM=;
 b=Z/85zMMoiPBuFTLYCXqCaUIxx1xQSTsE0wAcRqquqO7ROKa2/NEnHxtbk9HKKRMD9Rrrel
 kRobSr62fvP/POvSHecTaNhUFXKtmRk/7oBsAJFpJOnxp+ri67ioaTPKVfIkfE4+FdmCYZ
 I2UyjnK4d9APwAoiIRK8CZSbfcA0MGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624891656;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i46dtNzNWFUJjSlTfo0e0UpAvcGvKfEZ7MGZJDiH+yM=;
 b=3wtT87RZPfjnpvjHAgxYJGEANZwJPzDXxFVffaafnzPOIVH5jFWi0OvVHf6Mj+2MfD4cgG
 MFCnhueyH9ZAd1Cw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id R2S3Fwjh2WBTFwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jun 2021 14:47:36 +0000
Date: Mon, 28 Jun 2021 16:47:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNnhBhN6bzUCfqdk@pevik>
References: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
 <20210623135912.81156-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623135912.81156-3-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/4] syscalls/msgstress04: fix fork failure on
 small memory systems
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Krzysztof,

nit: Instead of git commit subject "syscalls/msgstress04: fix fork failure
on small memory systems". I'd use "tst_pid.c: fix fork ...".

> Running syscalls/msgstress04 on a system with less than ~4 GB of RAM fails:

>     Fork failure in the first child of child group 4396
>     Fork failure in the second child of child group 4413
>     msgstress04    1  TFAIL  :  msgstress04.c:222: Child exit status = 1

> The reason is cgroups pid limit set by systemd user.slice.  The limit is
> set for login session, also for root user.  For example on 2 GB RAM
> machine it is set as:
>     /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207

> Read the maximum number of pids and adjust the test limit.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  include/tst_pid.h |  4 ++-
>  lib/tst_pid.c     | 79 ++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 81 insertions(+), 2 deletions(-)

> diff --git a/include/tst_pid.h b/include/tst_pid.h
> index 6c42f73a57e7..8d999a655f1a 100644
> --- a/include/tst_pid.h
> +++ b/include/tst_pid.h
> @@ -14,7 +14,9 @@ pid_t tst_get_unused_pid_(void (*cleanup_fn)(void));

>  /*
>   * Returns number of free pids by subtraction of the number of pids
> - * currently used ('ps -eT') from max_pids
> + * currently used ('ps -eT') from maximum number of processes.
> + * The limit of processes come from kernel pid_max and cgroup session limits
> + * (e.g. configured by systemd user.slice).
>   */
>  int tst_get_free_pids_(void (*cleanup_fn)(void));

> diff --git a/lib/tst_pid.c b/lib/tst_pid.c
> index 9568cc9e91d2..c1ea3fe90e83 100644
> --- a/lib/tst_pid.c
> +++ b/lib/tst_pid.c
> @@ -18,14 +18,20 @@
>   *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>   */

> +#include <errno.h>
>  #include <fcntl.h>
>  #include <limits.h>
> +#include <stdio.h>
> +#include <stdlib.h>
>  #include <sys/types.h>
> +#include <unistd.h>
>  #include "test.h"
>  #include "tst_pid.h"
>  #include "old_safe_file_ops.h"

>  #define PID_MAX_PATH "/proc/sys/kernel/pid_max"
> +#define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
> +#define CGROUPS_V2_SLICE_FMT "/sys/fs/cgroup/user.slice/user-%d.slice/pids.max"

>  pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
>  {
> @@ -36,10 +42,77 @@ pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
>  	return pid;
>  }

> +/*
> + * Get the effective session UID - either one invoking current test via sudo
> + * or the real UID.
> + */
> +static int get_session_uid(void)
> +{
> +	const char *sudo_uid;
> +
> +	sudo_uid = getenv("SUDO_UID");
> +	if (sudo_uid) {
> +		int real_uid;
> +
> +		TEST(sscanf(sudo_uid, "%u", &real_uid));
FYI We recently decided to not use TEST() macro in library itself.
See Richard's effort [1]. We should document it in LTP Library API Writing Guidelines [2]

> +		if (TEST_RETURN != 1) {
> +#ifdef DEBUG
FYI we don't support DEBUG. Either the information is always important or not.
In this case I'd probably avoid printing it.

> +			tst_resm(TINFO, "No SUDO_UID from env");
> +#endif
> +		} else {
> +			return real_uid;
> +		}
> +	}
> +
> +	return getuid();
> +}
> +
> +static int read_session_pids_limit(const char *path_fmt, int uid,
> +				   void (*cleanup_fn) (void))
> +{
> +	int max_pids, ret;
> +	char path[PATH_MAX];
> +
> +	ret = snprintf(path, sizeof(path), path_fmt, uid);
> +	if (ret < 0 || (size_t)ret >= sizeof(path))
> +		return -1;
> +
> +	if (access(path, R_OK) != 0) {
> +		tst_resm(TINFO, "Cannot read session user limits from '%s'", path);
> +		return -1;
> +	}
> +
> +	SAFE_FILE_SCANF(cleanup_fn, path, "%d", &max_pids);
> +	tst_resm(TINFO, "Found limit of processes %d (from %s)", max_pids, path);
> +
> +	return max_pids;
> +}
> +
> +static int get_session_pids_limit(void (*cleanup_fn) (void))
> +{
> +	int max_pids, uid;
> +
> +	uid = get_session_uid();
> +	if (TEST_RETURN != 1) {
and here as well 
> +		tst_resm(TINFO, "Cannot get UID");
> +		return -1;
> +	}

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210621113804.26179-2-rpalethorpe@suse.com/
[2] https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
