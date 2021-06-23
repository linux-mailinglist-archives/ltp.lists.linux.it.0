Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECD13B16CC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:25:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1AC33C8E3C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 11:25:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 577593C21DD
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:25:22 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 18DF06011B6
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 11:25:20 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A31B1FD65;
 Wed, 23 Jun 2021 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624440320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tXSnbMEOyJ5l9wdH65V7LZjpdkmKiS3kwMkkpYvFDqc=;
 b=Yr4Lf/pVnVNVL76WDbLI8l9tqxaPY+hYniTC8nT6pRVnHqXOBs3JtR5lQ0M2T2GmdC1Xdp
 mqE859qt5BOUsp2ERa4EFVOg1XSJ5nX70LXSj3BokBS/0cTO39KBLWnymHQ13cX3AJqPLS
 7JoSBbi0PmCT44yM1ViZSZDeguRCf9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624440320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tXSnbMEOyJ5l9wdH65V7LZjpdkmKiS3kwMkkpYvFDqc=;
 b=1WojFgvTlatmdkS1F6H5KMz/OxMfihP1JY0iqRQ7fLTfMp8b971zhjMKZe0Hf0qE06YB9E
 TifyLoTIaIcZfRCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3624F11A97;
 Wed, 23 Jun 2021 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624440320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tXSnbMEOyJ5l9wdH65V7LZjpdkmKiS3kwMkkpYvFDqc=;
 b=Yr4Lf/pVnVNVL76WDbLI8l9tqxaPY+hYniTC8nT6pRVnHqXOBs3JtR5lQ0M2T2GmdC1Xdp
 mqE859qt5BOUsp2ERa4EFVOg1XSJ5nX70LXSj3BokBS/0cTO39KBLWnymHQ13cX3AJqPLS
 7JoSBbi0PmCT44yM1ViZSZDeguRCf9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624440320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tXSnbMEOyJ5l9wdH65V7LZjpdkmKiS3kwMkkpYvFDqc=;
 b=1WojFgvTlatmdkS1F6H5KMz/OxMfihP1JY0iqRQ7fLTfMp8b971zhjMKZe0Hf0qE06YB9E
 TifyLoTIaIcZfRCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 9ZF2CgD+0mAdPQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 09:25:20 +0000
Date: Wed, 23 Jun 2021 11:25:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNL9/k1iRralo/fj@pevik>
References: <20210622145938.106477-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622145938.106477-1-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset_hotplug: skip unsupported
 Microsoft Hyper-V
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

Hi Krzysztof,

> Microsoft Hyper-V with Linux guests does not support CPU hotplug, even
> if enabled in kernel configuration.  Quoting Ubuntu bug report from
> June 2018: "While Hyper-V may present all potential CPUs via ACPI MADT,
> CPU add/remove is not supported.". [1]

Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM. How many of tests will need tst_virt_hyperv? Although we don't touch
legacy API, I'd make an exception and add it to both test.sh and tst_test.sh
(ideally with an API extension, i.e. test could use SKIP_VIRT="hyperv", but that
can wait till tests are converted).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
