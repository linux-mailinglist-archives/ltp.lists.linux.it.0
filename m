Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A11FA8E1
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 08:40:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E4E73C2DBA
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 08:40:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A0C833C2B94
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 08:40:52 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B0C28292EB8
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 08:40:51 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id v24so7941078plo.6
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 23:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i2e5ukcV8XJC/nNyfTKMnpYPclq7KzJfqjRVY+qSj2I=;
 b=SpJdT5mJl1ymZ/BC6RJg+2KTr4c6qK1wYYzXj8BOlxKFkv51NL7lf+0ITxmZtE7pqx
 lB0O7GT1AIOzqElJKZPyzTmtMxBioYzHJgTdFhUouyff5KzLB4UwdRCbDZm4KCjuJP9w
 It3P+wi19Z1CqtdVs8GZC67qpz2cS0vWJFVwTcOd7vgGl8hnFQbtMmmVx/9fsR+BbR3J
 puEze9ON9gm1BcIOe99lVWIv7cuWWP1RKYCuYghBGgzULpbKZ/SSP7sfPoF2s9p0+4Zy
 ZfbbeQ4avO3fAlYJQ0FR3BehoMZhAjY2pHLsgXfttCQDRMQWfoT4Ph2ypl6/O4/2jJNj
 piwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i2e5ukcV8XJC/nNyfTKMnpYPclq7KzJfqjRVY+qSj2I=;
 b=GJWS+JY7M3H6wCoFdMaD0rYVxEi/DWx6gFHpJTjBBUPErO8vieiwhwoLiy171coofM
 KeBYeXoiaGxmqGw+O9RQq6lB32N/Rh7PW5Rd9BCepdMHOrtQBwjFkLNWZyEucXn+0y8F
 goxmXWyls8u85T6Zb6i/71ILWe26zjpsSTjXec8Qvvd5H+qw3wSTr66yYCXV63Wsjzx+
 WmWGpwJHA5jzSlU0G8GcqyVEAtCVZESblXWMoAPBO9vh+WapW4/t0xo164lGsUEIvSYy
 Vw/JJmdeGT7IcIvTivK7UkVlnJ9lFIxq3KUfTUfzq/BTQAXUnjI313yTqO2oICfZTmtD
 TsIg==
X-Gm-Message-State: AOAM533sFFmF0ZK3pucICCD9J0zNRNffxYTmr5mSdlKfTnHgqx63hn35
 hQkW30gtipZlJg6z5/A6qOdfbw==
X-Google-Smtp-Source: ABdhPJxl14F2t/YTTmduuOU+Zrq2a+VWiifqRpr2ntCUyClLGW5jQi5ODeMnbkQq/Qyfqa7VcdFA8w==
X-Received: by 2002:a17:902:8546:: with SMTP id
 d6mr855546plo.220.1592289649860; 
 Mon, 15 Jun 2020 23:40:49 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id jz23sm1404507pjb.2.2020.06.15.23.40.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 23:40:48 -0700 (PDT)
Date: Tue, 16 Jun 2020 12:10:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200616064047.7njwpmlmxzyoikwo@vireshk-i7>
References: <5d502fbc7070644ed83c423713941b457c3a7aff.1590057824.git.viresh.kumar@linaro.org>
 <7d7363384b5719fa48a5a5ba71b0aa581ebc91bd.1590131635.git.viresh.kumar@linaro.org>
 <20200615133125.GC25279@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615133125.GC25279@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 3/5] syscalls: semctl: Add new test to verify
 the _time_high fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 15-06-20, 15:31, Cyril Hrubis wrote:
> > diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
> > index aa211d37f8ee..150f581825c5 100644
> > --- a/testcases/kernel/syscalls/ipc/semctl/Makefile
> > +++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
> > @@ -5,7 +5,10 @@ top_srcdir              ?= ../../../../..
> >  
> >  include $(top_srcdir)/include/mk/testcases.mk
> >  
> > -LDLIBS  += -lltpipc
> > +semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LDLIBS += -lltpipc
> > +semctl08: LDLIBS += -lltpnewipc
> > +
> >  LDFLAGS += -L$(top_builddir)/libs/libltpipc
> > +LDFLAGS += -L$(top_builddir)/libs/libltpnewipc
> 
> This does not apply anymore after my fix. This should be:
> 
> LTPLIBS = ltpipc ltpnewipc
> 
> Which would add a dependency on these libraries in the build system and
> also append the LDFLAGS, then all we need to do is to add the LDLIBS.

diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index 6895fb1967a1..d7002872ab42 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -3,7 +3,7 @@
 
 top_srcdir              ?= ../../../../..
 
-LTPLIBS = ltpipc
+LTPLIBS = ltpipc ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
@@ -11,4 +11,4 @@ semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LDLIBS += -lltpi
 semctl08: LDLIBS += -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-LDFLAGS += -L$(top_builddir)/libs/libltpnewipc

This doesn't build for some reason.

make -C "/mnt/ssd/all/work/repos/tools/ltp/libs/libltpipc /mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc" -f "/mnt/ssd/all/work/repos/tools/ltp/libs/libltpipc /mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc/Makefile" all
make[1]: *** /mnt/ssd/all/work/repos/tools/ltp/libs/libltpipc /mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc: No such file or directory.  Stop.
../../../../../include/mk/testcases.mk:52: recipe for target '/mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc/libltpnewipc.a' failed
make: *** [/mnt/ssd/all/work/repos/tools/ltp/libs/libltpnewipc/libltpnewipc.a] Error 2

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
