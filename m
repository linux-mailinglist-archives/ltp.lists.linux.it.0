Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 507025B6972
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 10:23:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A54FC3CAAEA
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 10:23:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1ED753CA900
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 10:23:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4BEFE6001F4
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 10:23:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F3303495C;
 Tue, 13 Sep 2022 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663057427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+VLix4rhuwqrKW2N7mLdMWo87DL18rWtxcRjtWbK8TI=;
 b=MLJiGpMwXSTH/VSXlD8O3s9PSC/x6GwBcdE9O4HaTO4MTP7Rl1ojROt7tgNhtjrZIdMgfy
 qx7t+CegrD0RuyVMvveHvbuCNoQ4Bxn7DGSAGT2hm82ZP0Ezsh0cG8ZG+tl2gnv9xBC1Hm
 2fjY2TThy0jp/a6N9V1KWyvL6fRKRfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663057427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+VLix4rhuwqrKW2N7mLdMWo87DL18rWtxcRjtWbK8TI=;
 b=3tJHs+/+nQ/+kqnaWFjM8XFE7wLykzQOg88r6xklZyVcsg3kdda57qLuvIw/nP98Ve/hXT
 osEwOCYFS+X3/oCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56C6E139B3;
 Tue, 13 Sep 2022 08:23:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n5qtFBM+IGPyFgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 13 Sep 2022 08:23:47 +0000
Date: Tue, 13 Sep 2022 10:25:43 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YyA+hyLQ5hy0UdZA@yuki>
References: <20220910170518.17006-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220910170518.17006-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Add .mailmap
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
Cc: Jiri Jaburek <jjaburek@redhat.com>,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> although I prefer to keep signing non-SUSE work ("after work hacking")
> with my private gmail mail, for release counting purposes it's better to
> keep only SUSE mail.

I usually fix the duplicates by hand, we even have typos there so some
post processing is needed anyways. And it takes less than 5 minutes
too.

On the other hand there is no reason not to add this.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> I suppose others want to update their mail. I didn't dare to add these,
> feel free to send patch with your setup:
> 
> Andrea Cervesato <andrea.cervesato@suse.com> <andrea.cervesato@suse.de>
> Jiri Jaburek <jjaburek@redhat.com> <jjaburek@users.noreply.github.com>
> Richard Palethorpe <rpalethorpe@suse.com> <rpalethorpe@suse.com>
> Yang Xu <xuyang2018.jy@fujitsu.com> <yangx.jy@cn.fujitsu.com>

I guess that everyone should add their aliases if they want to.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
