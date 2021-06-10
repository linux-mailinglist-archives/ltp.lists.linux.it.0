Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA53A2772
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 10:52:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A6BB3C31A9
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 10:52:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C71673C232A
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 10:52:18 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A5B2B1A00CBB
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 10:52:17 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B64FF1FD60;
 Thu, 10 Jun 2021 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623315136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1hCXK1Bfnnqo9ILyMQVrDj21QFy0bOTsrrUzZ7U7LUQ=;
 b=dbnhhSwfYAHqu3qOGvXcHY7eFlNF/ofQK3WkUP3RtDTK/UgcDwNu2tBpUP4+rbP8+LSzw9
 ubgNzgUUiH8Y04E0Smw5+9zx8e88ccrRBOxbti4gB/YK+RFa30l3XyQRYfKar8PoXZqs1A
 VEl9BKVyWWC4ujrGP0QrIX0XSW0F8kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623315136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1hCXK1Bfnnqo9ILyMQVrDj21QFy0bOTsrrUzZ7U7LUQ=;
 b=LIYIv/lSHAhzu/ih6AqxpI2ehNuOAdQnZcK0tuSNYKxN1lqO14sIpmZclIjVrSMjTGgCZ+
 MmXwlmONA8p2hlCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9A82B118DD;
 Thu, 10 Jun 2021 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623315136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1hCXK1Bfnnqo9ILyMQVrDj21QFy0bOTsrrUzZ7U7LUQ=;
 b=dbnhhSwfYAHqu3qOGvXcHY7eFlNF/ofQK3WkUP3RtDTK/UgcDwNu2tBpUP4+rbP8+LSzw9
 ubgNzgUUiH8Y04E0Smw5+9zx8e88ccrRBOxbti4gB/YK+RFa30l3XyQRYfKar8PoXZqs1A
 VEl9BKVyWWC4ujrGP0QrIX0XSW0F8kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623315136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1hCXK1Bfnnqo9ILyMQVrDj21QFy0bOTsrrUzZ7U7LUQ=;
 b=LIYIv/lSHAhzu/ih6AqxpI2ehNuOAdQnZcK0tuSNYKxN1lqO14sIpmZclIjVrSMjTGgCZ+
 MmXwlmONA8p2hlCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id jcOTJMDSwWC+JQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 10 Jun 2021 08:52:16 +0000
Date: Thu, 10 Jun 2021 10:26:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMHMtS527P2OIHjs@yuki>
References: <20210608135718.36579-1-xieziyao@huawei.com>
 <20210608135718.36579-5-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210608135718.36579-5-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4 v2] syscalls/io_submit: Add io_submit03 test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +static void cleanup(void)
> +{
> +	if (rdonly_fd > 0)
> +		SAFE_CLOSE(rdonly_fd);
> +	if (wronly_fd > 0)
> +		SAFE_CLOSE(wronly_fd);
> +	TST_EXP_PASS_SILENT(tst_syscall(__NR_io_destroy, ctx));

I've replaced these PASS_SILENT() with plain old tst_brk(TBROK ...) in
the last two tests and pushed, thanks.


The TST_EXP_* macros are intended for the actual test and not for
setup/cleanup where the test is supposed to report TBROK if something
goes wrong.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
