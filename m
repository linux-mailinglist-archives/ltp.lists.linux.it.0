Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E13FB7B0
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 16:17:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41B0A3C2F7B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 16:17:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9023B3C2AAC
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 16:17:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5D90B1400C5C
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 16:17:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BC6422045;
 Mon, 30 Aug 2021 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630333039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0jB5eHaUt7FFNv7E2pPFORSNYb5s1os/7rfbrdaxGq8=;
 b=CCm1s/+Xb3N/pfZqHiGaJmYNWHg2pCohYdzR2J4M9f9lmlFwjlRVvX3oqJaHrEM3rEQ4Ks
 ZzyhBYcsOi1NziGefDzYJJQXUP6WhHBTpd7L+o0cqpssr7+Bqerwbqa5vxBfQg6OIcGGlY
 aeWTILeSY7oNPcyjyqGZ1oIKY6Mc+g4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630333039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0jB5eHaUt7FFNv7E2pPFORSNYb5s1os/7rfbrdaxGq8=;
 b=cDfsmAp1iHwF1pfP6RfQWKjPSftGJKHZncidGPPWUN+wBtPfU1is37QCAAaI+CIEPUfyYf
 YVvDma9FLGMqwtCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 697B513A6F;
 Mon, 30 Aug 2021 14:17:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qaTCGG/oLGHHMwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 30 Aug 2021 14:17:19 +0000
Date: Mon, 30 Aug 2021 16:17:27 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YSzod9oVzf05LQbb@yuki>
References: <20210830070951.27803-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830070951.27803-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_test_macros.h: Add TST_EXP_VAL macro
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +#define TST_EXP_VAL_SILENT_(SCALL, SSCALL, VAL, ...)                           \
> +	do {                                                                   \
> +		TEST(SCALL);                                                   \
> +		                                                               \
> +		TST_PASS = 0;                                                  \
> +		                                                               \
> +		if (TST_RET != VAL) {                                          \
> +			TST_MSGP_(TFAIL | TTERRNO, " retval not %ld",          \
> +			          (long )VAL, SSCALL, ##__VA_ARGS__);          \
> +			break;                                                 \
> +		}                                                              \
> +		                                                               \
> +		TST_PASS = 1;                                                  \
> +		                                                               \
> +	} while (0)
> +
> +#define TST_EXP_VAL_SILENT(SCALL, VAL, ...) TST_EXP_VAL_SILENT_(SCALL, #SCALL, VAL, ##__VA_ARGS__)
> +
> +#define TST_EXP_VAL(SCALL, VAL, ...)                                           \
> +	do {                                                                   \
> +		TST_EXP_VAL_SILENT(SCALL, VAL, ##__VA_ARGS__);                 \

Shouldn't we call the VAL_SILENT_() variant here and stringify the SCALL
here? Otherwise I guess that this will introduce the same problem I was
fixing in the "stringify early" patch.

Other than this it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
