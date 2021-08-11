Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81B3E92B0
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 15:30:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF2023C6FCC
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 15:30:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 42CB33C24E3
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 15:30:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4EA881401108
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 15:30:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 933BD221FD;
 Wed, 11 Aug 2021 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628688628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tygworxYHPsJ1fKtuyD5UidWr5/tOGKWfmPi2xhJSYw=;
 b=Q+kuZPO4hp9tUxB+AVpF0C1U5coaB2KblNIMul+Tap32nAURhm37ZJ8U8+GoeIAgXmJCk6
 kgmNfFSDSp/Zr4wrYoxXU3LyrN8OUtCJGpsWJiBkaBmWEAT3tXvI9RE0c7J0lsU30jMm2U
 yO/WMHcrfJ11PX+HJpnaXehYnK5YkP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628688628;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tygworxYHPsJ1fKtuyD5UidWr5/tOGKWfmPi2xhJSYw=;
 b=omawHaoQgfXLbhl0dRqJcHCbwS2qew4v5SSTTDPA3KCitkQj0eji5eSUxH//HDx+PKhyRr
 ZbfBoxv7mT0MIuDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 784BA13C2B;
 Wed, 11 Aug 2021 13:30:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PtHcHPTQE2EmNQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 11 Aug 2021 13:30:28 +0000
Date: Wed, 11 Aug 2021 15:30:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YRPQ/zpKDGbc+9nz@yuki>
References: <20210809083903.161596-1-xieziyao@huawei.com>
 <20210809083903.161596-4-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210809083903.161596-4-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/4] epoll_wait: Convert epoll_wait03 to the new
 API
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
> + * 1. epoll_wait fails with EBADF if epfd is not a valid file descriptor.
> + * 2. epoll_wait fails with EINVAL if epfd is not an epoll file descriptor.
> + * 3. epoll_wait fails with EINVAL if maxevents is less than zero.

I've changed this list to be use dashes instead of numbers, since that
is how the rest of the testcases documents subtests in lists.

And pushed the whole patchset, nice work, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
