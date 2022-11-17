Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29B62E04D
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Nov 2022 16:50:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CE9C3CCFC4
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Nov 2022 16:50:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E561E3C62D3
 for <ltp@lists.linux.it>; Thu, 17 Nov 2022 16:50:18 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A7B2B1022030
 for <ltp@lists.linux.it>; Thu, 17 Nov 2022 16:50:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C082226F0;
 Thu, 17 Nov 2022 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668700216;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HpvzdNG5Qahy5YrsgzG7D4YvYXoIi0pJzJ2IlNnN0ow=;
 b=dEqhff8Mgtunyjh6SCGpwnlD31OrURSASg/TZ6fZfagRPbnMviuJT1wDErhl1nn1NK1ha/
 FVSOFs9gm6SnZzLCSs1mXdHBz0sk2I/PxQI6rP8ugphNkm9/HN91xjbXkPTnj+iFO+LGn7
 i7rrqFNKe0QEdNRUv7fE8eYJ9fOiH0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668700216;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HpvzdNG5Qahy5YrsgzG7D4YvYXoIi0pJzJ2IlNnN0ow=;
 b=WL+XNUAT5h4hxYgJgqWsuGvB2bS2hHHYBRbgPgqLtstspY/QqvhYkYGC3s+Nu+EcvYxg9/
 Qgp345Iw+QNWL6AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C9ECE13A12;
 Thu, 17 Nov 2022 15:50:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KH3ZLzdYdmNaLQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 17 Nov 2022 15:50:15 +0000
Date: Thu, 17 Nov 2022 16:50:13 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <Y3ZYNfhTNhwISEyB@pevik>
References: <20221115123721.12176-1-jack@suse.cz>
 <20221115124741.14400-3-jack@suse.cz>
 <Y3RIKsBUx+KiH4lD@xpf.sh.intel.com>
 <20221116105814.ozfankn5qkizj2zr@quack3>
 <CAOQ4uxj7+PLuSA18s7QCdYF0x9f09gYmvgpmFHMH75vRt9swcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxj7+PLuSA18s7QCdYF0x9f09gYmvgpmFHMH75vRt9swcg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] fanotify10: Make evictable marks tests more
 reliable
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan, Amir,

> On Wed, Nov 16, 2022 at 12:58 PM Jan Kara <jack@suse.cz> wrote:

> > On Wed 16-11-22 10:17:14, Pengfei Xu wrote:
> > > Hi Jan Kara,

> > > On 2022-11-15 at 13:47:38 +0100, Jan Kara wrote:
> > > > Tests verifying that evictable inode marks don't pin inodes in memory
> > > > are unreliable because slab shrinking (triggered by drop_caches) does
> > > > not reliably evict inodes - dentries have to take round through the LRU
> > > > list and only then get reclaimed and inodes get unpinned and then inodes
> > > > have to be rotated through their LRU list to get reclaimed. If there are
> > > > not enough freed entries while shrinking other slab caches, drop_caches
> > > > will abort attempts to reclaim slab before inodes get evicted.

> > > > Tweak evictable marks tests to use more files and marks in parallel and
> > > > just verify that some (at least half) of the marks got evicted. This
> > > > should be more tolerant to random fluctuation in slab reclaim
> > > > efficiency.

> > > If possible, could you add the Tested-by tag:
> > > Tested-by: Pengfei Xu <pengfei.xu@intel.com>

> > Sure, will do. I'll just wait whether there will be some other review
> > comments.

> I would want to say Reviewed-by, but I could only say Eyeballed-by.
> I like the change and thanks for figuring this out, but the review
> was very hard, so I did not have time to do it thoroughly.

> Good luck, Petr ;-)
Thanks :). I'm ill, hoping to be back working next week, I'll have look soon.

Kind regards,
Petr

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
