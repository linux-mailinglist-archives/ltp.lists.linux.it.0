Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 468BA39B267
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 08:12:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDB9F3C4EC9
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 08:12:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF40D3C283C
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 08:12:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CDFC7200FC5
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 08:12:24 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC9E81FD37;
 Fri,  4 Jun 2021 06:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622787143;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7iVIXLY48l/m+ZfuzLg2BEpN3sXUsW8b91O7Xofd+MM=;
 b=uByr0CEEflb4MUXJWpxAO5E0PPcgBzL3avblSvh7YvZWiqWC/XGw/uaZr9wqlJzy1MdVH+
 IgLTojyUnbwP4zGdMgl/hoivJlDp8xV7GnOlp42iKs/V7QnjnKpLQY0zdI0pdldZC6eYmY
 yBKikE/mNt55fIqCvswcwlw4UNCO2ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622787143;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7iVIXLY48l/m+ZfuzLg2BEpN3sXUsW8b91O7Xofd+MM=;
 b=+psEEsbFpToaetkNZD/lbQDbXVizaOL9b0b0Z8a/0rLx7DR6HytGJaMePpLfMMau313n4z
 L4FIyaGwHVkYByCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A24F7118DD;
 Fri,  4 Jun 2021 06:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622787143;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7iVIXLY48l/m+ZfuzLg2BEpN3sXUsW8b91O7Xofd+MM=;
 b=uByr0CEEflb4MUXJWpxAO5E0PPcgBzL3avblSvh7YvZWiqWC/XGw/uaZr9wqlJzy1MdVH+
 IgLTojyUnbwP4zGdMgl/hoivJlDp8xV7GnOlp42iKs/V7QnjnKpLQY0zdI0pdldZC6eYmY
 yBKikE/mNt55fIqCvswcwlw4UNCO2ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622787143;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7iVIXLY48l/m+ZfuzLg2BEpN3sXUsW8b91O7Xofd+MM=;
 b=+psEEsbFpToaetkNZD/lbQDbXVizaOL9b0b0Z8a/0rLx7DR6HytGJaMePpLfMMau313n4z
 L4FIyaGwHVkYByCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id RBRVJkfEuWBLHwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 06:12:23 +0000
Date: Fri, 4 Jun 2021 08:12:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Message-ID: <YLnERhx/f8evU0uQ@pevik>
References: <20210603154825.30165-1-rpalethorpe@suse.com>
 <20210603154825.30165-2-rpalethorpe@suse.com>
 <YLnC05icNAshbXtr@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLnC05icNAshbXtr@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/2] Add 'make checks' and clang-checks to
 build system
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

> Hi Richie,

> > Allows the user to run 'make check' to check all source files or
> > 'make check-<target>' to check one source file corresponding to a
> > target.

> > Adds makefile pieces for tools/clang-checks/main which will be a
> > libclang based tool. By default this is ran by 'make check'.

> Compilation does not work from tools directory:

> $ cd tools/ && make
> ../include/mk/testcases.mk:25: ../include/mk/clang-checks.mk: No such file or directory
> make: *** No rule to make target '../include/mk/clang-checks.mk'.  Stop.

I guess you forget to add git add include/mk/clang-checks.mk, right?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
