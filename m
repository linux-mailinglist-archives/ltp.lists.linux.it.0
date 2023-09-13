Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C6C79E7C1
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Sep 2023 14:16:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A998E3CB531
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Sep 2023 14:16:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8B19B3CB2BF
 for <ltp@lists.linux.it>; Wed, 13 Sep 2023 14:16:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9A8EF10009AF
 for <ltp@lists.linux.it>; Wed, 13 Sep 2023 14:16:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F0771F385;
 Wed, 13 Sep 2023 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1694607406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ri1m5Qj653ikG2DABTvCVgWN14MXE3qBLjK3uFPpyHA=;
 b=osIq2Ka2d8wEibd32RTDA6ILh0JfWEZk7MQ97s6K7bNJT4oqKtSSTlc9ckPZYHeWsnjh1y
 rMJD/eYA06XRrxsu3QS2KFDkUIDLYA8D3KpUxQw6mVlWlMeczmpk6uY7vhtlewwEANYZ1H
 9zhC8ez22+eblGYUX2VJ8sHceRUHQfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1694607406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ri1m5Qj653ikG2DABTvCVgWN14MXE3qBLjK3uFPpyHA=;
 b=M8f4gQbg4ouP+YRtfsBlDEImfATjfk1COFuFTT+fuWj6bA3uB4+GBOQfPlncqbn23NfrrK
 At0/Chso10azpICw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F13EE13582;
 Wed, 13 Sep 2023 12:16:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lILKOS2oAWVGIAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 13 Sep 2023 12:16:45 +0000
Date: Wed, 13 Sep 2023 14:17:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZQGoXAAPcWjLjear@yuki>
References: <20230705141223.31468-1-andrea.cervesato@suse.de>
 <20230705141223.31468-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705141223.31468-2-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v8 1/4] Refactor mqns_03 using new LTP API
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
>  static void setup(void)
>  {
> -	tst_require_root();
> -	check_mqns();
> +	char *tmpdir;
> +
> +	if (!str_op || (strcmp(str_op, "clone") && strcmp(str_op, "unshare")))
> +		tst_brk(TCONF, "Please specify clone|unshare child isolation");
> +
> +	tmpdir = tst_get_tmpdir();
> +
> +	SAFE_ASPRINTF(&devdir, "%s/mqueue", tmpdir);
> +	SAFE_MKDIR(devdir, 0755);
> +
> +	SAFE_ASPRINTF(&mqueue1, "%s" MQNAME1, devdir);
> +	SAFE_ASPRINTF(&mqueue2, "%s" MQNAME2, devdir);

Do we really need the devdir and mqueue paths to be absolute?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
