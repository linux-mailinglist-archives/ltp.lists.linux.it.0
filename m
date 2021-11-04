Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C914A445B34
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 21:46:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27E8F3C7531
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 21:46:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 44C583C559D
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 21:46:39 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D03261001165
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 21:46:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08B31218B2;
 Thu,  4 Nov 2021 20:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636058798;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AxoqIf53yjgo0kLsVTiK5AM+SlsSwgyUIkuZpHlckVw=;
 b=pile729gzsH5hgODUg6Q1qxdH0dNFXkxLbTFM/XhPK/WwFlGSyJ6cYEZZWbWDo4FnounVF
 HySXxh0iyhlo5gWdBceI2yfFjZk96wABEzV+c1Vyi+HIHGw3EPlFXWpZRhAthiKFANAcKb
 BDRj0Gy9iLrul8rj9m0BHXUEO2ov2o4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636058798;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AxoqIf53yjgo0kLsVTiK5AM+SlsSwgyUIkuZpHlckVw=;
 b=MWSfQlw89D2ntnRPm9jLrk5JY1NNUkK3T8WGH+JXrENCVj0b8NlZ+x3QYc7fWGJZg1+F/A
 w1hjmqRA6bHm/lCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C774C13FD0;
 Thu,  4 Nov 2021 20:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JAVYLq1GhGF+dgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 04 Nov 2021 20:46:37 +0000
Date: Thu, 4 Nov 2021 21:46:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YYRGrBaCefpAtz6x@pevik>
References: <20211103120233.20728-1-chrubis@suse.cz>
 <20211103120233.20728-6-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103120233.20728-6-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 5/7] docparse: Add type normalization
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> For now just for .test_variants.

> There are two reasons for this:

> - This code makes sure that we get right value parsed and aborts the
>   compilation if the parser got confused. This part is important since
>   if the testrunners are going to use the metadata the data in there
>   must be correct.
Very good idea.

> - And much less important it makes the resulting json nicer to read

...
> +static void convert_str2int(struct data_node *res, const char *id, const char *str_val)
> +{
> +	long val;
> +	char *endptr;
> +
> +	errno = 0;
> +	val = strtol(str_val, &endptr, 10);
> +
> +	if (errno || *endptr) {
> +		fprintf(stderr,	"Cannot convert %s value %s to int!", id, str_val);
=> missing \n.
> +		exit(1);
> +	}
> +
> +	if (verbose)
> +		fprintf(stderr, "NORMALIZING %s TO INT %li", id, val);
And here.
> +
> +	data_node_hash_del(res, id);
> +	data_node_hash_add(res, id, data_node_int(val));
> +}
> +
> +static void check_normalize_types(struct data_node *res)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; tst_test_typemap[i].id; i++) {
> +		struct data_node *n;
> +		struct typemap *typemap = &tst_test_typemap[i];
> +
> +		n = data_node_hash_get(res, typemap->id);
> +		if (!n)
> +			continue;
> +
> +		if (n->type == typemap->type)
> +			continue;
> +
> +		if (n->type == DATA_STRING && typemap->type == DATA_INT) {
> +			convert_str2int(res, typemap->id, n->string.val);
> +			continue;
> +		}
> +
> +		fprintf(stderr, "Cannot convert %s from %s to %s!",
And here.
> +			typemap->id, data_type_name(n->type),
> +			data_type_name(typemap->type));
> +		exit(1);
> +	}
> +}

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
