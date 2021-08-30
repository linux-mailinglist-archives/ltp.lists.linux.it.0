Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B0D3FB6FD
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 15:33:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8CCC3C2B6C
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 15:33:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DFEF83C0234
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 15:33:19 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 094C31400779
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 15:33:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49D5622145;
 Mon, 30 Aug 2021 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630330398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Dr55WggPAW1gEReII/XqRV2HMehm0LOOJzC2Q85k3M=;
 b=LEwe7nyhXlnqMwcQWlSf+E4ZAfQa/LHYVAJcke7RHTT6GAxk56kqtkYJ3oDnlsoNkD8pBu
 BHfS5mFBlaKNWHY/Hx2+kQL0VCvCSoAzAiAOWwT3iMFmGHHZeDO5RmIf30TNm9MapHSduw
 /lV8lZDO3GkoNnNvRON9aWK7p9KUAcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630330398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Dr55WggPAW1gEReII/XqRV2HMehm0LOOJzC2Q85k3M=;
 b=bXiEkvZPclPE6bZj+3AimROrS0DxS7R8tdw3p8qu+6zcw+NpbGr0C6kaC7TVysLeYjS8W3
 gX3EVemOhGRvXuBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 303D013A98;
 Mon, 30 Aug 2021 13:33:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id weaiCh7eLGGrJQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 30 Aug 2021 13:33:18 +0000
Date: Mon, 30 Aug 2021 15:33:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YSzeJvfWZja/oKnR@yuki>
References: <20210827095210.23602-1-rpalethorpe@suse.com>
 <20210827095210.23602-2-rpalethorpe@suse.com>
 <YSjXX6NWbDzu5X9m@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSjXX6NWbDzu5X9m@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Add CHECK_NOFLAGS and checkpatch.pl to 'make
 check'
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Add another check command type. CHECK_NOFLAGS just takes the source
> > file name as an argument. By default it is set to
> > scripts/checkpatch.pl which is probably the only thing we want to use
> > it for. OTOH you can set it to clang-tidy instead.
> The same we could do with checkbashisms for tests using new shell API.

This would be a good idea as well.

> > It is run with '-' because of the large number of errors it presently
> > produces. Also of course, check errors are not actually fatal. If we
> > wish to stop on errors in the future (e.g. for CI) then a "strict"
> > option can be introduced.
> 
> Thanks for doing this!
> 
> Could it be possible to run it only for tests which use new API? Otherwise it
> takes long time before we can use it in CI due lots of output from tests using
> legacy API:
> 
> tst_record_childstatus.c:1: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> => tst_record_childstatus.c uses test.h.

Well I do see this to be mainly targetting development so that everyone
can do 'make check' before submitting. So I would like to get this
merged ASAP and we can try to make it work with CI later on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
