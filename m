Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 206EE6B79DD
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Mar 2023 15:05:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4FCE3CAEAF
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Mar 2023 15:05:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E515A3C0277
 for <ltp@lists.linux.it>; Mon, 13 Mar 2023 15:05:19 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 71B6D200903
 for <ltp@lists.linux.it>; Mon, 13 Mar 2023 15:05:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3CD151FE08;
 Mon, 13 Mar 2023 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1678716318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dnNbulv+tv1G96YscZ/TsqqASLJeRfiXKW4lt9q1ri0=;
 b=l777hweLQ+ibjbju6JqrQ5b+ezEqRs1R2DX11Fl78EYWOZvn6FfsU2yIkRJ+Qn4ATAhEWH
 pas/T64OWci+gBVLv5SHpZnokEx3/JrACmaCOdsowazyN5x8dN+eDoFNH40N4nDLS/81of
 vA+xQWvK19TIQ1iV0P0JedH02jBlsZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1678716318;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dnNbulv+tv1G96YscZ/TsqqASLJeRfiXKW4lt9q1ri0=;
 b=9PyhbdCYH3YHkyj966+SADWv6JtBZJkCU0fI+vd9JSslsI7NzZ+e/cf+PhXUP7S0Bv3wZU
 7ffX0Yld+awXA7Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1985213517;
 Mon, 13 Mar 2023 14:05:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DPY1BZ4tD2RHPgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 13 Mar 2023 14:05:18 +0000
Date: Mon, 13 Mar 2023 15:06:38 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <ZA8t7hVYRmF+I9k0@yuki>
References: <20230311023343.25177-1-wegao@suse.com>
 <20230312004420.16457-1-wegao@suse.com> <ZA7qq15aeKS+ZeJR@yuki>
 <20230313122100.GA12608@localhost> <ZA8Y+O7QFfVB0/62@yuki>
 <20230313134624.GA9783@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313134624.GA9783@localhost>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] madvise11.c:Check loadable module before rmmod
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
> > +int tst_buildin_driver(const char *driver)
> > +{
> > +       return !tst_search_driver(driver, "modules.buildin");
> > +}
> > +
> >  int tst_check_driver(const char *driver)
> >  {
> >  #ifdef __ANDROID__
> > 
> 
> Try use above implementation but i found another TWARN : (
> 
> localhost:/home/ltp/testcases/kernel/syscalls/madvise # ./madvise11
> tst_test.c:1560: TINFO: Timeout per run is 0h 01m 00s
> madvise11.c:396: TINFO: Spawning 5 threads, with a total of 800 memory pages
> madvise11.c:165: TINFO: Thread [3] returned 0, succeeded.
> madvise11.c:165: TINFO: Thread [1] returned 0, succeeded.
> madvise11.c:165: TINFO: Thread [2] returned 0, succeeded.
> madvise11.c:165: TINFO: Thread [4] returned 0, succeeded.
> madvise11.c:165: TINFO: Thread [0] returned 0, succeeded.
> madvise11.c:199: TPASS: soft-offline / mmap race still clean
> madvise11.c:327: TWARN: open(/sys/kernel/debug/hwpoison/unpoison-pfn,1,0000) failed: ENOENT (2) !!!!

That's strange, this should be equivalent to the modinfo patch you send,
at least the modinfo parses the same file.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
