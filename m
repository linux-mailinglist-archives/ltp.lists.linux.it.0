Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7E23AE9F4
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 15:24:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADC333C7044
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 15:24:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 628BB3C234D
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 15:24:08 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C0C29600868
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 15:24:07 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B8C221A5B;
 Mon, 21 Jun 2021 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624281846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ODHgZRMQiKHdvdBk82xj8Nt7UMTcjRfXC7dFW1c4CiM=;
 b=O220hLrNDWHSAtDUMczVsCkP7RacpB6Dsy2odv/DE6lot+Uzic3/cTAOv/drqt9ex1Qk7f
 8hSk/Jc+xZHOc0yblR3Ub5nwKE7tJJmBmVslVO6jekKyA30m76cY6+EjWQLhHkkLpp9Toh
 Hb036PUg+nG7YKYzCnCaMVzgsq9VZpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624281846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ODHgZRMQiKHdvdBk82xj8Nt7UMTcjRfXC7dFW1c4CiM=;
 b=KRPk6sNKZ3vB0nDGc0BJMOKHwJVgn/KHjjYKG6dUo43HVcitaxrvytnl2SIebZv9jLlezW
 GlzhxJFVZ7E/CUBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0EE5F118DD;
 Mon, 21 Jun 2021 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624281846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ODHgZRMQiKHdvdBk82xj8Nt7UMTcjRfXC7dFW1c4CiM=;
 b=O220hLrNDWHSAtDUMczVsCkP7RacpB6Dsy2odv/DE6lot+Uzic3/cTAOv/drqt9ex1Qk7f
 8hSk/Jc+xZHOc0yblR3Ub5nwKE7tJJmBmVslVO6jekKyA30m76cY6+EjWQLhHkkLpp9Toh
 Hb036PUg+nG7YKYzCnCaMVzgsq9VZpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624281846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ODHgZRMQiKHdvdBk82xj8Nt7UMTcjRfXC7dFW1c4CiM=;
 b=KRPk6sNKZ3vB0nDGc0BJMOKHwJVgn/KHjjYKG6dUo43HVcitaxrvytnl2SIebZv9jLlezW
 GlzhxJFVZ7E/CUBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id lTRuAvaS0GBgTgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 21 Jun 2021 13:24:06 +0000
Date: Mon, 21 Jun 2021 14:58:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YNCM9qwRXZE8Zz/y@yuki>
References: <20210618094210.183027-1-xieziyao@huawei.com>
 <20210618094210.183027-7-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618094210.183027-7-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/7] io_setup: Add docparse formatting and more
 detailed description
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
> + * 1. io_setup succeeds if both nr_events and ctxp are valid.
> + * 2. io_setup fails and returns -EINVAL if ctxp is not initialized to 0.
> + * 3. io_setup fails and returns -EINVAL if nr_events is invalid.
> + * 4. io_setup fails and returns -EFAULT if ctxp is NULL.
> + * 5. io_setup fails and returns -EAGAIN if nr_events exceeds the limit
>   *    of available events.

I've changed the numbered list to a asciidoc list (items start with -)
so that it renders nicely and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
