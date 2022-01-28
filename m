Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B780249FAB8
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jan 2022 14:31:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FE253C9754
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jan 2022 14:31:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D46E13C9120
 for <ltp@lists.linux.it>; Fri, 28 Jan 2022 14:31:55 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 532EC600724
 for <ltp@lists.linux.it>; Fri, 28 Jan 2022 14:31:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78364212B6;
 Fri, 28 Jan 2022 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643376714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQ16OX3nFoESFhVvyYVjQzkg+wxWzrcRTm2TjGeGutY=;
 b=IF+CaKSgF4C4tNxNl9NlEgI2dArkKJF2ciQNU9MdZJ+V9D45IIXDpAUM8PxB64oo9naqOe
 kZkUciNkp8lLG4LllPw596InBm2kRMh8fKmnujGGSxShWwyvDKUSogAO4iBsUssz2DqbNw
 ZSBFx10B3ibF4bB4vo0NFvs83cSdi/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643376714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQ16OX3nFoESFhVvyYVjQzkg+wxWzrcRTm2TjGeGutY=;
 b=lGWkV1j7H8EfVoT2JijmBlUVGf+CEd1/qEo96TvfaI0kYK/CERhlCngiNWkHEkZT40U3AQ
 ZriRo3hmH9YkMJDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5383B13AAE;
 Fri, 28 Jan 2022 13:31:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r6b9Ekrw82HSAgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 28 Jan 2022 13:31:54 +0000
Date: Fri, 28 Jan 2022 14:33:46 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YfPwulEymVgPHGGR@yuki>
References: <20220125144043.31798-1-pvorel@suse.cz>
 <20220125144043.31798-2-pvorel@suse.cz> <YfPwdgiq7MDM7E8a@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfPwdgiq7MDM7E8a@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] lapi/sched.h: Add include <sched.h>
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
> > We including headers in lapi headers instead of depending headers are
> > included in tests which use lapi headers.
> 
> -ENOPARSE
> 
> The patch itself looks good though.
> 
> So maybe this should be something as:
> 
> Include <sched.h> and "lapi/syscalls.h" in "lapi/sched.h" instead of the
> tests.

Also with the description fixed:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
