Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DC35A2937
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Aug 2022 16:19:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A55723CA490
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Aug 2022 16:19:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C7613CA070
 for <ltp@lists.linux.it>; Fri, 26 Aug 2022 16:19:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BB2A1140012E
 for <ltp@lists.linux.it>; Fri, 26 Aug 2022 16:19:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B9DDD3368D;
 Fri, 26 Aug 2022 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661523573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hQcUdQxNUZMuepXVbYJ/F++PM5KJNU/gEtWd5DhXR4s=;
 b=yFg20KV9CZqV7C0Xz0R+uBb+E6DPXsuaScdDq9Y5q7rjniB/LfRPa+lHBD4aALJ6Bz9c5k
 UNEE2U4XWXONiFknEctrpAeSh7Yi4egYb/sznTEl07jML9+3ZphyA0Wg9NlyVlE0rfnBUz
 Zi6buBd10CUsxT0Onnejk7q8sKLIhfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661523573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hQcUdQxNUZMuepXVbYJ/F++PM5KJNU/gEtWd5DhXR4s=;
 b=GSkzaIrhVn/WSLXA1UpkvPrS6JZknnjjnhFSMqZ34mb/Nf3Jn+t1pY7msCiFFSTZC1oVwc
 JkC4re9fFi177VBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A182F13421;
 Fri, 26 Aug 2022 14:19:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nZViJ3XWCGNeQQAAMHmgww
 (envelope-from <jack@suse.cz>); Fri, 26 Aug 2022 14:19:33 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 12D65A0679; Fri, 26 Aug 2022 16:19:33 +0200 (CEST)
Date: Fri, 26 Aug 2022 16:19:33 +0200
From: Jan Kara <jack@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20220826141933.fiy7mohz4ca6s5se@quack3>
References: <20220825140306.7150-1-jack@suse.cz>
 <YwjGrvqYEv4cn+/A@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YwjGrvqYEv4cn+/A@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify10: Make evictable marks test
 more reliable
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
Cc: Jan Kara <jack@suse.cz>, Matthew Bobrowski <repnop@google.com>,
 Dominique Leuenberger <dimstar@opensuse.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri 26-08-22 15:12:14, Petr Vorel wrote:
> Hi Jan, all,
> 
> > In some setups evictable marks tests are failing because the inode with
> > evictable mark does not get evicted. Make sure we sync the filesystem
> > before we try to drop caches to increase likelyhood the inode will get
> > evicted.
> 
> Merged with minor changes to keep checkpatch.pl happy.

Thanks!

> Given on previous discussion the behavior on ext2 vs. xfs:
> would it make sense to transform the test to use .all_filesystems = 1 ?

Well, I don't think it would improve test coverage in any interesting way.
This test tests stuff in fsnotify layer & VFS. The differences in
filesystem inode reclaim are not target of this test - we are just trying
to check that fsnotify does not block inode reclaim by holding inode
references and for that any filesystem works. Or did you mean something
else?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
