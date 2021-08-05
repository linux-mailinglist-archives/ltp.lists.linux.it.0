Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DE3E1432
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 13:54:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0DB43C7DB2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 13:54:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4DA733C5F7B
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 13:54:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7D9441001127
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 13:54:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8935320211;
 Thu,  5 Aug 2021 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628164473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pA4zkfCOQea8WVrwdSzyA8xwyDWobTxvUyG0bqJPJBs=;
 b=CnbDoZUSlZIe4RjiVyGq7R5DIZlyNB92JGy5mB7F+/Oufu/rZGtW0bdKPDyCOqENE1jQwI
 Hs7bk9557ulj/zwGBnTgeyM0QF/hC5ixybLQnSZIsbBAamOpGDGF59DTVet53Uvko7qjR+
 PufEHvTXIiFlSN5YEEYX6hlJX7lbv4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628164473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pA4zkfCOQea8WVrwdSzyA8xwyDWobTxvUyG0bqJPJBs=;
 b=zUP8ozVjd1BMrYFzMaDkvbyQU/g7nyW9A5Oan9YwZUArfez8cUheFKQdHIgJjw4uRbwrkP
 EEVUTzkXp7nDPmBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E45E13D61;
 Thu,  5 Aug 2021 11:54:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nbOLGHnRC2GcNwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 05 Aug 2021 11:54:33 +0000
Date: Thu, 5 Aug 2021 13:54:43 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YQvRg1O7kakkm30M@yuki>
References: <20210804060736.10234-1-sujiaxun@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804060736.10234-1-sujiaxun@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [1/6] syscalls/sysfs: Convert sysfs01 to the new
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
> +		TEST(tst_syscall(__NR_sysfs, 1, "proc"));
> 
>  		/* check return code */
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL, "sysfs(2) Failed for "
> -				 "option 1 and set errno to %d", TEST_ERRNO);
> +		if (TST_RET == -1) {
> +			tst_res(TFAIL, "sysfs(2) Failed for "
> +				 "option 1 and set errno to %d", TST_ERR);
>  		} else {
> -			tst_resm(TPASS, "sysfs(2) Passed for " "option 1");
> +			tst_res(TPASS, "sysfs(2) Passed for " "option 1");
>  		}

This could be just:

	TST_EXP_POSSITIVE(tst_syscall(__NR_sysfs, 1, "proc"),
	                  "sysfs(1, "proc")");

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
