Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FE76A5ABD
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Feb 2023 15:20:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AD833CBA1F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Feb 2023 15:20:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 394983CAFCE
 for <ltp@lists.linux.it>; Tue, 28 Feb 2023 15:20:31 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0F2BE600202
 for <ltp@lists.linux.it>; Tue, 28 Feb 2023 15:20:29 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 12310219BA;
 Tue, 28 Feb 2023 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677594029;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xNH77FTIXzWWW1h8lF48jlpKEpzzNzwboUiSeSbp1xY=;
 b=qnd0YAXMhxejAnoZRBngRDz1/JkfE2HuVlahP/fW0+MDQcSXI/xjw76sXzxoMylvnSCCEE
 H6Yw9vg3mOjZb0sJUOqvjzYPxFtyGd3wB7I0yqrYQ/YDg1amDEhyg/CPrgeTPTCJ8lxE/w
 ++DVsKpuKHgIeX1+HVOy5d2Y3pG+mO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677594029;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xNH77FTIXzWWW1h8lF48jlpKEpzzNzwboUiSeSbp1xY=;
 b=EY9ad7ULKb2O6CfJi5w92hRAk2cbi8bJ1CuxAkRj0icyNFV3KkYAlCM7Im4FiI5ZmTN2HN
 XeqRn7geHcfF6VDw==
