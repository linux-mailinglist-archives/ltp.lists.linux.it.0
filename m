Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B9455B34
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Nov 2021 13:06:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4F843C886A
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Nov 2021 13:06:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 267623C0BB5
 for <ltp@lists.linux.it>; Thu, 18 Nov 2021 13:06:25 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 05BF7600629
 for <ltp@lists.linux.it>; Thu, 18 Nov 2021 13:06:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 227F21FD37;
 Thu, 18 Nov 2021 12:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637237184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G2n0kcx5w4mgTvykALHC5993dLXIgoyF45w7a3ZoGLo=;
 b=QA1qzpgLT/gK4PrTGqO5PfEkwC+d27vbW7IMlsaRtFrhX0PMTim5V2L7+iTJtD3lq2CTbh
 A5CiR1OcQPrGBK84u7Z/WzfWwhapcgK759GD4Ki3pRGAFybwhkZjji8pHz9XWdG6W2HRdK
 oy4KKjS3tDhT+zlCQtM2EEcgzO2NOcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637237184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G2n0kcx5w4mgTvykALHC5993dLXIgoyF45w7a3ZoGLo=;
 b=MGw5uDB7jjA4fECz+4dU9cfVzk1yL8PbspWoai2Mbi0HALiB8AtFXlBosckvOVQwpGeN09
 D9bo+znDkDOUMjCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BBAF13D00;
 Thu, 18 Nov 2021 12:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PorpAcBBlmF5PAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 18 Nov 2021 12:06:24 +0000
Date: Thu, 18 Nov 2021 13:07:29 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YZZCAXWRcrsYJo9+@yuki>
References: <20211117070708.2174932-1-liwang@redhat.com>
 <77e0b8b9-5de6-73ab-0f73-e3d95bad0935@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77e0b8b9-5de6-73ab-0f73-e3d95bad0935@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/3] lib: adding .supported_archs field in
 tst_test structure
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
> > Testcases for specific arch should be limited on that only being supported
> > platform to run, we now involve a .supported_archs to achieve this feature
> > in LTP library. All you need to run a test on the expected arch is to set
> > the '.supported_archs' array in the 'struct tst_test' to choose the required
> > arch list. e.g.
> >
> >      .supported_archs = (const char *const []){"x86_64", "ppc64", NULL}
> >
> > This helps move the TCONF info from code to tst_test metadata as well.
> 
> while I do like this, I wonder if it wouldn't be better to do this using 
> kernel config. IIRC there are config switches
> for all architectures. Further more this would allow adding more complex 
> conditions in the future.
> 
> E.g: I am pretty sure, that there are some syscalls, that have existed 
> "forever" in x86_64, but where only added
> in a specific version for aarch64. By making the arch a separate option, 
> there is no way, to model this.
> If it was done in the kernel config check, it could be possible to add 
> version and arch checks like
> (CONFIG_AARCH64 && CONFIG_VERSION > 5.3) || CONFIG_X86_64
> 
> While this probably does not produce a very good error message, it is 
> more versatile.
> 
> Sorry for this late questioning the whole approach.

Not at all, this is a good point.

The main problem is that the kernel architecture does not need to match
the binary architecture which is what this patchset tries to cover. That
means that 32bit binary on 64bit kernel would not match what we are
supposed to match. Even more the config variables are confusing, on
x86_64 with compat layer enabled we get:

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y

That makes any reasoning quite messy.

What would make much more sense would be injecting LTP specific
variables to the parsed variables before evaluation. So for instance we
would insert BINARY_ARCH variable which would cover this exact case and
the check would look like:

"(BINARY_ARCH == "aarch64" && CONFIG_VERSION > 5.3) || CONFIG_X86_64"

However I would still like to have a simple list of supported
architectures in the test structure as well, since that is much easier
to read and reason about and it covers 99% of the cases. Nothing stops
us for adding the more complex checks in the case that we see the need
later on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
