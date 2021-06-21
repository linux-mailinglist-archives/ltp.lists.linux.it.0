Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA5C3AE5A4
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:08:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AC563C96EC
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:08:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6967A3C704B
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:08:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7BD72200927
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:08:07 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9670E1FD42;
 Mon, 21 Jun 2021 09:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624266487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6pO7oG/N9TuX0nYP7Bbf6ktvqRSmD4tlnXhS9MD3nw=;
 b=x5Gi3sNU2bJ8UoQX/x0RnBEKJ6PvTlrUtE/OEGA6KWexKeHUj3wxvNrG4lVsWlP2yrUnTU
 7wI2ZuKAm/q7uv8ZZGlpAMlVGSGht4oAHNfYF0/Ic5Oy+28JmdhmL88mpEw5OW/nMVrlUo
 ZT+xL/6BA/Zir1//2ohA9+ngLCTr+AA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624266487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6pO7oG/N9TuX0nYP7Bbf6ktvqRSmD4tlnXhS9MD3nw=;
 b=enzECPzk9JadqeOgBnJ09L0HFWzKoDi+GqaT0esLvit08twzWsokFS8lXdMdkVmtk6ynk1
 A+1zO6IygicwKACA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7A28B118DD;
 Mon, 21 Jun 2021 09:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624266487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6pO7oG/N9TuX0nYP7Bbf6ktvqRSmD4tlnXhS9MD3nw=;
 b=x5Gi3sNU2bJ8UoQX/x0RnBEKJ6PvTlrUtE/OEGA6KWexKeHUj3wxvNrG4lVsWlP2yrUnTU
 7wI2ZuKAm/q7uv8ZZGlpAMlVGSGht4oAHNfYF0/Ic5Oy+28JmdhmL88mpEw5OW/nMVrlUo
 ZT+xL/6BA/Zir1//2ohA9+ngLCTr+AA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624266487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6pO7oG/N9TuX0nYP7Bbf6ktvqRSmD4tlnXhS9MD3nw=;
 b=enzECPzk9JadqeOgBnJ09L0HFWzKoDi+GqaT0esLvit08twzWsokFS8lXdMdkVmtk6ynk1
 A+1zO6IygicwKACA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id uC2yHPdW0GCjPgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 21 Jun 2021 09:08:07 +0000
Date: Mon, 21 Jun 2021 10:42:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YNBQ95gIlM9TTjpA@yuki>
References: <20210618094210.183027-1-xieziyao@huawei.com>
 <20210618094210.183027-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618094210.183027-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
> +#include "config.h"
> +#include "tst_test.h"
> +
> +#ifdef HAVE_LIBAIO
> +#define EXP_RET (-EFAULT)
> +
> +#include <libaio.h>
> +
> +static void run(void)
> +{
> +	io_context_t ctx;
> +
> +	memset(&ctx, 0, sizeof(ctx));
> +	TEST(io_cancel(ctx, NULL, NULL));
> +
> +	if (TST_RET == 0)
> +		tst_res(TFAIL, "call succeeded unexpectedly");
> +	else if (TST_RET == EXP_RET)
> +		tst_res(TPASS, "io_cancel(ctx, NULL, NULL) returns %ld : %s",
> +			TST_RET, strerror(-TST_RET));
> +	else
> +		tst_res(TFAIL, "io_cancel(ctx, NULL, NULL) returns %ld : %s, expected %d : %s",
> +			TST_RET, strerror(-TST_RET), EXP_RET, strerror(-EXP_RET));

Please use TST_EXP_FAIL() instead.

> +}
> +
> +static struct tst_test test = {
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_AIO=y",
> +		NULL
> +	},
> +	.test_all = run,
> +};
> +
> +#else
> +TST_TEST_TCONF("test requires libaio and it's development packages");
> +#endif
> --
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
