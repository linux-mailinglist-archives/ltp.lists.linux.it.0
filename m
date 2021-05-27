Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A61393134
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 16:44:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C2003CA10F
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 16:44:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F164C3C9912
 for <ltp@lists.linux.it>; Thu, 27 May 2021 16:44:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6D8B8200FC6
 for <ltp@lists.linux.it>; Thu, 27 May 2021 16:44:14 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE1A9218DD;
 Thu, 27 May 2021 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622126653;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MV1CtldKrEkhW0II5Bgg79GweRiK4j8P8N9FPHmm5BE=;
 b=nYyEQshdDyxK6L1MQoOUzwJZjzf4/+4MeIKlQgoqFlhkaAz8TcBqXj4LHMePsMWZx4IKHE
 0ynBAQsf/VS6m5x/5JlBo4CUSy2dKxrdOXmmo7nxxIYWvqCb/f5PAEUdvaFghFQzoDy597
 /TiUEZnlRnHua/lsoTvQkJczSJIJWnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622126653;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MV1CtldKrEkhW0II5Bgg79GweRiK4j8P8N9FPHmm5BE=;
 b=G0jYaWVCQZPBCeuWsZTybHf1R2h6hnsMqIEWtxdRCPFnhOoQcBIhYA1Us4QsAJMg4wAl4Z
 e5DYQEUwfFOaE+Ag==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 748FE11A98;
 Thu, 27 May 2021 14:44:13 +0000 (UTC)
Date: Thu, 27 May 2021 16:44:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YK+wPLPBEHxH5gmq@pevik>
References: <20210526154949.4473-1-pvorel@suse.cz>
 <YK+QeafN4q6IUvOn@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YK+QeafN4q6IUvOn@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Split test-writing-guidelines
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

> Hi!
> > Test Writing Guidelines wiki page is too long, thus split it
> > into 3 parts:

> > 1) generic part (only first chapter, the same URL)
> > 2) C test API (2.2 chapter, 4. Common problems)
> > 3) shell test API

> > Unfortunately this breaks users' bookmarks.

> > Start numbering in headers from 1 on each page (links are broken
> > anyway).

> > NOTE: in order to have '...' formatting as code,
> > main header ====== was needed to add on the page.

> The split looks good to me, acked.
Thank to you all, merged.
Unfortunately I left two things, thus two more small fixes were needed.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > See it:
> > https://github.com/pevik/ltp/wiki/Test-Writing-Guidelines

> This page should be updated, at least the paragraph about commenting code
> should now explain top level comment format.

> The backward compatibility should be improved as well, since we have
> kernel config parser now as well, etc.

> I guess that I should sit down and write a patch for that one once the
> split is applied.

Agree to all.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
