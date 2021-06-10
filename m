Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 373103A2DBE
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 16:08:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCF783C7635
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 16:08:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0AEB33C188E
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 16:08:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2103F200C3C
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 16:08:48 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D7821FD37;
 Thu, 10 Jun 2021 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623334128;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3M4llAVsVU0NtwoteIpcNQ8DBiJABM42nIKaX5hBSeM=;
 b=FynadfNtkYRGTWQe2KPPi7SKoE9K6gmiJoIJm0mmRhK+yChFRgkn8oOGJyQE4IS4jmSenR
 CjqWYKv9bmMUDKxLYsK3BI9QGT+cXLJuGH0XPCEZKbiBUDxRs3jKAcFYuwIb5BogHJgnnI
 EKrE9vidvCrMGkFH008UJndoykCFggk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623334128;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3M4llAVsVU0NtwoteIpcNQ8DBiJABM42nIKaX5hBSeM=;
 b=Alv/qv43UW43MzMpeV3MA3BITPpa0yyS6IJkMKPLqxSQut6rsar00yzdXTUKT7oVcWULXm
 ypHDjU4pBx981wDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2E695118DD;
 Thu, 10 Jun 2021 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623334128;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3M4llAVsVU0NtwoteIpcNQ8DBiJABM42nIKaX5hBSeM=;
 b=FynadfNtkYRGTWQe2KPPi7SKoE9K6gmiJoIJm0mmRhK+yChFRgkn8oOGJyQE4IS4jmSenR
 CjqWYKv9bmMUDKxLYsK3BI9QGT+cXLJuGH0XPCEZKbiBUDxRs3jKAcFYuwIb5BogHJgnnI
 EKrE9vidvCrMGkFH008UJndoykCFggk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623334128;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3M4llAVsVU0NtwoteIpcNQ8DBiJABM42nIKaX5hBSeM=;
 b=Alv/qv43UW43MzMpeV3MA3BITPpa0yyS6IJkMKPLqxSQut6rsar00yzdXTUKT7oVcWULXm
 ypHDjU4pBx981wDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id wJQuCfAcwmCgWwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 10 Jun 2021 14:08:48 +0000
Date: Thu, 10 Jun 2021 16:08:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YMIc7lb+Zs4C1bMr@pevik>
References: <20210610125229.24140-1-pvorel@suse.cz>
 <YMINpZkS4j3bhN9O@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMINpZkS4j3bhN9O@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] newlib_tests: Fix build dependency on lib
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

Hi Cyril,

...
> > -include $(top_srcdir)/include/mk/env_pre.mk
> > +include $(top_srcdir)/include/mk/testcases.mk

> Ah right, this adds dependency on the library and builds it if needed.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> Btw the lib/tests/ subdirectory has the same problem, but I'm not sure
> if we care enough to fix that...
Good catch, I fixed it here and merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
