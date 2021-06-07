Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1139DE05
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:47:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73B453C574C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:47:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D92B83C4DBE
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:47:52 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 725431400E70
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:47:52 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC5BC21A97;
 Mon,  7 Jun 2021 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623073671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jw7ZNRAu73FPjkFdop2hq7ZhX+9o1s8FetKadHQXlc=;
 b=Urdc/bwN016CWoQGJqyF+HKm7QNXBYPHLC3KYG4gcpfYJI56lxwViGhuhY7agPr6IVqAmn
 u1MWEN4i1oWH7NXkck+MVOTZ/ClG6CktxlYHFC6293qM+xgtw8oV60u1YCRcvv+wACbZg5
 FFDxzU8EUqtp0giHBdCpPKU2RQR4R5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623073671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jw7ZNRAu73FPjkFdop2hq7ZhX+9o1s8FetKadHQXlc=;
 b=TH5YOxgstdYavlNjVFB8mfA2Ams7e23UysBFC5y+SGgW8Bn1QGZIf7m5Th1TgKR2ohcXtR
 fgLswZtuL7JJhxCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A021D118DD;
 Mon,  7 Jun 2021 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623073671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jw7ZNRAu73FPjkFdop2hq7ZhX+9o1s8FetKadHQXlc=;
 b=Urdc/bwN016CWoQGJqyF+HKm7QNXBYPHLC3KYG4gcpfYJI56lxwViGhuhY7agPr6IVqAmn
 u1MWEN4i1oWH7NXkck+MVOTZ/ClG6CktxlYHFC6293qM+xgtw8oV60u1YCRcvv+wACbZg5
 FFDxzU8EUqtp0giHBdCpPKU2RQR4R5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623073671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jw7ZNRAu73FPjkFdop2hq7ZhX+9o1s8FetKadHQXlc=;
 b=TH5YOxgstdYavlNjVFB8mfA2Ams7e23UysBFC5y+SGgW8Bn1QGZIf7m5Th1TgKR2ohcXtR
 fgLswZtuL7JJhxCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ueTZJYcjvmAlLgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 07 Jun 2021 13:47:51 +0000
Date: Mon, 7 Jun 2021 15:22:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YL4deOp77fYs40Jw@yuki>
References: <20210507083321.167998-1-xieziyao@huawei.com>
 <20210507083321.167998-4-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210507083321.167998-4-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/io_submit: Add io_submit02 test for
 native AIO
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
Cc: rpalethorpe@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +	TEST(tst_syscall(__NR_io_submit, *tc[i].ctx, tc[i].nr, tc[i].iocbs));
> +	tst_res(TST_ERR == tc[i].exp_errno ? TPASS : TFAIL,
> +		"io_submit(2) with %s returns %s, expected %s",
> +		tc[i].desc, tst_strerrno(TST_ERR), tst_strerrno(tc[i].exp_errno));

I do not like this tst_res() that much. Can we rather do:

	if (tc[i].exp_errno)
		TST_EXP_FAIL(...);
	else
		TST_EXP_PASS(...);

Another possibility would be splitting the test into two one for
negative and one for positive cases.


And we need the .needs_kconfig in this test as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
