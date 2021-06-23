Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B93B1861
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:02:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7E253C6FDB
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 13:02:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 141EE3C2244
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:02:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9226810005B9
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 13:02:07 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC6A01FD36;
 Wed, 23 Jun 2021 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624446126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X2JGQ7b5xe1W0/ZZ4NE4xRzmJ2rk82AMks8rBI4br5Y=;
 b=v+6rsAMAH54OTElwlr+M5uaM5hzHaA8ldoZW8H+S3knM0DM00Pt0+eSlrd2HnY0dwc0mfC
 r0bnFD+VldjoXPSL956IqbWY+XnvK1IAyZaNbZMOHSdoFEpGcwdSOGEDjbq8jZgIMM77lt
 RCoX6KaymkmAP9L/DcX9gsAHL6Nwqz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624446126;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X2JGQ7b5xe1W0/ZZ4NE4xRzmJ2rk82AMks8rBI4br5Y=;
 b=RmSQpxhIfy2NrF8IAFNRu/xz5Bfd2z/g46vMmtMxE3x+vtyPwcMmQGZTWf/YO9A8Rn0hsb
 UkvujjK4vp4e5sBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id AB5E311A97;
 Wed, 23 Jun 2021 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624446126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X2JGQ7b5xe1W0/ZZ4NE4xRzmJ2rk82AMks8rBI4br5Y=;
 b=v+6rsAMAH54OTElwlr+M5uaM5hzHaA8ldoZW8H+S3knM0DM00Pt0+eSlrd2HnY0dwc0mfC
 r0bnFD+VldjoXPSL956IqbWY+XnvK1IAyZaNbZMOHSdoFEpGcwdSOGEDjbq8jZgIMM77lt
 RCoX6KaymkmAP9L/DcX9gsAHL6Nwqz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624446126;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X2JGQ7b5xe1W0/ZZ4NE4xRzmJ2rk82AMks8rBI4br5Y=;
 b=RmSQpxhIfy2NrF8IAFNRu/xz5Bfd2z/g46vMmtMxE3x+vtyPwcMmQGZTWf/YO9A8Rn0hsb
 UkvujjK4vp4e5sBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id da+VKK4U02AgbQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 23 Jun 2021 11:02:06 +0000
Date: Wed, 23 Jun 2021 12:36:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNMOr/9X8J3NaAMZ@yuki>
References: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/msgstress03: fix fork failure on
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +/*
> + * Get the effective session UID - either one invoking current test via sudo
> + * or the real UID.
> + */
> +int get_session_uid(void)
> +{
> +	const char *sudo_uid;
> +
> +	sudo_uid = getenv("SUDO_UID");
> +	if (sudo_uid) {
> +		int real_uid;
> +
> +		TEST(sscanf(sudo_uid, "%u", &real_uid));
> +		if (TEST_RETURN != 1) {
> +#ifdef DEBUG
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
>  /*
>   * rm_shm() - removes a shared memory segment.
>   */
> @@ -218,3 +243,36 @@ int get_max_msgqueues(void)
>  	fclose(f);
>  	return atoi(buff);
>  }
> +
> +/*
> + * Get the limit of processes for current session configured by systemd user.slice.
> + * This also applies to root user.
> + */
> +int get_pids_limit(void)
> +{
> +	int real_uid, ret;
> +	char path[PATH_MAX];
> +	long unsigned int max_pids;
> +
> +	real_uid = get_session_uid();
> +	if (TEST_RETURN != 1) {
> +		tst_resm(TINFO, "Cannot get UID");
> +		return -1;
> +	}
> +
> +	ret = snprintf(path, sizeof(path),
> +		       "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max",
> +		       real_uid);
> +	if (ret < 0 || (size_t)ret >= sizeof(path))
> +		return -1;
> +
> +	if (access(path, R_OK) != 0) {
> +		tst_resm(TINFO, "Cannot read session user limits from '%s'", path);
> +		return -1;
> +	}
> +
> +	SAFE_FILE_SCANF(cleanup, path, "%lu", &max_pids);
> +	tst_resm(TINFO, "Found limit of processes %lu (from %s)", max_pids, path);
> +
> +	return max_pids;
> +}

This is quite generic functionality so we may as well put it into the
include/tst_pid.h and lib/tst_pid.c as tst_get_pids_limit().

And we do already have tst_get_free_pids_() in there so we can substract
that as well if applicable to make it a bit more precise.

Also I think that it may make sense to put the part that substract some
constant to leave room for the rest of the system to the library as
well. There is no point in having this heuristic in each test.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
