Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F259FD78
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Aug 2022 16:43:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C3BC3CA41C
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Aug 2022 16:43:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 235003C9AEA
 for <ltp@lists.linux.it>; Wed, 24 Aug 2022 16:43:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2552A600CCC
 for <ltp@lists.linux.it>; Wed, 24 Aug 2022 16:43:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E85742234A;
 Wed, 24 Aug 2022 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661352193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vd+Uh4ecvubKNWcyX8dHC4dEdjXOCvW3X8MGnWo+emc=;
 b=X3HayCORUwy2lIVEmqbZ8lYjJMnL0UdP80aIV10mp+lwmLklVLoXuKovSPmpzLVvU8xzjd
 bVHVY7U59RNSp5z82BkajIN56ohmcmVI0sE08jeSOWigcMS3nTi9LfcH08b6q6kYfUiW/a
 sAGiPadMa73B+kaAp9NQc/9BMyH4Z1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661352193;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vd+Uh4ecvubKNWcyX8dHC4dEdjXOCvW3X8MGnWo+emc=;
 b=/vuzbSavMtbjpBR7RMEfDv7s3tKd2LGpLSQ0tW0xsZ7BVaLMLbsYqSKq+qOj/C/rNVJ6uN
 Yn7f50ykOnLdDIDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDE8213AC0;
 Wed, 24 Aug 2022 14:43:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9C1zLwE5BmNADQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 24 Aug 2022 14:43:13 +0000
Date: Wed, 24 Aug 2022 16:45:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YwY5eWJesAkKNQ2M@yuki>
References: <20220824123240.20092-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824123240.20092-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] github: Add issue template
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> this effort is driven by reports like [1]
> You can see the result on my special fork [2].
> 
> I considered to mention ML, but in the end I didn't.
> 
> Kind regards,
> Petr
> 
> [1] https://github.com/linux-test-project/ltp/issues/created_by/anilbp
> [2] https://github.com/pevik/_ltp_test_issue/issues/new
> 
>  .github/issue_template.md | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 .github/issue_template.md
> 
> diff --git a/.github/issue_template.md b/.github/issue_template.md
> new file mode 100644
> index 000000000..caf8907da
> --- /dev/null
> +++ b/.github/issue_template.md
> @@ -0,0 +1,5 @@
> +Issues are *not* support forum.
> +
> +Bugs in the tests should be reported to your Linux distribution.
> +
> +Issues are *only* for reporting bugs in tests.

I guess if we are adding this we could also include actual instruction
for a real bugreports that they should idealy include LTP version,
distribution the bug was found on, full log if applicable, etc.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
