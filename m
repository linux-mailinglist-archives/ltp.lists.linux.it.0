Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0951D401B15
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 14:21:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A28453C8A2F
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 14:21:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A1E303C25B5
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 14:21:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 41281600D10
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 14:21:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A910D22112;
 Mon,  6 Sep 2021 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630930901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VNRm92gQBVxMi2YSnxzQJHlXqs8RZah2kqQQJxiGnJ8=;
 b=xxOoErepzC5TdmUPibkCJTF2gCSPSs6Cosl6IrAmJmhEmXo6PaLU+AlXctbAz4jw4cmHRZ
 Q5iOdKdDeS26RMhx/b462VfIjWDH8Gy86d5k4rHE9wVV5MDPqgqLN3uInZZRYyEIKPRagU
 vvvCVN+Mh39E9oTbxIYWc5/MsF1LgUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630930901;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VNRm92gQBVxMi2YSnxzQJHlXqs8RZah2kqQQJxiGnJ8=;
 b=ZD6KIhoQ70Ps9GnlaFkNy2ZJkR15iSwFbSDUkmuB+8OmaVmc2yOKLHzRuibSEMY6jOKs09
 QjEHf1vCsjmIbmAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8294E13C1B;
 Mon,  6 Sep 2021 12:21:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1a+0HtUHNmEFOQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 06 Sep 2021 12:21:41 +0000
Date: Mon, 6 Sep 2021 14:21:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YTYH4DdeUqsYeglK@yuki>
References: <20210903154848.18705-1-mdoucha@suse.cz>
 <20210903154848.18705-4-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210903154848.18705-4-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] Add user/group ID lookup helper functions
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
> diff --git a/lib/tst_uid.c b/lib/tst_uid.c
> index dd719d312..915a5bc34 100644
> --- a/lib/tst_uid.c
> +++ b/lib/tst_uid.c
> @@ -3,8 +3,10 @@
>   * Copyright (c) 2021 Linux Test Project
>   */
>  
> +#define _XOPEN_SOURCE 500
>  #include <sys/types.h>
>  #include <grp.h>
> +#include <pwd.h>
>  #include <errno.h>
>  
>  #define TST_NO_DEFAULT_MAIN
> @@ -36,3 +38,101 @@ gid_t tst_get_free_gid_(const char *file, const int lineno, gid_t skip)
>  	tst_brk_(file, lineno, TBROK, "No free group ID found");
>  	return (gid_t)-1;
>  }
> +
> +struct passwd *safe_getpwent(const char *file, const int lineno)
> +{
> +	struct passwd *ret;
> +
> +	errno = 0;
> +	ret = getpwent();
> +
> +	if (!ret) {
> +		if (errno) {
> +			tst_brk_(file, lineno, TBROK | TERRNO,
> +				"getpwent() failed");
> +		} else {
> +			tst_brk_(file, lineno, TBROK,
> +				"getpwent() failed: end of file");
> +		}

I'm not sure if "no more users in the /etc/passwd" should be reported as
an error.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
