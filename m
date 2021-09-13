Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8959240861C
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 10:11:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF5613C8A83
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 10:11:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 560E53C1DCC
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 10:11:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AA0861000A29
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 10:11:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D559D21FA6;
 Mon, 13 Sep 2021 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631520662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TqgJzUE+9F845jwNISUetj2Rzh0zRQ8LjCewshk/MlE=;
 b=q7U/4fqRf+vvcwcLH/cGJZbSxdXFmACu4zKTAtMqHeUYILWWUbut1J3M/qc4kQg+l1Ff2A
 KHznSxQ/VzSQnjEGvOuVpHVN8nrVEsTzb5lbDPMplK61IuexNH2RmMvWa9WI4t16EsG196
 lkGjYg8EGC73rqRhy7ZNuR06um/8cQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631520662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TqgJzUE+9F845jwNISUetj2Rzh0zRQ8LjCewshk/MlE=;
 b=emCtZzuWGiaaOkzBFF1C9h9c/GQhJMDxuPoCjZuN17pMQRJat6t6GsOJkXV5H25PC3mfly
 OmO921G4ZXfr1nCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE84213A09;
 Mon, 13 Sep 2021 08:11:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lEpFLpYHP2EFQAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 13 Sep 2021 08:11:02 +0000
Date: Mon, 13 Sep 2021 10:11:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: kernel test robot <oliver.sang@intel.com>
Message-ID: <YT8HqsXsHFeMdDxS@yuki>
References: <20210912123429.GA25450@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912123429.GA25450@xsang-OptiPlex-9020>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [mm/page]  ab19939a6a: ltp.msync04.fail
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, Jan Kara <jack@suse.cz>,
 lkp@intel.com, Chi Wu <wuchi.zero@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@fb.com>,
 lkp@lists.01.org, Sedat Dilek <sedat.dilek@gmail.com>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: ab19939a6a5010cba4e9cb04dd8bee03c72edcbd ("mm/page-writeback: Fix performance when BDI's share of ratio is 0.")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> 
> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20210907
> with following parameters:
> 
> 	disk: 1HDD
> 	fs: xfs
> 	test: syscalls-03
> 	ucode: 0xe2
> 
> test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/

The msync04 test formats a device with a diffrent filesystems, for each
filesystem it maps a file, writes to the mapped page and the checks a
dirty bit in /proc/kpageflags before and after msync() on that page.

This seems to be broken after this patch for ntfs over FUSE and it looks
like the page does not have a dirty bit set right after it has been
written to.

Also I guess that we should increase the number of the pages we dirty or
attempt to retry since a single page may be flushed to the storage if we
are unlucky and the process is preempted between the write and the
initial check for the dirty bit.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
