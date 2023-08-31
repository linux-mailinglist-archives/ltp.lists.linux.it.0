Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E72978EEA8
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Aug 2023 15:31:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 381EF3CBEE9
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Aug 2023 15:31:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8A05D3CBE81
 for <ltp@lists.linux.it>; Thu, 31 Aug 2023 15:31:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 750E52000D4
 for <ltp@lists.linux.it>; Thu, 31 Aug 2023 15:31:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8742821842;
 Thu, 31 Aug 2023 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693488695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dS4yj2IAnoHV42RDJAbnutNEznwCyFJR9Hm95H3HJ4Q=;
 b=d5ufSTEw8YwTxZlYll8VRQ1DKk8qXqZZXDg2QrgiGJWyqzeLoAm9Yn+ILbQV/n6TBPbjKH
 p4qgCXSiyd5oIKMrB9tcCjzPXS50fWV1wZoNH3kFn8i42QdCU1j5Mnxyyif/ywVraXpmJX
 w8lCoH6nKrNxqnWoF45QXldzcaOyLHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693488695;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dS4yj2IAnoHV42RDJAbnutNEznwCyFJR9Hm95H3HJ4Q=;
 b=IJrOHvcv/cr/yWFf9NhMTkR0ic3jjnhS2A9djheubEVOZpN/ReFU9i2KgbFuBzXJotx9g9
 cSfffZ1ujN8HxoCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7544613583;
 Thu, 31 Aug 2023 13:31:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id s7QeGzeW8GTZIAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 31 Aug 2023 13:31:35 +0000
Date: Thu, 31 Aug 2023 15:32:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZPCWWXXHG-oEB5qO@yuki>
References: <20230831104242.27156-1-andrea.cervesato@suse.de>
 <20230831104242.27156-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230831104242.27156-2-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/2] Refactor getegid01 using new LTP API
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
> +	gid_t gid;
> +	gid_t st_gid, st_egid;
>  
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO, "getegid failed");
> -			continue;	/* next loop for MTKERNEL */
> -		}
> +	SAFE_FILE_LINES_SCANF("/proc/self/status", "Gid: %d %d", &st_gid, &st_egid);

Hint: You can use assignment suppresion '*' in order to get rid of the
      dummy st_gid variable.

> -		tst_resm(TPASS, "getegid returned %ld", TEST_RETURN);
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
> -
> -static void setup(void)
> -{
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -	TEST_PAUSE;
> +	GID16_CHECK((gid = GETEGID()), "getegid");

And this does not work at all.

The GID16_CHECK() is for the case where we have GID that is 32bit and we
want to check if the value fits into 16bit. In this case we get 16bit
value from the sycall, so the check will always be true.

Also the check only returns value, which we ingore here, so this isn't
doing anything at all.

What we need to do instead is to check the gid from /proc/ that is 32bit
if it fits into 16bit (in the case of the 16bit syscall) and skip the
comparsion below.

> +	TST_EXP_EQ_LI(gid, st_egid);

So the code here should really do:

	if (GID16_CHECK(st_egid))
		TST_EXP_EQ_LI(gid, st_egid);
	else
		tst_res(TPASS, "getgid() passed");

Which skips the check on 16bit syscall in the case that the GID
overflows 16bit, however we still have to report at least single TPASS
otherwise the test will be failed by the test library.

>  }
>  
> -static void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.test_all = run,
> +};
> -- 
> 2.35.3
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
