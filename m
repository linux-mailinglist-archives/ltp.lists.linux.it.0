Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7424547BE33
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Dec 2021 11:36:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F50B3C9213
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Dec 2021 11:36:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D13143C0667
 for <ltp@lists.linux.it>; Tue, 21 Dec 2021 11:36:44 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 64F18200FF5
 for <ltp@lists.linux.it>; Tue, 21 Dec 2021 11:36:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B468B21114;
 Tue, 21 Dec 2021 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640083003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J8AbVM/jTIj/B8506IjgCqBkpAuxg/A5qCyA3m96vCI=;
 b=IiKQJ2qLtJPqyG8XcO0mk9o5JIBeJBv6JWo/YiJsIza8etM+uAQJHIdS4/1E0iAM0dJc4h
 0I033udUeqMKe3QV+sX59m7s6XnzpWs17Xw0EzfKToPdWIR2Eq0JTCfntDYy7CM3qtMCep
 uvlag5TthwzLKmWJeAADFtTU72j2yvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640083003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J8AbVM/jTIj/B8506IjgCqBkpAuxg/A5qCyA3m96vCI=;
 b=vBQbVmSNZKhvVnfnKG9ohZva9ntVpWkNMMia/2x+C/SCmvXuPR7OZti4ERqUduaFPlLjqS
 qZfwo84fqc3x+1Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C4D113A5F;
 Tue, 21 Dec 2021 10:36:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WxhPJDuuwWGXYgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 21 Dec 2021 10:36:43 +0000
Date: Tue, 21 Dec 2021 11:38:14 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YcGuliqt4hj/M0pX@yuki>
References: <20211221091302.26904-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221091302.26904-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Complete help message adding option before desc
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
>  static void print_help(void)
>  {
>  	unsigned int i;
> +	char msg[1024];
>  
>  	/* see doc/user-guide.txt, which lists also shell API variables */
>  	fprintf(stderr, "Environment Variables\n");
> @@ -498,8 +499,13 @@ static void print_help(void)
>  	if (!tst_test->options)
>  		return;
>  
> -	for (i = 0; tst_test->options[i].optstr; i++)
> -		fprintf(stderr, "%s\n", tst_test->options[i].help);
> +	for (i = 0; tst_test->options[i].optstr; i++) {
> +		snprintf(msg, 1024, "-%c\t %s",
> +			tst_test->options[i].optstr[0],
> +			tst_test->options[i].help);
> +
> +		fprintf(stderr, "%s\n", msg);
> +	}
>  }

I got rid of the useless temporary buffer here and pushed, thanks.

This is actually a step into a right direction and it also makes the
generated documentation a bit better too. Ideally the tst_test structure
could be also improved to include the default value for the option
too...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
