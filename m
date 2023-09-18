Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC53F7A48B7
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 13:47:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACC573CB20B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 13:47:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF85B3CA983
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 13:47:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 280191A00F99
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 13:47:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4782A1FE3A;
 Mon, 18 Sep 2023 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695037673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFkxOOiER9k2Uio16G46S4ffO3AuK3CnKU4LxXNvM2s=;
 b=wFwql/7DQgxF/SirKos3WCIiX49Lk5JdlBngRV69EYtoILN3OS2BG+mGnc4quRte02htpb
 V1KEtEjPYwottuHFgFMt+e/yti1JR1ouFL1ovmeudYIx8XyLrADW0+p3gzDgMHheHuKay4
 QPpyr4XykTvXZox7YUAuCNn7SH23dnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695037673;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFkxOOiER9k2Uio16G46S4ffO3AuK3CnKU4LxXNvM2s=;
 b=iKe1yiockTeTpLTWVPKPA71eO1MSi86zmqWjRA+fkA3tp3j+OlvTe27MsRwUpxNBsSvm4F
 4sDBwWZzNN0s2bDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CC0E13480;
 Mon, 18 Sep 2023 11:47:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id srVPCek4CGWYYQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 18 Sep 2023 11:47:53 +0000
Date: Mon, 18 Sep 2023 13:48:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZQg5FZuKujZeI403@yuki>
References: <20230918110737.1922-1-andrea.cervesato@suse.de>
 <20230918110737.1922-2-andrea.cervesato@suse.de>
 <20230918113947.GA4279@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918113947.GA4279@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/2] Replace runltp-ng with kirk framework
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I dared to send yet another fix for kirk Makefile:
> https://patchwork.ozlabs.org/project/ltp/patch/20230918113524.17908-1-pvorel@suse.cz/
> 
> kirk should remain as the original file, runltp-ng is the link name.
> 
> If you agree with it, I'll merge the fix to kirk repo and update the git has in
> this patch.

Green light from me. Feel free to also merge the Add kirk & ltx tools
but do not forget about ack from Ritchie and please add also my
Reviewed-by.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
