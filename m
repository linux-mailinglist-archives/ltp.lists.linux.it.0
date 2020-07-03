Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A94213151
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 04:22:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C95C3C247C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 04:22:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BADBA3C0EC0
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 04:22:29 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 905691A01163
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 04:22:28 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id o13so11424409pgf.0
 for <ltp@lists.linux.it>; Thu, 02 Jul 2020 19:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PGNP8i64OD11kzmHw1hwOqKtnUxU/V9R6uXYxun8jhU=;
 b=Yp8yTyJoeMwte8w0BkzXhNZFFrV7/cdIpQeHGMIqr+vJERzOritccrrY8wohxaAQ1O
 kq4k6YApr4c7p+Iv7IHFRehzjEQezTiUPys46KRv52L4UAnPQi1SGJoi4YogqC6md6AA
 mNCAYpxbUesNscgd4AU7DYSwPXiD/XKG14B3deCiACzm7Mb+oMNJ3Lhr2UHLsf0NVdCo
 H4vHothrvhykOHHscg9UcHuRrhuVZ8kz/rr8ISBvxFfrKpRkmH/6iOXGTJJ1+Hbwi8xV
 5+EgjaHsDh9OMGJROwpDt/JxD8UxDYjvCBhz55j377u8MnaCjAadwtNN7QScOfRwKpwt
 jq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PGNP8i64OD11kzmHw1hwOqKtnUxU/V9R6uXYxun8jhU=;
 b=UxFGj9RGdT+1LEjlt+MpDnpO8R731P0sFvGuM2zf2t7/369VNIcCkzWkKul6nLHQ3e
 ez3kGulUuDW7+qOZ/jPGdQHRSVYi8lRKyDIz1htviHO2DD2Xi6QbSoOJa76e/6f5Vbgu
 GBxni0a6G+NMvxOtPwgow6QHBhWbp0sAOFH4plNdZ3bsp7cy+vTkH9PCNlaiEwGqdFOB
 CYJYOpPfE1poqbq98HudOTr9bt9U6WRogzmoEUBR8V/jkEHQMm2ZP29unQLi8jHjoDWC
 Fm3YK7/yoVLSJxMpe6gnrGnvhDQFECjzhDD5gEHqzUUVIvOHP1Ra20t821XJVk2VoOUD
 Id3w==
X-Gm-Message-State: AOAM531R6SzfZs1rVhWWay97Dx/3xzxyiX0fsYGy4joXslHQhTh6cZtn
 E49AcRzqoGqJlpC2H5GWGl+4Fw==
X-Google-Smtp-Source: ABdhPJzSgW3bteW8J5+JjbGJ7J/h02QsQKt9lhSERy5ol1yt5aIk3xL5i5JCHuDbh9P1Gp4qgkV3tg==
X-Received: by 2002:a63:475c:: with SMTP id w28mr27922492pgk.222.1593742946913; 
 Thu, 02 Jul 2020 19:22:26 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id s6sm9646485pfd.20.2020.07.02.19.22.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jul 2020 19:22:25 -0700 (PDT)
Date: Fri, 3 Jul 2020 07:52:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200703022221.upylhdvugtnp6hr2@vireshk-i7>
References: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
 <20200702133418.GD9101@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702133418.GD9101@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/timer_settime01: Improve print
 messages
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

On 02-07-20, 15:34, Cyril Hrubis wrote:
> Hi!
> > This improves the print messages by providing additional information
> > about the tests.
> 
> Do we really need this?
> 
> We do print which test variant we test at the start of each block and no
> other tests with test variant prefix the messages like this...

Damn, I missed that somehow and thought some information is missing :(

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
