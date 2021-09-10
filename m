Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F28F1406DA5
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 16:32:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20DEB3C8CF5
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Sep 2021 16:32:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DEB613C05AE
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 16:32:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E4F221A00E02
 for <ltp@lists.linux.it>; Fri, 10 Sep 2021 16:32:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C45620211;
 Fri, 10 Sep 2021 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631284370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0gCvHaFoaErwZzq8spVYY8j7DbpH/CPgcbOQt2V5IEI=;
 b=206L+5vmmo3KJcInxsempdJtTN6qyVFo6yJ8DKRXsTVNWmvpFp9ktQEEORSQdtjnGrJSNz
 XRfLvgMrJO4L/3a/+GAWeQ8O/ArtYVybcP8QTssQtSKDm/ereurR+UwAiHrHgoaLHl56pL
 GsNJnJ14ByhEGm0Pc7fAw4YDvKmY6zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631284370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0gCvHaFoaErwZzq8spVYY8j7DbpH/CPgcbOQt2V5IEI=;
 b=uVEZhzEe10jU5Y+mVEQxR9X4LECC82HqwvpcR2ZpaUfWIHyOWH/gV+k6WFD6VfF1o1wbPS
 TQH4YKJAUsiBSoBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EE0413D38;
 Fri, 10 Sep 2021 14:32:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9nFGDpJsO2ElbQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 10 Sep 2021 14:32:50 +0000
Date: Fri, 10 Sep 2021 16:33:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YTtsomf8YXHThm6t@yuki>
References: <20210909155126.2720-1-mdoucha@suse.cz>
 <20210909155126.2720-4-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210909155126.2720-4-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/8] syscalls/setresgid02: Convert to new API
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
I've pushed patches up to this point, thanks.

For the rest it has to be decided if we will use TST_EXP_FAIL() or not.

I've also did a minor changes to this patch, see below.

> +/*\
> + * [Description]
> + *
> + * Verify that setresgid() will successfully set the expected GID when called
> + * by root with the following combinations of arguments:
> + * 1. setresgid(-1, -1, -1)
> + * 2. setresgid(-1, -1, other)
> + * 3. setresgid(-1, other, -1)
> + * 4. setresgid(other, -1, -1)
> + * 5. setresgid(root, root, root)
> + * 6. setresgid(root, main, main)
> + */

I've reformatted this part so that it rendes as a list in the asciidoc
syntax.

>  struct test_case_t {		/* test case structure */
> -	uid_t *rgid;		/* real GID */
> -	uid_t *egid;		/* effective GID */
> -	uid_t *sgid;		/* saved GID */
> -	struct passwd *exp_rgid;	/* Expected real GID */
> -	struct passwd *exp_egid;	/* Expected effective GID */
> -	struct passwd *exp_sgid;	/* Expected saved GID */
> +	gid_t *rgid;		/* real GID */
> +	gid_t *egid;		/* effective GID */
> +	gid_t *sgid;		/* saved GID */
> +	gid_t *exp_rgid;	/* Expected real GID */
> +	gid_t *exp_egid;	/* Expected effective GID */
> +	gid_t *exp_sgid;	/* Expected saved GID */
>  	char *desc;		/* Test description */
>  };

And also got rid of these useless comments, that were commenting the
obvious.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
