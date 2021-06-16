Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA1E3A9BD8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 15:22:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 225783C8901
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 15:22:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 603153C2174
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 15:22:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8409C60055D
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 15:22:24 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0048321A24;
 Wed, 16 Jun 2021 13:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623849744;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ji3/sZtQ1Wg0kYUAA+rYBgH8rEVoNFQNDvq4+hWGvd8=;
 b=VDTMQ6GcVXcp7UrTpPFAp3MgMNKN8+FqyUhXhU1lFWjay0goPwrUb+JckpWivTaQwGnBM8
 4P9bJICHTrr9ynEXdpFQ5zRkihD8X8rLeEprWYgurRQ76vBfspYHSOTXTjIwyfrcOBB6dd
 aW2M0tCZLWYc+YrTxAQ+vMh1I7AGxjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623849744;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ji3/sZtQ1Wg0kYUAA+rYBgH8rEVoNFQNDvq4+hWGvd8=;
 b=14qHbjbwjUDsJVs0yxKoUWq/x9qHwvScaBvAqVzQJnCLwnG3I5UvLCIRRBw550xwt3hOG0
 i8Y9oZFyuvyNiODw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C1CCA118DD;
 Wed, 16 Jun 2021 13:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623849743;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ji3/sZtQ1Wg0kYUAA+rYBgH8rEVoNFQNDvq4+hWGvd8=;
 b=nIaRBh3O/H9Oe8smTkTdhBf59GSkijnt46r6HnOA7MVpjUEyzAqDzDxkN3vi2eH5W/y1qq
 VgENGzPABFDl7RI4rdMYGRsbszik2TYPWlrkiQ/NcKOLVaQ8qkOPk910Hvxkv1oh76Wx5R
 TzF7kYkcS9Xt+83OGj0hGnSAe1cKm38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623849743;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ji3/sZtQ1Wg0kYUAA+rYBgH8rEVoNFQNDvq4+hWGvd8=;
 b=cczOQPGcY3N+FCLLSE3Z9M7rKysu7HncBDQ++kapEZ164IWGsF2lk6BFIme7HbIQR3vPMN
 iIx5pMQXnD2GYxDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id OYgkLQ/7yWBeNQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 13:22:23 +0000
Date: Wed, 16 Jun 2021 15:22:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMn7Doe2ApgjET5r@pevik>
References: <20210518064506.203781-1-xieziyao@huawei.com>
 <CAEemH2en6C3dUzspuVwNVmRiUeBQWK38bLPT7+ZwErVFQG+i-w@mail.gmail.com>
 <YKXtvaeckoJ2HJzJ@pevik>
 <730f190e-4baa-f854-2c5e-8c6b9d4267df@huawei.com>
 <YMniMEyDjhCLcx8g@pevik>
 <147203f7-eccc-09fb-4dd5-7083881fe84b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <147203f7-eccc-09fb-4dd5-7083881fe84b@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] typo: Add necessary spaces in the outputs
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ziyao,

...
> > But I'm ok to merge it without.

> Thanks, by the way, would you mind fixing this while you merge?

> It's also fine that I send v2 patch later to fix the problem.
I fixed the most obvious lines, concentrating on tests which use new API and
merged.

open posix tests produce a lot of checkpatch.pl warnings anyway => do not waste
time on details. And some fanotify / inotify tests which are up to date use
traditional formatting which splits lines => replacing it now.

> Thanks for your review.
Thanks for your time.

Kind regards,
Petr

> Kind Regards,
> Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
