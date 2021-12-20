Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677047AEFB
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Dec 2021 16:07:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B23A23C917D
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Dec 2021 16:07:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8EC943C912A
 for <ltp@lists.linux.it>; Mon, 20 Dec 2021 16:07:20 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CB36560055A
 for <ltp@lists.linux.it>; Mon, 20 Dec 2021 16:07:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F30621F3B0;
 Mon, 20 Dec 2021 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640012838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FCd4vZBmdIJlvB/jQHHl7JTzyrJikdNTMt/0D5bKBUs=;
 b=lfvvML3AhG9VZPWXhUuVDo6EpbBn5FRGIaUW0k9tEOvCC5wt2qgKEiZq6PBYHdvxDZiAQ2
 1saKfI836FOkzSLk/gxM0kWCLygw0Qh4wy7uasyQk/kZSq7cBQppDlXd1PeMRyuROHujfI
 l38P6oqDKKf53IdHBkrkuGWkDXIgb4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640012838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FCd4vZBmdIJlvB/jQHHl7JTzyrJikdNTMt/0D5bKBUs=;
 b=8/1b3C8xKcwsXDfND3ACNNCDykrF9RxZI8QHo54mc5DWWPUB6RZ8+7PVlJA+u2o7PvzFFj
 nNMBrpJKxtsj4nBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C13CF13B7F;
 Mon, 20 Dec 2021 15:07:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nDFqLSacwGEFMQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 20 Dec 2021 15:07:18 +0000
Date: Mon, 20 Dec 2021 16:08:48 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YcCcgEZR8OyN7xbv@yuki>
References: <20211220131043.18894-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220131043.18894-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] API/cgroup: Add safe_cgroup_lines_scanf
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
> +void safe_cgroup_lines_scanf(const char *const file, const int lineno,
> +			     const struct tst_cgroup_group *const cg,
> +			     const char *const file_name,
> +			     const char *const fmt, ...)
> +{
> +	va_list va;
> +	char buf[BUFSIZ];
> +	ssize_t len = safe_cgroup_read(file, lineno,
> +				       cg, file_name, buf, sizeof(buf));
> +	const int conv_cnt = tst_count_scanf_conversions(fmt);
> +	int ret = 0;
> +	char *line;
> +
> +	if (len < 1)
> +		return;
> +
> +	line = strtok(buf, "\n");

It may be safer to use strtok_r() other than that:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
