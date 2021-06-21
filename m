Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C510A3AE600
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:27:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43FAC3C98AA
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:27:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0500C3C702C
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:27:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 44FBA1A009AF
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:27:09 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A29B81FD34;
 Mon, 21 Jun 2021 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624267629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1ShzVJ/1lZH6Z+Tn6kyimqzAj5x5JYh105uAoEbNuk=;
 b=GTO7k/nrSpKwLm/vzG25pwcErda+HI9k9D54pqUkBk1wLR8FqcAKP4TXKyCTlBSuDyglgL
 DGwDSJnGsh6JpUH43kS4TTFbfIU+8eQ+d31gVfvhyMDI5AsEU2bG2rKokxuR+J2aNFMYfE
 PkKU2LX01gppuFaxJPqtOEq5H4wheOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624267629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1ShzVJ/1lZH6Z+Tn6kyimqzAj5x5JYh105uAoEbNuk=;
 b=Qdkdw8AQwZw9eaasFuQwdKdxXpggIbknPmWVuf1fXD8ljFekF8ytaAhnpKc5yqPef3+eT9
 9mInpztnAuWDI4Dw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 84341118DD;
 Mon, 21 Jun 2021 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624267629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1ShzVJ/1lZH6Z+Tn6kyimqzAj5x5JYh105uAoEbNuk=;
 b=GTO7k/nrSpKwLm/vzG25pwcErda+HI9k9D54pqUkBk1wLR8FqcAKP4TXKyCTlBSuDyglgL
 DGwDSJnGsh6JpUH43kS4TTFbfIU+8eQ+d31gVfvhyMDI5AsEU2bG2rKokxuR+J2aNFMYfE
 PkKU2LX01gppuFaxJPqtOEq5H4wheOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624267629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/1ShzVJ/1lZH6Z+Tn6kyimqzAj5x5JYh105uAoEbNuk=;
 b=Qdkdw8AQwZw9eaasFuQwdKdxXpggIbknPmWVuf1fXD8ljFekF8ytaAhnpKc5yqPef3+eT9
 9mInpztnAuWDI4Dw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id r+kTH21b0GDgSAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 21 Jun 2021 09:27:09 +0000
Date: Mon, 21 Jun 2021 11:01:33 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YNBVbVGZ5QRJuOkH@yuki>
References: <20210618094210.183027-1-xieziyao@huawei.com>
 <20210618094210.183027-2-xieziyao@huawei.com>
 <YNBQ95gIlM9TTjpA@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNBQ95gIlM9TTjpA@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/7] io_cancel02: Add io_cancel02 test for libaio
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
> > +#include "config.h"
> > +#include "tst_test.h"
> > +
> > +#ifdef HAVE_LIBAIO
> > +#define EXP_RET (-EFAULT)
> > +
> > +#include <libaio.h>
> > +
> > +static void run(void)
> > +{
> > +	io_context_t ctx;
> > +
> > +	memset(&ctx, 0, sizeof(ctx));
> > +	TEST(io_cancel(ctx, NULL, NULL));
> > +
> > +	if (TST_RET == 0)
> > +		tst_res(TFAIL, "call succeeded unexpectedly");

It's usually easier to read to use return instead of else if branches:

	if (TST_RET == 0) {
		tst_res(TFAIL, "io_cancel() succeeded unexpectedly");
		return;
	}

Also you should never use strerror() in tests, we do have tst_strerrno()
for that purpose, also if you have checked that TST_RET == EFAULT there
is no point in converting the value into a string and you can do:


	if (TST_RET == -EFAULT) {
		tst_res(TPASS, "io_cancel() failed with EFAULT");
		return;
	}


Followed by:

	tst_res(TFAIL, "io_cancel() failed unexpectedly %s (%d) expected EFAULT",
	        tst_strerrno(-TST_RET), -TST_RET);

> > +	else if (TST_RET == EXP_RET)
> > +		tst_res(TPASS, "io_cancel(ctx, NULL, NULL) returns %ld : %s",
> > +			TST_RET, strerror(-TST_RET));
> > +	else
> > +		tst_res(TFAIL, "io_cancel(ctx, NULL, NULL) returns %ld : %s, expected %d : %s",
> > +			TST_RET, strerror(-TST_RET), EXP_RET, strerror(-EXP_RET));
> 
> Please use TST_EXP_FAIL() instead.

Looking again, these calls do return -error on failure, we can't use
TST_EXP_FAIL() here.

But even then there are a couple of problems to fix (commented above).


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
