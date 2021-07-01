Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7443B8E1A
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 09:17:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 567543C8693
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 09:17:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 896083C1CCF
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 09:17:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 08E6A200DE5
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 09:17:55 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4A9FD1FF73;
 Thu,  1 Jul 2021 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625123875;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DMs27nMFWChzzE4DDwUB0K6d8nW6Zf89qSdnER78roI=;
 b=2JvyCGBAVfIzbbp71iCpWxpUxPByQAODGXcmvG1xsrQnX4ekFAk0CqBekwDSNKVn2D44ow
 nhLiWq9IfpHVC2fEztGU1fgrIwmU3ZaTuSZSGOMnJXweDQXxbyELXfrU+CebUtIreAzMaj
 loPY9CUCfqLnP2hO5f8gsn9YXhDx+QQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625123875;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DMs27nMFWChzzE4DDwUB0K6d8nW6Zf89qSdnER78roI=;
 b=G7IgyO7NpIhEMQdI0JrFxp0VmKumIfpaBar6B72jM4yuMi2tMJz1pEd0zD4OwIZihPJbg/
 hmARg66Za7XY65Dw==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E917BA3B83;
 Thu,  1 Jul 2021 07:17:54 +0000 (UTC)
References: <20210629072710.23800-1-rpalethorpe@suse.com>
 <20210629072710.23800-7-rpalethorpe@suse.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Richard Palethorpe <rpalethorpe@suse.com>
In-reply-to: <20210629072710.23800-7-rpalethorpe@suse.com>
Date: Thu, 01 Jul 2021 08:17:53 +0100
Message-ID: <87fswy33ku.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/7] doc: Document TEST macro and state
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Richard Palethorpe via ltp <ltp@lists.linux.it> writes:

>  
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
> +This and similar macros take optional variadic arguments. These begin
> +with a format string and then appropriate values to be formatted.
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +TST_EXP_PASS(chown("a/file", uid, gid), "chown(%s,%d,%d)",
> +	     "a/file", uid, gid);
> +-------------------------------------------------------------------------------
> +
> +Expects +chown+ to return 0 and emits a pass or a fail. The arguments
> +to +chown+ will be printed in either case. There are many similar
> +macros, please see 'tst_test_macros.h'.

It appears that TST_EXP* macros (but not TEST) are documented
elsewhere. So I should probably combine these comments with the existing
docs.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
