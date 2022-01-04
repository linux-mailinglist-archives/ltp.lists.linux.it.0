Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5167E4840FE
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 12:37:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E289A3C9166
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 12:37:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D67E63C1482
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 12:37:25 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 046131000230
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 12:37:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 24D0A1F397;
 Tue,  4 Jan 2022 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1641296244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YS4Wh/FUIwBdVTHNXB1PUkFFBUALW/KbFwW/o90WutM=;
 b=1usgxb55r1KgN/StehxkRsahSM+Rf82/9Y7U1UcZXflCtWoccbmKwaPQ74sUYJLH1qWH/1
 yff9toI4nS7oDnl69ekko8KwKY5nsTpvSjxhK1LnSfnY8u+zW6fHuSu1RRcUksonXSJn0p
 aKGdITUvUpQrAGeDLnIi8hJ09JWGXfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1641296244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YS4Wh/FUIwBdVTHNXB1PUkFFBUALW/KbFwW/o90WutM=;
 b=XtQyP4F2KL5WuLmUk2ZnCYiTjqof5bkoDqbCulv6CYkJyiH8UP10EWATMPhdvMKph84M+9
 6LIg6fDzxiBvBBCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11EA113AE1;
 Tue,  4 Jan 2022 11:37:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /rwzA3Qx1GE5PgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 04 Jan 2022 11:37:24 +0000
Date: Tue, 4 Jan 2022 12:38:52 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YdQxzGz/JepPnmVu@yuki>
References: <20220104081836.22827-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104081836.22827-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 00/10] watchqueue testing suite
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
> described in https://www.kernel.org/doc/html/latest/watch_queue.html
> 
> Andrea Cervesato (10):
>   Prepare watchqueue testing suite build
>   Add wqueue01 new test
>   Add wqueue02 new test
>   Add wqueue03 new test
>   Add wqueue04 new test
>   Add wqueue05 new test
>   Add wqueue06 new test
>   Add wqueue07 new test
>   Add wqueue08 new test

Minus the issues I've pointed out this looks like a good basic tests.

What is missing are all the more interesting cases, just by looking at
the API these are at least:

- check that we can filter out events correctly
  (both for type and subtype)

- test that fills up the queue on purpose, i.e. generates events and
  does not read back until its full, you should get special event if
  WATCH_META_LOSS_NOTIFICATION is set

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
