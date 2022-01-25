Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD849B2D6
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 12:20:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50A103C92A9
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 12:20:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BADE63C54C9
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 12:20:36 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1D27B1A00933
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 12:20:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4AC3E21111;
 Tue, 25 Jan 2022 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643109635;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1U7GAUoleo9Lz4LWNRMZwC7p4TSKRomGMOlAtVIZwLY=;
 b=lMhzxDjT6fz7bs/rT2THHnm0TLcvaVi/LEAua7pZ2R321CPqxCiL4qiSlKdiay6nuNTjXj
 yTE3F4cQz4IL7ux063Ro6jZ031W9MFQb4Jakv0oHvTlVDvo6PiI8Vc3rCtXw8Iz/8BVpf1
 jXGZeJoFmBx4N+s2TIGPwbK1I8gwgdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643109635;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1U7GAUoleo9Lz4LWNRMZwC7p4TSKRomGMOlAtVIZwLY=;
 b=V4+wwN9cSYZeA9wNpeC2gVYRC5uRVkwUfJ2S2TJTfCZY652Ni25K+lEkY5Zaj5wAnJHjvQ
 rlQnA/dDPIEUZ2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B945A13DBC;
 Tue, 25 Jan 2022 11:20:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2dMVIQLd72G/BgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 25 Jan 2022 11:20:34 +0000
Date: Tue, 25 Jan 2022 12:20:31 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Ye/c/+wNRVvwKqHI@pevik>
References: <20211220201814.31596-1-pvorel@suse.cz> <YcH7m45TKEWaDrG3@yuki>
 <Ye615gN0Yv1/WskD@pevik> <Ye/V4CoUHqwE5eGs@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ye/V4CoUHqwE5eGs@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] sched_get_priority_max01: Add more policies
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

...
> > I guess SCHED_RESET_ON_FORK would deserve it's own test (man sched(7):
> > when set, children created by fork(2) do not inherit privileged scheduling
> > policies).

> Yes please. Either write the test or at least create a github issue.

https://github.com/linux-test-project/ltp/issues/905
Marked as easyhack and wait some time to let new comers to take it before
implementing it myself.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
