Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962E3AC5CA
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 10:15:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 768643C2F28
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 10:15:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6601C3C2173
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 10:14:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 76EBF100127C
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 10:14:58 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8CD991FDAE;
 Fri, 18 Jun 2021 08:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624004096;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OM566bzT5mxhF+0XfpO40/G2zK5bsqpty9UWUpJ5epc=;
 b=a2a/f7hr4V3IWSg2aaAvO0JUvGo56ZaEZyyzt3V32EjWHCuDE1fWup78dnVFkx5BrbrGSr
 N2H/ODtKX6FtetOqFDt1pTp0itVQNcDLktGFPh/HDdZrlAPrzYTP4xtuU6FZHvmHDk/LMR
 KC96yeA6n9KKPMGHsNnKuvMWhATBhJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624004096;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OM566bzT5mxhF+0XfpO40/G2zK5bsqpty9UWUpJ5epc=;
 b=I7PdRhhFl4UDfJE1Ch29hYjJH0DWUyO2+Z/rgYFPRM8sVduNVeWC9p3YGJU9qWmwD/kynV
 IRAJjaeFSV9PugAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 505EF118DD;
 Fri, 18 Jun 2021 08:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624004096;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OM566bzT5mxhF+0XfpO40/G2zK5bsqpty9UWUpJ5epc=;
 b=a2a/f7hr4V3IWSg2aaAvO0JUvGo56ZaEZyyzt3V32EjWHCuDE1fWup78dnVFkx5BrbrGSr
 N2H/ODtKX6FtetOqFDt1pTp0itVQNcDLktGFPh/HDdZrlAPrzYTP4xtuU6FZHvmHDk/LMR
 KC96yeA6n9KKPMGHsNnKuvMWhATBhJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624004096;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OM566bzT5mxhF+0XfpO40/G2zK5bsqpty9UWUpJ5epc=;
 b=I7PdRhhFl4UDfJE1Ch29hYjJH0DWUyO2+Z/rgYFPRM8sVduNVeWC9p3YGJU9qWmwD/kynV
 IRAJjaeFSV9PugAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id +W08EQBWzGBBbgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 18 Jun 2021 08:14:56 +0000
Date: Fri, 18 Jun 2021 10:14:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMxV/hsYgmegkg5Y@pevik>
References: <20210603033611.15619-1-xieziyao@huawei.com>
 <20210603033611.15619-3-xieziyao@huawei.com>
 <YMurRVXwyvKXnkjj@pevik>
 <81961ede-0a43-36d5-ce50-996e81daf867@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81961ede-0a43-36d5-ce50-996e81daf867@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

> Hi, Petr,

> > > 1. Convert sendfile06 to the new API with file descriptors instead
> > > of socket descriptors.
> > I wonder if this is ok, suppose yes, but better if other check.
> I noticed that it is described in `man 2 sendfile` as follows:

> In Linux kernels before 2.6.33, out_fd must refer to a socket.  Since Linux
> 2.6.33 it can be any file.
+1

> And if we need to cover the case where out_fd is a socket, I suggest adding
> it to sendfile02.c, which tests the basic functionality of the sendfile(),
> just like sendfile07.c:

> in_fd = SAFE_OPEN("in_file", O_RDONLY);

> SAFE_SOCKETPAIR(PF_UNIX, SOCK_DGRAM | SOCK_NONBLOCK, 0, p);
> out_fd = p[1];

Sounds reasonable, but given we test for compilation with 3.10 [1], we can
forget on 2.6.33. We haven't decided the minimal version, maybe we should state
that anything < 3.0 can be removed (it's probably to early to declare 3.10 as
minimal supported version).


> > > 2. Remove the support for UCLINUX.

> > LGTM.
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > ...
> > > +	TEST(sendfile(out_fd, in_fd, NULL, sb.st_size));
> > > +	after_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
> > > +
> > > +	if (TST_RET != sb.st_size)
> > nit: checkpatch.pl complains, it should be if (sb.st_size != TST_RET)
> > (can be fixed during merge)
> Oh yes, sometimes forgot to use checkpatch.pl to check my code files. Thanks
> for your tips, Petr.
np, it's really a detail.

Kind regards,
Petr

> Kind Regards,
> Ziyao

[1] https://github.com/linux-test-project/ltp/wiki/Supported-kernel,-libc,-toolchain-versions

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
