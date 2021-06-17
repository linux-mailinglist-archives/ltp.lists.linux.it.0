Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC843ABD46
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 22:06:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78DC43C7883
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 22:06:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E6D5E3C4C05
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 22:06:33 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BF3AB600941
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 22:06:32 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E61AE1FDE7;
 Thu, 17 Jun 2021 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623960391;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A/t3v3r3dK5y8/qvK8sDxSOZ3Ex3Y8hatLd4JANyvUw=;
 b=yMRmVPVYweOG/lafCJbg2OLgoeWJIwgzmmr4wry6Dh2/oMnnJp6nVKsoxSpHzZp8ANgDQJ
 wcgCja4ET4MUjbiJMjFeeYAFgJrICJtQYqo8hAPTmNeu/jz+0GobO6kKp9F+eCetC6AoGU
 5r6+HvT3WHv7XgZJgFImnTkRiozPbNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623960391;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A/t3v3r3dK5y8/qvK8sDxSOZ3Ex3Y8hatLd4JANyvUw=;
 b=U4bup7b3ydYJwD9csx946Y0QthKHqzXKz/zW9k+r1jCE1BSR732PgnPQcd7oYu7KixbqSx
 W0MvZyJ44mtVz+AQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4FB64118DD;
 Thu, 17 Jun 2021 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623960391;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A/t3v3r3dK5y8/qvK8sDxSOZ3Ex3Y8hatLd4JANyvUw=;
 b=yMRmVPVYweOG/lafCJbg2OLgoeWJIwgzmmr4wry6Dh2/oMnnJp6nVKsoxSpHzZp8ANgDQJ
 wcgCja4ET4MUjbiJMjFeeYAFgJrICJtQYqo8hAPTmNeu/jz+0GobO6kKp9F+eCetC6AoGU
 5r6+HvT3WHv7XgZJgFImnTkRiozPbNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623960391;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A/t3v3r3dK5y8/qvK8sDxSOZ3Ex3Y8hatLd4JANyvUw=;
 b=U4bup7b3ydYJwD9csx946Y0QthKHqzXKz/zW9k+r1jCE1BSR732PgnPQcd7oYu7KixbqSx
 W0MvZyJ44mtVz+AQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 3pCIEEery2ByBAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 17 Jun 2021 20:06:31 +0000
Date: Thu, 17 Jun 2021 22:06:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMurRVXwyvKXnkjj@pevik>
References: <20210603033611.15619-1-xieziyao@huawei.com>
 <20210603033611.15619-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603033611.15619-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls/sendfile: Convert sendfile06 to the
 new API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ziyao,

> 1. Convert sendfile06 to the new API with file descriptors instead
> of socket descriptors.
I wonder if this is ok, suppose yes, but better if other check.

> 2. Remove the support for UCLINUX.

LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> +	TEST(sendfile(out_fd, in_fd, NULL, sb.st_size));
> +	after_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
> +
> +	if (TST_RET != sb.st_size)
nit: checkpatch.pl complains, it should be if (sb.st_size != TST_RET)
(can be fixed during merge)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
