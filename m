Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4F746DC1
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jul 2023 11:39:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B87943CC02E
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jul 2023 11:39:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7236F3C9981
 for <ltp@lists.linux.it>; Tue,  4 Jul 2023 11:39:03 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C3F0210007FF
 for <ltp@lists.linux.it>; Tue,  4 Jul 2023 11:39:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F389420483;
 Tue,  4 Jul 2023 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1688463542;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZgn8oRQnZ31x6Q+owX37cbu5hbbTt0mSp5MKGNUSm8=;
 b=1K50PN303wqCHQ7sD31vpBgRCyzGn5Yf5aRX32oHAdrOYd4euX1mS/wKKGGFhpYfbeE+kd
 qhRyYJQT8gew/p1hBM8LDcj0u+36yD8jvqT9O2eEZLmYLt7cABHPU2LyWgyUdSbv6znT/P
 ZVNdMG24ZaBzRrlDeQJoBj82H127aHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1688463542;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZgn8oRQnZ31x6Q+owX37cbu5hbbTt0mSp5MKGNUSm8=;
 b=+cbJOVzGwASaC/Bw2y6c4ephL4JV8tpEFzoxwhWduQdlMSQA0tbyIKlYOheZirNCtUY5K4
 om2O9xaol6YDl3Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7BCD133F7;
 Tue,  4 Jul 2023 09:39:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L1p8M7Xoo2SuUwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 04 Jul 2023 09:39:01 +0000
Date: Tue, 4 Jul 2023 11:39:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20230704093900.GB470707@pevik>
References: <20230704092424.497903-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704092424.497903-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/3] C API: print LTP version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I also wonder, how to print LTP version for C API without requiring
LTPROOT environment variable.

In shell, it could be changed

if [ -z "$LTPROOT" ]; then
-	export LTPROOT="$PWD"
+	export LTPROOT="$(cd "$(dirname "$0")/../.." && pwd)
-	export TST_DATAROOT="$LTPROOT/datafiles"
else
	export TST_DATAROOT="$LTPROOT/testcases/data/$TST_ID"
fi

But that could broke some tests which are using datafiles/ directory inside git
tree.

I was also thinking about replacing LTPROOT in C API with #define generated by
configure script based on prefix. But again, how to have it in shell?
I don't want to have stub (tst_test.sh.in), thus maybe the way would be to
expect "Version" file is in ../../, e.g.

. ../../Version
But with the LTPROOT change above, it could be
. $LTPROOT/Version

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
