Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D93F6190
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 17:24:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 407DA3C31FE
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 17:24:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8530B3C30C8
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 17:24:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 14809600631
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 17:24:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 944A2220C9;
 Tue, 24 Aug 2021 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629818682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OBifFbMWaERW7wZ120d+vdEuxUKER37MKI3fG9I4Uyw=;
 b=Ul+XxdDonfCo/x2y8uL8fWM5jSsFo9UuOWax18yS5gFbZH7Q39MJdEtKXT2FIB8fCi5V64
 liO7G87ajfOd9j5psSM8tv8NxWJKThdSUzlcellOIXT7OP/WcqXZsiP7q91Z/6A0mdYUM3
 0iTwV+kXQcfcMsJ7jly9xtKCbZgJGho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629818682;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OBifFbMWaERW7wZ120d+vdEuxUKER37MKI3fG9I4Uyw=;
 b=lo67MQs65ZW64edLo1TdAukXtJyFzL9wFnNEHj3KzJgIHYxdipfR5Xx8EHumK7gV84hzHO
 4Xgf3yg20F/7rsCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D81213AFF;
 Tue, 24 Aug 2021 15:24:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ThxkHToPJWGOGwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 24 Aug 2021 15:24:42 +0000
Date: Tue, 24 Aug 2021 17:24:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YSUPQSOB6pYOG4nj@yuki>
References: <20210817064924.127970-1-xieziyao@huawei.com>
 <20210817064924.127970-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817064924.127970-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] epoll_ctl: Add docparse formatting and
 cleanup for epoll_ctl02
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
Pushed with a minor change to the documentation comment, thanks.

> +/*\
> + * [Description]
>   *
> + * Verify that,
> + * - epoll_ctl fails with EBADF if epfd is an invalid fd.
> + * - epoll_ctl fails with EBADF if fd is an invalid fd.
> + * - epoll_ctl fails with EINVAL if op is not supported.
> + * - epoll_ctl fails with EINVAL if fd is the same as epfd.
> + * - epoll_ctl fails with EINVAL if events is NULL.
> + * - epoll_ctl fails with ENOENT if fd is not registered with EPOLL_CTL_DEL.
> + * - epoll_ctl fails with ENOENT if fd is not registered with EPOLL_CTL_MOD.
> + * - epoll_ctl fails with EEXIST if fd is already registered with EPOLL_CTL_ADD.

There is no reason to repeat the 'epoll_ctl fails with' so I've moved it
to the "Verify that," part and also there has to be empty line after the
"Verify that..." so that the list renders as a list in asciidoc.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
