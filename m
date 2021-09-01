Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEF23FD9E1
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 14:57:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 536EC3C9379
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 14:57:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF5C53C535D
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 14:57:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E4A161A0112E
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 14:57:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0432E1FF04;
 Wed,  1 Sep 2021 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630501032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+v8R2JZs2/PbDbOT4grj2A1jV5L55pvAouzPJyrcmJU=;
 b=nzdlh4GnzuWOCgCQAwXrZtQfOt+OFUku3Mnba6ZnXvpFqIb3FFmp2PbeIppi/zucEIkqkE
 9TEFr5c7VaRqObOB8pUaV6wBF9ffd1+4qgkmV3bcz/cSMjsT5Xb5om8jwX6ScDeJnilLJb
 xImYkvKNSIB6x66+b25BOQsX02jvSdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630501032;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+v8R2JZs2/PbDbOT4grj2A1jV5L55pvAouzPJyrcmJU=;
 b=Wt+u5Egz13fJbn3UXYedbC7y599Deq1ngtoBqWxcEarEI0A4Jws4J/vJ+s//v9gzOXtYrQ
 yPADwK94nPAEOZCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E391913AF8;
 Wed,  1 Sep 2021 12:57:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KG6FN6d4L2F/egAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 01 Sep 2021 12:57:11 +0000
Date: Wed, 1 Sep 2021 14:57:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Wang Kunfeng <threefifteen.wangkunfeng@huawei.com>
Message-ID: <YS94sad/CSdCWaoA@yuki>
References: <20210831024617.246758-1-threefifteen.wangkunfeng@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210831024617.246758-1-threefifteen.wangkunfeng@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] gettid:Convert gettid01 to new API
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
Looks good, apart from the license.

Also we should try to validate the tid. I guess that we can do that by
sending a signal and making sure that it has arrived. That could be done
by something as tgkill(getpid(), TST_RET, SIGUSR1); after setting up an
handler for SIGUSR1 that sets a flag if called and then checking if the
flag has been set after we have send the signal.

Also I guess that in the simple case that the process runs a single
thread the pid is the same as tid. We would have to clone a new process
with CLONE_THREAD and run the test from the cloned thread in order to
have the tid different from the pid in order to test the getpid() !=
gettid() case.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
