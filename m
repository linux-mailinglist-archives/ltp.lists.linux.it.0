Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 013753A0EE5
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 10:48:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5B323C4D93
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 10:48:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 762893C29E8
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 10:48:57 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0A7026009D7
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 10:48:56 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 32AE3219B7;
 Wed,  9 Jun 2021 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623228536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJ2AGncHYldigudXUyRK4AfCUAhLWbfR5WNiIhnXyr0=;
 b=WltUW18KmIHDmDKlnCfy259F/4IJwESt+DSWi5+V8Vku5wGMMI0woO4QGXGYc3sFHaWa3C
 66Br79yOwUXKLZED5CTUp6W18m0T//JdauLAGoPuSso5744Ute9Ws9ZnpJy1C4KZN46LIO
 ChHCuEC3d2iLK5LFGB3uMggC+6zyCvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623228536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJ2AGncHYldigudXUyRK4AfCUAhLWbfR5WNiIhnXyr0=;
 b=rWdHDkUfadD8xdPEeZ+S/YEp30QtRO1AjbEWDnFJ8/Mw00wkw9HoIHNMJfaKvaZkLtwYbR
 faaqh6HXNPgkiwBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 163C8118DD;
 Wed,  9 Jun 2021 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623228536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJ2AGncHYldigudXUyRK4AfCUAhLWbfR5WNiIhnXyr0=;
 b=WltUW18KmIHDmDKlnCfy259F/4IJwESt+DSWi5+V8Vku5wGMMI0woO4QGXGYc3sFHaWa3C
 66Br79yOwUXKLZED5CTUp6W18m0T//JdauLAGoPuSso5744Ute9Ws9ZnpJy1C4KZN46LIO
 ChHCuEC3d2iLK5LFGB3uMggC+6zyCvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623228536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJ2AGncHYldigudXUyRK4AfCUAhLWbfR5WNiIhnXyr0=;
 b=rWdHDkUfadD8xdPEeZ+S/YEp30QtRO1AjbEWDnFJ8/Mw00wkw9HoIHNMJfaKvaZkLtwYbR
 faaqh6HXNPgkiwBg==
Received: from director1.suse.de ([192.168.254.71]) by imap3-int with ESMTPSA
 id cBw2BHiAwGBWZAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 08:48:56 +0000
Date: Wed, 9 Jun 2021 10:23:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Message-ID: <YMB6aoVvTKJQ6wif@yuki>
References: <20210608132723.255996-1-cascardo@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210608132723.255996-1-cascardo@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_wake04: avoid tst_ts_from_ns overflow on
 32-bit platforms
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Good catch, I guess that it would be slightly cleaner to fix the
NSEC_PER_SEC size instead with:

diff --git a/include/lapi/common_timers.h b/include/lapi/common_timers.h
index b783beff4..e50f698d6 100644
--- a/include/lapi/common_timers.h
+++ b/include/lapi/common_timers.h
@@ -12,7 +12,7 @@
 #include "lapi/posix_clocks.h"

 #ifndef NSEC_PER_SEC
-#define NSEC_PER_SEC (1000000000L)
+#define NSEC_PER_SEC (1000000000LL)
 #endif

 static const clock_t clock_list[] = {


What do you think?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
