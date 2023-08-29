Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D1278BF30
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Aug 2023 09:26:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F1243CC03E
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Aug 2023 09:26:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 24CD13CB722
 for <ltp@lists.linux.it>; Tue, 29 Aug 2023 09:26:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5932214000F9
 for <ltp@lists.linux.it>; Tue, 29 Aug 2023 09:26:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 642881F37E;
 Tue, 29 Aug 2023 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693293971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qr8NGQQY/ejotC0K8A7xj5SbMXSBe+8h2SveFNh/Bqs=;
 b=ElyJy7I+ba07M5wuRC3yZ1IcY9Dwm/Cwwg4O9uqR9TOc5KbNXcjGLfnGqUDA8zyvUZnXsv
 Y1n4e8GexUU26VcuV9oMfvEL9fvBUBWYn0yQqyv2C7/q5s9PpOdZ1s3GoP12RmORxspHcJ
 rZyKVYL/RNuPgLjho7E2+cRLofrqnAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693293971;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qr8NGQQY/ejotC0K8A7xj5SbMXSBe+8h2SveFNh/Bqs=;
 b=jbgK/wDBTOOqUEhLaiF76u0r0NwPjTsybovPc/PTckBH/WZeQDSfCC6Sz+BKhhLXvUVADo
 6jfs0hhXYy/mCEAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A2994138E2;
 Tue, 29 Aug 2023 07:26:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E17mHJKd7WQ8GwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 29 Aug 2023 07:26:10 +0000
Date: Tue, 29 Aug 2023 09:25:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZO2dfwOM0pK8xz1j@rei>
References: <20230823130904.26051-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823130904.26051-1-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Add epoll_wait05 test
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
> This test verifies that epoll receives EPOLLRDHUP event when we hang
> a reading half-socket we are polling on.
> 
> Implements: https://github.com/linux-test-project/ltp/issues/860
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>

...

> +/*\
> + * [Description]
> + *
> + * Verify that epoll receives EPOLLRDHUP event when we hang a reading
> + * half-socket we are polling on.
> + *
> + * As reference please check https://lwn.net/Articles/864947/

I'm a bit confused here, the test itself looks good, but it references
an article and a kernel commit that changed how polling on _pipe_ works.
The kernel change literally changes only pipe_write() in fs/pipe.c and
this test actually tests inet sockets.

I guess that the confusion is caused by the fact that the github issue
referenced the lwn.net article as a reason why we need more epoll
coverage, but these tests are not directly related to that commit at
all.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
