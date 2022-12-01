Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C0D63F1DF
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Dec 2022 14:41:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 584943CC492
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Dec 2022 14:41:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D4CC33CC470
 for <ltp@lists.linux.it>; Thu,  1 Dec 2022 14:41:15 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 489251BE9BA8
 for <ltp@lists.linux.it>; Thu,  1 Dec 2022 14:41:14 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 23E311FD8F;
 Thu,  1 Dec 2022 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1669902074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zp82etR4AoB9/n40LxH/kR5etus3dHh06Ta8bdRLjdw=;
 b=ZCeHpIVKS+t8X7owTlnaBK2VGL5tlKf2A/XQy9jnjjnvpHNJXjm8pNk7OjVTWtV3PY651L
 u057nN6LnuTitZm7s+jzi49xoCXeIqgj/Gxp73bCMYSgF4JX5YcgpiLXSgm4lROZ3WB7Ol
 dj3alFzaD9bMbpB9wXIp6QrSTK7xv20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1669902074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zp82etR4AoB9/n40LxH/kR5etus3dHh06Ta8bdRLjdw=;
 b=1E76tZ3R/x5lKseMYYtnHpaHZJkBVSTM5H9edLbKVby5RTqge4Y0sN7AsRdN3JxXEhSLL1
 CxiJdhCuRu3AggBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 12BC11320E;
 Thu,  1 Dec 2022 13:41:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id OYr0A/quiGNOGQAAGKfGzw
 (envelope-from <chrubis@suse.cz>); Thu, 01 Dec 2022 13:41:14 +0000
Date: Thu, 1 Dec 2022 14:42:33 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <Y4ivSaZhuMSevMR2@yuki>
References: <20221201025141.71227-1-zhaogongyi@huawei.com>
 <20221201025141.71227-2-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201025141.71227-2-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib/safe_macros: Add SAFE_STRTOF
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
> +float safe_strtof(const char *file, const int lineno,
> +		  void (cleanup_fn) (void), char *str,
> +		  float min, float max)
> +{
> +	float rval;
> +	char *endptr;
> +
> +	errno = 0;
> +	rval = strtof(str, &endptr);
> +
> +	if ((errno == ERANGE) || (rval == 0)
> +	    || (rval == HUGE_VAL) || (rval == -HUGE_VAL)) {

This does not look right, supposedly the ERANGE is only set on overflow,
and the rval is not guaranteed to be exact on underflow. Also rval == 0
is a valid result.

We do zero errno above so I would just do:

	if (errno) {
		tst_brkm_(...);
		return rval;
	}

> +		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
> +			"strtof(%s) failed", str);
> +		return rval;
> +	}
> +
> +	if (rval > max || rval < min) {
> +		tst_brkm_(file, lineno, TBROK, cleanup_fn,
> +			"strtof(%s): %f is out of range %f - %f",
> +			str, rval, min, max);
> +		return 0;
> +	}
> +
> +	if (endptr == str || (*endptr != '\0' && *endptr != '\n')) {
> +		tst_brkm_(file, lineno, TBROK, cleanup_fn,
> +			"Invalid value: '%s'", str);
> +		return 0;
> +	}
> +
> +	return rval;
> +}

Otherwise it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
