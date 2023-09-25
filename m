Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 017337AD366
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Sep 2023 10:32:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEFE63CBDB4
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Sep 2023 10:32:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1D5D93C9A28
 for <ltp@lists.linux.it>; Mon, 25 Sep 2023 10:32:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 06E661400F56
 for <ltp@lists.linux.it>; Mon, 25 Sep 2023 10:32:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6FDF1F855;
 Mon, 25 Sep 2023 08:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695630728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cECgfHYcd30ExPyLRB7tcaTke5RApGY6WN8sskXDOBU=;
 b=syuvxSLayCLsSHddvP+tyoAUd8QH/3eVOKtK2dAFVG5oFAYC8ok4IhS9m97Pa1phYwg8Ey
 N27SdWUmkoaKjykYi2E6CO0h0mAYxYZ1eukevfl/PMo6fb6Ik5RfIDZN5GUxbt/TUvoFMb
 PX022kGguN0lCcnycRF/P1kcy7Q4vwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695630728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cECgfHYcd30ExPyLRB7tcaTke5RApGY6WN8sskXDOBU=;
 b=vJOBkYs/xVoRHe/9Ga/wyLXey0bm8wSMMhXTFH9Wqxaq1HeZE/DxjJlSx6Nzl8DslC+I3r
 IujK+daF8TakNbDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFB3E13A67;
 Mon, 25 Sep 2023 08:32:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5z6oLYhFEWXkYAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 25 Sep 2023 08:32:08 +0000
Date: Mon, 25 Sep 2023 10:32:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <ZRFFsrgJ9tZQt1Hs@yuki>
References: <20230924050846.2263-1-reubenhwk@gmail.com>
 <ZQ/hGr+o61X1mik9@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQ/hGr+o61X1mik9@casper.infradead.org>
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] vfs: fix readahead(2) on block devices
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
Cc: mszeredi@redhat.com, brauner@kernel.org, Jan Kara <jack@suse.cz>,
 lkp@intel.com, oe-lkp@lists.linux.dev, oliver.sang@intel.com,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 Reuben Hawkins <reubenhwk@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I realise we could add new test cases _basically_ forever, but I'd like
> to see a little more coverage in test_invalid_fd().  It currently tests
> both pipes and sockets, but we have so many more fd types.  Maybe there
> are good abstractions inside LTP already for creating these?  I'd
> like to see tests that the following also return -EINVAL:
> 
>  - an io_uring fd
>  - /dev/zero
>  - /proc/self/maps (or something else in /proc we can get unprivileged
>    access to)
>  - a directory (debatable!  maybe we should allow prefetching a
>    directory!)

This sounds like a good idea. We do have an API to iterate over
filesystems but not API to iterate over file descriptors, I suppose that
we will need an enum with fd type passed along with the file descriptor
so that we can set the expectations right and then just define a
function that would take the structure and do the test, something as:

enum tst_fd_type {
	TST_FD_IO_URING,
	TST_FD_DEV_ZERO,
	TST_FD_PROC_MAPS,
	...
};

struct tst_fd {
	enum tst_fd_type type;
	int fd;
};

static void test_fd(struct tst_fd *fd)
{
	if (fd->type == TST_FD...)
		TST_EXP_PASS(...);
	else
		TST_EXP_FAIL(...);
}

I can add something like this once we are done with the September LTP
release.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
