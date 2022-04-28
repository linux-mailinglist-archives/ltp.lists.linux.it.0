Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 192BC513393
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 14:24:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9D583CA6DA
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 14:24:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 53EC33C8977
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 14:24:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D24CF1A017D6
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 14:24:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3172210EE;
 Thu, 28 Apr 2022 12:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651148662;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ScfVHg28dzsiry8PHM/+dwRq7nBCnxNJ52obXdZmbYg=;
 b=R54CJGBq5QxJMhWLMeHYhWDr52UyqW+rTWSeRLLgs6YRSMSvXGoIUSAPFnyWvlhxHF9nv4
 93OOpZgSC5LwzdzgqJyCiFhzXdkd5IuledNoasBy2twHapX/dv0OiYbKzmeNkxCt/vn7gG
 jV5CQJFiFVrwR/TEfEEGAzKeQewt+aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651148662;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ScfVHg28dzsiry8PHM/+dwRq7nBCnxNJ52obXdZmbYg=;
 b=7RqYTTjOeoOAT1TBUZGV+QEc87jxuESOGGIy5vFbwrtF04T1PASIrRu09oCN5weOlleuBx
 GzojX17lHjbCTpBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B165313AF8;
 Thu, 28 Apr 2022 12:24:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RJCnKXaHamIlJwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 28 Apr 2022 12:24:22 +0000
Date: Thu, 28 Apr 2022 14:24:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Chen Hanxiao <chenhx.fnst@fujitsu.com>
Message-ID: <YmqHdHHNSR+d4SLy@pevik>
References: <20220428104642.110-1-chenhx.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428104642.110-1-chenhx.fnst@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] syscalls/mount_setattr01: Add basic functional
 test
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

Hi Dai, Chen,

Reviewed-by: Petr Vorel <pvorel@suse.cz>
LGTM, waiting for Cyril's final ack before merging.

> diff --git a/testcases/kernel/syscalls/mount_setattr/mount_setattr01.c b/testcases/kernel/syscalls/mount_setattr/mount_setattr01.c
...
> +#define MNTPOINT        "mntpoint"
> +#define OT_MNTPOINT     "ot_mntpoint"
> +#define TCASE_ENTRY(attrs, exp_attrs)   \
> +	{                                \
> +		.name = #attrs,                 \
> +		.mount_attrs = attrs,           \
> +		.expect_attrs = exp_attrs       \
> +	}
nit: This is absolutely ok, but I'd personally use the version from v2, which
set only .name and .mount_attrs (the only point for macros are to reduce
duplicity, which is not in passing .expect_attrs).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
