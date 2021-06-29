Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 147203B7A59
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 00:20:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 825B83C9397
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 00:20:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 49F863C2020
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 00:20:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B28B620039F
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 00:20:14 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 158C320426;
 Tue, 29 Jun 2021 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625005214;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j6gk/IyZSY2s3Lcz65BxhwdV/H4tL3yx2xV5BJgXMY8=;
 b=Xv0rXrhcmXIlgraJHizGONl2IxDenavDKjfzeb22A1aieCgWGqwCCXNmPICsGJA40GN2UP
 SpDhqTK5bZiZqcPwRPe/saMk0bbLKWn2Q/f3Pki14BrOagypu4gAkRgV+RURFRtaRBcwJW
 FzQVB9sTFY0kZZD9fmqhy8m4D1a3X9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625005214;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j6gk/IyZSY2s3Lcz65BxhwdV/H4tL3yx2xV5BJgXMY8=;
 b=FnyPiPz1ecz/pyj3DUhfEQA1TJitqh6ZZ2qSxtZNsh7+mdj6y3Xiv9Bz9k8+PEZg9SSTsy
 4bpN5n0nFvOabqBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C632E11906;
 Tue, 29 Jun 2021 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625005214;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j6gk/IyZSY2s3Lcz65BxhwdV/H4tL3yx2xV5BJgXMY8=;
 b=Xv0rXrhcmXIlgraJHizGONl2IxDenavDKjfzeb22A1aieCgWGqwCCXNmPICsGJA40GN2UP
 SpDhqTK5bZiZqcPwRPe/saMk0bbLKWn2Q/f3Pki14BrOagypu4gAkRgV+RURFRtaRBcwJW
 FzQVB9sTFY0kZZD9fmqhy8m4D1a3X9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625005214;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j6gk/IyZSY2s3Lcz65BxhwdV/H4tL3yx2xV5BJgXMY8=;
 b=FnyPiPz1ecz/pyj3DUhfEQA1TJitqh6ZZ2qSxtZNsh7+mdj6y3Xiv9Bz9k8+PEZg9SSTsy
 4bpN5n0nFvOabqBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 7EhJLp2c22DLUwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 22:20:13 +0000
Date: Wed, 30 Jun 2021 00:20:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YNucnE+N98zmKmWN@pevik>
References: <20210629214808.18760-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629214808.18760-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/5] Run tests in CI
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Hi all,

> changes v2->v3:
> * going back to simplest changes in make
> * adding lib/newlib_tests/runtest.sh (instead fighting with our build
>   system I concentrated on runtest.sh)
> * removing tst_fuzzy_sync01 as it sporadically fails

> Tested:
> https://github.com/pevik/ltp/actions/runs/984224611

> TODO: Not what's wrong with PATH on CentOS 7:
> /__w/ltp/ltp/lib/newlib_tests/runtest.sh: line 78: ./test05: No such file or directory
> ./shell/net/../../../../testcases/lib/tst_test.sh: line 149: tst_rod: command not found

> Maybe it's in different directory?
> It uses old make 3.82, there is something incompatible.
OK, whole out-of-tree build is broken. There are 2 issues:

1) probably PATH ../../testcases/lib/ points to srcdir instead of build dir).
It's just older make exit properly with 2, newer don't, not sure why.

2) The same issue with non-zero exit not being propagated on newer make
is also when runtest.sh quits with:
runtest TFAIL: shell/net/tst_ipaddr_un.sh failed with TFAIL

I guess I need to use @set -e; in Makefile (I didn't want to use set -e in the
runtest.sh itself, it would break printing printing what failed).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
