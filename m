Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DCA59E510
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Aug 2022 16:22:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6E423CA328
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Aug 2022 16:22:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A70753C93EF
 for <ltp@lists.linux.it>; Tue, 23 Aug 2022 16:22:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0842A2002DD
 for <ltp@lists.linux.it>; Tue, 23 Aug 2022 16:22:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 41FA7336D1;
 Tue, 23 Aug 2022 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661264526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aMVLZLt549c2fIRhacpdrgKpC2YdIOHFaDChZ1OywnI=;
 b=LTVL4s3BDnqgcdvydBqwerl0J44FwjsjV8+qu+rgU+ESmEhssFmaUqT70hUhwql9dRnkXO
 hzcqlHXBTgRQdpS1iUt0dHqCqN4aepx1wZgQbcJpykfXxJBBE9FOB5iJh71bGBhNqt0eSV
 qHIHvwy0sEORAhdzqGien9f2OXIQT64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661264526;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aMVLZLt549c2fIRhacpdrgKpC2YdIOHFaDChZ1OywnI=;
 b=xEGD98HaOcbZgsoRusAWJPK0GKeXG94D014LkpYxPl32z5oa7ESAO58DCByjbEis/Jy+6H
 AXLDqQy4ENQymvBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29BEA13AB7;
 Tue, 23 Aug 2022 14:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BZLsCY7iBGPCfQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 23 Aug 2022 14:22:06 +0000
Date: Tue, 23 Aug 2022 16:24:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YwTjBO6ko9SoDVjd@yuki>
References: <20210303023235.431238-1-yangx.jy@cn.fujitsu.com>
 <YEigO2gryF1Kp6Gq@pevik>
 <b11680c3-7878-b06b-e87a-8991bd3cb305@163.com>
 <YEkAH6xJlSK99bp+@pevik> <YEnx4V3Il/VrThv/@pevik>
 <YEn0BK8xHVU1e52X@yuki.lan> <YEtK/A2mGoEZjF8Q@pevik>
 <YEtox4nFn3DO1KHv@yuki.lan> <YEtrkUmj9j0ej/r6@pevik>
 <YhjNpL9C3PP6Yd4U@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YhjNpL9C3PP6Yd4U@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Use anonymous .resource_files for
 docparse
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>   "execveat02": {
> -   "resource_files": "resource_files",
> +   "resource_files": [
> +     "TEST_APP"
> +    ],
> 
> => improvement => I'd merge this patch.

Agreed, can we merge this patch? Or is there a reason not to?

> NOTE: It'd be nice if even TEST_APP was changed to execveat_child,
> not sure what needs to be one for it. NOTE the definitions are mostly in C
> source:
> 
> #define TEST_APP "execveat_child"

I guess that this point has been discussed in the

"metaparse: Replace macro also in arrays"

where we agreed that we will need a list of macros that should not be
expandened.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
