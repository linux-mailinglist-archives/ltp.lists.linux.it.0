Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDCC3A25F2
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 09:57:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D5CC3C3164
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 09:57:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D34083C0B9A
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 09:57:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 32111600740
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 09:57:50 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A24A219A2;
 Thu, 10 Jun 2021 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623311870;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lb4r/pmZgKpTkzCQWKqmu1vR5uTAnAA2cs+eMWQXiNM=;
 b=nbz/U+6t87wqXHhOi87Li3v77t+fO38ojrjUjoTnOE1yIR+5EJt6AvzewgsGLaobFNlVv+
 +zaQeV1qn34Wbl+swO73S2Fd9H9azAohI5rWvctu22HnVBgEWaTPA3FWoKsbGD220j2mn1
 XZwTy26Ab3QAymZSOXxQn59G14LF/W8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623311870;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lb4r/pmZgKpTkzCQWKqmu1vR5uTAnAA2cs+eMWQXiNM=;
 b=mYrPSr25WVVo5WaV9jhI1PdNmFBkXjx+JQjAKsR06mTWm/aU7w2ewnUIf6M4lZnGlPrJzm
 hFDDVT0ql+qtCpCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 49E15118DD;
 Thu, 10 Jun 2021 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623311870;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lb4r/pmZgKpTkzCQWKqmu1vR5uTAnAA2cs+eMWQXiNM=;
 b=nbz/U+6t87wqXHhOi87Li3v77t+fO38ojrjUjoTnOE1yIR+5EJt6AvzewgsGLaobFNlVv+
 +zaQeV1qn34Wbl+swO73S2Fd9H9azAohI5rWvctu22HnVBgEWaTPA3FWoKsbGD220j2mn1
 XZwTy26Ab3QAymZSOXxQn59G14LF/W8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623311870;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lb4r/pmZgKpTkzCQWKqmu1vR5uTAnAA2cs+eMWQXiNM=;
 b=mYrPSr25WVVo5WaV9jhI1PdNmFBkXjx+JQjAKsR06mTWm/aU7w2ewnUIf6M4lZnGlPrJzm
 hFDDVT0ql+qtCpCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 4bUFEP7FwWDMCAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 10 Jun 2021 07:57:50 +0000
Date: Thu, 10 Jun 2021 09:57:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YMHF/H7OsORVP606@pevik>
References: <1623297725-3296-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <121d371d-baca-fc43-9938-8d83e360d97b@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <121d371d-baca-fc43-9938-8d83e360d97b@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_virt.c: Add fallback when not using
 Microsoft Hyper-V hypervisor
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

Hi all,

> On 10/06/2021 06:02, Yang Xu wrote:
> > If we don't use Microsoft Hyper-V hypervisorm, getrusage04 will report the

> s/hypervisorm/hypervisor/
+1

> > following error:
> > getrusage04    1  TBROK  :  tst_virt.c:175: invalid virt_type flag: 6
> > getrusage04    2  TBROK  :  tst_virt.c:175: Remaining cases broken

> > We should add is_hyperv() function when try_systemd_detect_virt returns -1.
> > But it is a bit complexd according to systemd-detect-virt implementation[1].

> s/complexd/complex/
+1

Thanks!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
