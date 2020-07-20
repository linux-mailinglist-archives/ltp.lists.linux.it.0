Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CAB225A6F
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:53:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A34DE3C4E10
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:53:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EE15A3C223B
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:53:31 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CCF5C601261
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:52:15 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id 207so8735509pfu.3
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rmGeOthcx1jCv/28YCRXseG1y6keqJeyDyHLWpnIERE=;
 b=ULG+u3huVwe2/c9Qsm7fQjUakjWhTEJqrV+le00+5X80cdRs7AOkp8i1bGa349kZqY
 IuCQVB9z+hUltL/oLlfnf4lyrz49hmR6dIo8VOvzCEkw2gI+Nxwqy//myO57HS3GyM1p
 uyTYp9nohGmVcnJjNEm9sV9aqVCAhCdulOGKQCb1uHoffHLOmKoAxMZ8aXihBZ0F0p4n
 dXTvyAPACqYJV7GwkWL+zfgO2Rel9cEYWk+PQ4PUBjjOs6+ZhclNdybq55Yb+ELbpvIA
 k3Vd+bVCQTJ9u1KO6eFEGCJUqRfa9VDxgHSTmbOrxNQcNLZVCbIor2OZnZU7O6cN0CK5
 JGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rmGeOthcx1jCv/28YCRXseG1y6keqJeyDyHLWpnIERE=;
 b=OpraUsXKo6ECaoP4n7QDWv6DC74aWcUajzA+JXbC5pbR+KkQDHqVhVo9wfWDBvSG17
 4zjgY7PKIDtdBD39f8dwPvVi8m1i5IIlRL5BBdlPWfQ5X2U1tt9uu3jzWuWv8tyBJbYT
 JU0J+5/AA3YVRxpnFyrAluQqch5fYvUn9p3vHwn9wLzXVR8PM/IKYWMCa2pBdPVxGNSS
 ofzsMgcDjo2lZhqXlQEi3Uwh9HfrlfgiugS0MP/lCzHT9ccyz2gK6SxmBXRNC+g5s03I
 rNFY4Ixa1AypT5kh8y5bTdCcM5CojuwYWoVoUzejOCdmSKgHAGhH05biXttEZYppZnyJ
 X36g==
X-Gm-Message-State: AOAM5336iojNF6s2+RfSesKcBHfBH9yfBXAv68QVz0g9EPEje+P0zLhV
 Cis34XoeudEtT+wnFcGUUoE/Hw==
X-Google-Smtp-Source: ABdhPJxtxp6IR5UUZqf1vw2OqA+ODRmqY5WtDyc/f0gMDF9WxAh2xHzgnt0KOGvtjdbpx2zo/RFi/g==
X-Received: by 2002:aa7:8597:: with SMTP id w23mr17971821pfn.219.1595235209439; 
 Mon, 20 Jul 2020 01:53:29 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id cl17sm11091200pjb.50.2020.07.20.01.53.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 01:53:28 -0700 (PDT)
Date: Mon, 20 Jul 2020 14:23:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200720085311.h77zxzfsqrhmmy2w@vireshk-mac-ubuntu>
References: <20200720052755.21105-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720052755.21105-1-yangx.jy@cn.fujitsu.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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

On 20-07-20, 13:27, Xiao Yang wrote:
> pidfd_open(2) will set close-on-exec flag on the file descriptor as
> it manpage states, so check close-on-exec flag by fcntl(2).
> 
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> ---
> 
> 1) We don't care if the test uses the TEST() macro so just keep it.
> 2) Use bare fcntl() instead of SAFE_FCNTL() so that file descriptor
>    can be closed when fcntl(F_GETFD) fails.
> 
>  .../kernel/syscalls/pidfd_open/pidfd_open01.c  | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
