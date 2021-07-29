Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9E3DA78F
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 17:27:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E48133C6895
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jul 2021 17:27:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 059073C6300
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 17:27:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5905D20039F
 for <ltp@lists.linux.it>; Thu, 29 Jul 2021 17:27:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 73B28223F2;
 Thu, 29 Jul 2021 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627572428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=89lGhLyhq4IYgub09h9VdtB0dxVOqHBeCv1WgmgMric=;
 b=hDpmEPKMWtRenKxMl6XnT0n7Gwawdhz1i5gToxMc5zz1Mm4gWzOakXDQylV9hrC8F3AB1t
 Qq77ckM/7dRGYYAu6dLJt+ALfXA6OKHAWpDB3cxBcsO+Qq9RFlHRo6Eeko5NlMgdzhWUpz
 mA8NAMy5En8iD4wCSE/BnZ4uw2Q/B1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627572428;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=89lGhLyhq4IYgub09h9VdtB0dxVOqHBeCv1WgmgMric=;
 b=7UnyK+8PNA7+K5isHajL3s9FxfB6QSXzaHTVonjcxpP/+qMi+iEPqHdmNum+1FMPs3ICqT
 HhPETBAeiMz1LmBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52FC813BD0;
 Thu, 29 Jul 2021 15:27:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iSHXE8zIAmHaKgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 29 Jul 2021 15:27:08 +0000
Date: Thu, 29 Jul 2021 17:27:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YQLIzZJiDUKznZ/d@yuki>
References: <20210728123412.31858-1-rpalethorpe@suse.com>
 <20210728123412.31858-6-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728123412.31858-6-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 5/8] doc: Document TEST macro and state
 TST_RET/ERR rule LTP-002
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
I've pushed all but this patch, see below.

>  -------------------------------------------------------------------------------
>  
> -The 'TST_EXP_FAIL2()' is the same as 'TST_EXP_FAIL()' except the return value
> -is expected to be non-negative integer if call passes.
> +The 'TST_EXP_FAIL2()' is the same as 'TST_EXP_FAIL()' except the
> +return value is expected to be non-negative integer if call
> +passes. These macros build upon the +TEST()+ macro and associated
> +variables.
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +TEST(socket(AF_INET, SOCK_RAW, 1));
> +if (TST_RET > -1) {
> +	tst_res(TFAIL, "Created raw socket");
> +	SAFE_CLOSE(TST_RET);
> +} else if (TST_ERR != EPERM) {
> +	tst_res(TFAIL | TTERRNO,
> +		"Failed to create socket for wrong reason");
> +} else {
> +	tst_res(TPASS | TTERRNO, "Didn't create raw socket");
> +}
> +-------------------------------------------------------------------------------
> +
> +The +TEST+ macro sets +TST_RET+ to its argument's return value and
> ++TST_ERR+ to +errno+. The +TTERNO+ flag can be used to print the error
> +number's symbolic value.
> +
> +No LTP library function or macro, except those in 'tst_test_macros.h',
> +will write to these variables (rule 'LTP-002'). So their values will
> +not be changed unexpectedly.
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +TST_EXP_POSITIVE(wait(&status));
> +
> +if (!TST_PASS)
> +	return;
> +-------------------------------------------------------------------------------
> +
> +If the return value of 'wait' is positive. This macro will print a
> +pass result and set +TST_PASS+ appropriately. If the return value is
> +zero or negative, then it will print fail.
> +
> +As seen above, this and similar macros take optional variadic
> +arguments. These begin with a format string and then appropriate
> +values to be formatted. So
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +TST_EXP_PASS(chown("a/file", uid, gid), "chown(%s,%d,%d)",
> +	     "a/file", uid, gid);
> +-------------------------------------------------------------------------------
> +
> +expects +chown+ to return 0 and emits a pass or a fail. The arguments
> +to +chown+ will be printed in either case. There are many similar
> +macros to those shown here, please see 'tst_test_macros.h'.

There is already TST_EXP_PASS description before the TST_EXP_FAIL so
this duplicates it. Other than that the rest looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
