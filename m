Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC7839DDE3
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:41:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6806E3C565F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:41:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C905D3C2698
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:41:28 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 548E61A00F28
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:41:28 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D2F01FDA5;
 Mon,  7 Jun 2021 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623073287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T0HDz5s8tF4e2IcslFSxUogjVT1+XQepLGveSLL2Wuk=;
 b=WmrUZhmAakWAaG/bnZTxNKqx/6Sn6zDWITiLFzNXiVcozeF8s4D+uJZ4TkNHjcrz31m+oL
 dIkxyKfDdqjZNHX5lWlpi17FGcjHX2ycyHG/pwqcCv/zLQGmKKbH4DtZbWoF7rzh8tF38D
 CF2uLi64JF4dtS4yHTJud4WmMAJqx9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623073287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T0HDz5s8tF4e2IcslFSxUogjVT1+XQepLGveSLL2Wuk=;
 b=HyLOfgq+jJt2AcQX5QF5efjcPzmrX/rEYQkoxSOCgAVW+wc4bxHB9RW6wHlu8oacNSqJ67
 Ss4TCuYFoU4LyzCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4B9E3118DD;
 Mon,  7 Jun 2021 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623073287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T0HDz5s8tF4e2IcslFSxUogjVT1+XQepLGveSLL2Wuk=;
 b=WmrUZhmAakWAaG/bnZTxNKqx/6Sn6zDWITiLFzNXiVcozeF8s4D+uJZ4TkNHjcrz31m+oL
 dIkxyKfDdqjZNHX5lWlpi17FGcjHX2ycyHG/pwqcCv/zLQGmKKbH4DtZbWoF7rzh8tF38D
 CF2uLi64JF4dtS4yHTJud4WmMAJqx9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623073287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T0HDz5s8tF4e2IcslFSxUogjVT1+XQepLGveSLL2Wuk=;
 b=HyLOfgq+jJt2AcQX5QF5efjcPzmrX/rEYQkoxSOCgAVW+wc4bxHB9RW6wHlu8oacNSqJ67
 Ss4TCuYFoU4LyzCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Q7owEQcivmCMKgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 07 Jun 2021 13:41:27 +0000
Date: Mon, 7 Jun 2021 15:15:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YL4b+J7Cc+i4Bs7w@yuki>
References: <20210507083321.167998-1-xieziyao@huawei.com>
 <20210507083321.167998-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210507083321.167998-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] syscalls/io_destroy: Add io_destroy02 test
 for native AIO
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
Cc: rpalethorpe@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Test looks good but there is one minor problem that has to be solwed,
see below.

> +/*
> + * Copyright (c) Crackerjack Project., 2007
> + * Ported from Crackerjack to LTP by Masatake YAMATO <yamato@redhat.com>
> + * Copyright (c) 2011 Cyril Hrubis <chrubis@suse.cz>
> + * Copyright (c) 2017 Xiao Yang <yangx.jy@cn.fujitsu.com>
> + * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Test io_destroy invoked via syscall(2) with an invalid ctx and expects
> + * it to return EINVAL.
> + */
> +
> +#include <linux/aio_abi.h>
> +
> +#include "config.h"
> +#include "tst_test.h"
> +#include "lapi/syscalls.h"
> +
> +static void verify_io_destroy(void)
> +{
> +	aio_context_t ctx;
> +	memset(&ctx, 0xff, sizeof(ctx));
> +	TST_EXP_FAIL(tst_syscall(__NR_io_destroy, ctx), EINVAL);

This may fail the test if CONFIG_AIO has been disabled in kernel, which
I think is common for embedded tests.

Thinking of solution the easiest fix would probably be to add
.needs_kconfigs with "CONFIG_AIO" to the tst_test structure.

> +}
> +
> +static struct tst_test test = {
> +	.test_all = verify_io_destroy,
> +};
> --
> 2.17.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
