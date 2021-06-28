Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E3D3B6912
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 21:29:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91A1C3C6E44
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 21:29:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C9293C1B16
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 21:29:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A586E200164
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 21:29:18 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F15E720327;
 Mon, 28 Jun 2021 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624908557;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FfJPrGxs/MvF7j4f2Zwj9vGj0M+YE+FglMh+A9VyX0=;
 b=iazRMSlba/YjwXlqxdfftqLM4XMBkPT6gLTHbCfHbUk4sFZk7XNjGft3aoV4EvoX9FpD2l
 QorB4VA5NWQ8wIpzLxPx+TMHHZBeJopYRcSj222YiUw4Mh7EWh30YJwk4A6gy5sfudw8RP
 fOe25tgRhXDcG3D+ku/E3Lc2ENOHDX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624908557;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FfJPrGxs/MvF7j4f2Zwj9vGj0M+YE+FglMh+A9VyX0=;
 b=pNyqSZdUPTVhRDoCImDTN1zCAFWGm1mAk80nItU4Z1YtPmb5AWkC7uA5ttMUWNErHCbyZA
 1/QP3R8kJd5nC8Dg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C28AD11906;
 Mon, 28 Jun 2021 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624908557;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FfJPrGxs/MvF7j4f2Zwj9vGj0M+YE+FglMh+A9VyX0=;
 b=iazRMSlba/YjwXlqxdfftqLM4XMBkPT6gLTHbCfHbUk4sFZk7XNjGft3aoV4EvoX9FpD2l
 QorB4VA5NWQ8wIpzLxPx+TMHHZBeJopYRcSj222YiUw4Mh7EWh30YJwk4A6gy5sfudw8RP
 fOe25tgRhXDcG3D+ku/E3Lc2ENOHDX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624908557;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FfJPrGxs/MvF7j4f2Zwj9vGj0M+YE+FglMh+A9VyX0=;
 b=pNyqSZdUPTVhRDoCImDTN1zCAFWGm1mAk80nItU4Z1YtPmb5AWkC7uA5ttMUWNErHCbyZA
 1/QP3R8kJd5nC8Dg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 84hlLQ0j2mBwHgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jun 2021 19:29:17 +0000
Date: Mon, 28 Jun 2021 21:29:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNojDI7jzK0P0QRS@pevik>
References: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
 <20210623135912.81156-2-krzysztof.kozlowski@canonical.com>
 <YNnhawovD2P/JBHu@pevik>
 <c02beb1f-31f8-8902-8be8-27b4bf9ecfe2@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c02beb1f-31f8-8902-8be8-27b4bf9ecfe2@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/4] include/tst_pid.h: fix language typo
 (subtraction)
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

> On 28/06/2021 16:49, Petr Vorel wrote:
> > Hi Krzysztof,

> >>  /*
> >> - * Returns number of free pids by substarction of the number of pids
> >> + * Returns number of free pids by subtraction of the number of pids
> >>   * currently used ('ps -eT') from max_pids
> > Because you change the description of this function in the next commit,
> > I'd just fix this simple typo in 2nd commit. But of course it's not wrong
> > (prevents keeping the fix even if we'd removed second commit).

> The commits should do only one thing (fix one bug, bring one feature if
> possible) and the next commit does not touch that line. There is no
> re-doing of the same change in next commit.
As I wrote in this case I wouldn't bother (with test rewrite to new API there
are much more changes in single commit), but sure you're right this is the best
practice which we follow.

Kind regards,
Petr

> Best regards,
> Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
