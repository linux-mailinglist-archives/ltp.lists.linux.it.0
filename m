Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACD01C07EA
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 22:28:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18D493C5E61
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 22:28:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DAB0C3C27E8
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 22:28:48 +0200 (CEST)
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0BA6D6657F4
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 22:28:48 +0200 (CEST)
Received: by mail-ej1-x644.google.com with SMTP id rh22so5770344ejb.12
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 13:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2zsTduGcdhTH+CknHQ4P9vY0KgAS/2mEyOMlXsVRfY=;
 b=NTfd/BtcDysxxFST2p2Z4ClK6AkXSeX6yCYGgvAIFnxJBj1P7m5nys6Wcb0DswR1Vv
 I2YAaYvvkJcFoBeuJk7tqIPQEi11UxMLRvdttE1/Qoys6aacJF6vwspQV5VZFFNBLRGs
 2368NNelzztM6PcpkMpByV1aEc//hkTpZgpIo36uwzQV9euZTbHIR3UtErx7g3R3UKRe
 TQAEjr2w32pUc13dO1CMCyKNqRPY05QZMkPVQhU8DWa47CkgJq2/q0LpIiOUbjr1WqH+
 0huGQQk39+vNYVvHfrPD4j4soLYBylD3Xx/uhvNvtercVEflzTXgSRN/rYSKHr3ET0Md
 iuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2zsTduGcdhTH+CknHQ4P9vY0KgAS/2mEyOMlXsVRfY=;
 b=tq69hT3et6TZ4Zkd0EBdU38FzroRW4i/V+QKrqi+5dx0nUSeiwOb+iMOv81ozJO5wC
 EaZbLPlUAChibmvYKGGLuwmcEKDwUKlMlbw42TsGrw66dR/NJ1wuAbNzVsGm6Ri+YVNV
 Mw/tbkZHj4YH08uoqy88XD26rXFnXfxObDvamvfjrOV+/jA6kTiJlM39MKUGBFhxjE3z
 cI39jRgJ/0YUb2GfSzwxvAPDBLs6UEjx8dao0KgJuctZ+kxroIorrER6jElBDYIOTDh3
 f0zw7Dm7W9wBKF99JkzQIeDuReUIH7RFW1901LJhi/I/cQypV/AVKez7jfNckg6t6Fn6
 yIvQ==
X-Gm-Message-State: AGi0PubSaCggWtK0xPCu225N7x7kvdrsvdO39vtAAJo+dyuSMoQd3Y5C
 wS5DXz7mMwTLOCtNVyoT10N3aMCwuVCcvLzT9HY=
X-Google-Smtp-Source: APiQypJneVlwUlnK/OBhnKllSAn2w9oMYpBrF07jPU0rwtaeqqh+r6wOXb2DxZWlh1L0aaya8PHOZJfzmrboQeQVKE8=
X-Received: by 2002:a17:906:3e96:: with SMTP id
 a22mr233330ejj.232.1588278527390; 
 Thu, 30 Apr 2020 13:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200423150626.12672-1-fbozuta1@gmail.com>
 <20200423150626.12672-2-fbozuta1@gmail.com>
 <20200430151306.GA3299@rei>
