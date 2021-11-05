Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185344605B
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 08:56:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE4353C75BA
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 08:56:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB4453C559D
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 08:56:39 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 14A2714011B3
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 08:56:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 06D25212BD;
 Fri,  5 Nov 2021 07:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636098998;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=drwnNkQr2mGatNKNZQ5tmQuyIfwlgxvKsii21C0TcdQ=;
 b=YcYnOukxzZFDUCAgtgNsIHHg5DQozsSfZT5wvoN7e00d6q3PebwBnij0A1cGYEazBRGFSD
 isuB0xLzQi1NFCZGluN/RMpaVXpMMZYN49hmMPu/RfsR9NJQvGfkrNKNJXdvLvJeYOuvRA
 9sF3qe88q9TwqaqBOliYmookdZMUmiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636098998;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=drwnNkQr2mGatNKNZQ5tmQuyIfwlgxvKsii21C0TcdQ=;
 b=S2Q9GjJpTojVZbnFT4H7Lej2zLROPrX6T3EqgTYpwujibtONbRThYLfNu6FeUHBgzFfiem
 9bucLcYBl+lenxBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5DEF13D13;
 Fri,  5 Nov 2021 07:56:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GJUEM7XjhGFROgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 05 Nov 2021 07:56:37 +0000
Date: Fri, 5 Nov 2021 08:56:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YYTjtMm6mJ6w8Trs@pevik>
References: <20211105020729.162391-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211105020729.162391-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/epoll_create: add libc test for
 epoll_create
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

Hi Zhao,

> For epoll_create01.c/epoll_create02.c, we add libc epoll_create()
> test because Syscall __NR_epoll_create is not support in some arches.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

FYI in the past I was thinking about further automation of test variant,
thus I added variant_desc (see accept4_01.c). But nowadays most of the test
variants are using struct test_variants (mostly due time64 support thus they use
time64_variants.h). It looks to me only accept4_01.c and epoll_create0[12].c you
just ported, so any optimisation for non-time64 tests is not relevant any more.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
