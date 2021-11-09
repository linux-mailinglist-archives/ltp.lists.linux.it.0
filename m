Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B244AB92
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Nov 2021 11:32:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB5F13C06D2
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Nov 2021 11:32:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D13233C03B3
 for <ltp@lists.linux.it>; Tue,  9 Nov 2021 11:32:48 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EBA3C1001979
 for <ltp@lists.linux.it>; Tue,  9 Nov 2021 11:32:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 14D2021AFF;
 Tue,  9 Nov 2021 10:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636453967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0xKJUkgC55qtDbfW/lhsmrbwjKkvUTi+9rifbUEKP4=;
 b=Gn8CFS7xY0zp4R1747jLURqNxgFJn0fxi/VvMNbraA0lSY2QfT2yGGtlLDTQT2PFgVPsUZ
 OLOGOLrt9AqSnkvp1so8ax9DEAQe3TVqAKGRjmbGOmeYUNG1xg8DaDa4xTpIUhvKCUdH85
 zrGO/ER6BZLn4Lbf/s48b41f2y28ht8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636453967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0xKJUkgC55qtDbfW/lhsmrbwjKkvUTi+9rifbUEKP4=;
 b=wTJqUOcuOm/ZmmYQd7vLU0qOOhfh2dVJKRXwPT9byDoL+pCwYCUMIf8VynaKrGThBw3fjc
 jY/wtWZsGF/bWYDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF51513467;
 Tue,  9 Nov 2021 10:32:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bsATNU5OimFtdgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 09 Nov 2021 10:32:46 +0000
Date: Tue, 9 Nov 2021 11:33:48 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YYpOjGf64R9EcIVK@yuki>
References: <a3b6f022fac7447b9ee9a840c0ee212b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3b6f022fac7447b9ee9a840c0ee212b@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_test.c: add *cleanup() before exit
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> If we run the LTP testcases Concurrently, this might trigger the oom
> killer to kill the library process before the main process exit, and
> it might fill up the tmpfs through a long time running.

Then I guess we may as well adjust the oom_score for the test library
process so that it's less likely to end up being killed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
