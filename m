Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 860A4399FCA
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:30:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3316D3C53C5
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:30:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6CDA13C288A
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 13:30:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A9827140020B
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 13:30:53 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 784171FD4E;
 Thu,  3 Jun 2021 11:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622719852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HABWV9Fh/DPSYx1yzVo2UcVt5dLf6KkwXqSAjO5sF44=;
 b=dWzjuMdzCHpVh+9N2rivaMVkq3bn6Eeb5cwKqvjDCTfjB75WEGxPwkoepmXapDyabGNZOQ
 Yyb6ZQlLb1/gbpzQQOO/1dLa96AFCgqCylpQ8LNa16Apk3zGnyZZ5eBaJgUI4bYECkNUDH
 wg8jCoc1hcDYaO6YPOchDoIXEzY79Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622719852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HABWV9Fh/DPSYx1yzVo2UcVt5dLf6KkwXqSAjO5sF44=;
 b=TB1H1rt+ksgsJKYsJ9Wk49VbAIwQibVlLP9yrzidkSDplg4yTSknjqdWAYpcNzROLNGzzR
 qVQN5MnQullfobBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 611DE118DD;
 Thu,  3 Jun 2021 11:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622719852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HABWV9Fh/DPSYx1yzVo2UcVt5dLf6KkwXqSAjO5sF44=;
 b=dWzjuMdzCHpVh+9N2rivaMVkq3bn6Eeb5cwKqvjDCTfjB75WEGxPwkoepmXapDyabGNZOQ
 Yyb6ZQlLb1/gbpzQQOO/1dLa96AFCgqCylpQ8LNa16Apk3zGnyZZ5eBaJgUI4bYECkNUDH
 wg8jCoc1hcDYaO6YPOchDoIXEzY79Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622719852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HABWV9Fh/DPSYx1yzVo2UcVt5dLf6KkwXqSAjO5sF44=;
 b=TB1H1rt+ksgsJKYsJ9Wk49VbAIwQibVlLP9yrzidkSDplg4yTSknjqdWAYpcNzROLNGzzR
 qVQN5MnQullfobBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 6oBhFmy9uGC3ewAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 03 Jun 2021 11:30:52 +0000
Date: Thu, 3 Jun 2021 13:05:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLi3XqA3hLh7HWqn@yuki>
References: <YLeA8KOphpVg3IDP@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLeA8KOphpVg3IDP@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Reduce LICENCE/COPYING files
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
Cc: Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I suppose it's safe to keep only single licence in testcases/open_posix_testsuite/,
> but could we keep only COPYING in the root directory and delete the rest?
> Or keep COPYING and testcases/open_posix_testsuite/COPYING only?

Do we even need these files? Isn't SPDX identifier enough these days?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
