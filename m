Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3027C401880
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 10:59:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E8EC3C9524
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 10:59:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 329233C2600
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 10:59:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7158760072B
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 10:59:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B32B61FED1;
 Mon,  6 Sep 2021 08:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630918784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=frgg+Qt9LAHKFIHADFQrT2IuwxovO9r3ejfeNMGyruQ=;
 b=aXv2iw1PwqzIUqy5adjLk17x+gR702MxsMdH067qiiC/gxKlib6OTpcLBZxELbfHcah3tY
 vunUF9wt2u33p527l6mvVaXObTiuTah4MCjZrCcutyQ2eMIBPqkq3NDbk1GTg6U2Vob9dO
 zw91oOTnQGrAH0NS0wyNbcfy/a8ZApo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630918784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=frgg+Qt9LAHKFIHADFQrT2IuwxovO9r3ejfeNMGyruQ=;
 b=EKZUQbYz5ovBiHpyvsV4u4TNmyqWuwCz5aCgYU0Tp4AcgkQweXyovuRV6JcceHW5KNA7Kl
 FVX6d6z6H3AEn0Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A149213B3B;
 Mon,  6 Sep 2021 08:59:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fzhRJoDYNWEZfQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 06 Sep 2021 08:59:44 +0000
Date: Mon, 6 Sep 2021 10:59:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YTXYixG37nBTzhXk@yuki>
References: <20210906060020.3219023-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906060020.3219023-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] copy_file_range03: comparing timestamp in
 tst_timespec_diff
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
> -	updated_timestamp = get_timestamp(fd_dest);
> +	timestamp2 = get_timestamp(fd_dest);
>  
> -	if (timestamp == updated_timestamp)
> +	diff = tst_timespec_diff(timestamp1, timestamp2);
> +
> +	if (!diff.tv_sec && !diff.tv_nsec)
>  		tst_brk(TFAIL, "copy_file_range did not update timestamp.");

So as we changed the code to sleep for 1.5 sec I guess that we can
expect the difference to be at least 1 second because:

- the minimal granularity is 1s in which case we will get exactly 1s in
  the diff

- if the granularity is greater, we will get a bit more than 1s

So I would go for something as:

	long long diff_us = tst_timespec_diff_us(timestamp2, timestamp1);

	if (diff_us >= 1000000 && diff_us <= 2000000)
		tst_res(TPASS, "...");

Which expects that the difference between timestamps is in a sane range
not that it just have been changed.

>  	tst_res(TPASS, "copy_file_range sucessfully updated the timestamp");
> -- 
> 2.31.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
