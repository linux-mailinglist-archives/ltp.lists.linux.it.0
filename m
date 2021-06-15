Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0273A78B7
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 10:06:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F88B3C71D7
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 10:06:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55B403C1F4E
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 10:06:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6A0AB1A00CB8
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 10:06:36 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3086219CC;
 Tue, 15 Jun 2021 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623744396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UDYIoQsApcSVFiYvBqjxytq82T6HpUvuiNffya1DToI=;
 b=gbHCQYfvSqrK9LFoN+hkY8L4S9aPck19rJI4zAKoL1R4JYlp8XFpEjurbq3VzdWmVsvjWu
 6Rja4/nMTXp+3qTxqcHl7EWG421um9v62FjLdB1IfoFZDcjJCs/e2OzTpB6OIt3EMF8BYC
 EMjo8DB3OrVcU1ixnQeMXX3hAfd1dck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623744396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UDYIoQsApcSVFiYvBqjxytq82T6HpUvuiNffya1DToI=;
 b=Azt4W+C5zN2tPIIcZDBitlFfrAgkvtB1V1D6lgPdiOhcD3YY8goqAL4IAsiF/HSLba0sBm
 WbuvPhxEUQNE7lAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 756B1118DD;
 Tue, 15 Jun 2021 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623744396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UDYIoQsApcSVFiYvBqjxytq82T6HpUvuiNffya1DToI=;
 b=gbHCQYfvSqrK9LFoN+hkY8L4S9aPck19rJI4zAKoL1R4JYlp8XFpEjurbq3VzdWmVsvjWu
 6Rja4/nMTXp+3qTxqcHl7EWG421um9v62FjLdB1IfoFZDcjJCs/e2OzTpB6OIt3EMF8BYC
 EMjo8DB3OrVcU1ixnQeMXX3hAfd1dck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623744396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UDYIoQsApcSVFiYvBqjxytq82T6HpUvuiNffya1DToI=;
 b=Azt4W+C5zN2tPIIcZDBitlFfrAgkvtB1V1D6lgPdiOhcD3YY8goqAL4IAsiF/HSLba0sBm
 WbuvPhxEUQNE7lAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id bmFWG4xfyGBzSwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 15 Jun 2021 08:06:36 +0000
Date: Tue, 15 Jun 2021 10:06:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YMhfini/+dDFnrAY@pevik>
References: <20210615075104.24870-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615075104.24870-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] icmp_rate_limit01: Require CONFIG_VETH
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

> The test fails with TBROK if it can not create a virtual ethernet
> pair. So add it to the kconfigs.

Thanks, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
