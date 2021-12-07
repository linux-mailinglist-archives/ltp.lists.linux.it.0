Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2546B990
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Dec 2021 11:52:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84AC53C0F60
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Dec 2021 11:52:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 87AD03C0F60
 for <ltp@lists.linux.it>; Tue,  7 Dec 2021 11:52:53 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0CF6E6008F0
 for <ltp@lists.linux.it>; Tue,  7 Dec 2021 11:52:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49D691FD2F;
 Tue,  7 Dec 2021 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1638874372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BW2MWrReo5a1vYg86a0pTejoEnv+4nxjtjTXQuZfXGk=;
 b=PS78oliGZfNAUiP+aFU7GT8ivMvnFdepg8tCK7EXOHe6sMSUSXBBb2lFgsdxB0S/X16oba
 2lVZZEi1BbLE1+XyoMw2/poiC+ZfbI+htA3TlgMLgI508c5CbIpd6rVnTfnLqrQAufVmzR
 mtirYBpZeAqpuOLiBh2ffb+BaNiqqg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1638874372;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BW2MWrReo5a1vYg86a0pTejoEnv+4nxjtjTXQuZfXGk=;
 b=yB0l4hLOfl7dr1M8ol+a9XO28+fgRIUoCWlEBDvGovy9mZmgwwoZoihZw3qm3rBvTshIkN
 FTKXDnQDCiw17kBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3522313A1F;
 Tue,  7 Dec 2021 10:52:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e3RlCwQ9r2HfewAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 07 Dec 2021 10:52:52 +0000
Date: Tue, 7 Dec 2021 11:54:08 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <Ya89UIlBL8kBaZDP@yuki>
References: <20211207102904.6011-1-rpalethorpe@suse.com>
 <20211207102904.6011-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211207102904.6011-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] check: Add LTP-005 null termination check
 on test.tags
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
> +/* Checks if some struct array initializer is terminated with a blank
> + * (zeroed) item i.e. {}
> + */
> +static bool is_terminated_with_null_struct(const struct symbol *const sym)
> +{
> +	const struct expression *const arr_init = sym->initializer;
> +	const struct expression *item_init =
> +		last_ptr_list((struct ptr_list *)arr_init->expr_list);
> +
> +	if (item_init->type == EXPR_POS)
> +		item_init = item_init->init_expr;
> +
> +	return ptr_list_empty((struct ptr_list *)item_init->expr_list);
> +}

Looks good now.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
