Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EBE144DCC
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 09:36:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B4D73C23D9
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 09:36:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2E23C3C2379
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 09:36:41 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 64FC91A01C82
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 09:36:37 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id w2so11728pfd.3
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 00:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UzRwZuZIQ+wETazOHcI2GjGFWABLRPg5H2s9tj2ZniE=;
 b=fifwUJ2YEKKIAUKd7uTaZMm7CaLVkgpCLXcJx4hnj/LQ8sGsDnqY6IusJ4W9pS+EAS
 hu7qZ+qLyjLrEQztVN4Xe7fPxAAYOzGqttnNV4tER7WIHX50lTsE/MBCufU4q8TTk9Hi
 SUyXpQExavrZxhp3YIilS+LTgjLtPYuTl1XFVgM6jnZJfCBqZ8SlrZDL59lnXkC6L/70
 t8pxwUohg1XHJ03QeQuJh6KpIFHefsQL+eSmjvVbc+tGI/8Pkb3JhjG2jRYgplokykde
 A137D1Z0TOzUYZvT8cxKE4ckSVvSquVq6lpTvNnHvw/JUYSRUw/qSx23pn99DJAHaK1n
 KHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UzRwZuZIQ+wETazOHcI2GjGFWABLRPg5H2s9tj2ZniE=;
 b=Br3woM2+VzGnzZIlU1DLbPtDVoBpbw12ghsT66tbA7z6J0iuBIdV47D8nkpP7vrfkA
 QBjtHqAs8hmURQGrWHMzaYmutlHnfU7KxpriW5oeQk5WlY74bqdO/ykOYnck282Irrz+
 /cT0CvmyoKgitEcftwBhXCLqGaLBfENS1/hdiH3EVsRijua7lt7vjQ581/pIADf96hjp
 PpBuL2oYxXMiu85LYww6QVBXyCK82elvfn5AxFwPH9Y4QWo7ZG+nhFEi+/fH3Jg5cPna
 2AejBngearyL0tYnfiKc8MyeXD+WbBjWa8U+B89Y7LAPhArP3EfhVYRx6AXByLYo2YfU
 PKRw==
X-Gm-Message-State: APjAAAWu4hmLSrTmoPP6UOQy8CYf6yTtB1VA0sYz6zBFJLVcDXmiFqEz
 SFElDusMCwqyNX/JXJmZ3Y1O7g==
X-Google-Smtp-Source: APXvYqwrtJIGenM2cYs2q6+DNJqYmIacMq3KHFuGoPKkvRYc0a9hYLKrzoOMWpFkg+0Lg9NbPpzRgA==
X-Received: by 2002:a65:4109:: with SMTP id w9mr9848395pgp.383.1579682195711; 
 Wed, 22 Jan 2020 00:36:35 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id a16sm43311389pgb.5.2020.01.22.00.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jan 2020 00:36:34 -0800 (PST)
Date: Wed, 22 Jan 2020 14:06:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200122083632.spw7okh6g6c77p5q@vireshk-i7>
References: <b4f5242fdca1659b2f71e1b3290fd32194e7340a.1579259595.git.viresh.kumar@linaro.org>
 <4dd4dabd2cd574dc2657c5926e8e3d1a0c8a8ae6.1579259595.git.viresh.kumar@linaro.org>
 <20200121153928.GA12370@rei>
 <20200122051233.naobo3bb4jrk63of@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122051233.naobo3bb4jrk63of@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/pidfd_open
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

On 22-01-20, 10:42, Viresh Kumar wrote:
> From: Viresh Kumar <viresh.kumar@linaro.org>
> Date: Thu, 16 Jan 2020 16:47:01 +0530
> Subject: [PATCH] syscalls/pidfd_open
> 
> Add tests to check working of pidfd_open() syscall.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  configure.ac                                  |  1 +
>  include/lapi/pidfd_open.h                     | 21 ++++++
>  runtest/syscalls                              |  3 +
>  .../kernel/syscalls/pidfd_open/.gitignore     |  2 +
>  testcases/kernel/syscalls/pidfd_open/Makefile |  6 ++
>  .../kernel/syscalls/pidfd_open/pidfd_open01.c | 38 +++++++++++
>  .../kernel/syscalls/pidfd_open/pidfd_open02.c | 45 +++++++++++++
>  .../kernel/syscalls/pidfd_open/pidfd_open03.c | 64 +++++++++++++++++++
>  8 files changed, 180 insertions(+)
>  create mode 100644 include/lapi/pidfd_open.h
>  create mode 100644 testcases/kernel/syscalls/pidfd_open/.gitignore
>  create mode 100644 testcases/kernel/syscalls/pidfd_open/Makefile
>  create mode 100644 testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
>  create mode 100644 testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
>  create mode 100644 testcases/kernel/syscalls/pidfd_open/pidfd_open03.c

+ this as well (I will resent the patches properly again after you
have had a chance to look at them once).

diff --git a/runtest/syscalls b/runtest/syscalls
index 9d6d288780a3..a2d749d526a8 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -848,6 +848,7 @@ personality02 personality02
 
 pidfd_open01 pidfd_open01
 pidfd_open02 pidfd_open02
+pidfd_open03 pidfd_open03
 
 pidfd_send_signal01 pidfd_send_signal01
 pidfd_send_signal02 pidfd_send_signal02
diff --git a/testcases/kernel/syscalls/pidfd_open/.gitignore b/testcases/kernel/syscalls/pidfd_open/.gitignore
index be218f88647d..e0b8900c1c33 100644
--- a/testcases/kernel/syscalls/pidfd_open/.gitignore
+++ b/testcases/kernel/syscalls/pidfd_open/.gitignore
@@ -1,2 +1,3 @@
 pidfd_open01
 pidfd_open02
+pidfd_open03

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
