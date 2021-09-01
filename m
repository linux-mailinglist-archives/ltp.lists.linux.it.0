Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7503FE275
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 20:38:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73A823C774B
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 20:38:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9B5933C2A0B
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 20:38:06 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7640C1A00496
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 20:38:06 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BEC5A20235;
 Wed,  1 Sep 2021 18:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630521485;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oh+N14ECA6h0r/2MB35fUF/Ly8NEvfTYk+F85guK/xU=;
 b=qRIO/qRRnNo1ji5Tk4TFk5k/p/yxkHjqMenDQXJKpXxB6XRulpW0qDl4UB5dLyAIL+giq9
 i6s/AFGNcxV1r2DaV1kLJMAFMjsUQ+uD9c7Z3Ozr86w4YUqMIPs4FNKpDTlcRbrsVeIJbW
 VjdIyP9U+UfmZgsJFdBAf3wy6O6RiA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630521485;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oh+N14ECA6h0r/2MB35fUF/Ly8NEvfTYk+F85guK/xU=;
 b=1Ohlx4Jp73bhHCjvacw3xUN2lCLoAnrqH0NGSBx3h7bqZawjGsCbl0M+AQ7/YNSA+rwgqI
 Lmho7iaY4luXI5Aw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6E5A113AEA;
 Wed,  1 Sep 2021 18:38:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id PQijF43IL2GELAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 01 Sep 2021 18:38:05 +0000
Date: Wed, 1 Sep 2021 20:38:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YS/Iiy7xWGZJEayN@pevik>
References: <20210901151655.95760-1-krzysztof.kozlowski@canonical.com>
 <20210901151655.95760-2-krzysztof.kozlowski@canonical.com>
 <YS/DGPyHmEHnRSZk@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YS/DGPyHmEHnRSZk@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/3] controllers/cpuacct: skip cpuacct_100_100
 on small memory systems
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

> Hi!
> > +check_limits()
> > +{
> > +	local tasksneeded=$((max * nbprocess + 100))

> We allready have some reserve for the system in the tst_get_free_pids()
> so shouldn't this be just max * nbprocess ?

Yes:
lib/tst_pid.c

/* Leave some available processes for the OS */
#define PIDS_RESERVE 50

I suppose 50 is enough, but if 100 is experienced to be needed I'd update PIDS_RESERVE.

Also, because you introduced use of awk, I'd add TST_NEEDS_CMDS="awk". Or is it
that common even on embedded systems that we don't bother?

NOTE: all changes can be done during merge, we just need to agree on it.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
