Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ACE3B4191
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 12:24:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 242B23C6EF1
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 12:24:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 09E9E3C1D46
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 12:24:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 668F0601140
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 12:24:35 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C213221C0A;
 Fri, 25 Jun 2021 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624616674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WhavVeOrstdGWvOVzt+tl33KokVXTbvFwgkqXjUz+gQ=;
 b=Y7P7EsGSAKLS1RYKsbbetjXg8dami/AzZsXj+jTm64PewoClh4Hg5LoLDV/jK8FhaidLS3
 2CqMiNnKzEWKQZup4rI5LCvofCkT12o4I/UKvTyqnpR7i6H+Pa+Q3FFT16trhbohiL4ofk
 a8Q+EX2ArhQC4dhP/D11f5rveWtnjzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624616674;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WhavVeOrstdGWvOVzt+tl33KokVXTbvFwgkqXjUz+gQ=;
 b=p+94zeg+H1YjvEeibioX6sK0kr7xvV34SMi/WEfmaO/u84py+Nuy7+jJ0Aeo7vai3wHw2p
 h4yi/WHmYtiwbPCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9EA1D11A97;
 Fri, 25 Jun 2021 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624616674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WhavVeOrstdGWvOVzt+tl33KokVXTbvFwgkqXjUz+gQ=;
 b=Y7P7EsGSAKLS1RYKsbbetjXg8dami/AzZsXj+jTm64PewoClh4Hg5LoLDV/jK8FhaidLS3
 2CqMiNnKzEWKQZup4rI5LCvofCkT12o4I/UKvTyqnpR7i6H+Pa+Q3FFT16trhbohiL4ofk
 a8Q+EX2ArhQC4dhP/D11f5rveWtnjzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624616674;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WhavVeOrstdGWvOVzt+tl33KokVXTbvFwgkqXjUz+gQ=;
 b=p+94zeg+H1YjvEeibioX6sK0kr7xvV34SMi/WEfmaO/u84py+Nuy7+jJ0Aeo7vai3wHw2p
 h4yi/WHmYtiwbPCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id iNRpI+Ku1WDlDAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 25 Jun 2021 10:24:34 +0000
Date: Fri, 25 Jun 2021 11:58:58 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YNWo4kz8JaGyaW0M@yuki>
References: <20210621143056.2724-1-rpalethorpe@suse.com>
 <YNNV1NeXNUyLNE4a@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNNV1NeXNUyLNE4a@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [RFC PATCH] rm unused
 controllers/io-throttle tests
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
Cc: automated-testing@yoctoproject.org,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Acked-by: Petr Vorel <pvorel@suse.cz>

Things that never got into mainline shouldn't be in the repo at all...

Acked-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
