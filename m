Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE319FD263
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Dec 2024 10:05:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83EE13E6E8E
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Dec 2024 10:05:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A08203E11DE
 for <ltp@lists.linux.it>; Fri, 27 Dec 2024 10:04:54 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AD680143481B
 for <ltp@lists.linux.it>; Fri, 27 Dec 2024 10:04:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 71DD91FD53;
 Fri, 27 Dec 2024 09:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735290292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OEnaCeLCpIluAZh0dhh/U5jN/MUiVRkspBcSi30hYnY=;
 b=jycgPiam8fYlc0xP6l7okgpcQxVmZqzO5yiLqY5eg4cIJJPE6cDaVqobwJ1TRS2nga/od6
 gSzJJyxL5pjJjMQvQJ9a2EIvPJGGLrQBYJKrZPufAM0PkV7CPsbpvnQfkpnAe8R044Owps
 x6PWNB9mh1N45oMeNbrq5AKPGvvZ4HQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735290292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OEnaCeLCpIluAZh0dhh/U5jN/MUiVRkspBcSi30hYnY=;
 b=dpM9pdLvPHXLdP0ySx1Xrx5Ms1aIbSyZJQZ2czpnCBVg77p/uCI4loUtGZLFFAPVO7drWL
 xil3cVlLcvj5uHDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=jycgPiam;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=dpM9pdLv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735290292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OEnaCeLCpIluAZh0dhh/U5jN/MUiVRkspBcSi30hYnY=;
 b=jycgPiam8fYlc0xP6l7okgpcQxVmZqzO5yiLqY5eg4cIJJPE6cDaVqobwJ1TRS2nga/od6
 gSzJJyxL5pjJjMQvQJ9a2EIvPJGGLrQBYJKrZPufAM0PkV7CPsbpvnQfkpnAe8R044Owps
 x6PWNB9mh1N45oMeNbrq5AKPGvvZ4HQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735290292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OEnaCeLCpIluAZh0dhh/U5jN/MUiVRkspBcSi30hYnY=;
 b=dpM9pdLvPHXLdP0ySx1Xrx5Ms1aIbSyZJQZ2czpnCBVg77p/uCI4loUtGZLFFAPVO7drWL
 xil3cVlLcvj5uHDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C9AB13A30;
 Fri, 27 Dec 2024 09:04:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QvZOA7RtbmcXQQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 27 Dec 2024 09:04:52 +0000
Date: Fri, 27 Dec 2024 10:04:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20241227090442.GA308652@pevik>
References: <20241218184518.16190-1-chrubis@suse.cz>
 <20241218184518.16190-2-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218184518.16190-2-chrubis@suse.cz>
X-Rspamd-Queue-Id: 71DD91FD53
X-Spam-Level: 
X-Spamd-Result: default: False [-2.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 URI_HIDDEN_PATH(1.00)[https://git.busybox.net/buildroot/tree/.editorconfig];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 MISSING_XM_UA(0.00)[]; TO_DN_SOME(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; REPLYTO_EQ_FROM(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.71
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 01/13] lib: tst_sys_conf: Add two functions
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

Hi Cyril,

> Add two functions to read/write integer values from/to sysfs or procfs
> files.

> With that we replace the get_sys_tune() and set_sys_tune() from
> testcases/kernel/mem/lib/mem.c with a better implementation.

> We also remove the inclusion of the mem library from tunables, since
> it's no longer needed there.

+1

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Minor formatting notes below.

> +/**
> + * TST_SYS_CONF_LONG_SET()

I wonder how to silence warning when there is no short description.

include/tst_sys_conf.h:32: [kernel-doc WARN] : missing initial short description of 'TST_SYS_CONF_LONG_SET'

> + *
> + * Sets a sysfs or procfs file and optionally checks that it was set correctly.
> + *
> + * @param path A path to a sysfs or a procfs file.
> + * @param val A long int value to be written to the file.
> + * @param check If non-zero the library reads the file back and checks that the

nit: please fix these before merge (doxygen => sphinx syntax):

include/tst_sys_conf.h:32: [kernel-doc WARN] : no description found for parameter 'path'
include/tst_sys_conf.h:32: [kernel-doc WARN] : no description found for parameter 'val'
include/tst_sys_conf.h:32: [kernel-doc WARN] : no description found for parameter 'check'

> + *              value is the one we have written there. If not the library calls
> + *              tst_brk(TBROK, ...).
> + */


> +#define TST_SYS_CONF_LONG_SET(path, val, check) \
> +	tst_sys_conf_long_set_(__FILE__, __LINE__, path, val, check)
> +
> +void tst_sys_conf_long_set_(const char *file, const int lineno,
> +                            const char *path, long val, int check);
> +
> +
> +/**
> + * TST_SYS_CONF_LONG_GET()
> + *
> + * Gets a sysfs or procfs file value and converts it to long.
> + *
> + * @param path A path to a sysfs or a procfs file.
And here:

include/tst_sys_conf.h:50: [kernel-doc WARN] : no description found for parameter 'path'

> + */
> +#define TST_SYS_CONF_LONG_GET(path) \
> +	tst_sys_conf_long_get_(__FILE__, __LINE__, path)
> +
> +long tst_sys_conf_long_get_(const char *file, const int lineno,
> +                            const char *path);
> +
>  #endif
> diff --git a/lib/tst_sys_conf.c b/lib/tst_sys_conf.c
> index c0981dcb1..f962fc124 100644
> --- a/lib/tst_sys_conf.c
> +++ b/lib/tst_sys_conf.c
> @@ -145,3 +145,32 @@ void tst_sys_conf_restore(int verbose)
>  	}
>  }