Received: from g78 (rpalethorpe.udp.ovpn1.nue.suse.de [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C6A7A2C141;
 Tue, 28 Feb 2023 14:20:28 +0000 (UTC)
References: <20230215145440.78482-1-teo.coupriediaz@arm.com>
 <20230215145440.78482-3-teo.coupriediaz@arm.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Teo Couprie Diaz <teo.coupriediaz@arm.com>
Date: Tue, 28 Feb 2023 14:07:52 +0000
Organization: Linux Private Site
In-reply-to: <20230215145440.78482-3-teo.coupriediaz@arm.com>
Message-ID: <87fsapub13.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] lib/tst_pid: Go to parent cgroups for max
 value
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
Cc: Beata Michalska <beata.michalska@arm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Teo Couprie Diaz <teo.coupriediaz@arm.com> writes:

> A cgroup resource limitation can be either a number or "max".

IIRC this is not true on V1, at least not historically. On some tests we
have to simulate "max" when V1 is detected.

Perhaps for pids.max specifically it is the case though?

> It means that the cgroup will not be limited _more_ than it already is.
> This can mean that it will use the kernel limit for the resource, if it
> exists, or the limit of a parent cgroup.
>
> This patch reworks "read_session_pids_limit" to go up the cgroup hierarchy
> if it encounters a "max" value rather than a numerical one, using the
> kernel limit in the event where it doesn't find any.
>
> Clean up uid related code as it is not used anymore.
>
> Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> Co-developed-by: Beata Michalska <beata.michalska@arm.com>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  lib/tst_pid.c | 96 +++++++++++++++++++++++++++++----------------------
>  1 file changed, 54 insertions(+), 42 deletions(-)
>
> diff --git a/lib/tst_pid.c b/lib/tst_pid.c
> index 3d0be6dcd..ad1893290 100644
> --- a/lib/tst_pid.c
> +++ b/lib/tst_pid.c
> @@ -44,50 +44,69 @@ pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
>  	return pid;
>  }
>  
> -/*
> - * Get the effective session UID - either one invoking current test via sudo
> - * or the real UID.
> - */
> -static unsigned int get_session_uid(void)
> +static int __read_pids_limit(const char *path, void (*cleanup_fn) (void))
>  {
> -	const char *sudo_uid;
> +	char max_pids_value[100];
> +	int max_pids;
>  
> -	sudo_uid = getenv("SUDO_UID");
> -	if (sudo_uid) {
> -		unsigned int real_uid;
> -		int ret;
> +	if (access(path, R_OK) != 0) {
> +		tst_resm(TINFO, "Cannot read session user limits from '%s'", path);
> +		return -1;
> +	}
>  
> -		ret = sscanf(sudo_uid, "%u", &real_uid);
> -		if (ret == 1)
> -			return real_uid;
> +	SAFE_FILE_SCANF(cleanup_fn, path, "%s", max_pids_value);
> +	if (strcmp(max_pids_value, "max")) {
> +		max_pids =  SAFE_STRTOL(max_pids_value, 0, INT_MAX);
> +		tst_resm(TINFO, "Found limit of processes %d (from %s)",
> +				max_pids, path);
> +	} else {
> +		max_pids = -1;
>  	}
>  
> -	return getuid();
> +	return max_pids;
>  }
>  
> -static int read_session_pids_limit(const char *path_fmt, int uid,
> -				   void (*cleanup_fn) (void))
> +/*
> + * Take the path to the cgroup mount and to the current cgroup pid controller
> + * and try to find the PID limit imposed by cgroup.
> + * Go up the cgroup hierarchy if needed, otherwise use the kernel PID limit.
> + */
> +static int read_session_pids_limit(const char *cgroup_mount,
> +				   const char *cgroup_path, void (*cleanup_fn) (void))
>  {
> -	int max_pids, ret;
> -	char max_pid_value[100];
> -	char path[PATH_MAX];
> -
> -	ret = snprintf(path, sizeof(path), path_fmt, uid);
> +	int ret, cgroup_depth = 0, max_pids = -1;
> +	char path[PATH_MAX + 1], file_path[PATH_MAX + 1];
> +	const char *sub_path = cgroup_path;
> +
> +	/* Find the number of groups we can go up. */
> +	do {
> +		cgroup_depth += 1;
> +		sub_path++;
> +		sub_path = strchr(sub_path, '/');
> +	} while (sub_path);
> +
> +	ret = snprintf(path, sizeof(path), "%s%s", cgroup_mount, cgroup_path);
>  	if (ret < 0 || (size_t)ret >= sizeof(path))
>  		return -1;
>  
> -	if (access(path, R_OK) != 0) {
> -		tst_resm(TINFO, "Cannot read session user limits from '%s'", path);
> -		return -1;
> +	for (int i = 0 ; i < cgroup_depth ; i++) {
> +		/* Create a path to read from. */
> +		ret = snprintf(file_path, sizeof(file_path), "%s/pids.max", path);
> +		if (ret < 0 || (size_t)ret >= sizeof(file_path))
> +			return -1;
> +
> +		max_pids = __read_pids_limit(file_path, cleanup_fn);
> +		if (max_pids >= 0)
> +			return max_pids;
> +
> +		strncat(path, "/..", PATH_MAX);
>  	}
>  
> -	SAFE_FILE_SCANF(cleanup_fn, path, "%s", max_pid_value);
> -	if (!strcmp(max_pid_value, "max")) {
> +	if (max_pids < 0) {
> +		/* Read kernel imposed limits */
>  		SAFE_FILE_SCANF(cleanup_fn, PID_MAX_PATH, "%d", &max_pids);
> -		tst_resm(TINFO, "Found limit of processes %d (from %s=max)", max_pids, path);
> -	} else {
> -		max_pids = SAFE_STRTOL(max_pid_value, 0, INT_MAX);
> -		tst_resm(TINFO, "Found limit of processes %d (from %s)", max_pids, path);
> +		tst_resm(TINFO, "Using kernel processes limit of %d",
> +			 max_pids);
>  	}
>  
>  	return max_pids;
> @@ -98,9 +117,8 @@ static int get_session_pids_limit(void (*cleanup_fn) (void))
>  	char path[PATH_MAX + 1];
>  	char cgroup_pids[PATH_MAX + 1];
>  	char catchall;
> -	int uid, ret = 0;
> +	int ret = 0;
>  
> -	uid = get_session_uid();
>  	/* Check for generic cgroup v1 pid.max */
>  	ret = FILE_LINES_SCANF(cleanup_fn, "/proc/self/cgroup",
>  						   "%*d:pids:%s\n", cgroup_pids);
> @@ -121,11 +139,8 @@ static int get_session_pids_limit(void (*cleanup_fn) (void))
>  							   "%*s %*s %*s %*s %s %*[^-] - cgroup %*s %*[rw],pid%c",
>  							   path, &catchall);
>  
> -	if (!ret) {
> -		strncat(path, cgroup_pids, PATH_MAX);
> -		strncat(path, "/pids.max", PATH_MAX);
> -		return read_session_pids_limit(path, uid, cleanup_fn);
> -	}
> +	if (!ret)
> +		return read_session_pids_limit(path, cgroup_pids, cleanup_fn);
>  
>  	/* Check for generic cgroup v2 pid.max */
>  	ret = FILE_LINES_SCANF(cleanup_fn, "/proc/self/cgroup",
> @@ -135,11 +150,8 @@ static int get_session_pids_limit(void (*cleanup_fn) (void))
>  							   "%*s %*s %*s %*s %s %*[^-] - cgroup2 %c",
>  							   path, &catchall);
>  
> -	if (!ret) {
> -		strncat(path, cgroup_pids, PATH_MAX);
> -		strncat(path, "/pids.max", PATH_MAX);
> -		return read_session_pids_limit(path, uid, cleanup_fn);
> -	}
> +	if (!ret)
> +		return read_session_pids_limit(path, cgroup_pids, cleanup_fn);
>  
>  	return -1;
>  }
> -- 
> 2.25.1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
