Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DC3B0741
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:20:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BEE33C9473
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:20:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1AE0F3C229E
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:20:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A80E6200097
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:20:04 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0DB7921966;
 Tue, 22 Jun 2021 14:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624371604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uorpMuEUqHVRs1Ld+fbWKnWNRMNc7jS1mSQNZPe+pBU=;
 b=x2KdvJodG+LsiHcjFO3Skv6lFwmMmsJxngkKwjfAHZxTGAyDu1+A0OAA9cKZe7NAHCstEJ
 fcGSm5lfeOxnbxU0MC5PTjG9HiKiDIEmPzAEN/ssjoHXGt0YxGXyOfG8+pTAU8e/mJF3ju
 L7PPhwXypm3VWqVlUMxVHlWmN4Rm6Ac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624371604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uorpMuEUqHVRs1Ld+fbWKnWNRMNc7jS1mSQNZPe+pBU=;
 b=M6s96zLyLT9M0/hIqCZdKfN49ixDccA8WzrPB2PkIKMxDLKqZOigdDEj9VVVISfmrd6iSo
 sJ5lT6GiE04bvsAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E1950118DD;
 Tue, 22 Jun 2021 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624371604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uorpMuEUqHVRs1Ld+fbWKnWNRMNc7jS1mSQNZPe+pBU=;
 b=x2KdvJodG+LsiHcjFO3Skv6lFwmMmsJxngkKwjfAHZxTGAyDu1+A0OAA9cKZe7NAHCstEJ
 fcGSm5lfeOxnbxU0MC5PTjG9HiKiDIEmPzAEN/ssjoHXGt0YxGXyOfG8+pTAU8e/mJF3ju
 L7PPhwXypm3VWqVlUMxVHlWmN4Rm6Ac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624371604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uorpMuEUqHVRs1Ld+fbWKnWNRMNc7jS1mSQNZPe+pBU=;
 b=M6s96zLyLT9M0/hIqCZdKfN49ixDccA8WzrPB2PkIKMxDLKqZOigdDEj9VVVISfmrd6iSo
 sJ5lT6GiE04bvsAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id b9oINpPx0WCwVgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 22 Jun 2021 14:20:03 +0000
Date: Tue, 22 Jun 2021 15:54:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YNHrldS4vrr2BN/t@yuki>
References: <20210622113514.22284-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622113514.22284-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/8] Fix uninitialized var errors
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
> In a lot of cases the compiler is simply confused and gives an error,
> but there is no undefined behaviour. This is often caused by tst_brk
> which is the source of much confusion. Most likely there should be two
> versions of tst_brk. One which never returns and is used by test
> authors and one which can return, but is usually only used in library
> functions which may be called from cleanup.

Having two tst_brk() wouldn't solve much since all SAFE_MACROS() still
needs to use the one that may return.

So as far as I can tell it's easier to initialize variables to 0 in the
few cases where compiler ends up confused.

Anyways whole patchset pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
