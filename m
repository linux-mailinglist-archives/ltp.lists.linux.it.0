Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E30F939B936
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 14:51:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48F2E3C7FCD
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 14:51:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 442A53C4F4B
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 14:51:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C77A31001286
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 14:51:45 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 056251FD4A;
 Fri,  4 Jun 2021 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622811105;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S5Fccg8Q4FAXHZwibFzU6FvA1/dYXckRIYRZI2ro4VA=;
 b=xgcXoJz4zvwypKlX5SGnTCFXf9Qr7qKtTNI3c7yiXfmoW7eQ8vhM5V6sxmqkAOhlylq87m
 dejJacWpc2cr0lONbDiiBUaQGPFDoZNklEfnNidM6ZA51N/TpNgNu2aRDFg7Ov2rW+XqiL
 yWD8vuSBte27CG4Gq3+CkG6sAbvxVZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622811105;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S5Fccg8Q4FAXHZwibFzU6FvA1/dYXckRIYRZI2ro4VA=;
 b=dsFZM9r3fOp6vlLjd/WmSl1/pLV+DU2ExvQSrsrvUeX7NXci/BHcut6rDuke9HzL/LMkF+
 GQGDJFl6I40OlcAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C1B92118DD;
 Fri,  4 Jun 2021 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622811104;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S5Fccg8Q4FAXHZwibFzU6FvA1/dYXckRIYRZI2ro4VA=;
 b=FbHXtTIngctGd2s27NP/a26+gmB9GjbnZZy8QjvqIbW02QbWQTRpCShhofKh6XOcwpLLVe
 BAS/iAmSmd0BnEE5AQIEdrsSIf7BfXzz1r9Izm4iV9BeoKwqhxlChEZYCI02MsaB7YdyX7
 aS3OC7Ol8sH/2pBoSR2ja3+IPmCttX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622811104;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S5Fccg8Q4FAXHZwibFzU6FvA1/dYXckRIYRZI2ro4VA=;
 b=yxo7TV3Hv2KN4eBKjiiCo880qRlhXx0UtsnVat3wz67MgO6IY1jfxPOlb4T9EjrAGiuzHW
 GQDU1xApDRx/9uBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id gNusLOAhumBKSAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 12:51:44 +0000
Date: Fri, 4 Jun 2021 14:51:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLoh3jlicZ7E3BFV@pevik>
References: <20210603154825.30165-1-rpalethorpe@suse.com>
 <YLnGIJWPf2XsAdTt@pevik> <875yyuj91v.fsf@suse.de>
 <YLnvOpNr3HlTLWWP@pevik> <YLoPu+To+U+x2md7@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLoPu+To+U+x2md7@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/2] Libclang based analyzer
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

> Hi!
> > run-{c,shell}-api-tests is IMHO too long, but I was thinking about
> > check-{,c,shell}-api. But maybe you're right, let's wait for others opinions.

> I would vote for tests to be executed by 'make test' and the checks that
> Ritchie implements should be started by 'make check'.

> Even the kernel script is called checkpatch.pl so this would be
> consistent with the terms used in Linux kernel.

Sure. It's probably better not mixing these two anyway. It'd be good to run
all these in GitHub Actions and implement make help.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
