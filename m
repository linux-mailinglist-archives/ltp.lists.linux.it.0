Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E20CD1D4441
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 06:09:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1BC53C543D
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 06:08:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4D90F3C104B
 for <ltp@lists.linux.it>; Fri, 15 May 2020 06:08:56 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7F258600B1A
 for <ltp@lists.linux.it>; Fri, 15 May 2020 06:08:35 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id q9so411741pjm.2
 for <ltp@lists.linux.it>; Thu, 14 May 2020 21:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GiETq9AYouPqoQKwNwfzNDE3A0t/pQK6kIXPHgt0xcs=;
 b=o6/tb7ihnoWZqA3HsX4CDhGwvZa/m0thUpqtVOskoHLoVGR0ex820+MdaCzBvxEgzG
 PGqLkE6ZiDWafpoNsw1UfSHZbREVmK+tzC0yFCgPmi79eTIlFrnnwhQASlXHnE5iVc8d
 KCHqj1OMNm+yB4iJ65iC6bNiS99viKKfUVfEUfRtz+d4dYZrhfRExVMOoe81/uGWygnc
 27rW7NQ7bGaLwfZgzY3+BAmYqktcwUsT9X0P6Gp0ACiKVP+zeCuELVzovORk4gG0seW6
 ru/sbKqWfU+1m+C6TMR/eAd6nJ3zRn75GALVnR31k9uCHc8if3YOPKew0pw0OyDsnJ9/
 gVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GiETq9AYouPqoQKwNwfzNDE3A0t/pQK6kIXPHgt0xcs=;
 b=KOCOkHAtRDyHr3RiBKEtTE4MbI0X3FneZzPSPg7c0dh80QNhyyDySf9GmOF0d/mjaD
 mCYak8uecsMfbjBLGns419BJFJsvhjbngzXdWIi2KLJux2EIxyBUl9OXKOwMJUEYQqCu
 HmKBB5dzP8XJXEgztjBmBEMtqTXdbw+VsnXDR4qJ9kpw7S8oSs6Wd4vTV+R0zrspE9De
 bmF9ko5gzZn8GuLv5mTES+Kjqy2f25uBpAIvHBDVyrqq4s7Zr7yL28IAUnwJysP7nUF5
 PpH8X23zUmcDmf8zRy1xoPeVPtxHWDQ0OwFjV/X7KrmR179/+AvYCdAPVRQ8J7HSMfv+
 +MIw==
X-Gm-Message-State: AOAM531REaZMLllubu/93ra2t4wgp/zaaSn9vaLd920wnxZbFIqd54kK
 k86LeYIezFPbPsUfD+Zi38osDA==
X-Google-Smtp-Source: ABdhPJx1c7BZHtfIA6tgMGZKGReRtm41VWxXugrzKY1PBf9Q+xAfJzuS89nU/HXGM9uYk4jt1o+Q1A==
X-Received: by 2002:a17:902:d90c:: with SMTP id
 c12mr1761702plz.113.1589515733817; 
 Thu, 14 May 2020 21:08:53 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id g27sm651381pfr.51.2020.05.14.21.08.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 May 2020 21:08:53 -0700 (PDT)
Date: Fri, 15 May 2020 09:38:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vikas Kumar <vikas.kumar2@arm.com>
Message-ID: <20200515040849.yu27rdihdih5wxc3@vireshk-i7>
References: <20200514172831.27854-1-vikas.kumar2@arm.com>
 <20200514172831.27854-2-vikas.kumar2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514172831.27854-2-vikas.kumar2@arm.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 1/1] syscall: Add io_uring test
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

On 14-05-20, 22:58, Vikas Kumar wrote:
> Added Linux asynchronous I/O API Test for io_uring_setup(),
> io_uring_register() and io_uring_enter().
> This test will check io_uring api basic operation.
> 
> Signed-off-by: Vikas Kumar <vikas.kumar2@arm.com>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Please don't do this unless someone gave you this explicitly.

> diff --git a/testcases/kernel/syscalls/io_uring/io_uring01.c b/testcases/kernel/syscalls/io_uring/io_uring01.c
> +int setup_io_uring_test(struct submitter *s)
> +{
> +	struct io_sq_ring *sring = &s->sq_ring;
> +	struct io_cq_ring *cring = &s->cq_ring;
> +	struct io_uring_params p;
> +	void *ptr;
> +
> +	memset(&p, 0, sizeof(p));
> +	s->ring_fd = io_uring_setup(QUEUE_DEPTH, &p);
> +	if (s->ring_fd == -1) {
> +		tst_res(TFAIL | TTERRNO, "io_uring setup return error");
> +		return 1;
> +	}
> +
> +	//submission queue ring buffer mapping

You need to follow kernel coding guidelines everywhere in the code
here and so no such comments. Try to run checkpatch on this file with
--strict option and you will see the problems..

This API is new and you also need to implement something like
fsopen_supported_by_kernel().

I didn't do in depth reviews though..

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
