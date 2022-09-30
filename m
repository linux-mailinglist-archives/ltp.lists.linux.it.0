Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 172B05F0767
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Sep 2022 11:18:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72E313CA59D
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Sep 2022 11:18:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F18193CA52B
 for <ltp@lists.linux.it>; Fri, 30 Sep 2022 11:18:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2CC2F601202
 for <ltp@lists.linux.it>; Fri, 30 Sep 2022 11:17:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CBA62188B;
 Fri, 30 Sep 2022 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1664529479;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o7nVmuGv3OXVtNc5384tLYS6PgkYR8KuHBjMR0dIka4=;
 b=I/SJsiur0WXufR0FU0OSFua1/mtpDtqq7EWLg8iuapdQqlC2v8uLYDZ5vMPG87Jcn9jNPF
 dtiANuAQv02NfbfM8CulobxZ0ca7gOiioBYiIXBYMTnQoAwmiK3erWTbTGS1YSH4Len8ou
 X8Op/yEnBxF8FROkjUZhJjBA6x97NEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1664529479;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o7nVmuGv3OXVtNc5384tLYS6PgkYR8KuHBjMR0dIka4=;
 b=rzNcDaf+gz/D7fKn0LCX6q1altMZhB+y/dJ0gB5sSXyGtA3wwSC9KLTB6Oc+J/K8WBz6+d
 oALu8kSh4NJgcABg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECEA713677;
 Fri, 30 Sep 2022 09:17:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pa50N0a0NmMwWQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 30 Sep 2022 09:17:58 +0000
Date: Fri, 30 Sep 2022 11:17:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <Yza0ROA7bfttCnAD@pevik>
References: <20220927161408.23743-1-rpalethorpe@suse.com>
 <20220927161408.23743-5-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927161408.23743-5-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/6] api/channel: Add channel abstraction for
 message passing
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

Hi Richie,

...
> diff --git a/lib/tst_channel.c b/lib/tst_channel.c
...
> +static void pipe_chan_send(struct tst_chan *self)
> +{
> +	struct tst_pchan *priv = self->priv;
> +	const enum tst_pchan_state state =
> +		TST_STATE_GET(&priv->mach, 1 << PCS_IDLE | 1 << PCS_SEND_DATA | 1 << PCS_RECV_ACK);
> +
> + 	TST_STATE_EXP(&self->mach, 1 << CHS_READY | 1 << CHS_SEND);
nit: git am complains:

Applying: api/channel: Add channel abstraction for message passing
.git/rebase-apply/patch:293: space before tab in indent.
 	TST_STATE_EXP(&self->mach, 1 << CHS_READY | 1 << CHS_SEND);


Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
