Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C44C49C1
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Feb 2022 16:57:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0B7A3CA1B7
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Feb 2022 16:57:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E5B773C9D4E
 for <ltp@lists.linux.it>; Fri, 25 Feb 2022 16:57:23 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4C9A11400BCD
 for <ltp@lists.linux.it>; Fri, 25 Feb 2022 16:57:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8247A212C0;
 Fri, 25 Feb 2022 15:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645804642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HWdGKf3+lNbrmM7bMzTgK6hACjKYiqZxoohr0YME4HE=;
 b=MyXT/PWEMazvbqXxc9q4LlMZZF88VzuApJqXGCx1TNRberTcJX4HAJkz/UtBYEpel4o5sY
 cW+hKLKQeDQTfgq3hr6L6mFIkbXRr94ZGbPlLEvCbS9eHd9GG1yNqhX8zhMrKH2QsKlBl1
 zWEXJdd4nvrLvW4mc8aOmixr6E+VsLM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645804642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HWdGKf3+lNbrmM7bMzTgK6hACjKYiqZxoohr0YME4HE=;
 b=o2drTMHA2S0jc7MsIg6HFI56gsY1d8+CwvexnsY52e98fO3H0E9Vij3Eh01r7oyeHosnrg
 jbUWJYwd10e0mMCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CBE313BFF;
 Fri, 25 Feb 2022 15:57:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KG1BGGL8GGLSEgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 25 Feb 2022 15:57:22 +0000
Date: Fri, 25 Feb 2022 16:59:38 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <Yhj86k9U46vmGnm9@yuki>
References: <1645519272-2733-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1645519272-2733-3-git-send-email-xuyang2018.jy@fujitsu.com>
 <YhY2fZlfhv++XkMh@yuki> <62173291.3040704@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62173291.3040704@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/7] lib/tst_safe_pidfd: Add SAFE_PIDFD_OPEN
 macro
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Just avoid a big tst_safe_macros.h like tst_safe_sysv_ipc.h does.
> Also the pidfd related syscalls seems no libc wrapper.
> 
> Based on the above two points, I started a new header. Also if you want 
> to merge it into tst_safe_macros.h, I will do(I don't have objection to 
> add this into tst_safe_macros.h ).

I would have just added the definitions to the tst_safe_macros.h, but
it's not a big deal.

Otherwise the actuall code looks good, with the header merged to tst_safe_macros.h:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
