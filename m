Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C89A95C07
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 12:10:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CCE33C1CF5
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 12:10:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7BDA13C025A
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 12:10:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E6681600A0F
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 12:10:55 +0200 (CEST)
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A34EC06511C
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 10:10:54 +0000 (UTC)
Received: by mail-vs1-f71.google.com with SMTP id d15so1787668vsq.5
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 03:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dSArrue9RKdm5C4ua7J6utrFuK0U1HU8/+wK0HECfCo=;
 b=WVTOqIO3wRpqZ44lAs2DBjsuhiOn2TrfrBmw7zxBVZy6TaglthYojrZ5QvviCojtWJ
 YZPoRNkfCxRu2BUU6/4t15QXuYmT82nq/PrWkLr1uFwv6mN6aG3oGidntPZc6V4cuGEm
 IZo3ZOFr2wvl+r+pYPOIuuoze1GGhSoJQETtuvWYMr3PB5I2nISiHafphA/oS+Z6NiF4
 zoVgapc1/3u3VfqZCZ+c9FI+R2duRr/qmLdu0pVnRILoTPjBwB29uc/jBKnZninBsKjg
 uxIyGvXOrymBM2uDU7DbxAF6J/DlWRbWFj70S1yOpIIJdaSsQuu6v5fiq6LhiPz+nPRu
 xnOA==
X-Gm-Message-State: APjAAAUj9/s8cVsMNhxTP3WhM94Et8p+F9ihF+Sl/lkSV9Z6nFEZMtOB
 uIViBMNUyGxQtPSuXqJAz593JZFylPIgN5Qp0s6axyFCl9BMv+Ttfx/JlcbGPqjP5zZu+3rnRRt
 o8E/15FSO330gOtyj688YwUwLxLU=
X-Received: by 2002:a67:e24d:: with SMTP id w13mr11371117vse.58.1566295853641; 
 Tue, 20 Aug 2019 03:10:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeHUQtN7oTigpVYfMQ563YMnJanr5AAEBbQas1gMfu8qSEXwwiNmdAHsFz6K3h5FNz4dndMOcpkeHcKlS0HrY=
X-Received: by 2002:a67:e24d:: with SMTP id w13mr11371103vse.58.1566295853367; 
 Tue, 20 Aug 2019 03:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190819133618.7538-1-rpalethorpe@suse.com>
 <20190820095521.GA22253@rei.lan> <20190820095602.GB22253@rei.lan>
In-Reply-To: <20190820095602.GB22253@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 20 Aug 2019 18:10:42 +0800
Message-ID: <CAEemH2eCNk7tUadvcKcsyGZB+_Hgijg7-yd8Aw-RFtqrQhNLQQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_res: Print errno number in addition to error
 name
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Aug 20, 2019 at 5:56 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > It appears we are atleast missing ENOTSUPP (524) which is probably returned by
> > > create_timer for some alarm clocks on none x86 arches. This isn't entirely
> > > clear, but what is clear is that it would help to know what the error number
> > > is without using strace.
> >
> > Can we please also patch the lib/errnos.h so that the ENOTSUPP is
> > included there as well?
>
> And also patch the timer_create() tests to return TCONF if we got
> ENOTSUPP?

I think we shouldn't TCONF this until we get clear the problem.

This failure very probably a bug for kernel:

# grep RTC_CLASS /boot/config-4.18.0-128.el8.aarch64
CONFIG_RTC_CLASS=y

# ./timer_create01
tst_test.c:1104: INFO: Timeout per run is 0h 05m 00s
...
timer_create01.c:87: FAIL: Failed to create timer for
CLOCK_BOOTTIME_ALARM: ??? (524)
timer_create01.c:87: FAIL: Failed to create timer for
CLOCK_REALTIME_ALARM: ??? (524)

# cat kernel/time/alarmtimer.c -n
...
   57  #ifdef CONFIG_RTC_CLASS
...
    72 struct rtc_device *alarmtimer_get_rtcdev(void)
    73 {
    74         unsigned long flags;
    75         struct rtc_device *ret;
    76
    77         spin_lock_irqsave(&rtcdev_lock, flags);
    78         ret = rtcdev;
    79         spin_unlock_irqrestore(&rtcdev_lock, flags);
    80
    81         return ret;
    82 }
    83 EXPORT_SYMBOL_GPL(alarmtimer_get_rtcdev);
...
   140 #else
   141 struct rtc_device *alarmtimer_get_rtcdev(void)
   142 {
   143         return NULL;
   144 }
   ...
   670 static int alarm_timer_create(struct k_itimer *new_timer)
   671 {
   672         enum  alarmtimer_type type;
   673
   674         if (!alarmtimer_get_rtcdev())
   675                 return -ENOTSUPP;
   676
   677         if (!capable(CAP_WAKE_ALARM))
   678                 return -EPERM;
   679
   680         type = clock2alarm(new_timer->it_clock);
   681         alarm_init(&new_timer->it.alarm.alarmtimer, type,
alarm_handle_timer);
   682         return 0;
   683 }

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
