Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB353B1E28
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:56:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81F313C7022
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:56:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C84633C2298
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:56:02 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0505F600D60
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:56:01 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 643A821970;
 Wed, 23 Jun 2021 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624463761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bSoPZM8/F4EidT4hV8eoGl1Tg7Yh3cx5zmLeMDqW8mc=;
 b=gGXBZsR3VgTroHeAYHQHzfWyDUbyi+ioVNdnWNkvvfF9TKJdID6e3kGu+21Csx2kzEwUC9
 kYEnROYiMsSA9h1I0bMqbLUFS+FDm8E5+lNRZ1YTO97dQ9+LZQV8yX+ZKRG/36KkKAoRqw
 B8BDfHjzF6zUtvOCrRPlwOE7DRa1z9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624463761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bSoPZM8/F4EidT4hV8eoGl1Tg7Yh3cx5zmLeMDqW8mc=;
 b=pUDDR/s8JqMF10/+ak9CtWPB0J5hhpYZEj8UneuYuvSayLhE7ZHtvsasHMxUatNzgJrx8Z
 iyHsOXOZoi0iSTBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 144D811A97;
 Wed, 23 Jun 2021 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624463761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bSoPZM8/F4EidT4hV8eoGl1Tg7Yh3cx5zmLeMDqW8mc=;
 b=gGXBZsR3VgTroHeAYHQHzfWyDUbyi+ioVNdnWNkvvfF9TKJdID6e3kGu+21Csx2kzEwUC9
 kYEnROYiMsSA9h1I0bMqbLUFS+FDm8E5+lNRZ1YTO97dQ9+LZQV8yX+ZKRG/36KkKAoRqw
 B8BDfHjzF6zUtvOCrRPlwOE7DRa1z9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624463761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bSoPZM8/F4EidT4hV8eoGl1Tg7Yh3cx5zmLeMDqW8mc=;
 b=pUDDR/s8JqMF10/+ak9CtWPB0J5hhpYZEj8UneuYuvSayLhE7ZHtvsasHMxUatNzgJrx8Z
 iyHsOXOZoi0iSTBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id JOGBApFZ02BAEQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 15:56:01 +0000
Date: Wed, 23 Jun 2021 17:55:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YNNZj2oxewcXv5Wl@pevik>
References: <20210621100342.4060942-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621100342.4060942-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ssh-stress: Add hostkey generation
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

merged, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
