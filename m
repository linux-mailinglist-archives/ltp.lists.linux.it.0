Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D84397096
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:51:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C47AB3C68F6
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:51:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A921F3C222C
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:51:32 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 047741000DD2
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:51:31 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A346218B4;
 Tue,  1 Jun 2021 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622541091;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MhwOK3iW+VnvdZ2BG3O8WIsV9MBNRWcjcP3kT3CmEyo=;
 b=hLqGzyuisl9lkVtTDQcdLk0tQxsufvIKDKfnBJcebUygEqXF8GHk+8wQMTmiioQrGWlBSO
 xfy/IjKBxSMet+U1lT3WI+z70HSO8blw6gHCLES8BCLi1pPZem9XFZmEBS7Fvj1EmSt/oR
 wmeYsQpXqz3ff4GnOkScJfHwUAYMVJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622541091;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MhwOK3iW+VnvdZ2BG3O8WIsV9MBNRWcjcP3kT3CmEyo=;
 b=6j7YJAoPWG75XNYBDtnvqu2Uy91aEMTqWsoFrXSpK4qxE79jWwYLN7sUqn4agtDYZ9z4yN
 AyFcR9NSt6/ZwHBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 30281118DD;
 Tue,  1 Jun 2021 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622541091;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MhwOK3iW+VnvdZ2BG3O8WIsV9MBNRWcjcP3kT3CmEyo=;
 b=hLqGzyuisl9lkVtTDQcdLk0tQxsufvIKDKfnBJcebUygEqXF8GHk+8wQMTmiioQrGWlBSO
 xfy/IjKBxSMet+U1lT3WI+z70HSO8blw6gHCLES8BCLi1pPZem9XFZmEBS7Fvj1EmSt/oR
 wmeYsQpXqz3ff4GnOkScJfHwUAYMVJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622541091;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MhwOK3iW+VnvdZ2BG3O8WIsV9MBNRWcjcP3kT3CmEyo=;
 b=6j7YJAoPWG75XNYBDtnvqu2Uy91aEMTqWsoFrXSpK4qxE79jWwYLN7sUqn4agtDYZ9z4yN
 AyFcR9NSt6/ZwHBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Hli8CiMDtmBhdwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 09:51:31 +0000
Date: Tue, 1 Jun 2021 11:51:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLYDITE2xCkzfAOX@pevik>
References: <20210531165052.8731-1-pvorel@suse.cz>
 <20210531165052.8731-3-pvorel@suse.cz> <YLX5vtHAFVWUmjmU@yuki>
 <YLYAg9oM0XL4Q0/I@pevik> <YLX7K7oPmSSqXfxO@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLX7K7oPmSSqXfxO@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] CI: Rename travis script directory
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > I'm sorry, didn't read carefully that the first ack isn't for whole patchset,
> > thus merged whole patchset with your ack.

> The rest looks good as well and we really need working CI so no
> problem...
FYI: there are temporary repository sync problem on Tumbleweed
(problematic obviously both last Travis CI build and new GitHub
Actions builds):

No provider of 'ruby2.5-rubygem-asciidoctor' found.
https://travis-ci.org/github/linux-test-project/ltp/jobs/773129654
https://github.com/linux-test-project/ltp/runs/2717311009

It should be fixed soon.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
