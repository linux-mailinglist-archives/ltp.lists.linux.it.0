Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 24469394DCE
	for <lists+linux-ltp@lfdr.de>; Sat, 29 May 2021 21:10:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC4243C9347
	for <lists+linux-ltp@lfdr.de>; Sat, 29 May 2021 21:10:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5C9AD3C29EF
 for <ltp@lists.linux.it>; Sat, 29 May 2021 21:10:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 62C291A00907
 for <ltp@lists.linux.it>; Sat, 29 May 2021 21:10:49 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0DE5B1FD2E;
 Sat, 29 May 2021 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622315448;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t5K1oIFSVAEmbz5MhP6TTqlrfTuywaFFwuGF6O9XVXI=;
 b=FaiF96OGSFtg1Ng5YhKFR9wWMHpwCjfEdM4oZKYlI9To1AB1WmotCXu7Brq5SUqXesfS6W
 zGPg3P8nhrPJQSMydhOt+PbfL6/tNM8imJSMbrLtSIlf03TorMtRBPSBSLlgtJXlNv0C7b
 imPiOxyDEWl2xo1MzjGGVm6Xk1VpK3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622315448;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t5K1oIFSVAEmbz5MhP6TTqlrfTuywaFFwuGF6O9XVXI=;
 b=K9C0oKhs0t5UNq9NHX+4fMZaZpP5Fj2pZ8sNsFJ95evAC8P3GmE8l7Be71aL/exMdQhcPA
 QMWocLTPkXCE8yDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4FF60118DD;
 Sat, 29 May 2021 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622315447;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t5K1oIFSVAEmbz5MhP6TTqlrfTuywaFFwuGF6O9XVXI=;
 b=pv2MxHv4Rncmv+GS1C83gPbDKoig1X3X43C595BbkOVY0XIrVSQQOul1K4rwV7I78pt5r5
 Age2oDmYaP4UkX0XD6wy4YbPK2b3/GGDykBvS0TS+ImgwAEC0Q3kTo4f24MGakbuA1wc69
 djNFhF828cIZgcKn7uA6rHYSRN8CeQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622315447;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t5K1oIFSVAEmbz5MhP6TTqlrfTuywaFFwuGF6O9XVXI=;
 b=7YzgH4tQeQwT5xwvRmVlqWETr24PeIoE08RmN8DgN63ZXxUhQhxK7WAo6CR141T4XXCnr0
 3Y3H4oeUkTtDLGAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0vzeEbeRsmCuWAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Sat, 29 May 2021 19:10:47 +0000
Date: Sat, 29 May 2021 21:10:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLKRtWlnuRV2cLbM@pevik>
References: <20210528182549.14347-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210528182549.14347-1-chrubis@suse.cz>
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.50
X-Spamd-Result: default: False [0.50 / 100.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.00)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] doc: Modernize test-writing-guidelines
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

very nice improvements, thanks!
Few notes below.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> -In case of LTP testcases it's customary to add a paragraph with highlevel test
> -description somewhere at the beginning of the file (usually right under the GPL
> -header). This helps other people to understand the overall goal of the test
> -before they dive into the technical details.
> +* First of all I will repeat *Keep things simple*
> +
> +* Keep function and variable names short but descriptive, choosing a good name
> +  for an API function is very difficuilt task; do not underestimate it
typo: difficuilt => difficult
> +
> +* Keep functions reasonably short and focused on a single task
BTW we are in the section "1.4 Commenting code", shouldn't be in some section
for general coding rules (for both C and shell)? Maybe under "1.3 Coding style"
> +
> +* Be consistent
> +
> +* Avoid deep nesting
> +
> +* DRY
maybe:
* https://en.wikipedia.org/wiki/Don%27t_repeat_yourself[DRY]

But DRY is the same as "1.2 Code duplication"

Also, I'd note for "Keep lines under 80 chars": for strings (log messages) we
prefer lines under 100 chars than splitting string.

> +
> +If there is a code that requires to be commented keep it short and to the
> +point. These comments should explain *why* and not *how* thigs are done.
typo: thigs => things
> +
> +Never ever comment the obvious.
> +
> +In case of LTP testcases it's customary to add a comment with an asciidoc
> +formatted paragraph with highlevel test description at the beginning of the
> +file right under the GPL SPDX header. This helps other people to understand
> +the overall goal of the test before they dive into the technical details. It's
> +also exported into generated documentation hence it should mostly explain what
> +is tested and why.

>  1.5 Backwards compatibility
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> @@ -124,20 +143,27 @@ toolchain supplied by the manufacturer.

>  Therefore LTP test for more current features should be able to cope with older
>  systems. It should at least compile fine and if it's not appropriate for the
> -configuration it should return 'TCONF' (see test interface description below).
> +configuration it should return 'TCONF'.

>  There are several types of checks we use:

>  The *configure script* is usually used to detect availability of a function
> -declarations in system headers. It's used to disable tests at compile time.
> -
> -We also have runtime kernel version detection that can be used to disable
> -tests at runtime.
> +declarations in system headers. It's used to disable tests at compile time or
> +to enable fallback definitions.
>  Checking the *errno* value is another type of runtime check. Most of the
>  syscalls returns either 'EINVAL' or 'ENOSYS' when syscall was not implemented
>  or was disabled upon kernel compilation.

> +LTP has kernel version detection that can be used to disable tests at runtime,
> +unfortunatelly kernel version does not always corresponds to a well defined
typo: unfortunatelly => unfortunately
> +feature set as distributions tend to backport hundreds of patches while the
> +kernel version stays the same. Use with caution.
> +
> +Lately we added kernel '.config' parser, a test can define a boolean
> +expression of kernel config variables that has to be satisfied in order for a
> +test to run. This is mostly used for kernel namespaces at the moment.
...

>  Tests are generally placed under the 'testcases/' directory. Everything that
>  is a syscall or (slightly confusingly) libc syscall wrapper goes under
> -'testcases/kernel/syscalls/'. Then there is 'testcases/open_posix_testsuite'
> -which is a well maintained fork of the upstream project that has been dead
> -since 2005 and also a number of directories with tests for more specific
> -features.
> +'testcases/kernel/syscalls/'.

Maybe also mention testcases/cve/ and why tests are duplicated?
Not sure if it's worth to mention testcases/network/; also there are other
directories. But I suppose you don't want to be too verbose here atm.
Maybe one day (after we have done a cleanup of old unsupported things)
we should describe here or in testcases/README.md all subdirectories.

> +
> +Then there is 'testcases/open_posix_testsuite' which is a well maintained fork
nit: 'testcases/open_posix_testsuite/' ('/' at the end to be consistent.
> +of the upstream project that has been dead since 2005 and also a number of
> +directories with tests for more specific features.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
