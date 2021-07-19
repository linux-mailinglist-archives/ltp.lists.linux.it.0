Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA073CCE1F
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 08:49:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4B933C2E5C
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 08:49:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8995A3C0131
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 08:49:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C8025200FEF
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 08:49:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3680C201D0;
 Mon, 19 Jul 2021 06:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626677350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q5tWEFtZY26vNng4c5N3xO7+bPUAYmtkPTeIak61xbA=;
 b=AVqTfGtuhUtxslR7DAH0IFtVKnHYG0W3qbDcbd6zcszrTlJHdYVERfK5RNSQXtrMAZH5wa
 A0mTJY9sePgvB+RU2imTGMExjkoXVIJ7oZwS5Tr40UFxyR+9m3FdF06Tw0y8bAAjs5sG/g
 mAqQ1IgZJqVCfCPxqdEe4hgWKzbAb1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626677350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q5tWEFtZY26vNng4c5N3xO7+bPUAYmtkPTeIak61xbA=;
 b=DchQAAvxmMJRJTig1YPH49dTH5/Zxltr9xhUam4q5B/53GHJcOzS048Q3RIJ0Q1dDURChT
 ZzCuxzQRj6I2+mBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D09AE13C9B;
 Mon, 19 Jul 2021 06:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1/ZGMWUg9WBsfQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 19 Jul 2021 06:49:09 +0000
Date: Mon, 19 Jul 2021 08:49:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YPUgZGgztmG04Mfa@pevik>
References: <20210716140142.GA7113@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716140142.GA7113@andestech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3,
 1/2] lib/tst_test.sh: Make tst_umount work with argument that has
 trailing slash
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
Cc: richiejp@f-m.fm, alankao@andestech.com, metan@ucw.cz,
 ycliang@cs.nctu.edu.tw, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
>  	while [ "$i" -lt 50 ]; do
> -		if umount "$device" > /dev/null; then
> +		if umount "$device"/ > /dev/null; then
nit: although previous is working, I'd prefer "$device/"

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
