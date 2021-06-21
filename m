Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7753AEA44
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 15:42:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 690E93C7047
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 15:42:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC0DE3C2318
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 15:42:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 56AED2005D0
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 15:42:43 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E4032198A;
 Mon, 21 Jun 2021 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624282962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cnf6+WRok/nDrdx737MNcqjxdwOyPsaOgKPYD141yvo=;
 b=et4MJVvBzSAiTi/AM7ZuHIP57sGN/b8PXPJ2T6vwKVq49yiQCHmJn+69O2GzFcXJzrKHMC
 4tCOlrxdyuuMs0WAyAsKJBX2ZGiW1HxkuYLwlQEea6t9gqZe1VfU28Z9f+T+1RDdNMw0qu
 dUBVoJ0ymjRjmuGX+JUHP4KAxcoawmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624282962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cnf6+WRok/nDrdx737MNcqjxdwOyPsaOgKPYD141yvo=;
 b=iFYdKNK4Ncv67sqPJidLInta/DSgpz9KwgjP0ulyqS0GZL4hTos9RQFBR2zxKFEYY+JFVe
 iLxxNjAa/dFxyVAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8036E118DD;
 Mon, 21 Jun 2021 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624282962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cnf6+WRok/nDrdx737MNcqjxdwOyPsaOgKPYD141yvo=;
 b=et4MJVvBzSAiTi/AM7ZuHIP57sGN/b8PXPJ2T6vwKVq49yiQCHmJn+69O2GzFcXJzrKHMC
 4tCOlrxdyuuMs0WAyAsKJBX2ZGiW1HxkuYLwlQEea6t9gqZe1VfU28Z9f+T+1RDdNMw0qu
 dUBVoJ0ymjRjmuGX+JUHP4KAxcoawmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624282962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cnf6+WRok/nDrdx737MNcqjxdwOyPsaOgKPYD141yvo=;
 b=iFYdKNK4Ncv67sqPJidLInta/DSgpz9KwgjP0ulyqS0GZL4hTos9RQFBR2zxKFEYY+JFVe
 iLxxNjAa/dFxyVAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id kQodHlKX0GBpWAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 21 Jun 2021 13:42:42 +0000
Date: Mon, 21 Jun 2021 15:17:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YNCRU7dN7puCLcSp@yuki>
References: <20210618094210.183027-1-xieziyao@huawei.com>
 <20210618094210.183027-8-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618094210.183027-8-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 7/7] io_submit01: Add docparse formatting and more
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
> + * 1. io_submit fails and returns -EINVAL if ctx is invalid.
> + * 2. io_submit fails and returns -EINVAL if nr is invalid.
> + * 3. io_submit fails and returns -EFAULT if iocbpp pointer is invalid.
> + * 4. io_submit fails and returns -EBADF if fd is invalid.
> + * 5. io_submit() succeeds and returns the number of iocbs submitted.
> + * 6. io_submit() succeeds and returns 0 if nr is zero.

Did the same change here and pushed as well, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
