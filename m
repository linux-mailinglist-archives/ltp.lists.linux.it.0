Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D8078FBD2
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 12:38:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 233B83CE02C
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 12:38:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EA0E43CBBA7
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 12:38:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3A4D2600A85
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 12:38:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B90B1F45E;
 Fri,  1 Sep 2023 10:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693564680;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/n4zI2gvusqHRwql/8vYS0DUeYFEVN+lTH5vP+qwrM=;
 b=P1KgYbu+xtXS/UF4S68nCT50d6h8p7rUR0a2XIp30s/7khKLYuIyVPCIK43Ai4POGUjXAL
 +PeobTmSCIt4LCAhru/e7xwpasv/mqr+ynKsxwgMr9uAo7LVBQeJbE7ZyO11M55z4h1Lgq
 vlzPFwK2DSGJwzAVd8imY7Sfw9lFQ+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693564680;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/n4zI2gvusqHRwql/8vYS0DUeYFEVN+lTH5vP+qwrM=;
 b=5jWPQLfD6Oo+a9PONrgyCOE4URQP380xMy3Mo6imZLGNssr3S8KDv5t5umvGTbMgorK9nb
 soyLMbISptzYJ/AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD4131358B;
 Fri,  1 Sep 2023 10:37:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id G2hrMwe/8WRtZgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 01 Sep 2023 10:37:59 +0000
Date: Fri, 1 Sep 2023 12:37:58 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230901103758.GC323151@pevik>
References: <20230829073821.2580-1-andrea.cervesato@suse.de>
 <ZO8d3GO_jFgNAXNY@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZO8d3GO_jFgNAXNY@rei>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Add process_madvise01 test
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

HI Andrea, Cyril,

> Hi!
> > +	TST_EXP_EXPR(map_before.swap < map_after.swap,
> > +		"Most of the memory has been swapped out: %dkB out of %dkB",
> > +		map_after.swap,

> Although it's unlikely that map_before.swap will be non-zero we should
> print the difference here, so I've changed this part to:

> map_after.swap - map_before.swap

> And pushed, thanks.

FYI this new test is failing on current openSUSE Tumbleweed (kernel 6.4.12-1):

tst_test.c:1559: TINFO: Timeout per run is 0h 00m 30s
process_madvise01.c:38: TINFO: Allocate memory: 1048576 bytes
process_madvise01.c:99: TINFO: Reclaim memory using MADV_PAGEOUT
process_madvise01.c:62: TFAIL: Expect: Most of the memory has been swapped out: 0kB out of 1024kB

Summary:
passed   0
failed   1
broken   0
skipped  0
warnings 0

Test works well on current Debian unstable with kernel 6.4.11.
Could you please have a look if it's a test or a kernel bug?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
