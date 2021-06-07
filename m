Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0739D8D8
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:32:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D9A33C565F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:32:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0923B3C187D
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:32:34 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 445EF200BA7
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:32:33 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A35C721A87;
 Mon,  7 Jun 2021 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623058353;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ACBykZwK3+uXLKHNaBCBHCVu6pqs5mbfobd6OtR+s9I=;
 b=wKXcPKuG4VFTDiBdWsJxItHfkb8eYGH09ZBbIz4efr/IwVS6bdUijuJR8IWuNBa/HsZcwF
 CnEiYS1ISB+NXc+aWgbXmztFkd4BZCHQC3pOplaP2PjzV1JV0dc+vzmjTkF8xQ1dLl4kRn
 3p80tN17Odo4TvocBfm489o+q6okGG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623058353;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ACBykZwK3+uXLKHNaBCBHCVu6pqs5mbfobd6OtR+s9I=;
 b=wrcs1B+tqpnTVpW+DN1qW/Ri7yZBTVhRGcLZUqruUPr7R/x/P/Qld54vPQABR9vRBjZ80k
 vT0soRvV8VkM6tBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7D11D118DD;
 Mon,  7 Jun 2021 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623058353;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ACBykZwK3+uXLKHNaBCBHCVu6pqs5mbfobd6OtR+s9I=;
 b=wKXcPKuG4VFTDiBdWsJxItHfkb8eYGH09ZBbIz4efr/IwVS6bdUijuJR8IWuNBa/HsZcwF
 CnEiYS1ISB+NXc+aWgbXmztFkd4BZCHQC3pOplaP2PjzV1JV0dc+vzmjTkF8xQ1dLl4kRn
 3p80tN17Odo4TvocBfm489o+q6okGG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623058353;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ACBykZwK3+uXLKHNaBCBHCVu6pqs5mbfobd6OtR+s9I=;
 b=wrcs1B+tqpnTVpW+DN1qW/Ri7yZBTVhRGcLZUqruUPr7R/x/P/Qld54vPQABR9vRBjZ80k
 vT0soRvV8VkM6tBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Y2ZFHbHnvWC/FAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 07 Jun 2021 09:32:33 +0000
Date: Mon, 7 Jun 2021 11:32:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YL3nsHclCxBYmju4@pevik>
References: <20210603151012.14760-1-pvorel@suse.cz>
 <20210603151012.14760-2-pvorel@suse.cz>
 <40cd7b4a-2988-963f-ead0-6f8ffea01692@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40cd7b4a-2988-963f-ead0-6f8ffea01692@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_ipaddr_un.sh: Properly disable netns
 initialization
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

Hi Alexey,

> > -# workaround to disable netns initialization
> > -RHOST="foo"

> Could be TST_INIT_NETNS="no"
Good point.

> > +TST_NET_SKIP_VARIABLE_INIT=1
> > +

> OK, I think it's better than setting TST_INIT_NETNS and other vars
> (e.g. private _tst_net_parse_variables) here to actually skip init.

+1. Patchset merged with your Reviewed-by: tag. Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
