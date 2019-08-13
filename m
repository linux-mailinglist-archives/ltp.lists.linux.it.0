Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F340C8BB55
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 16:20:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F1713C1D47
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 16:20:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E0DD03C1826
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 16:20:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AB5691A01453
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 16:20:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C1DF2AE14;
 Tue, 13 Aug 2019 14:20:40 +0000 (UTC)
Date: Tue, 13 Aug 2019 16:20:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jinhui huang <huangjh.jy@cn.fujitsu.com>
Message-ID: <20190813142038.GA23369@rei.lan>
References: <1564395109-7165-3-git-send-email-huangjh.jy@cn.fujitsu.com>
 <1564645349-10859-1-git-send-email-huangjh.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564645349-10859-1-git-send-email-huangjh.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] syscalls/ftruncate: Rewrite ftruncate01
 and merge ftruncate02
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
Pushed with a minor change, thanks.

> +	SAFE_FSTAT(fd, &stat_buf);
> +	file_length = stat_buf.st_size;
>  
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> +	if (file_length != trunc_len) {
> +		tst_brk(TBROK, "ftruncate() got incorrected size: %d",
> +			file_length);

Changed this to tst_res(TFAIL, ...) followed by return, since this is by
no means TBROK.

> +	}
>  
> -	TEST_PAUSE;
> +	SAFE_LSEEK(fd, offset, SEEK_SET);
> +	SAFE_READ(0, fd, buf, sizeof(buf));
>  
> -	tst_tmpdir();
> +	for (i = 0; i < TRUNC_LEN1; i++) {
> +		if (buf[i] != data)
> +			tst_brk(TBROK, "ftruncate() got incorrect data");

And here as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