In-Reply-To: <20200430151306.GA3299@rei>
From: Filip Bozuta <fbozuta1@gmail.com>
Date: Thu, 30 Apr 2020 22:28:35 +0200
Message-ID: <CAGbDZErV-a7OwA_v_z8TWsJw=kupECgFAutBhnfSg1CJtWBH_Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] testcases/kernel/syscalls/ioctl: Add test
 for RTC ioctls used to read and set RTC time
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
Cc: Aleksandar Markovic <Aleksandar.Markovic@rt-rk.com>, laurent@vivier.eu,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Apr 30, 2020 at 5:13 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > This patch tests functionalities of following ioctls:
> >
> > RTC_RD_TIME - Getting RTC time
> >
> >     Returns this RTC's time in the following structure:
> >
> >         struct rtc_time {
> >             int tm_sec;
> >             int tm_min;
> >             int tm_hour;
> >             int tm_mday;
> >             int tm_mon;
> >             int tm_year;
> >             int tm_wday;     /* unused */
> >             int tm_yday;     /* unused */
> >             int tm_isdst;    /* unused */
> >         };
> >
> >     The fields in this structure have the same meaning and
> >     ranges as the tm structure described in gmtime man page.
> >     A pointer to this structure should be passed as the third
> >     ioctl argument.
> >
> > RTC_SET_TIME - Setting RTC time
> >
> >     Sets this RTC's time to the time specified by the rtc_time
> >     structure pointed to by the third ioctl argument. To set the
> >     RTC's time the process must be privileged (i.e., have the
> >     CAP_SYS_TIME capability).
> >
> > Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
> > ---
> >  runtest/syscalls                              |   2 +
> >  testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
> >  testcases/kernel/syscalls/ioctl/ioctl_rtc01.c | 121 ++++++++++++++++++
> >  3 files changed, 124 insertions(+)
> >  create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc01.c
> >
> > diff --git a/runtest/syscalls b/runtest/syscalls
> > index 44254d7da..c6b8a85ad 100644
> > --- a/runtest/syscalls
> > +++ b/runtest/syscalls
> > @@ -539,6 +539,8 @@ ioctl_ns07 ioctl_ns07
> >
> >  ioctl_sg01 ioctl_sg01
> >
> > +ioctl_rtc01 ioctl_rtc01
> > +
> >  inotify_init1_01 inotify_init1_01
> >  inotify_init1_02 inotify_init1_02
> >
> > diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
> > index 97fbb9681..b297407bd 100644
> > --- a/testcases/kernel/syscalls/ioctl/.gitignore
> > +++ b/testcases/kernel/syscalls/ioctl/.gitignore
> > @@ -14,3 +14,4 @@
> >  /ioctl_ns06
> >  /ioctl_ns07
> >  /ioctl_sg01
> > +/ioctl_rtc01
> > diff --git a/testcases/kernel/syscalls/ioctl/ioctl_rtc01.c b/testcases/kernel/syscalls/ioctl/ioctl_rtc01.c
> > new file mode 100644
> > index 000000000..e097f8f65
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/ioctl/ioctl_rtc01.c
> > @@ -0,0 +1,121 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2020 Filip Bozuta Filip.Bozuta@rt-rk.com
> > + */
> > +
> > +/*
> > + * Test RTC ioctls with RTC_RD_TIME and RTC_SET_TIME requests
> > + *
> > + * Reads the current time from RTC device using RTC_RD_TIME
> > + * request and displays the time information as follows:
> > + * hour:minute, month day.month.year
> > + *
> > + * Sets a new time in RTC device using RTC_SET_TIME request
> > + * and displays the new time information as follws:
> > + * hour:minute, month day.month.year
> > + *
> > + * Reads the new time from RTC device using RTC_RD_TIME
> > + * request and checks whether the read time information
> > + * is same as the one set by RTC_SET_TIME
> > +
> > + * Runs RTC_SET_TIME to set back the current time read by
> > + * RTC_RD_TIME at the beginning of the test
> > + */
> > +
> > +#include <stdint.h>
> > +#include <errno.h>
> > +#include <linux/rtc.h>
> > +#include "tst_test.h"
> > +
> > +static void setup(void)
> > +{
> > +     int exists = access("/dev/rtc", O_RDONLY);
> > +
> > +     if (exists < 0)
> > +             tst_brk(TCONF, "RTC device driver file not found");
>
> The old LTP test allowed an RTC device to be passed to the test, I
> wonder what should we do here. Should we loop over all rtcX devices under
> /dev/ by default?
>

Thank you for your review!
I will see to it that I correct all of the mistakes you have pointed
out to me in the v3 series of these patches.

I agree with this. I shall create a mechanism to run the test for all
/dev/rtcX devices that are available on the system.

> Also the same interface seems to be exported via proc and sysfs, it may make
> sense to check that /sys/class/rtc/rtcX/time and date matches the
> results from ioctl commands. We do have SAFE_FILE_SCANF() so reading
> these should be simple enough.
>

Yes you are right, this would be a good addition to the test. Should I
read the time using both the ioctl command and SAFE_FILE_SCANF() or
should I use just one of these two?

> > +}
> > +
> > +char *read_time_request = "RTC_RD_TIME";
> > +char *set_time_request = "RTC_SET_TIME";
> > +
> > +static void run(void)
> > +{
> > +     int fd;
> > +
> > +     struct rtc_time rtc_read_time;
> > +     struct rtc_time rtc_cur_time;
> > +     struct rtc_time rtc_set_time = {
> > +             .tm_sec = 0, .tm_min = 15, .tm_hour = 13,
> > +             .tm_mday = 26, .tm_mon = 8, .tm_year = 119};
> > +
> > +     int time_read_supported, time_set_supported = 0;
> > +
> > +     fd = SAFE_OPEN("/dev/rtc", O_RDONLY);
> > +
> > +     if (fd == -1)
> > +             tst_brk(TCONF, "RTC device driver file could not be opened");
>
> You are using SAFE_OPEN() the return value will never be -1, SAFE_OPEN()
> either succeeds or exits the test.
>
> You have to use raw open() call if you want to handle the errors
> yourself. Also you should really check for errno here, I guess that we
> should TCONF only or ENOENT?
>
> And lastly but not least we should open the device once in the test
> setup and close it once in test cleanup, there is no point in opening it
> for each test iteration (the test -i parameter).
>

Thank you for pointing this out to me. I will consider both options:
using SAFE_OPEN() and remove the error check or use raw open() with
appropriate error handling. In any case, I will move this opening of
the device file in the setup() function
and create a cleanup() function where the file will be closed.

> > +     if (ioctl(fd, RTC_RD_TIME, &rtc_cur_time) == -1) {
>
> Just for the sake of being pedantic we should test that the retuned
> value here is exactly the one that describes success, so we should do:
>
>         ioctl(fd, RTC_RD_TIME, &foo) != 0
>
> There have been cases where wrongly applied patch caused random values
> to be returned from a syscall which would not be caught here.
>

I will change this in every part of the test where the ioctl() call is checked.

> > +             if (errno == ENOTTY)
> > +                     tst_res(TCONF, "ioctl %s not supported on RTC device",
> > +                             read_time_request);
> > +             else
> > +                     tst_res(TFAIL | TERRNO, "unexpected ioctl error");
> > +     } else {
> > +             tst_res(TPASS, "time successfully read from RTC device");
> > +             tst_res(TINFO, "current RTC time: %d:%d, %d.%d.%d",
> > +                     rtc_cur_time.tm_hour, rtc_cur_time.tm_min,
> > +                     rtc_cur_time.tm_mday, rtc_cur_time.tm_mon,
> > +                     rtc_cur_time.tm_year);
> > +             time_read_supported = 1;
> > +     }
> > +
> > +     if (ioctl(fd, RTC_SET_TIME, &rtc_set_time) == -1) {
> > +             if (errno == ENOTTY)
> > +                     tst_res(TCONF, "ioctl %s not supported on RTC device",
> > +                             set_time_request);
>
> Huh, why do we pass static string as %s? Why can't we just simply put it
> verbatim into the string?
>
> > +             else
> > +                     tst_res(TFAIL | TERRNO, "unexpected ioctl error");
> > +     } else {
> > +             tst_res(TPASS, "time successfully set to RTC device");
> > +             tst_res(TINFO, "new RTC time: %d:%d, %d.%d.%d",
> > +                     rtc_set_time.tm_hour, rtc_set_time.tm_min,
> > +                     rtc_set_time.tm_mday, rtc_set_time.tm_mon,
> > +                     rtc_set_time.tm_year);
> > +             time_set_supported = 1;
> > +     }
> > +
> > +     if (time_read_supported && time_set_supported) {
> > +             ioctl(fd, RTC_RD_TIME, &rtc_read_time);
> > +
> > +             char time_data[][10] = {"minute", "hour", "month",
> > +                     "month day", "year"};
>
> This can be just const char *time_data[] = {...};
>
> > +             int read_time_data[] = {
> > +                     rtc_read_time.tm_min, rtc_read_time.tm_hour,
> > +                     rtc_read_time.tm_mday, rtc_read_time.tm_mon,
> > +                     rtc_read_time.tm_year};
> > +             int set_time_data[] = {
> > +                     rtc_set_time.tm_min, rtc_set_time.tm_hour,
> > +                     rtc_set_time.tm_mday, rtc_set_time.tm_mon,
> > +                     rtc_set_time.tm_year};
> > +             for (int i = 0; i < 5; i++)
> > +                     if (read_time_data[i] == set_time_data[i])
> > +                             tst_res(TPASS, "%s reads new %s as expected",
> > +                                     read_time_request, time_data[i]);
> > +                     else
> > +                             tst_res(TFAIL, "%s reads different %s than set",
> > +                                     read_time_request, time_data[i]);
>
> Here as well, why do we pass static string as a parameter?
>

I am sorry. I got confused when writting this part of the test (last
20 lines). I will
change this whole time comparing section in v3 and remove all static
strings.

> > +     }
> > +
> > +     if (time_set_supported)
> > +             ioctl(fd, RTC_SET_TIME, &rtc_cur_time);
>
> If we are allowed to set the time but not read it we will not restore
> the value at the end. Also does having write-only RTC even make sense?
> Shouldn't we just drop the time_read_supported flag and exit the test if
> we can't read it?
>

I will drop both time_read_supported and time_set_supported flags as
they are unnecessary. Instead, I shall just use tst_brk() to exit the
test in the beginning part if RTC_RD_TIME or RTC_SET_TIME request
fails (as there is no need to move forward with the test if any of
these requests fail at the beginning).

> > +     SAFE_CLOSE(fd);
> > +}
> > +
> > +static struct tst_test test = {
> > +     .test_all = run,
> > +     .needs_root = 1,
> > +     .needs_device = 1,
> > +     .setup = setup,
> > +};
>
> Lastly there are some minor coding style violations, LTP uses LKML
> coding style, and there is a script packed along with the Linux kernel
> that can check your patches before sending them, see
> linux/scripts/checkpatch.pl.
>

I will check all future patches with checkpatch.pl script from the Linux kernel.

I would just like to inform you that I am going on a short holiday in
the next three days after which I will have some other tasks that I
have to attend to. For that reason, I won't be able to complete the v3
series with the corrected flaws of this patch in the near future.
However, I am looking forward to getting back at work on these tests
and correcting all of the mistakes that you have pointed out to me as
soon as possible. I am also looking forward to your reviews of my
future patches.

Thanks again for all of your comments!

Best regards,
Filip

> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
