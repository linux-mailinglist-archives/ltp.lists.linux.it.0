Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 305F1752755
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jul 2023 17:35:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E1C33CDEBB
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jul 2023 17:35:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D98663CDE9C
 for <ltp@lists.linux.it>; Thu, 13 Jul 2023 17:33:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1DBFE200A04
 for <ltp@lists.linux.it>; Thu, 13 Jul 2023 17:33:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C41522185;
 Thu, 13 Jul 2023 15:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689262430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZnsbM2wbDJKZoJO63kCqa7skAvyrvbFpqW+OFngO6J0=;
 b=sV1pgtAi27tWlGMws6tV7hf/GEtyL/tfm4WbvICemOjJMuus/p2+X17CiUlFl/l1j+rjgD
 xKsKyh+PUXOM5Mtqqoc/ExfUrXx6RAHwtZ6Lb7OFEryuzF6O5kA/QwwDb0pnIavlwHUUdU
 pG3UxM2hej8IJ+lTSLLmhqbB30xUz/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689262430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZnsbM2wbDJKZoJO63kCqa7skAvyrvbFpqW+OFngO6J0=;
 b=9pXKKiCXJGy/exWne0PvxfT2nb5/QqIeeq771ADv8xv5NQVJ9/i551YInR/xTA9frjX5m8
 AoqlkLi8oC3II5Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42C8613489;
 Thu, 13 Jul 2023 15:33:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e3taEF4ZsGTsGAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 13 Jul 2023 15:33:50 +0000
Date: Thu, 13 Jul 2023 17:34:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZLAZn_SBmoIFG5F5@yuki>
References: <202307132107.2ce4ea2f-oliver.sang@intel.com>
 <20230713150923.GA28246@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230713150923.GA28246@lst.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 13 Jul 2023 17:35:37 +0200
Subject: Re: [LTP] [linus:master] [iomap]  219580eea1: ltp.writev07.fail
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
Cc: "Darrick J. Wong" <djwong@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, Miklos Szeredi <mszeredi@redhat.com>,
 Chao Yu <chao@kernel.org>, oe-lkp@lists.linux.dev,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, ltp@lists.linux.it,
 lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, kernel test robot <oliver.sang@intel.com>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I can't reproduce this on current mainline.  Is this a robust failure
> or flapping test?  Especiall as the FAIL conditions look rather
> unrelated.

Actually the test is spot on, the difference is that previously the
error was returned form the iomap_file_buffered_write() only if we
failed with the first buffer from the iov, now we always return the
error and we do not advance the offset.

The change that broke it:

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 063133ec77f4..550525a525c4 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -864,16 +864,19 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
                .len            = iov_iter_count(i),
                .flags          = IOMAP_WRITE,
        };
-       int ret;
+       ssize_t ret;

        if (iocb->ki_flags & IOCB_NOWAIT)
                iter.flags |= IOMAP_NOWAIT;

        while ((ret = iomap_iter(&iter, ops)) > 0)
                iter.processed = iomap_write_iter(&iter, i);
-       if (iter.pos == iocb->ki_pos)
+
+       if (unlikely(ret < 0))
                return ret;
-       return iter.pos - iocb->ki_pos;
+       ret = iter.pos - iocb->ki_pos;
+       iocb->ki_pos += ret;
+       return ret;
 }

I suppose that we shoudl fix is with something as:

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index adb92cdb24b0..bfb39f7bc303 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -872,11 +872,12 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
        while ((ret = iomap_iter(&iter, ops)) > 0)
                iter.processed = iomap_write_iter(&iter, i);

+       iocb->ki_pos += iter.pos - iocb->ki_pos;
+
        if (unlikely(ret < 0))
                return ret;
-       ret = iter.pos - iocb->ki_pos;
-       iocb->ki_pos += ret;
-       return ret;
+
+       return iter.pos - iocb->ki_pos;
 }
 EXPORT_SYMBOL_GPL(iomap_file_buffered_write);


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
