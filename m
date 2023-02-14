Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 445EC69618A
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 11:56:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1414E3CBF5D
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 11:56:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D00213CB4DB
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 11:56:56 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0903F1400BC8
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 11:56:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B01FF1F8B6;
 Tue, 14 Feb 2023 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1676372214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m//7iatUDvhVRLkq/MlO4o5VlY9OE+rJlJiboUc5z4c=;
 b=wZFmnlntD2qYRDNh+ccw5SuhVt2o0atPb4Arb7s+Sxt+yI1PFS6zP+YPmERk24WE3hX0rJ
 fIRQjMFR+y6501iTcogGnK1foOSe1przA0FC2GQH8+n36ljVabkJGrqEayjMi4fc7p7XB9
 jaBS2b3MeMDG++yj433LdAXciNHsJcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1676372214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m//7iatUDvhVRLkq/MlO4o5VlY9OE+rJlJiboUc5z4c=;
 b=OrJ5hkaeapan/d7i4CXj3n4M45icIy/48vhAIvVdycmIVDtvtEWAAo+RHWO7WON48OCMer
 iC3JOAsPLpCerxCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FEEF138E3;
 Tue, 14 Feb 2023 10:56:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YpEAJ/Zo62PzbQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 14 Feb 2023 10:56:54 +0000
Date: Tue, 14 Feb 2023 11:58:21 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Message-ID: <Y+tpTaLp7cYjGDnO@yuki>
References: <20230213134104.229241-1-ycliang@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230213134104.229241-1-ycliang@andestech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib/tst_pid.c: Count used pid by traversing
 /proc
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
> Use "ps -eT | wc -l" to calculate the number of used pid
> could have an incorrectly larger result because "ps -eT"
> may list the same pid multiple times (with different SPID).
> 
> Instead, we could count used pid by traversing /proc
> directory and count the subdirectories that have name
> composed of digits.
> 
> Increase PIDS_RESERVED to avoid fork failure.

The changes looks good, but can we please split the patch into two?

We should keep the change to the PIDS_RESERVED separate from the code
changes.

> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
>  lib/tst_pid.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/tst_pid.c b/lib/tst_pid.c
> index 5595e79bd..7582e4828 100644
> --- a/lib/tst_pid.c
> +++ b/lib/tst_pid.c
> @@ -18,6 +18,7 @@
>   *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>   */
>  
> +#include <ctype.h>
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <limits.h>
> @@ -35,7 +36,7 @@
>  #define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
>  #define CGROUPS_V2_SLICE_FMT "/sys/fs/cgroup/user.slice/user-%d.slice/pids.max"
>  /* Leave some available processes for the OS */
> -#define PIDS_RESERVE 50
> +#define PIDS_RESERVE 200
>  
>  pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
>  {
> @@ -113,21 +114,16 @@ static int get_session_pids_limit(void (*cleanup_fn) (void))
>  
>  int tst_get_free_pids_(void (*cleanup_fn) (void))
>  {
> -	FILE *f;
> -	int rc, used_pids, max_pids, max_session_pids, max_threads;
> -
> -	f = popen("ps -eT | wc -l", "r");
> -	if (!f) {
> -		tst_brkm(TBROK, cleanup_fn, "Could not run 'ps' to calculate used pids");
> -		return -1;
> -	}
> -	rc = fscanf(f, "%i", &used_pids);
> -	pclose(f);
> -
> -	if (rc != 1 || used_pids < 0) {
> -		tst_brkm(TBROK, cleanup_fn, "Could not read output of 'ps' to calculate used pids");
> -		return -1;
> +	DIR *f;
> +	struct dirent *ent;
> +	int max_pids, max_session_pids, max_threads, used_pids = 0;
> +
> +	f = SAFE_OPENDIR("/proc");
> +	while ((ent = SAFE_READDIR(f))) {
> +		if (isdigit(ent->d_name[0]))
> +			++used_pids;
>  	}
> +	SAFE_CLOSEDIR(f);
>  
>  	SAFE_FILE_SCANF(cleanup_fn, PID_MAX_PATH, "%d", &max_pids);
>  	SAFE_FILE_SCANF(cleanup_fn, THREADS_MAX_PATH, "%d", &max_threads);
> -- 
> 2.34.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
