Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93703605A86
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Oct 2022 11:03:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54CF93CB13B
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Oct 2022 11:03:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 337063C1769
 for <ltp@lists.linux.it>; Thu, 20 Oct 2022 11:03:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C2080200C23
 for <ltp@lists.linux.it>; Thu, 20 Oct 2022 11:03:48 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 07F6F22C1C;
 Thu, 20 Oct 2022 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666256628;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NSkAqhUqvm71n4+Ri+7OgmRtQxt6j7GHjX9cuKaIeWg=;
 b=fqYwuq1M97xazC6hxnePJIONrNpa2km7rq4Zh8eY7Rq95SZdYBruP1BPSV9UOlglmHihO6
 gUM8vsa9TuRhZNvPrJToDD1EpaaHyonB/WyFYqoZ470tSG9OlmMel3QtWIYZvLZc9CCRsH
 LYfQjH/9mYBAtcSWO/iPJpmIXr5+qrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666256628;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NSkAqhUqvm71n4+Ri+7OgmRtQxt6j7GHjX9cuKaIeWg=;
 b=EiMd/QhbgsZkwWM6FRgYaVIpddqCwa3gZCdGaBN6yyg5giEhf79uo97BzJChCqPoS7yubs
 t17cMYnPXTLnnpAQ==
Received: from g78 (unknown [10.100.228.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 22D562C187;
 Thu, 20 Oct 2022 09:03:46 +0000 (UTC)
References: <20221010081628.37168-1-zhaogongyi@huawei.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Date: Thu, 20 Oct 2022 09:58:06 +0100
In-reply-to: <20221010081628.37168-1-zhaogongyi@huawei.com>
Message-ID: <87wn8uvpcf.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: Move setup_ipc() to the beginning of
 do_setup()
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

Hello,

Zhao Gongyi via ltp <ltp@lists.linux.it> writes:

> Move setup_ipc() to the beginning of do_setup() since we
> would use the 'results' immediately in do_setup(), otherwise,there
> is no Results statistics when calling the tst_brk in do_setup().
>
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  lib/tst_test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 8ccde1629..02fc6a06e 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -1096,6 +1096,8 @@ static void do_cgroup_requires(void)
>
>  static void do_setup(int argc, char *argv[])
>  {
> +	setup_ipc();
> +

We can't move it to before checking if tst_test is null.

Is there anything else that needs to be done before calling that?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
