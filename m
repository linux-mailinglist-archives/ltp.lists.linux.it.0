Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8403441439D
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 10:21:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B83D93C788E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 10:21:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9AFD03C6A0B
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 10:21:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D70F12000AB
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 10:21:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D59221FF53;
 Wed, 22 Sep 2021 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632298871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gkj6GJEKEVMfodLQiKxIIKwPV7F+FgTn8XKKU4N+9nE=;
 b=fUUIA73+Oo8KH0ZHXRZeMPrFqCLMXTDUKdGHKfGoQXnXA4OpTWY35qGtDiDJKwEo/fNLEv
 gBHnQPN2KV3jVZmgoGshuNHGnM8TkwfLuWg3SX368FwTpf1e1UKRMzspViFuKsOR4+HK72
 nfh3Wn8/XAVxdt9TIYFWAIWLDXgwe2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632298871;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gkj6GJEKEVMfodLQiKxIIKwPV7F+FgTn8XKKU4N+9nE=;
 b=LE41HwH7uKGoBAzIFEQzl7Z6GZg7KGePfzNdLOd9W3Jd5ZyYb53mn3vEAHCpoJkVK7hTXi
 iRUkBPyfGD9fxLDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD03A13D65;
 Wed, 22 Sep 2021 08:21:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o3kVLXfnSmHgCwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 22 Sep 2021 08:21:11 +0000
Date: Wed, 22 Sep 2021 10:21:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YUrnljqYd5Hx/fi+@yuki>
References: <20210817104625.2559362-1-liwang@redhat.com>
 <20210921203349.GA2014441@maple.netwinder.org>
 <CAEemH2dMCmYDkZYxfaeJ_oQCCcHzeMgSOGVQ_wS6BwCrp0YiQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dMCmYDkZYxfaeJ_oQCCcHzeMgSOGVQ_wS6BwCrp0YiQw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] fallocate05: increase the fallocate and
 defallocate size
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > This change appears seems to be causing fallocate05 test to reliably
> > trigger OOM (out of memory) on my test machine, which has only 256MB
> > RAM.
> >
> 
> Thanks for reporting the failure. We purposely increase the size of
> fallocate
> to reduce interference from metadata changing. But not clear how much
> size should be a proper value for a small system.
> 
> Can you try with decrease the number of FALLOCATE_BLOCKS?
> 
> i.e.
> 
> #define FALLOCATE_BLOCKS 64
> #define DEALLOCATE_BLOCKS 16
> 
> Or, what about other multiple sizes, test result?

Looking at the test I do not think there is a reason to allocate more
than a two or four blocks for the buffer. We just need to write() to the
fallocated area in a loop one block at a time until it's full. I do not
think that it's a good idea to pass ~100MB buffer to a single write()
and expect it to succeed anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
