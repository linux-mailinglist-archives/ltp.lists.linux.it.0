Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C7523EC5D
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:24:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C214D3C31F0
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:24:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 27AF03C2A76
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:24:40 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 23B1E1000CB5
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:24:40 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id f9so758073pju.4
 for <ltp@lists.linux.it>; Fri, 07 Aug 2020 04:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kn8K8avwWnwZeaIFWvW8Ii0GSyoJUBtivkmqBqJgOwA=;
 b=RHPULnhJ1BljaGoP6CnSQAzbWuQ4ZE6IzpkRhTDrDE4yoXKRPSdpnoXvEGZ7i4KhNE
 /4lV1rUXiDoQMPt4fO+w6fNVXJFcFfk1cbIIJEHlKOqcBjB3z8AcTWEvr9g637KDvpr8
 fHO+9Dp0qqqPZoPYo58R2cRlvMXgfQH+W4D8oKzgiM+zO3yzJy4t4jtEwNlwZvQuxhZY
 Mbu8Mnomb1B6OuuP2K99KZrDyJrS0b9zjXisBv2dJNuOSIYH3eUFdn7FOd8nEnr5Ij68
 bDHmJyDU4U/NXnsXQCE+NvByxwGMi9MnXCEc5/0TboVrpzvk3HipV8qDYTsU0msDVzlZ
 jqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kn8K8avwWnwZeaIFWvW8Ii0GSyoJUBtivkmqBqJgOwA=;
 b=HQCRXNcXr0I9VdIX8uBb6p/atSMo389MwN9oXQROyCKFDkkgA+ypPToFflKDvQuyWa
 48DPwo1zrTwCcQE3OESiKefGV+SHm+8zwrkfDWXMgh96IyX1kbq5VojE1W7RBQaaopMF
 NV963t+/c4qmmjvYITb9u71B9hVnrgekJaDPdAmccZJNdunK5b8PVa5x5V8hwTG3473x
 xA+wP7vpyvsnv9PPm1kpjUt4/fZtLwxChy2QRIywixmpqMmHceC6VKhuzX9ysYiSZ8Yw
 M5vqQo0+JLTyak1xu4eEIrhbAjo4s+Y5HtGQHon5RwOsF0hTpcEjul1xqu8AMWQ9U8X5
 uFYw==
X-Gm-Message-State: AOAM532Tn1xOAgPiBE+JvDy0Qe0upsu2fHcCH+R0rkQcI/Kvfd12L2kZ
 Nuloku5dl12x8o5a1aCgOSLGtmBRqwM=
X-Google-Smtp-Source: ABdhPJzuDIsMrBaLt1Dq801LcAeUPqrVGM9jsYhgcsktFh1SeNPY5c2o1zLSwMQy8agQgvO7+5+J2A==
X-Received: by 2002:a17:902:7446:: with SMTP id
 e6mr12233349plt.267.1596799478683; 
 Fri, 07 Aug 2020 04:24:38 -0700 (PDT)
Received: from localhost ([106.198.244.73])
 by smtp.gmail.com with ESMTPSA id y65sm12320790pfb.155.2020.08.07.04.24.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Aug 2020 04:24:37 -0700 (PDT)
Date: Fri, 7 Aug 2020 16:54:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200807112320.fb5r3myiczldyovx@vireshk-mac-ubuntu>
References: <ebc888947b095fd6a359ad749e50217d0b38954e.1596637728.git.viresh.kumar@linaro.org>
 <20200806125603.GC3315@yuki.lan>
 <20200807044234.basdp5ic4xzleqsx@vireshk-mac-ubuntu>
 <20200807084544.GB4931@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807084544.GB4931@yuki.lan>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V8 1/2] syscalls/utimensat: Migrate to new test
 framework
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

On 07-08-20, 10:45, Cyril Hrubis wrote:
> Hi!
> > > Also we do pass libc timespec to a syscall that is supposed to take the
> > > old kernel type, right?
> > > 
> > > I guess that the options are:
> > > 
> > > * Use the glibc function here instead
> > > 
> > > * Change the type in the follow up patch
> > 
> > This is already properly fixed in 2/2.
> 
> Maybe I'm blind but I do not see anything that would touch the
> reset_time() function in 2/2.

I mistakenly thought about the one used in the run() call. Sent V9
now.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
