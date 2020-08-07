Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513B23E6DD
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 06:42:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4206E3C31D7
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 06:42:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6E1F33C1CB6
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 06:42:44 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 977F9200907
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 06:42:43 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id ha11so306860pjb.1
 for <ltp@lists.linux.it>; Thu, 06 Aug 2020 21:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IZmGO82FBTEPOdT/6mYrnZpFd4IiJiTvSMrulC6zv+E=;
 b=nJ72IkigUPgBTRCxGdxgk/7UjGMUnReurdPS4kIOFSqkbIE7Pmo0jsu/QnyUfz8E5D
 wGTHjmVHJzqhTT01fV4NNjw9p+R+Mh0OAXqwC2LGdyW/J7ZfOi1aShJGqLIzbH9yH45w
 FfOXXKsxlLnWlQzLDzYJte4Q7MXxwo1pANe+rhNoaivhj4NfXQotsRY3sNSyjmDO3jnh
 SDHicriT1iRGyi5NEwMux1S+ObSIQEK2PqsrzGQqtDUXEpAdKYoCqu/ReOh54vQD/Uh7
 O0i1fixxW52aB5368vG8AqI0iyGwcoKF/yrtbZC6IoXBFoAHNf37sn3FneLWiBBNosqQ
 exsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IZmGO82FBTEPOdT/6mYrnZpFd4IiJiTvSMrulC6zv+E=;
 b=Wwp4fA8QLmCnscjPWxYmcYWAoNIoRAYm60NOEblRTzUxlYaZgmcEc72l0E2z6OZhWS
 8jS0ooq+BVHLMzCTZOyImBCzyJ6xVPoe+YG0iaMHefHxgCWOC1QHz7AP13h8lVulHO66
 YN9NfK6XLrguQXI1nNSO0/ioja0fleC9zzDUt9a5DTOU7B051r/vJs29HdKDtbdD0YRS
 O1wvO3td21VpzRQWXj10r41eksyC2tUUbBVrBa88/1PM0et5/w9t/DvxwTZk6+rSAc+R
 B3XuX+m01f6zbb8+kyWGDBh3lnW6KMwFJRIBxO6LidLjoy85+pX8JX44FqE5eHtTpbED
 IXfA==
X-Gm-Message-State: AOAM532dGt1VTiWHOYkkYpjjPTW/zMVydJi3ZVxNB1kFtRuKU/VobAvB
 n1KCdb5TGS5OyUgPkGna4G8EBQ==
X-Google-Smtp-Source: ABdhPJwc/5ZsOYhmB1nC3DjI1mU4yjYej/jiN5y6wjOlt9FQh28LfNROI2bsubz2yOrQBKl2Diqqqw==
X-Received: by 2002:a17:90a:6a8d:: with SMTP id
 u13mr10956037pjj.166.1596775362013; 
 Thu, 06 Aug 2020 21:42:42 -0700 (PDT)
Received: from localhost ([223.190.59.99])
 by smtp.gmail.com with ESMTPSA id r91sm8896495pja.56.2020.08.06.21.42.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Aug 2020 21:42:41 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:12:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200807044234.basdp5ic4xzleqsx@vireshk-mac-ubuntu>
References: <ebc888947b095fd6a359ad749e50217d0b38954e.1596637728.git.viresh.kumar@linaro.org>
 <20200806125603.GC3315@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806125603.GC3315@yuki.lan>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On 06-08-20, 14:56, Cyril Hrubis wrote:
> Hi!
> > +static void reset_time(char *pathname, int dfd, int flags)
> > +{
> > +	struct timespec ts[2];
> > +	struct stat sb;
> >  
> > -		ts[1].tv_sec = atoi(argv[optind + 3]);
> > -		if (argv[optind + 4][0] == 'n') {
> > -			ts[1].tv_nsec = UTIME_NOW;
> > -		} else if (argv[optind + 4][0] == 'o') {
> > -			ts[1].tv_nsec = UTIME_OMIT;
> > -		} else {
> > -			ts[1].tv_nsec = atoi(argv[optind + 4]);
> > -		}
> > +	ts[0].tv_sec = 0;
> > +	ts[0].tv_nsec = 0;
> > +	ts[1].tv_sec = 0;
> > +	ts[1].tv_nsec = 0;
> >  
> > -		tsp = ts;
> > +	TEST(sys_utimensat(dfd, pathname, ts, flags));
> > +	TEST(stat(pathname, &sb));
> 
> Wrapping the calls to TEST() macro here is useless.

The TEST() thing always look like the SAFE_() macros to me somehow and
so did this mistake.

> Also we do pass libc timespec to a syscall that is supposed to take the
> old kernel type, right?
> 
> I guess that the options are:
> 
> * Use the glibc function here instead
> 
> * Change the type in the follow up patch

This is already properly fixed in 2/2.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
