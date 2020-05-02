Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9901C3492
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:36:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C5ED3C5846
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:36:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9EAF43C26D0
 for <ltp@lists.linux.it>; Sat,  2 May 2020 09:10:07 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A78CC14016DA
 for <ltp@lists.linux.it>; Sat,  2 May 2020 09:10:06 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so973103pjb.3
 for <ltp@lists.linux.it>; Sat, 02 May 2020 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Oa9CXoTd995e5PtrWGddGkjK4dNlpD3QuW+kp3zLinA=;
 b=hRwSiQJrJdhJt8SESpRkhxfWy+nm0/pq36wj7DMZUXqTppS9CH2bIev44krzB4lvZU
 XAuvUbwLDE+Qaam/qXepRqwtcTgS8qPivjhs8Jxvl0cInCXBljVWxESJnInfDG1m0EQl
 jw0hW08hoJACGWijPsNWE/piv0gwIpVbsuchSA3JxLOQlkAK4TPOHIkRiFer7fY1IQZE
 Zr/mL3daDI4HVgcY+REPTY2vn451Jd8HrnumH/YhG5+qA8uSdhTKy7+9iWBt3mCucFqg
 tpdQIxxbdcVE34c5PKog5Au2dmWfxUo4xD3jDyDUJbmYEn5P+OgUCZyEpg8TXgOwdfpv
 MC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Oa9CXoTd995e5PtrWGddGkjK4dNlpD3QuW+kp3zLinA=;
 b=W3GFGLJCwGrKxiAp5WTi4OLq9AEs66NOHV2Z/gBr8zwkkGeWbD+zF5WjCi+IpnhP86
 zF74hm/gSXO2G2hfY+HGdvb54sSW3HXBwIA4Zni1XAyzgzQuO1//CKY4++gKREO9YcWu
 KHBjt1eJ0s4vl/lX3e9HgYgxn3XLRqLbIv2Vn0t7Li5hbJkdimdGAi0TC5rb8eafq8oz
 7r/zSff4RayqG/6VIMbqadOrfwSmr0or50zd6msSUBbM25VMn1hsu8FYajVfWAtJ+FEH
 w8f0gPBC2jF6plsFYKYqLr+UKXqpBUyQ7Z1QNY5HMq08HbBlI/qEfXtdL5ysaZ0gCtME
 VGCg==
X-Gm-Message-State: AGi0PuYHBdUVXCRmxxxJJcQvwVBvB0MKWqOtqign6FheBQIksDArBP2K
 ankI951EEsLQiNqgTOkBrb6T
X-Google-Smtp-Source: APiQypKh53h9mG76/LAAku8OApwmD14jhEM8tEgPs9DT0VghocCvkfRiLuzVHWSxaf1eQ+ha/ySO4w==
X-Received: by 2002:a17:902:bb97:: with SMTP id
 m23mr6265857pls.253.1588403404923; 
 Sat, 02 May 2020 00:10:04 -0700 (PDT)
Received: from morpheus.bobrowski.net (49.37.70.115.static.exetel.com.au.
 [115.70.37.49])
 by smtp.gmail.com with ESMTPSA id e135sm3823379pfh.37.2020.05.02.00.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 00:10:04 -0700 (PDT)
Date: Sat, 2 May 2020 17:09:58 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200502070956.GA1649@morpheus.bobrowski.net>
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-4-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421065002.12417-4-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 May 2020 10:36:17 +0200
Subject: Re: [LTP] [PATCH 3/4] syscalls/fanotify15: Add a test case for
 inode marks
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Apr 21, 2020 at 09:50:01AM +0300, Amir Goldstein wrote:
> +	tst_res(TINFO,
> +		"Test #%d: FAN_REPORT_FID with mark type: %s",
> +		number, mark->name);
>  
> -	if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | FAN_MARK_FILESYSTEM,
> +

A nit, but there's an unnecessary extra whiteline here.

> +	if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag, tc->mask |
>  				FAN_CREATE | FAN_DELETE | FAN_MOVE |
> -				FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
> +				FAN_MODIFY | FAN_ONDIR,
>  				AT_FDCWD, TEST_DIR) == -1) {
>  		if (errno == ENODEV)
>  			tst_brk(TCONF,
>  				"FAN_REPORT_FID not supported on %s "
>  				"filesystem", tst_device->fs_type);
>  		tst_brk(TBROK | TERRNO,
> -			"fanotify_mark(%d, FAN_MARK_ADD | FAN_MARK_FILESYSTEM, "
> +			"fanotify_mark(%d, FAN_MARK_ADD | %s, "
>  			"FAN_CREATE | FAN_DELETE | FAN_MOVE | "
> -			"FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR, "
> +			"FAN_MODIFY | FAN_ONDIR, "
>  			"AT_FDCWD, %s) failed",
> -			fanotify_fd, TEST_DIR);
> +			fanotify_fd, mark->name, TEST_DIR);

I see that you've removed the FAN_DELETE_SELF mask here, although
should we consider adding tc->mask here too for the sake of
correctness?

The rest looks fine to me.

Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
