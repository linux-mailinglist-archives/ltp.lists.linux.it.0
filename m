Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD9B3A15B8
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 15:33:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C88113C8FCB
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 15:33:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7CEEB3C59D0
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 15:33:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EB7706005D4
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 15:33:43 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5681C219D8;
 Wed,  9 Jun 2021 13:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623245623;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsLlYXZDBhrTxA2t5KSwmUnpJXBcYoEvs/CNdZEp4tc=;
 b=lPFQIYbiwiRImiKtoKVvNPtY545QPljzYGd8mOhS6/VcJ+exHgs8hSEsCTEYRxwmZcxQgb
 2lWmg+C0H1WEXuczJvwuY3DDBycUyZIU5TAZNxge49FGr6XVJOZ6btOpi1UANmYA2Ogwst
 6QKz9lw+IbQA1juwRgYeqywIdWcccxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623245623;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsLlYXZDBhrTxA2t5KSwmUnpJXBcYoEvs/CNdZEp4tc=;
 b=0/7uKiXFgjw+tK0MbB6Z5vMG8TDkT6YUTjCpbjsyYwFle8TR1qrkF3xMUC0hD05fttMom9
 RtceeEjp4f/BbaBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2E4C6118DD;
 Wed,  9 Jun 2021 13:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623245623;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsLlYXZDBhrTxA2t5KSwmUnpJXBcYoEvs/CNdZEp4tc=;
 b=lPFQIYbiwiRImiKtoKVvNPtY545QPljzYGd8mOhS6/VcJ+exHgs8hSEsCTEYRxwmZcxQgb
 2lWmg+C0H1WEXuczJvwuY3DDBycUyZIU5TAZNxge49FGr6XVJOZ6btOpi1UANmYA2Ogwst
 6QKz9lw+IbQA1juwRgYeqywIdWcccxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623245623;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsLlYXZDBhrTxA2t5KSwmUnpJXBcYoEvs/CNdZEp4tc=;
 b=0/7uKiXFgjw+tK0MbB6Z5vMG8TDkT6YUTjCpbjsyYwFle8TR1qrkF3xMUC0hD05fttMom9
 RtceeEjp4f/BbaBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id nyzGCTfDwGB5LQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 09 Jun 2021 13:33:43 +0000
Date: Wed, 9 Jun 2021 15:33:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YMDDNYojVH/NZbB8@pevik>
References: <20210609080313.15359-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609080313.15359-1-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hotplug/cpu_hotplug: skip unsupported Microsoft
 Hyper-V
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

> Detect the Hyper-V with systemd and if it succeeds, skip the test.
> This of course does not support all possible cases, e.g. running tests
> under Hyper-V without systemd will still fail, but it's a easy way to
> avoid test failure in common configuration.
Good catch, thanks!

> Ideally the newly introduced tst_virt_hyperv should be added to
> testcases/lib but first the CPU hotplug tests would have to be converted
> to newlib.
+1, thanks for TODO.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> [1] https://bugs.launchpad.net/ubuntu/+source/linux-azure/+bug/1776293

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
