Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6223F98EB
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 14:15:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9B3B3C2DDD
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 14:15:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 42FE93C2D5C
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 14:15:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 52DBC600F6E
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 14:15:30 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D5E320215;
 Fri, 27 Aug 2021 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630066530;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bSZf2vdanak7MXA0CBaJLMtShzG8YWB3StyK/hJHuw0=;
 b=EZAEhHIaRVggN19WjL67XtAYLHyRCIPx1kDpsrs9hsZW9XzbcGkEpiQruJaAQv/FHeY6P8
 z8YCOz5147n+pFiv824jugsT/oxpiH0Be/tuNOeqmgED043DMd+hruNHIZDiIoFXyWwbUr
 t5eh54tp6OipktUmRxOoyu0z8ZrJIXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630066530;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bSZf2vdanak7MXA0CBaJLMtShzG8YWB3StyK/hJHuw0=;
 b=NY2PSzHOHX2i+RgwwNskb8L8PRqk665T3m7Fo9qLyjaoKsnJ3dTgFem16s0nTTDRrd404B
 bjzBHKoCcd9+PhCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2AB1513893;
 Fri, 27 Aug 2021 12:15:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 51TMB2LXKGEJUAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 27 Aug 2021 12:15:30 +0000
Date: Fri, 27 Aug 2021 14:15:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YSjXX6NWbDzu5X9m@pevik>
References: <20210827095210.23602-1-rpalethorpe@suse.com>
 <20210827095210.23602-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827095210.23602-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

> Add another check command type. CHECK_NOFLAGS just takes the source
> file name as an argument. By default it is set to
> scripts/checkpatch.pl which is probably the only thing we want to use
> it for. OTOH you can set it to clang-tidy instead.
The same we could do with checkbashisms for tests using new shell API.

> It is run with '-' because of the large number of errors it presently
> produces. Also of course, check errors are not actually fatal. If we
> wish to stop on errors in the future (e.g. for CI) then a "strict"
> option can be introduced.

Thanks for doing this!

Could it be possible to run it only for tests which use new API? Otherwise it
takes long time before we can use it in CI due lots of output from tests using
legacy API:

tst_record_childstatus.c:1: WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
=> tst_record_childstatus.c uses test.h.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
