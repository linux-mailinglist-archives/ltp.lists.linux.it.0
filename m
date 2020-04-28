Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A36641BBA95
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 12:03:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB4B13C5F44
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 12:03:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 047F83C281C
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 12:02:59 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F210E600F24
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 12:02:58 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id x2so6740014pfx.7
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1kyz50f9QVbS31zNt97x7l5C7C0lFZu0rbd0KYHpmmQ=;
 b=hI/HjWVJRTFXuXG7as261jA7ZASOarw7MQ/eBS+A6WpccZGuc52VaaG4FFEk8LQS5x
 CP3CgnUIOtkIKZW41YXjba8hiqGzupQfsblytDQ+UBTfQvex7TziEZ5Yhpnl0J/N9wv9
 x3K3N9uO3tQh5wqByktQDgtKASmsfxKQufIXEMwwKMuRtOEz0bm8/6aSsOcMikeAf0te
 FhwSP488GS0gFLGfLUu8qMibuyVBgpt26V83RJEGEdD0x42K7C6ZXKjVXG5zDe+h9Bms
 CE0WY/2RO9yuHChl+MB+SZ2eVy165+R3JoLgMvS2ZG2Y1mTTAqSSUHWIkSfMTah7Y8kQ
 hP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1kyz50f9QVbS31zNt97x7l5C7C0lFZu0rbd0KYHpmmQ=;
 b=th363iL/SWimiGbY8UlRDLnN9+hzVpzblBoD3CckJpXmB0xNnXovxY+S3tKQ+LubbR
 jxTqVQZfSxxtY3y5687wwkgJhjf6KHbD4iG63iRwTlAfI0kTjoft0r6GlyUrjVtCvMQt
 F9rHDo6YsynHWKmsMwfuW/hiL9mUvZZJgApyAPxrLA4G2x0oicuObpXePCWxcv7A3Ajy
 qGtbDWykqfOpHUqxm5VnrCk/uOoTtnmyeRHDyG6KJ8QNos7x8BuAnrjJQ5mCPWw+wyiN
 t7fkUHmAtDc9FdQWp92MiMyJRYkdts9+2t6RyqPMG739VfvUP1xNheHn5cxlQoo0MVUn
 0hbA==
X-Gm-Message-State: AGi0PuYkI5utqcacpFtZvOUR+OrKjh7ssBm4G3T/SHa1dhaWIfpLvmFX
 4fhqLpK0B6I7QyYaUpLZ9jjzxZUVlp0=
X-Google-Smtp-Source: APiQypLf0wwQIHonrpClY1R5DEZJa/DMbpBixfqur5pj/Rm6I4JfVFxDYjA6f0un5Xb1gTCZoPmN2A==
X-Received: by 2002:a63:cc:: with SMTP id 195mr26810193pga.373.1588068177419; 
 Tue, 28 Apr 2020 03:02:57 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id i135sm12563491pgc.8.2020.04.28.03.02.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 03:02:56 -0700 (PDT)
Date: Tue, 28 Apr 2020 15:32:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200428100254.3oiu3weon3uyyvkl@vireshk-i7>
References: <20200428094745.io5fni2txzl6n37q@vireshk-i7>
 <20200428095222.GC6221@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428095222.GC6221@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] What is wrong with this program ?
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
Cc: vincent.guittot@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 28-04-20, 11:52, Cyril Hrubis wrote:
> Hi!
> > #include "tst_test.h"
> > 
> > static void run(void)
> > {
> > 	int fd;
> > 
> > 	fd = SAFE_OPEN("file", O_RDWR | O_CREAT);
> > 	SAFE_CLOSE(fd);
> > 	fd = SAFE_OPEN("file", O_RDWR | O_CREAT);
> > }
> > 
> > static struct tst_test test = {
> > 	.test_all = run,
> > 	.needs_tmpdir = 1,
> > };
> > 
> > 
> > It fails with:
> > 
> > safe_macros.c:230: BROK: foo.c:9: open(file,66,01) failed: EACCES (13)
> > 
> > if run as a normal user and passes with sudo.
> 
> I guess that you forget to pass the mode argument to the first
> SAFE_OPEN() and hence the second one fails because the garbage passed to
> mode prevents normal users from opening the file.

Hmm, mode seems to be missing from a lot of syscall tests, which means that if
they are run in a loop (with the cmdline way you mentioned earlier), then they
will all fail.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
