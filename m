Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3349865A
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 18:20:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CF483C8A9A
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 18:20:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 68A1C3C6F6F
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 18:20:26 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F024D1000457
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 18:20:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 396C62199B;
 Mon, 24 Jan 2022 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643044825;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xfjtheu/n++h/xDTfCgyoAtTEKt2D4sRg/rPiiepxkQ=;
 b=fWrtlm/gAQC+QkC+y+2GMIR0v+X0y22u376Q/KuLptgm3e5LI4RUWqibgvbidUjLQwkrBS
 V3uQXSDe9+D4xijF7uP3Vs5MhQkuLEQXLhGpv48mAx/e++yIwBrruRr3Zouo8ykRYgm2dL
 tyCc68eScL8BEJql0aguJXK22lhj2gc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643044825;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xfjtheu/n++h/xDTfCgyoAtTEKt2D4sRg/rPiiepxkQ=;
 b=rTlL/3BMQYHnQZk4vTuSThfqE0u0WXZBnaB+D/+5j45PRYaz57ZwXYRaWTx9+TfUB/y8qF
 vpVESJtyOPbgfZDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 165B013C44;
 Mon, 24 Jan 2022 17:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xnUZBNnf7mFoXAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 24 Jan 2022 17:20:25 +0000
Date: Mon, 24 Jan 2022 18:20:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
Message-ID: <Ye7f163YDnEX/UEW@pevik>
References: <20220124065937.17383-1-pvorel@suse.cz>
 <d566cf35-7e73-5052-4f77-2bbe05ba8904@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d566cf35-7e73-5052-4f77-2bbe05ba8904@virtuozzo.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] rpc_lib.sh: Check for running RPC
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
Cc: NeilBrown <neilb@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Nikita,


> Yes, it fixes that.

> Btw, easy test is:
>   systemctl stop rpcbind.service
>   runltp -f net.rpc

> After applying your patch, that results in no TCONF from rcp01.sh, because
> rpcbind.socket is still there, and systemd restarts rpcbind on request.
Thanks for verifying it!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
