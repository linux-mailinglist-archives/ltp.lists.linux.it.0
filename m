Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB37143D0
	for <lists+linux-ltp@lfdr.de>; Mon, 29 May 2023 07:51:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CD4D3CCDCE
	for <lists+linux-ltp@lfdr.de>; Mon, 29 May 2023 07:51:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B1A23C9C39
 for <ltp@lists.linux.it>; Mon, 29 May 2023 07:51:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B5673600125
 for <ltp@lists.linux.it>; Mon, 29 May 2023 07:51:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 858CC21A4A;
 Mon, 29 May 2023 05:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685339472;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1gmv/yubOWRxpSTEx7oU5/J0h4YEexTYSDOrauv0S+A=;
 b=VLZM9Pi0xSjCpYOUB4GQxxF1M2jcsKvyEYGIIM/POCvL2sOAMUffyeIW0uRWeYBtjJzBWX
 bYggUe/0vvrlfgmUWP7cf5LsPHtH3Mv7X3mgIl355jjFNYHMCGU9dQh6UDxTThT80LAQh3
 GODQeAkJAa403TcseOh8dOVNGVF6X8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685339472;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1gmv/yubOWRxpSTEx7oU5/J0h4YEexTYSDOrauv0S+A=;
 b=HYB9KBrOO4V8T0YtuxtsszcX1w7Sf2OTWmM9Y1iPvGI5NRi+bEYxZRqzRohcDtsKpJzA1L
 gQC987tDi73a0BBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35507133F7;
 Mon, 29 May 2023 05:51:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Wo2zClA9dGSnNQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 29 May 2023 05:51:12 +0000
Date: Mon, 29 May 2023 07:51:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20230529055110.GC6579@pevik>
References: <20230526133435.7369-1-mdoucha@suse.cz>
 <20230526133435.7369-5-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526133435.7369-5-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/7] KVM: Add async communication helper
 functions
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
Cc: Nicolai Stange <nstange@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Some KVM tests need to communicate with VM controller program
> without stopping guest execution. Add guest helper functions
> for sending asynchronous guest signal to host and waiting for host
> to acknowledge the signal. Add host helper functions for waiting
> for guest signal and acknowledging it.

> Test programs using these functions must have at least two host threads.
IMHO we don't have flags to require this. I guess KVM hosts nowadays should have
more than 2 threads (these tests are for bare metal), thus we don't have to note
this also in the code, right?

Anyway LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Waiting some time if Cyril, or somebody else will have time to look into this
change before merging whole patchset.

NOTE: whoever will merge this, it requires to change second commit:
https://lore.kernel.org/ltp/20230526142745.GA813136@pevik/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
