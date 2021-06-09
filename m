Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F161B3A16A6
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:09:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9921A3C8FD8
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:09:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 11F0F3C7AE6
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:09:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 578CB600F1B
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:09:04 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C9B7D219B1;
 Wed,  9 Jun 2021 14:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623247743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=karj0iPfy0m9fp18DnOFG0QeB77UUY0ZzxnAIl3LYSk=;
 b=WszB/3dZ1AljZpczMd1SnE8uowfOmbYNXl+DxjvYGzU8TXeRhKJK3hmYQb4NIOlsIMa/2i
 rr/4ymnks02m6us+qAYfEcN9Cc3qzlMfduutB+z6i1OHGgGcXLPYZ/jU3LH9G4gq+pbcwl
 wNEV4wsXd11GWHPOHG2A6+ti3ojm0jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623247743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=karj0iPfy0m9fp18DnOFG0QeB77UUY0ZzxnAIl3LYSk=;
 b=0sgTsl/J4tl9NuzqoHzryPSQ/dzbMFS9MwwIhdU9387l7X3aiYGPqtuMjjAuWYVItDbpMU
 F/155jalhSGRvsBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ACF28118DD;
 Wed,  9 Jun 2021 14:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623247743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=karj0iPfy0m9fp18DnOFG0QeB77UUY0ZzxnAIl3LYSk=;
 b=WszB/3dZ1AljZpczMd1SnE8uowfOmbYNXl+DxjvYGzU8TXeRhKJK3hmYQb4NIOlsIMa/2i
 rr/4ymnks02m6us+qAYfEcN9Cc3qzlMfduutB+z6i1OHGgGcXLPYZ/jU3LH9G4gq+pbcwl
 wNEV4wsXd11GWHPOHG2A6+ti3ojm0jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623247743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=karj0iPfy0m9fp18DnOFG0QeB77UUY0ZzxnAIl3LYSk=;
 b=0sgTsl/J4tl9NuzqoHzryPSQ/dzbMFS9MwwIhdU9387l7X3aiYGPqtuMjjAuWYVItDbpMU
 F/155jalhSGRvsBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id zhwwKX/LwGB+RQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 14:09:03 +0000
Date: Wed, 9 Jun 2021 15:43:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YMDFc+T1WNyy/eMK@yuki>
References: <20210609114659.2445-1-chrubis@suse.cz>
 <20210609114659.2445-4-chrubis@suse.cz> <YMDBFfCZwYDYwWDg@pevik>
 <YMDC/mjGTXxoq9uH@yuki> <YMDKttIQJfdszYgt@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMDKttIQJfdszYgt@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 3/4] lib: Introduce concept of
 max_test_runtime
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
Cc: automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Another option would be to redefine the timeout to be timeout per a
> > fork_testrun() instance, which would make the approach slightly easier
> > in some places, however that would mean either changing default test
> > timeout to much smaller value and annotating all long running tests.
> IMHO slightly better approach to me.
> 
> > Hmm, I guess that annotating all long running tests and changing default
> > timeout may be a good idea regardless this approach.
> +1

I can send a v2 if this approach ends up being prefered...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
