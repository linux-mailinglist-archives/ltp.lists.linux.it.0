Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C23A69E9
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:18:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CEC23C72C7
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:18:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DBD453C2E47
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:18:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 766E0200AD4
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:18:32 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB7F01FD3C;
 Mon, 14 Jun 2021 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623683911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6nM385muBwA+cOFJa/+fZlRkBGWvysWaYzMAKwJSuy0=;
 b=fSm24J26pyWnKH3Gf5IOEqbrZHvWsI/FXMLWjNs1R/Oxab0mJUMeCmEGrnJM5YCNBE8t8/
 gMHMMrFSqnKuiEl1i3Xtl7bAZ7ET0xAx0pkf6H4I5TcPQGkSxl9RB16B6DH5m+ZHypjAgO
 hQQTLec7zprRVPoaYcwQ/sqESiyMO5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623683911;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6nM385muBwA+cOFJa/+fZlRkBGWvysWaYzMAKwJSuy0=;
 b=ILuGYnRALBA9bktwpSKC4WQqWHfoi2j7h47mS5+wXzQxFZbiNdAsukqO8KlLOcoEdTZj69
 BD2M56IPa+xUdyDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B6721118DD;
 Mon, 14 Jun 2021 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623683911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6nM385muBwA+cOFJa/+fZlRkBGWvysWaYzMAKwJSuy0=;
 b=fSm24J26pyWnKH3Gf5IOEqbrZHvWsI/FXMLWjNs1R/Oxab0mJUMeCmEGrnJM5YCNBE8t8/
 gMHMMrFSqnKuiEl1i3Xtl7bAZ7ET0xAx0pkf6H4I5TcPQGkSxl9RB16B6DH5m+ZHypjAgO
 hQQTLec7zprRVPoaYcwQ/sqESiyMO5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623683911;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6nM385muBwA+cOFJa/+fZlRkBGWvysWaYzMAKwJSuy0=;
 b=ILuGYnRALBA9bktwpSKC4WQqWHfoi2j7h47mS5+wXzQxFZbiNdAsukqO8KlLOcoEdTZj69
 BD2M56IPa+xUdyDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /Q9aK0dzx2D6IAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 14 Jun 2021 15:18:31 +0000
Date: Mon, 14 Jun 2021 16:52:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMdtQWuJzK5fk1SD@yuki>
References: <YMNqQE218QqnPiZY@yuki>
 <20210613171642.7773-1-vinay.m.engg@gmail.com>
 <YMdpulBdM4FEtFm5@yuki>
 <CANUMPcWU-fXLJvLR=4+uv4RJFJQ7-WcozND72RD7aouotLQgng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANUMPcWU-fXLJvLR=4+uv4RJFJQ7-WcozND72RD7aouotLQgng@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] getrusage02: Skipped EFAULT tests for libc
 variant.
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
Cc: umesh kalappa0 <umesh.kalappa0@gmail.com>, metan@ucw.cz,
 Randy MacLeod <rwmacleod@gmail.com>, vinay.kumar@blackfigtech.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Thanks for your review.
> In your corrections for getrusage02.c need below change.

Sorry for missing that, fix pushed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
