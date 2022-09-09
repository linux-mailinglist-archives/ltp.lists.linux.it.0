Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 543815B3230
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 10:47:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 569683CA9F1
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 10:47:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E67B63C8CC0
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 10:47:28 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 66A901A003C0
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 10:47:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 705501F8D7
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662713247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=Vc7h5hXOphEcedq/uYckH4cP6f813E+Uoq7nsataaFE=;
 b=WGxExJM+OSQEcnT2GwtZ+uoNGh60kAznjnWkE+9XTU80FOcA9hx8Ld+JTNyxPJBjg01mRf
 bZnBkMAUi9PUg/sfl6mo7St+fpB3y7/neSiJVGtxPA1JRUfwZYP/w6FlkkSgIvaYTIHY7J
 Iw/2srorJXqjBSzDGFd9wHdKIWzxeJc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662713247;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=Vc7h5hXOphEcedq/uYckH4cP6f813E+Uoq7nsataaFE=;
 b=ZE4Tg2JuYg3fCHH6JniXuOldnPtryLeoxH2naNMPetKDGapM9Yfe4WiWohcJOPcCPaCTDV
 QQO5aPLKdgoFRwDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B707139D5
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 08:47:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Kdi0FZ/9GmOsTwAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 09 Sep 2022 08:47:27 +0000
Date: Fri, 9 Sep 2022 10:49:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: LTP List <ltp@lists.linux.it>
Message-ID: <Yxr+EpKTnKQbKXTb@yuki>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] September LTP release
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
It's time to start working on LTP September relelase.

First of all I'm thinking of increasing the bus factor for LTP so if
there is anyone who wants to drive the release process instead of me
please sign up ASAP. I will of course review patches and help with the
release, but it would nice if someone else tried to do all the little
things for release as sending emails, deciding what should go to release
after freeze, preparing release notes, uploading tarballs on github,
etc.

And in order not to delay things further, please start pointing out
patches that should go in before the release. I guess Martin runtime
fixes should go in. Anything else?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
