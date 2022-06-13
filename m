Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B8548150
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jun 2022 10:13:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 936CE3C9458
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jun 2022 10:13:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3785C3C895D
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 10:13:12 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9F4271A00241
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 10:13:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9044F21E10;
 Mon, 13 Jun 2022 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655107990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PqnirPDsFhZKab6EM9nlYwvOyg6x1NWBt1A5Pr/CZQ=;
 b=KgMiDplkcsa2TZGFsegwb7P2dSKPkw0ps6k45+3qHPK6HTtfHlRBP3EFBrp6nyzMQKld3r
 PKJvB6kY4INPYl3cJmg73grMKW0jdyKoIFn9ryz20ZY3+AFwtTOIkhHI5C4On5/n4U21q4
 dpnq2KpNTumuTuzY2wghuDB8GiVOizw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655107990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PqnirPDsFhZKab6EM9nlYwvOyg6x1NWBt1A5Pr/CZQ=;
 b=cD8VpItU+Ldpokaa54mT4apCcFmk2Cxs3WrFfyGtk1GIutyPXMbeOFjWN4Q38qkjD/YHp2
 HeZZ2yVGTdBcV+DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6959F13443;
 Mon, 13 Jun 2022 08:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5oB2F5bxpmI5IwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 13 Jun 2022 08:13:10 +0000
Date: Mon, 13 Jun 2022 10:15:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YqbyFKN999MTr6Xf@yuki>
References: <20220610131442.5032-1-mdoucha@suse.cz> <YqNIIb/NFVBjsZdb@rei>
 <156915a0-cd2b-e6b8-1b7c-273c67911d4b@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156915a0-cd2b-e6b8-1b7c-273c67911d4b@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] configure: Check for KVM linker script support
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
> > Skipping the whole directory will actually cause problems too, since the
> > runltp files does include the kvm_pagefault01 now which will obvious
> > fail because the binary would be missing.
> > 
> > I'm not sure what the best solution would be, maybe install dummy
> > libraries that just print TCONF in a case that linker does now work?
> 
> KVM tests have their own runfile which can be simply skipped. These
> tests should not be included in any other runfiles because they should
> only be run on baremetal. That's the solution: Don't run the KVM runfile
> if the KVM tests were not built.
> 
> Also, the KVM Makefile already builds nothing on non-x86 archs so the
> problem was there from the beginning.

Looks like these are not in default scenario either, then this is not a
reson to block the patch. However we should really figure out how to
deal with cases like this at least for the new testrunner.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
