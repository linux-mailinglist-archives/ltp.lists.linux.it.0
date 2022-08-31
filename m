Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D35A7C26
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 13:27:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC0D93CA70D
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Aug 2022 13:27:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D28E83C6651
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 13:27:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DFF1C1A004DD
 for <ltp@lists.linux.it>; Wed, 31 Aug 2022 13:27:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D4C522156;
 Wed, 31 Aug 2022 11:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661945232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ol6M0un7KA3EpAMxZKdeY1CUU7RbnUmcLu1T5NTxvU=;
 b=Sgy7+S1MDIkwqeDqnZwBRriZjupaGtq4ig25d/yXk/XqRiFQdrIJu6Q7CfrRkCJOadKgHx
 jsQCSKFppxSW5Vi4P0Yu/qq/eR5XwPZUOHMbjx7KGpy+ir2E3cp1Sebv8F8L+pCv8v++P6
 Lg8/sWKrAo3IXGuTHiwLFHvvuh35F18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661945232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ol6M0un7KA3EpAMxZKdeY1CUU7RbnUmcLu1T5NTxvU=;
 b=7RWoi/xyNglnJyTm/3aw2zCplRI/JIVPaWzgsH8ZGqjObVinENuYVb4ltOMopv3djsTz3E
 MX230guAW0msJ7BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 370DC1332D;
 Wed, 31 Aug 2022 11:27:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U5iyC5BFD2NcfQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 31 Aug 2022 11:27:12 +0000
Date: Wed, 31 Aug 2022 13:29:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Yw9GByNGbwassF/J@yuki>
References: <20220830135007.16818-1-mdoucha@suse.cz>
 <20220830135007.16818-9-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830135007.16818-9-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 08/10] readahead02: Add max_runtime
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
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/kernel/syscalls/readahead/readahead02.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/testcases/kernel/syscalls/readahead/readahead02.c b/testcases/kernel/syscalls/readahead/readahead02.c
> index 4fa8cfaf8..dc96eaef4 100644
> --- a/testcases/kernel/syscalls/readahead/readahead02.c
> +++ b/testcases/kernel/syscalls/readahead/readahead02.c
> @@ -406,6 +406,7 @@ static struct tst_test test = {
>  	},
>  	.test = test_readahead,
>  	.tcnt = ARRAY_SIZE(tcases),
> +	.max_runtime = 30,
>  	.tags = (const struct tst_tag[]) {
>  		{"linux-git", "b833a3660394"},
>  		{"linux-git", "5b910bd615ba"},

There are actually couple of things to consider here. First of all the
testfile_size defaults to 64MB but it can be changed by a command line
parameter, so we can easily overrun the 30 seconds by asking for large
enough file. The best solution would be to add runtime 30 seconds as
this patch does but if user passes -s parameter adjust the runtime in
the test setup as well. Something as (30 * size / 64_MB) should be
better than nothing.

However as we run the test with a loop device it will fail with ENOSPC
if we pass -s bigger than the loop device, we should at least check if
the device is large enough in the test setup too.

Also as we run the test inside a loop device I guess that we can also
sync and drop caches just for the device, which should be faster than
syncing and dropping the whole system. Possibly we just need to umount
it and mount it again.

And lastly we should as well use tst_parse_filesize() so that we can
pass -s 128M but that is very minor.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
