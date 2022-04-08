Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78B4F9AC1
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Apr 2022 18:36:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6B6F3CA503
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Apr 2022 18:36:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7E5293CA4F8
 for <ltp@lists.linux.it>; Fri,  8 Apr 2022 18:36:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5F90060083E
 for <ltp@lists.linux.it>; Fri,  8 Apr 2022 18:36:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 44A1021603;
 Fri,  8 Apr 2022 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1649435770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8B6xVXjVvdPjpBPL+o0EErBNNevoP3KpwDnFPr//Bs=;
 b=QaT6QH+yh0/dGNA7vUp1w97URsq+LFEfKxVqmsmODeYbOHp7BTuxhHupFX/jMrywQj5fBM
 vb++/S5++TcJkncppuN7gVA6yvn6l0SpDHr/E2iJEYz0a9MwbFAWhNqHpd94rRynmgd9uc
 0PenBxO2w2oQuFIbbgshthHbzCoLjmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1649435770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8B6xVXjVvdPjpBPL+o0EErBNNevoP3KpwDnFPr//Bs=;
 b=suZQYl5zQnf9wCLcAGojdVGQ9J8oHNzRihGr5HEX5segBSsFfqK+OH/v9HI06ygDDyy4Yo
 2INNLq4AkKOAuuCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12A3613314;
 Fri,  8 Apr 2022 16:36:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t893A3pkUGKVcgAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 08 Apr 2022 16:36:10 +0000
Message-ID: <d6bf9309-50ee-d754-7dd4-2fb353023d02@suse.cz>
Date: Fri, 8 Apr 2022 18:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, Zhao Gongyi <zhaogongyi@huawei.com>
References: <20220328114921.182315-1-zhaogongyi@huawei.com>
 <YkxNEjvaLAsWZSaq@pevik>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <YkxNEjvaLAsWZSaq@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] io_submit01/io_submit02: Bugfix for running with
 the option "-i"
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
Cc: viresh.kumar@linaro.org, Martin Doucha <martin.doucha@suse.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 05. 04. 22 16:07, Petr Vorel wrote:
> Hi all,
> 
>> For io_submit01, add io_destroy before test return, or the test
>> would fail and report EAGAIN.
>> For io_submit02, move the io_destroy to the suitable location, or
>> the test would fail and report EAGAIN.
> 
> $ ./io_submit01 -i150
> ...
> io_submit01.c:122: TPASS: io_submit() with NULL iocb pointers failed with EFAULT
> io_submit01.c:127: TFAIL: io_submit() returned -11(EAGAIN/EWOULDBLOCK), expected EBADF(-9)
> io_submit01.c:127: TFAIL: io_submit() returned -11(EAGAIN/EWOULDBLOCK), expected EBADF(-9)
> io_submit01.c:127: TFAIL: io_submit() returned -11(EAGAIN/EWOULDBLOCK), expected EBADF(-9)
> io_submit01.c:127: TFAIL: io_submit() returned -11(EAGAIN/EWOULDBLOCK), expected SUCCESS(1)
> 
> $ ./io_submit02 -i150
> ...
> io_submit02.c:76: TPASS: io_submit() returns 0 if nr is zero
> io_submit02.c:78: TFAIL: io_submit() returns -1, expected 1
> 
> @Cyril, Li, Martin, Viresh: while this fix is valid using memset() (which is required)
> slows down testing a lot. Any idea whether this can be avoid to keep the speed?

It's slow because the "fix" keeps destroying and recreating the IO
context. You don't need to do that, you just need to flush the finished
events from kernel buffer using io_getevents(), otherwise it'll get full
and io_submit() will start returning EAGAIN. I'll submit a patch on Monday.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
