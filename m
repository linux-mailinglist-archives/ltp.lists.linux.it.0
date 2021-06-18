Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 647D53ACAA5
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 14:12:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5CF13C3099
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 14:12:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C93F3C1B48
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 14:12:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 743DB601C74
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 14:12:01 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D73591FDE7;
 Fri, 18 Jun 2021 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624018320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+KiV/ZQBkM21FyaQSW88k63m2kbloD/GCS+j7E3ma0=;
 b=uHfTL8/QYSLjZN4bQ45a/Lwk3pUcdZwPwnrOq2LXkOrTIPFND51cErMGUsALeG9T+fP/BU
 IDyHPYZSG9hcQiGCMfToapQaeyiTGufDqz16VOf+wz2vXrXkc5xCHFlKMHrppWSm1GNH3h
 UmmSXPx+g9961f+R3wsAToD7nC0K/fM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624018320;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+KiV/ZQBkM21FyaQSW88k63m2kbloD/GCS+j7E3ma0=;
 b=/5oDw1qq9INZIKPKSiAWryGq1cxBw3hPQlXQg5ZqpUJ8AvStbFeGbJ9UmT+ly2VRUxJmnP
 YQcRnT9kwlpMJCDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B807C118DD;
 Fri, 18 Jun 2021 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624018320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+KiV/ZQBkM21FyaQSW88k63m2kbloD/GCS+j7E3ma0=;
 b=uHfTL8/QYSLjZN4bQ45a/Lwk3pUcdZwPwnrOq2LXkOrTIPFND51cErMGUsALeG9T+fP/BU
 IDyHPYZSG9hcQiGCMfToapQaeyiTGufDqz16VOf+wz2vXrXkc5xCHFlKMHrppWSm1GNH3h
 UmmSXPx+g9961f+R3wsAToD7nC0K/fM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624018320;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+KiV/ZQBkM21FyaQSW88k63m2kbloD/GCS+j7E3ma0=;
 b=/5oDw1qq9INZIKPKSiAWryGq1cxBw3hPQlXQg5ZqpUJ8AvStbFeGbJ9UmT+ly2VRUxJmnP
 YQcRnT9kwlpMJCDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id HU6kK5CNzGBYDgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 18 Jun 2021 12:12:00 +0000
Date: Fri, 18 Jun 2021 13:46:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMyHj8em7HRG8XrS@yuki>
References: <20210617105556.130869-1-xieziyao@huawei.com>
 <20210617105556.130869-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617105556.130869-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3 v2] lib: tst_process_state: Use SPDX and
 format alignment
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
> ---
> v1->v2:
> 1. Move changes in license and whitespaces to a separate patch.
> 
>  include/tst_process_state.h | 23 +++++++++--------------
>  lib/tst_process_state.c     | 31 +++++++------------------------
>  2 files changed, 16 insertions(+), 38 deletions(-)
> 
> diff --git a/include/tst_process_state.h b/include/tst_process_state.h
> index c32aa58e6..32eaf46d9 100644
> --- a/include/tst_process_state.h
> +++ b/include/tst_process_state.h
> @@ -2,13 +2,10 @@
>   * Copyright (C) 2012-2014 Cyril Hrubis chrubis@suse.cz
>   */
> 
> - /*
> -
> -   These functions helps you wait till a process with given pid changes state.
> -   This is for example useful when you need to wait in parent until child
> -   blocks.
> -
> -  */
> +/*
> + * These functions helps you wait till a process with given pid changes state.
> + * This is for example useful when you need to wait in parent until child blocks.
> + */
> 
>  #ifndef TST_PROCESS_STATE__
>  #define TST_PROCESS_STATE__
> @@ -29,8 +26,7 @@
>  #ifdef TST_TEST_H__
> 
>  #define TST_PROCESS_STATE_WAIT(pid, state, msec_timeout) \
> -	tst_process_state_wait(__FILE__, __LINE__, NULL, \
> -	                       (pid), (state), (msec_timeout))
> +	tst_process_state_wait(__FILE__, __LINE__, NULL, (pid), (state), (msec_timeout))

This actually creates a line over 80 chars, so I guess that the proper
fix would be keeping the pid, state and timeout on a separate line but
using tabs instead of spaces for indentation.

>  #else
>  /*
>   * The same as above but does not use tst_brkm() interface.
> @@ -41,13 +37,12 @@
>   */
>  int tst_process_state_wait2(pid_t pid, const char state);
> 
> -# define TST_PROCESS_STATE_WAIT(cleanup_fn, pid, state) \
> -	 tst_process_state_wait(__FILE__, __LINE__, (cleanup_fn), \
> -	                        (pid), (state), 0)
> +#define TST_PROCESS_STATE_WAIT(cleanup_fn, pid, state) \
> +	tst_process_state_wait(__FILE__, __LINE__, (cleanup_fn), (pid), (state), 0)

And here as well.


Apart from these two minor issues the rest looks fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
