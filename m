Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA253E1445
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 14:00:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9F0E3C7DB2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 14:00:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 48CAB3C7D85
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 14:00:20 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 639BA1A01224
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 14:00:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D7CE2022E;
 Thu,  5 Aug 2021 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628164819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RDUL/5D55MUhPP1UV7FXCKMQMrqOkZzNdQGO/i9Ag24=;
 b=xU1L0RhJgOomoAPX6CmvEyVhoWD19xWxxj6k0uaTVCMhdsYiOsL4KFVk8H5B+fezfZLt7r
 mO1MX6GmK+7PYTgxTrsHQS3b8ZiN8JCbloruC6nM9gIhQmAE57ajPt7U1K8W2e9EqTR2GF
 4+qQSNoD6K9hFXDuEwFdMmmMgwwMCaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628164819;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RDUL/5D55MUhPP1UV7FXCKMQMrqOkZzNdQGO/i9Ag24=;
 b=Otsa4YBr7frExE56MpVF8B0wOQua292JMHLUCYSxxKYX9YxIBC99Owe4cUpvad+umN6k9N
 nxc9vgRMfgSVFKCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A8A713D61;
 Thu,  5 Aug 2021 12:00:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kLa3FdPSC2EkOQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 05 Aug 2021 12:00:19 +0000
Date: Thu, 5 Aug 2021 14:00:28 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YQvS3PLdmpmSNJAf@yuki>
References: <20210805104229.10826-1-sujiaxun@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805104229.10826-1-sujiaxun@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [2/6] syscalls/sysfs: Convert sysfs02 to the new
 API
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
> +/*
> + * [DESCRIPTION]

This has to be [Description]

> -		TEST(ltp_syscall(__NR_sysfs, 2, 0, buf));
> +		TEST(tst_syscall(__NR_sysfs, 2, 0, buf));
> 
>  		/* check return code */
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL, "sysfs(2) Failed for "
> +		if (TST_RET == -1) {
> +			tst_res(TFAIL, "sysfs(2) Failed for "
>  				 "option 2 and returned"
> -				 " %d as error number", TEST_ERRNO);
> +				 " %d as error number", TST_ERR);
>  		} else {
> -			tst_resm(TPASS, "sysfs(2) Passed for option 2");
> +			tst_res(TPASS, "sysfs(2) Passed for option 2");
>  		}
> -	}			/*End of TEST_LOOPING */

And this should be just TST_EXP_PASS(...);


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
