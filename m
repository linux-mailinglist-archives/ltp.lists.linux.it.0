Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D14E18C68B
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:35:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD1103C5476
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:35:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D679F3C5460
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:35:53 +0100 (CET)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8E4F2600AAE
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:35:52 +0100 (CET)
Received: by mail-pj1-x1044.google.com with SMTP id bo3so1931552pjb.5
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 21:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LX1LQmAdPRozL6NpJFK/S5NbjfP9JbwT5lligaux3G0=;
 b=fGLfC2+KLIqqYue7iqB3ReUJEv5LZcv3CVMjoqx7Ya+CpJyZ3irfH5yr+p/7MnOwGR
 A/B+Kq06/lwnvmVQ+qXS8IPYbtFHHxkSMjEvCLHLhSDNf/5a1i2+4W0RS+5zyerMldHk
 TXZ4tqzwhZh1Sjx2ggXH3+rFizwhweBnvPcM/nNqMAb6zlI87W9ahp3/LWuQ3tkJ9xjO
 zuaBP5ljXVVs5XLfaZvu3FyTr53yxYbpQneh8P0e3yAcYW86SSLEipnKCPZ0zabzigM+
 D07/vjfn6P6ZC8ezFLGNmwpinekxstJvW8ex/T+ckb3H2KnXbvHkByR9BvTtz8kwHK9D
 j1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LX1LQmAdPRozL6NpJFK/S5NbjfP9JbwT5lligaux3G0=;
 b=QI7r7LdVme9oNKTx6b21wEPueOf+T0QL1pgEsogckErdouhelrI9uRxeN/wA6RvpW/
 cTeiSvLBXLH6CcnPtVM4kcssv4uIUzchGtj3YNMeqH1H9yVteHGt+6oOMylywAFRVFYW
 96vxoxcumgXrny6CZ2PC8xrDD+gWnv3KLRb3DAZ8dp2zeZnVOowWEDDdpe7ndIcp0zp9
 E7RA3CzgNpPSh9zbenmn4ku8MFuVhnI3LZuWxvO9d9pIoQgEV2K3JNfjAsWTnOFaJkco
 QDqE+jmYPNB4JPzuJWa/QR2cNYf8yG2s01MNsIUUUF4XZrlDMKT4c4l/rZaeBO7vydY8
 0BSA==
X-Gm-Message-State: ANhLgQ34i/L3t6UnWHubH/805UOcjn/KA2ZdQ84dElGZcLQ6wgHhGcql
 l0HVqoOFVQSDuXEKxbbJ2kjXOg==
X-Google-Smtp-Source: ADFU+vvIIZswFlpoDcpXJ21SrE1dds/DuK6XyTbXYuVRI5/cVPJQvyHxE8A7LsMc/+iHLmHioIlhLA==
X-Received: by 2002:a17:902:820a:: with SMTP id
 x10mr3188093pln.179.1584678951183; 
 Thu, 19 Mar 2020 21:35:51 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id s61sm3484896pjd.33.2020.03.19.21.35.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 21:35:50 -0700 (PDT)
Date: Fri, 20 Mar 2020 10:05:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200320043548.66orcumbq57wqyzt@vireshk-i7>
References: <6648a9106e367d370012c8ee1d0d81c369779ba8.1584014172.git.viresh.kumar@linaro.org>
 <928553e5fd3518fccb363fb8b6ad079ac3c75fd2.1584090119.git.viresh.kumar@linaro.org>
 <20200313124920.GC6597@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313124920.GC6597@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 10/10] syscalls/open_tree: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 13-03-20, 13:49, Cyril Hrubis wrote:
> > +static void run(unsigned int n)
> > +{
> > +	struct tcase *tc = &tcases[n];
> > +	int fd, fsmfd, otfd;
> > +
> > +	TEST(fd = fsopen(tst_device->fs_type, 0));
> > +	if (fd == -1) {
> > +		tst_res(TFAIL | TERRNO, "fsopen() failed");
> > +		return;
> > +	}
> > +
> > +	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> > +	if (TST_RET == -1) {
> > +		SAFE_CLOSE(fd);
> > +		tst_res(TFAIL | TERRNO, "fsconfig() failed");
> > +		return;
> > +	}
> > +
> > +	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> > +	if (TST_RET == -1) {
> > +		SAFE_CLOSE(fd);
> > +		tst_res(TFAIL | TERRNO, "fsconfig() failed");
> > +		return;
> > +	}
> > +
> > +	TEST(fsmfd = fsmount(fd, 0, 0));
> > +	SAFE_CLOSE(fd);
> > +
> > +	if (fsmfd == -1) {
> > +		tst_res(TFAIL | TERRNO, "fsmount() failed");
> > +		return;
> > +	}
> > +
> > +	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> > +			MOVE_MOUNT_F_EMPTY_PATH));
> > +	SAFE_CLOSE(fsmfd);
> 
> Here as well, shouldn't we just set the .mount_device flag instead?

Hi,

Sorry but I am not sure what will happen by .mount_device here. From
what I see from tst_test.c, that flag will end up calling SAFE_MOUNT()
automatically, but what we are calling here is fsmount() and
move_mount() instead.

Can you please elaborate a bit on that ? Thanks.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
