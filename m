Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9DB450257
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 11:22:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8494C3C814D
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 11:22:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A84A93C7FC2
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 11:22:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DE794601234
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 11:22:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 282971FD65;
 Mon, 15 Nov 2021 10:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636971761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lenc7i5VZ9/2waY1K0IsFoYj5nB6gZ55WI9h5sviQ7Q=;
 b=mbOuebCQMUo7vHPXYxY4t9X/nM5lXNxhEkS3mlQLFX2oKRQpLhMF/NxuJ2kEK9iRqsUYCP
 ea5Gs+pfqcVHqWNQ4UamFmFE8Qtpxd1iMZO6jqhui7TB4SPoKwGHz1A5xjd3zQvJ0W+XbL
 2cWkuK7OFd4rhajmiMuzKPgLLAEvX7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636971761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lenc7i5VZ9/2waY1K0IsFoYj5nB6gZ55WI9h5sviQ7Q=;
 b=6QoUayFhCgn50tRhPVSdaQDY3Be/XGHmqrsKXyso5qUT5XbS84KLTrS3txxGwIsmLjfllE
 D9Hhths9rivIPKAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1437E13D58;
 Mon, 15 Nov 2021 10:22:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NoewA/E0kmHlIgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 15 Nov 2021 10:22:41 +0000
Date: Mon, 15 Nov 2021 11:23:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YZI1MBtVqeN7FTJ8@yuki>
References: <20190726081926.8250-1-camann@suse.com>
 <20200207111028.GA19508@rei.lan> <875ysxe4dp.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875ysxe4dp.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] syscalls/ioprio: Add functional test case
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
Cc: Christian Amann <camann@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I think in general things have moved on quite a bit since this was
> written. So considering the other issues as well, I will mark it as
> rejected in patchwork. If anyone would like to pick this up please see
> https://github.com/linux-test-project/ltp/issues/277

I've linked the mailing list thread in the issue as well, so that
the discusions is not lost.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
