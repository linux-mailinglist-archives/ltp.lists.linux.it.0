Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1353A683A
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 15:41:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B984F3C4D1F
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 15:41:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 02D073C2819
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 15:41:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2BAB0600860
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 15:41:24 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 626F01FD3E;
 Mon, 14 Jun 2021 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623678084;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SK7B0OWPyj9nX65aAJ7dF4EPs54aTqoq0b0E1e670NE=;
 b=kiKo5ejDuH1nhhmodiJv71G2LRi0bIvHchegZy6A3iu28coRk4yDdgT/bRWkwJjwCT1QIa
 suuXOnL/2P7K++ig4xQCHDk6KJMI4OOzE2FKMysLq0q5cqxagbHdrymN2e/W8oRyFmjAsq
 HpK4rJckzJXxEmUhMAPCSYupsQIiu9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623678084;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SK7B0OWPyj9nX65aAJ7dF4EPs54aTqoq0b0E1e670NE=;
 b=AIGIispMPv0/wjQLsQ/caR2F7I4URqoEvtKHURck4Lzxpndlzjj9KcZTx2oeqi1ZE4+4Ct
 gghuY4Qvc3YscnBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3EC37118DD;
 Mon, 14 Jun 2021 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623678084;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SK7B0OWPyj9nX65aAJ7dF4EPs54aTqoq0b0E1e670NE=;
 b=kiKo5ejDuH1nhhmodiJv71G2LRi0bIvHchegZy6A3iu28coRk4yDdgT/bRWkwJjwCT1QIa
 suuXOnL/2P7K++ig4xQCHDk6KJMI4OOzE2FKMysLq0q5cqxagbHdrymN2e/W8oRyFmjAsq
 HpK4rJckzJXxEmUhMAPCSYupsQIiu9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623678084;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SK7B0OWPyj9nX65aAJ7dF4EPs54aTqoq0b0E1e670NE=;
 b=AIGIispMPv0/wjQLsQ/caR2F7I4URqoEvtKHURck4Lzxpndlzjj9KcZTx2oeqi1ZE4+4Ct
 gghuY4Qvc3YscnBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id SnckDoRcx2DbYQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 14 Jun 2021 13:41:24 +0000
Date: Mon, 14 Jun 2021 15:41:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YMdcgrabnou+u90I@pevik>
References: <20210614115638.25467-1-rpalethorpe@suse.com>
 <20210614115638.25467-3-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614115638.25467-3-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v3 2/2] Start libclang based analyzer and
 TEST() check
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

> +#if HAVE_CLANG_C_INDEX_H
> +
> +#include <clang-c/Index.h>
...

> +static void emit_error(const char *const error_msg)
> +{
> +	if (color_enabled(STDERR_FILENO)) {
> +		dprintf(STDERR_FILENO,
> +			"%sERROR%s: %s%s%s\n",
> +			ansi_red, ansi_reset,
> +			ansi_bold, error_msg, ansi_reset);
> +	} else {
> +		dprintf(STDERR_FILENO, "ERROR: %s\n", error_msg);
> +	}
> +}
...
> +	if (ret != CXError_Success) {
> +		emit_error("Failed to parse translation unit!");
> +		return 1;
> +	}
...

> +#else
> +
> +int main(const attr_unused int argc, const attr_unused char *const *const argv)
> +{
> +	emit_error("clang-checks was not built correctly; libclang headers are not installed!\n");
emit_error() is not visible here, thus build fails. Please add it before HAVE_CLANG_C_INDEX_H.

Or you could just use tst_test.h with TST_NO_DEFAULT_MAIN and here would be TST_TEST_TCONF()
(+ LTP_ATTRIBUTE_UNUSED).

Kind regards,
Petr

> +	return 1;
> +}
> +
> +#endif

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
