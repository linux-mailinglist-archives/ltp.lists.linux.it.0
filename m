Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC73577CD5
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jul 2022 09:50:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52FAC3C95FF
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jul 2022 09:50:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CA38A3C8CB2
 for <ltp@lists.linux.it>; Mon, 18 Jul 2022 09:50:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id ADF2710005C4
 for <ltp@lists.linux.it>; Mon, 18 Jul 2022 09:50:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 608D01F949;
 Mon, 18 Jul 2022 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1658130640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDjdD6skMppLyyGnyYw5NUIiM5/0OH+zpXB6aerrZdI=;
 b=yBIT57bMkxVw67j18Bu/llcEShFeseoL4C6ZkMBkFKRbbNKjKWqQekl/GYAkhGt7NTqI03
 GV5n8UawKmHRTQS0a0uU0xOH9A8tJM3+bAowUn6plsdxIGFZxCloVT4TByb6wVk1Y3OpL9
 qVq5xCn7jXUYp9XKnyelVyCMqE6JZnY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1658130640;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDjdD6skMppLyyGnyYw5NUIiM5/0OH+zpXB6aerrZdI=;
 b=XSLz66lXeuK3jQOlTvlbf5jjedvp1oaE832ZH3iX8Xd9LOQ9vOxJHBfuEyXPVczWrDwN7Y
 EgXi9IkJNN0iYMCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 49E5413A37;
 Mon, 18 Jul 2022 07:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +MGIENAQ1WKqfQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 18 Jul 2022 07:50:40 +0000
Date: Mon, 18 Jul 2022 09:52:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YtURQlBJhpnWoSCv@yuki>
References: <20220715062519.2480-1-chenhx.fnst@fujitsu.com>
 <YtGZZeUm2iB/uySr@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YtGZZeUm2iB/uySr@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mount03: Convert to new API
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> @Richie @Li @Metan: There are checkpatch.pl warnings. Yes, kernel folks does not
> like permission warnings. Do we want to follow? Or should we remove these from
> our checkpatch.pl fork (we use constants in many places)?
> 
> $ make check-mount03
> mount03.c:29: WARNING: Symbolic permissions 'S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH' are not preferred. Consider using octal permissions '0644'.
> mount03.c:30: WARNING: Symbolic permissions 'S_IRUSR|S_IXUSR|S_IXGRP|S_IXOTH' are not preferred. Consider using octal permissions '0511'.
> mount03.c:50: WARNING: static char array declaration should probably be static const char
> mount03.c:103: WARNING: Symbolic permissions 'S_IRWXU' are not preferred. Consider using octal permissions '0700'.
> mount03.c:114: WARNING: Symbolic permissions 'S_IRWXU' are not preferred. Consider using octal permissions '0700'.
> mount03.c:125: WARNING: Symbolic permissions 'S_IRWXU' are not preferred. Consider using octal permissions '0700'.
> mount03.c:181: WARNING: Symbolic permissions 'S_IRWXU' are not preferred. Consider using octal permissions '0700'.
> mount03.c:204: WARNING: Symbolic permissions 'S_IRWXU' are not preferred. Consider using octal permissions '0700'.

To be honest I think Linus is right at this one, the single octal number
is way more readable than the bitwise or of four constants, so I would
be inclined to start following the kernel practice here.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