> +long tst_sys_conf_long_get_(const char *file, const int lineno,
> +                            const char *path)
nit: could you please use tabs instead of spaces?
Because it triggers warnings:

$ make check-tst_sys_conf
CHECK lib/tst_sys_conf.c
tst_sys_conf.c:149: ERROR: code indent should use tabs where possible
tst_sys_conf.c:149: WARNING: please, no spaces at the start of a line
tst_sys_conf.c:159: ERROR: code indent should use tabs where possible
tst_sys_conf.c:159: WARNING: please, no spaces at the start of a line
tst_sys_conf.c:161: ERROR: code indent should use tabs where possible
tst_sys_conf.c:161: WARNING: please, no spaces at the start of a line
tst_sys_conf.c:163: ERROR: code indent should use tabs where possible
tst_sys_conf.c:163: WARNING: please, no spaces at the start of a line
tst_sys_conf.c:165: ERROR: code indent should use tabs where possible
tst_sys_conf.c:165: WARNING: please, no spaces at the start of a line
tst_sys_conf.c:170: ERROR: code indent should use tabs where possible
tst_sys_conf.c:170: WARNING: please, no spaces at the start of a line
tst_sys_conf.c:171: ERROR: code indent should use tabs where possible
tst_sys_conf.c:171: WARNING: please, no spaces at the start of a line
tst_sys_conf.c:172: ERROR: code indent should use tabs where possible
tst_sys_conf.c:173: ERROR: code indent should use tabs where possible
tst_sys_conf.c:173: WARNING: please, no spaces at the start of a line
tst_sys_conf.c:174: ERROR: code indent should use tabs where possible
tst_sys_conf.c:174: WARNING: please, no spaces at the start of a line


> +{
> +	long ret;
> +
> +	safe_file_scanf(file, lineno, NULL, path, "%ld", &ret);
> +
> +	return ret;
> +}
> +
> +void tst_sys_conf_long_set_(const char *file, const int lineno,
> +                            const char *path, long val, int check)
> +{
> +        tst_res_(file, lineno, TINFO, "Setting %s to %ld", path, val);
> +
> +        safe_file_printf(file, lineno, NULL, path, "%ld", val);
> +
> +        if (check) {
> +		long read_val;
nit: obviously also here are tabs and spaces mixed. Minor, but worth to fix
before merge.

Maybe we would benefit to add .editorconfig [1] (see examples [2] [3]).

Also maybe to save indent?

if (!check)
	return;

Kind regards,
Petr


> +
> +		safe_file_scanf(file, lineno, NULL, path, "%ld", &read_val);
> +
> +                if (val != read_val)
> +                        tst_brk_(file, lineno, TBROK,
> +			         "Wrote %ld to %s but read back %ld",
> +                                 val, path, read_val);
> +        }
> +
> +}

[1] https://editorconfig.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/.editorconfig
[3] https://git.busybox.net/buildroot/tree/.editorconfig

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
